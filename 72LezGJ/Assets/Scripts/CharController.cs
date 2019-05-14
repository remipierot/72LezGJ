using System.Collections.Generic;
using UnityEngine;
using Custom.Input;

public class CharController : MonoBehaviour
{
	private Controls _Controls;
	private static Dictionary<KeyName, float> _YRotations = new Dictionary<KeyName, float>()
	{
		{ KeyName.Up, 0f },
		{ KeyName.Right, 90f },
		{ KeyName.Down, 180f },
		{ KeyName.Left, 270f }
	};
	private bool _NormalSize = true;

	void Update()
	{
		if (_Controls == null)
			_Controls = new Controls();

		_Controls.UpdateStates(Time.deltaTime);

		var yRotation = gameObject.transform.rotation.eulerAngles.y;
		var wantedRotation = Quaternion.identity;
		var upPressed = _Controls.IsPressed(KeyName.Up);
		var rightPressed = _Controls.IsPressed(KeyName.Right);
		var downPressed = _Controls.IsPressed(KeyName.Down);
		var leftPressed = _Controls.IsPressed(KeyName.Left);
		var direction = Vector3.zero;

		if(upPressed)
		{
			if (!rightPressed && !downPressed && !leftPressed && !Mathf.Approximately(yRotation, _YRotations[KeyName.Up]))
				gameObject.transform.rotation = Quaternion.Euler(0f, _YRotations[KeyName.Up], 0f);

			direction.z += 1f;
		}

		if (rightPressed)
		{
			if (!upPressed && !downPressed && !leftPressed && !Mathf.Approximately(yRotation, _YRotations[KeyName.Right]))
				gameObject.transform.rotation = Quaternion.Euler(0f, _YRotations[KeyName.Right], 0f);

			direction.x += 1f;
		}

		if (downPressed)
		{
			if (!rightPressed && !upPressed && !leftPressed && !Mathf.Approximately(yRotation, _YRotations[KeyName.Down]))
				gameObject.transform.rotation = Quaternion.Euler(0f, _YRotations[KeyName.Down], 0f);

			direction.z -= 1f;
		}

		if (leftPressed)
		{
			if (!rightPressed && !downPressed && !upPressed && !Mathf.Approximately(yRotation, _YRotations[KeyName.Left]))
				gameObject.transform.rotation = Quaternion.Euler(0f, _YRotations[KeyName.Left], 0f);

			direction.x -= 1f;
		}

		if (_Controls.IsDown(KeyName.Action))
		{
			_NormalSize = !_NormalSize;

			if (_NormalSize)
				gameObject.transform.localScale = Vector3.one * .5f;
			else
				gameObject.transform.localScale = Vector3.one * .1f;
		}

		GetComponent<Rigidbody>().velocity = direction.normalized;
	}
}
