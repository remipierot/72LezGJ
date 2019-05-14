using System.Collections;
using UnityEngine;
using Custom.Input;

public class CharController : MonoBehaviour
{
	private Controls _Controls;
	private Rigidbody _Body;
	private bool _NormalSize = true;
	private bool _ChangingSize = false;

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

		if (_Controls.IsDown(KeyName.Action) && !_ChangingSize)
		{
			_NormalSize = !_NormalSize;
			_ChangingSize = true;

			if (_NormalSize)
			{
				StartCoroutine(_ScaleUp());
				SetLayerRecursively(gameObject, 10); //Set Layer to Large
			}
			else
			{
				StartCoroutine(_ScaleDown());
				SetLayerRecursively(gameObject, 11); //Set Layer to Small
			}
		}

		_Body.velocity = direction.normalized * Speed;
	}

	private IEnumerator _ScaleDown()
	{
		var startScale = gameObject.transform.localScale;
		var endScale = Vector3.one * .1f;
		var time = 0f;

		while (time < ScaleSpeed)
		{
			gameObject.transform.localScale = Vector3.Lerp(startScale, endScale, time / ScaleSpeed);
			time += Time.deltaTime;
			yield return null;
		}

		gameObject.transform.localScale = endScale;
		_ChangingSize = false;
	}

	private IEnumerator _ScaleUp()
	{
		var startScale = gameObject.transform.localScale;
		var endScale = Vector3.one * .5f;
		var time = 0f;

		while (time < ScaleSpeed)
		{
			gameObject.transform.localScale = Vector3.Lerp(startScale, endScale, time / ScaleSpeed);
			time += Time.deltaTime;
			yield return null;
		}

		gameObject.transform.localScale = endScale;
		_ChangingSize = false;
	}

	void SetLayerRecursively(GameObject obj, int newLayer)
	{
		if (null == obj)
		{
			return;
		}

		obj.layer = newLayer;

		foreach (Transform child in obj.transform)
		{
			if (null == child)
			{
				continue;
			}
			SetLayerRecursively(child.gameObject, newLayer);
		}
	}

}
