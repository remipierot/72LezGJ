using UnityEngine;

public class TriggerScript : MonoBehaviour
{
	public bool inWater = false;

	private void OnTriggerEnter(Collider other)
	{
		if (other.CompareTag("Water"))
		{
			inWater = true;
		}
	}

	private void OnTriggerExit(Collider other)
	{
		if (other.CompareTag("Water"))
		{
			inWater = false;
		}
	}
}