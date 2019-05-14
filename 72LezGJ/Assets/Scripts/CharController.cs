using System;
using System.Collections;
using UnityEngine;
using Custom.Input;

public class CharController : MonoBehaviour
{
	private Controls _Controls;
	private Rigidbody _Body;
	private bool _NormalSize = true;
	private Coroutine _ScaleCoroutine;

	public float Speed = 1f;
	public float ScaleSpeed = 1f;
	public GameObject UpWalk;
	public GameObject RightWalk;
	public GameObject DownWalk;
	public GameObject LeftWalk;

	void Update()
	{
		if (_Controls == null)
			_Controls = new Controls();

		if (_Body == null)
		{
			_Body = GetComponent<Rigidbody>();
			_Body.centerOfMass = Vector3.zero;
			_Body.inertiaTensorRotation = new Quaternion(0, 0, 0, 1);
		}

		_Controls.UpdateStates(Time.deltaTime);

		var upPressed = _Controls.IsPressed(KeyName.Up);
		var rightPressed = _Controls.IsPressed(KeyName.Right);
		var downPressed = _Controls.IsPressed(KeyName.Down);
		var leftPressed = _Controls.IsPressed(KeyName.Left);
		var direction = Vector3.zero;

		if(upPressed)
			direction.z += 1f;

		if (rightPressed)
			direction.x += 1f;

		if (downPressed)
			direction.z -= 1f;

		if (leftPressed)
			direction.x -= 1f;

		direction.Normalize();

		if (direction.sqrMagnitude > 0f)
		{
			UpWalk?.SetActive(upPressed && (UpWalk.activeInHierarchy || (!rightPressed && !downPressed && !leftPressed)));
			RightWalk?.SetActive(rightPressed && (RightWalk.activeInHierarchy || (!upPressed && !downPressed && !leftPressed)));
			DownWalk?.SetActive(downPressed && (DownWalk.activeInHierarchy || (!upPressed && !rightPressed && !leftPressed)));
			LeftWalk?.SetActive(leftPressed && (LeftWalk.activeInHierarchy || (!upPressed && !rightPressed && !downPressed)));
		}

		if (_Controls.IsDown(KeyName.Action))
		{
			_NormalSize = !_NormalSize;

			if (_NormalSize)
			{
				if(_ScaleCoroutine != null)
					StopCoroutine(_ScaleCoroutine);

				_ScaleCoroutine = StartCoroutine(_ScaleUp());
			}
			else
			{
				if (_ScaleCoroutine != null)
					StopCoroutine(_ScaleCoroutine);

				_ScaleCoroutine = StartCoroutine(_ScaleDown());
			}
		}

		_Body.velocity = direction.normalized * Speed;
	}

	private IEnumerator _ScaleDown()
	{
		var startScale = gameObject.transform.localScale;
		var endScale = Vector3.one * .1f;
		var time = 0f;

		if (!Mathf.Approximately(startScale.x, .5f))
			time = ScaleSpeed * (.5f - startScale.x) / .4f;

		while (time < ScaleSpeed)
		{
			gameObject.transform.localScale = Vector3.Lerp(startScale, endScale, time / ScaleSpeed);
			time += Time.deltaTime;
			yield return null;
		}

		gameObject.transform.localScale = endScale;
	}

	private IEnumerator _ScaleUp()
	{
		var startScale = gameObject.transform.localScale;
		var endScale = Vector3.one * .5f;
		var time = 0f;

		if (!Mathf.Approximately(startScale.x, .1f))
			time = ScaleSpeed * (startScale.x - .1f) / .4f;

		while (time < ScaleSpeed)
		{
			gameObject.transform.localScale = Vector3.Lerp(startScale, endScale, time / ScaleSpeed);
			time += Time.deltaTime;
			yield return null;
		}

		gameObject.transform.localScale = endScale;
	}
}
