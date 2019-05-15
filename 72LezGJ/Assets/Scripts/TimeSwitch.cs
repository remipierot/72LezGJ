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
		else if(other.name.Contains("PushBox"))
		{
			if (SwitchToPast)
				GameManager.LinkObjectToPast(other.gameObject);
			else
				GameManager.LinkObjectToPresent(other.gameObject);
		}
	}
}
