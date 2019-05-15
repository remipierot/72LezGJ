using UnityEngine;

public class PortalTeleport : MonoBehaviour
{
	public GameObject LinkedPortal;
	public bool CanTeleport = true;

	void OnTriggerEnter(Collider other)
	{
		if (other.gameObject.tag != "Player" && other.gameObject.tag != "TPableObject")
			return;

		if (!CanTeleport)
			return;

		LinkedPortal.GetComponent<PortalTeleport>().CanTeleport = false;
		if (other.gameObject.tag == "TPableObject")
		{
			other.transform.position = new Vector3(LinkedPortal.transform.position.x, other.transform.position.y, LinkedPortal.transform.position.z);
			//other.GetComponent<Rigidbody>().AddForce(other.GetComponent<pushingBox>().direction * .00002f);
		}
		else
		{
			other.transform.parent.position = new Vector3(LinkedPortal.transform.position.x, other.transform.parent.position.y, LinkedPortal.transform.position.z);
		}
	}

	void OnTriggerExit(Collider other)
	{
		if (other.gameObject.tag == "Player" || other.gameObject.tag == "TPableObject")
			if (CanTeleport == false)
				CanTeleport = true;
	}
}
