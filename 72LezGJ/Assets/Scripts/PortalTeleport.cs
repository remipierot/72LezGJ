using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PortalTeleport : MonoBehaviour
{
    public GameObject linkedPortal;
    public bool canTeleport = true;

    // Start is called before the first frame update
    void Start()
    {

    }

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Player" || other.gameObject.tag == "TPableObject")
        {
            if (canTeleport)
            {
                linkedPortal.GetComponent<PortalTeleport>().canTeleport = false;
                other.transform.position = new Vector3(linkedPortal.transform.position.x, other.transform.position.y, linkedPortal.transform.position.z);
                if (other.gameObject.tag == "TPableObject")
                {
                    other.GetComponent<Rigidbody>().AddForce(other.GetComponent<pushingBox>().direction * 0.00002f);
                }
            }
        }

    }

    void OnTriggerExit(Collider other)
    {
        if (other.gameObject.tag == "Player" || other.gameObject.tag == "TPableObject")
        {
            if (canTeleport == false)
            {
                canTeleport = true;
            }
        }
    }


    // Update is called once per frame
    void Update()
    {
        
    }
}
