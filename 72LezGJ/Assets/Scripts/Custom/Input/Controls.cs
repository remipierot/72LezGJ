using System;
using System.Collections.Generic;

namespace Custom.Input
{
	/// <summary>
	/// List of the keys available to the application.
	/// To add/modify/remove inputs, change the values in this enum.
	/// Be sure to update the <cref="_FillKeysUsedOnFrame()"/> method accordingly.
	/// </summary>
	public enum KeyName
	{
		Up,
		Right,
		Down,
		Left,
		Action
	}

	/// <summary>
	/// Different states available to each key.
	/// Some can overlap, which is why this enum is defined as Flags.
	/// 
	/// Framecount:   ∞  >        1       >    ∞    >     1    >  ∞
	/// Keystate  : Free > Down + Pressed > Pressed > Released > Free
	/// </summary>
	[Flags]
	public enum State
	{
		Free = 1 << 0,
		Down = 1 << 1,
		Pressed = 1 << 2,
		Released = 1 << 3
	}

	/// <summary>
	/// This class intends to deliver an abstraction between the actual input provider and
	/// the rest of the application. 
	/// 
	/// Relies by default on UnityEngine (<see cref="_FillKeysUsedOnFrame()"/>),
	/// but the content of this method can be changed to rely on an external
	/// input values provider (standard C#, or custom API for exotic controllers for example).
	/// 
	/// The input values are updated by a method that has to be called on each update for the 
	/// values to be accurate:
	///		- <cref="UpdateStates(float)"/>
	/// 
	/// Access to input values is made by using the getters:
	///		- <cref="IsFree(KeyName)"/>
	///		- <cref="IsDown(KeyName)"/>
	///		- <cref="IsPressed(KeyName)"/>
	///		- <cref="IsReleased(KeyName)"/>
	///
	/// It is also possible to access the time a specific input has been pressed:
	///		- <cref="GetTimePressed(KeyName)"/>
	/// </summary>
	public sealed class Controls
	{
		private Dictionary<KeyName, KeyState> _KeyStates = new Dictionary<KeyName, KeyState>();
		private Dictionary<KeyName, bool> _KeysUsedOnFrame = new Dictionary<KeyName, bool>();

		private class KeyState
		{
			public State CurrentState = State.Free;
			public float TimeBeingPressed = 0f;

			public KeyState() { }
		}

		public Controls()
		{
			foreach (KeyName keyName in Enum.GetValues(typeof(KeyName)))
			{
				_KeyStates.Add(keyName, new KeyState());
				_KeysUsedOnFrame.Add(keyName, false);
			}
		}

		/// <summary>
		/// Has to be used in the Update of a Monobehaviour, otherwise input will not be updated.
		/// 
		/// /!\/!\/!\ DO NOT CHANGE METHOD CONTENT /!\/!\/!\
		/// </summary>
		/// <param name="deltaTime">deltaTime provided by the class calling this method.</param>
		public void UpdateStates(float deltaTime)
		{
			_FillKeysUsedOnFrame();

			foreach (var kvp in _KeyStates)
			{
				var currentState = State.Free;
				var isUsedOnFrame = _KeysUsedOnFrame[kvp.Key];

				if(isUsedOnFrame)
				{
					currentState |= State.Pressed;

					if (IsFree(kvp.Key) || IsReleased(kvp.Key))
						currentState |= State.Down;
				}
				else if (IsPressed(kvp.Key))
					currentState |= State.Released;

				if(IsPressed(kvp.Key))
				{
					if ((currentState & State.Pressed) != 0)
						_KeyStates[kvp.Key].TimeBeingPressed += deltaTime;
					else if ((currentState & State.Released) != 0)
						_KeyStates[kvp.Key].TimeBeingPressed = 0f;
				}

				if (currentState != State.Free)
					currentState ^= State.Free;

				_KeyStates[kvp.Key].CurrentState = currentState;
			}
		}

		/// <summary>
		/// Defines how a key is recognized as used or not.
		/// This method can be edited to defined specific ways to recognized a used/not used key.
		/// </summary>
		private void _FillKeysUsedOnFrame()
		{
			foreach (var kvp in _KeyStates)
				_KeysUsedOnFrame[kvp.Key] = UnityEngine.Input.GetButton(kvp.Key.ToString());
		}

		/// <summary>
		/// True if the key is not currently used (was 'Free' or 'Released' the frame before).
		/// </summary>
		/// <param name="keyName">Name of the key to check the state of.</param>
		/// <returns>True if the key is 'Free', false otherwise.</returns>
		public bool IsFree(KeyName keyName)
		{
			return (_KeyStates[keyName].CurrentState & State.Free) != 0;
		}

		/// <summary>
		/// True if the key has just been pressed (was 'Free' or 'Released' during the previous frame).
		/// This state lasts for a single frame, during which the key is considered 'Down' AND 'Pressed'.
		/// </summary>
		/// <param name="keyName">Name of the key to check the state of.</param>
		/// <returns>True if the key is 'Down', false otherwise.</returns>
		public bool IsDown(KeyName keyName)
		{
			return (_KeyStates[keyName].CurrentState & State.Down) != 0;
		}

		/// <summary>
		/// True if the key is pressed (held down).
		/// </summary>
		/// <param name="keyName">Name of the key to check the state of.</param>
		/// <returns>True if the key is 'Pressed', false otherwise.</returns>
		public bool IsPressed(KeyName keyName)
		{
			return (_KeyStates[keyName].CurrentState & State.Pressed) != 0;
		}

		/// <summary>
		/// True if the key has just been released (was 'Down' or 'Pressed' during the previous frame).
		/// This state lasts for a single frame.
		/// </summary>
		/// <param name="keyName">Name of the key to check the state of.</param>
		/// <returns>True if the key is 'Released', false otherwise.</returns>
		public bool IsReleased(KeyName keyName)
		{
			return (_KeyStates[keyName].CurrentState & State.Released) != 0;
		}

		/// <summary>
		/// Get the time a key has been 'Pressed' in seconds.
		/// </summary>
		/// <param name="keyName">Name of the key to get the pressed time of.</param>
		/// <returns>Time the given key has been 'Pressed' in seconds.</returns>
		public float GetTimePressed(KeyName keyName)
		{
			return _KeyStates[keyName].TimeBeingPressed;
		}  
	}
}

