using UnityEngine;

public class CameraHandler : MonoBehaviour
{
	public GameObject Character;

	void Update()
	{
		Vector3 targetPosition = Character.transform.position;
		targetPosition.y = transform.position.y;

		transform.position = targetPosition;
	}
}
