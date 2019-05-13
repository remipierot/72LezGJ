using System;
using System.Collections.Generic;

namespace Custom.Input
{
	public enum KeyName
	{
		Up,
		Right,
		Down,
		Left,
		Action
	}

	[Flags]
	public enum State
	{
		Free = 1 << 0,
		Down = 1 << 1,
		Pressed = 1 << 2,
		Released = 1 << 3
	}

	public class Controls
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
		/// /!\ DO NOT CHANGE METHOD CONTENT /!\
		/// 
		/// Has to be used in the Update of a Monobehaviour, otherwise input won't be updated.
		/// </summary>
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

		public bool IsFree(KeyName keyName)
		{
			return (_KeyStates[keyName].CurrentState & State.Free) != 0;
		}

		public bool IsDown(KeyName keyName)
		{
			return (_KeyStates[keyName].CurrentState & State.Down) != 0;
		}

		public bool IsPressed(KeyName keyName)
		{
			return (_KeyStates[keyName].CurrentState & State.Pressed) != 0;
		}

		public bool IsReleased(KeyName keyName)
		{
			return (_KeyStates[keyName].CurrentState & State.Released) != 0;
		}

		public float GetTimePressed(KeyName keyName)
		{
			return _KeyStates[keyName].TimeBeingPressed;
		}  
	}
}

