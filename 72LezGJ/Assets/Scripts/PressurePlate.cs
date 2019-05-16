using UnityEngine;

public class PressurePlate : MonoBehaviour
{
	public GameObject LinkedElement;
	private int _NbGOOnPlate = 0;
	private bool _PlayerRegistered = false;

	private void OnTriggerEnter(Collider other)
	{
		LinkedElement.SetActive(false);

		if (!_PlayerRegistered || other.tag != "Player")
		{
			if(other.tag == "Player")
				_PlayerRegistered = true;

			_NbGOOnPlate++;
		}
	}

	private void OnTriggerExit(Collider other)
	{
		if (other.tag == "Player")
			_PlayerRegistered = false;

		_NbGOOnPlate--;

		if(_NbGOOnPlate == 0)
			LinkedElement.SetActive(true);
	}
}
