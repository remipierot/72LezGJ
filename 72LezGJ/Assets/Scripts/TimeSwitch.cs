using UnityEngine;

public class TimeSwitch : MonoBehaviour
{
	public bool SwitchToPast = false;

	private void OnTriggerEnter(Collider other)
	{
		if (other.tag == "Player")
		{
			if (SwitchToPast)
				GameManager.SwitchToPast();
			else
				GameManager.SwitchToPresent();
		}
	}
}
