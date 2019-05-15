using UnityEngine;

public class PressurePlate : MonoBehaviour
{
	public GameObject LinkedElement;
	private int _NbGOOnPlate = 0;

	private void OnTriggerEnter(Collider other)
	{
		LinkedElement.SetActive(false);
		_NbGOOnPlate++;
	}

	private void OnTriggerExit(Collider other)
	{
		_NbGOOnPlate--;

		if(_NbGOOnPlate == 0)
			LinkedElement.SetActive(true);
	}
}
