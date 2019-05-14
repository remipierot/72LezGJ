using System;
using System.Linq;
using System.Text;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

namespace Custom.Input
{
	public class ControlsTest : MonoBehaviour
	{
		private Controls _Controls;

		public TextMeshPro Text;

		void Update()
		{
			if (_Controls == null)
				_Controls = new Controls();

			//Update actual input values
			_Controls.UpdateStates(Time.deltaTime);

			//Example: check if the 'Up' key is free (not pressed)
			var free = _Controls.IsFree(KeyName.Up);

			//Example: check how long the 'Up' key has been pressed
			var timeUpPressed = _Controls.GetTimePressed(KeyName.Up);

			//Update debug text
			_UpdateText();
		}

		//Debug method, fill the text with Controls data
		private void _UpdateText()
		{
			StringBuilder newText = new StringBuilder();
			string free, down, pressed, released, timePressed;

			var wantedKeyLength = Enum.GetValues(typeof(KeyName)).OfType<object>().OrderBy(k => k.ToString().Length).Last().ToString().Length;
			if ("Key".Length > wantedKeyLength)
			{
				wantedKeyLength = 3;
			}
			newText.AppendFormat("|{0}|", "Key".PadRight(wantedKeyLength));

			var wantedKeyStatesLength = new Dictionary<State, int>();
			foreach (State state in Enum.GetValues(typeof(State)))
			{
				wantedKeyStatesLength[state] = Enum.GetValues(typeof(State)).OfType<object>().OrderBy(k => k.ToString().Length).Last().ToString().Length;
				newText.AppendFormat("{0}|", state.ToString().PadRight(wantedKeyStatesLength[state]));
			}

			newText.AppendFormat("{0}|", "Seconds pressed");
			newText.AppendFormat("\n{0}\n", "".PadRight(newText.Length, '-'));

			foreach (KeyName keyName in Enum.GetValues(typeof(KeyName)))
			{
				free = _Get10(_Controls.IsFree(keyName));
				down = _Get10(_Controls.IsDown(keyName));
				pressed = _Get10(_Controls.IsPressed(keyName));
				released = _Get10(_Controls.IsReleased(keyName));
				timePressed = _Controls.GetTimePressed(keyName).ToString();

				newText.AppendFormat("|{0}|{1}|{2}|{3}|{4}|{5}|\n",
					keyName.ToString().PadRight(wantedKeyLength),
					free.PadRight(free.Length - 1 + wantedKeyStatesLength[State.Free]),
					down.PadRight(down.Length - 1 + wantedKeyStatesLength[State.Down]),
					pressed.PadRight(pressed.Length - 1 + wantedKeyStatesLength[State.Pressed]),
					released.PadRight(released.Length - 1 + wantedKeyStatesLength[State.Released]),
					timePressed.PadRight("Seconds pressed".Length));
			}

			Text.text = newText.ToString();
		}

		private string _Get10(bool value)
		{
			return value ? "<color=#00FF00FF>1</color>" : "<color=#FF0000FF>0</color>";
		}
	}
}
