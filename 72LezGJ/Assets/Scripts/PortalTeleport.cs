using UnityEngine;

public class PortalTeleport : MonoBehaviour
{
	public GameObject LinkedPortal;
	public bool CanTeleport = true;
	public Vector2 OutDirection = Vector2.up;

	void OnTriggerEnter(Collider other)
	{
		if (other.gameObject.tag != "Player" && other.gameObject.tag != "TPableObject")
			return;

		if (!CanTeleport)
			return;

		LinkedPortal.GetComponent<PortalTeleport>().CanTeleport = false;
		if (other.gameObject.tag == "TPableObject")
		{
			other.transform.position = new Vector3(LinkedPortal.transform.position.x + OutDirection.x, other.transform.position.y, LinkedPortal.transform.position.z + OutDirection.y);
		}
		else
		{
			other.transform.parent.position = new Vector3(LinkedPortal.transform.position.x, other.transform.parent.position.y, LinkedPortal.transform.position.z);
			other.transform.parent.gameObject.GetComponent<CharController>().SwitchFacing(OutDirection);
		}
	}

	void OnTriggerExit(Collider other)
	{
		if (other.gameObject.tag == "Player" || other.gameObject.tag == "TPableObject")
			if (CanTeleport == false)
				CanTeleport = true;
	}
}
