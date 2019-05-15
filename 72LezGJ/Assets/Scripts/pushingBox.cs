using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class pushingBox : MonoBehaviour
{

    Vector3 positionA;
    Vector3 positionB;
    public Vector3 direction;


    // Start is called before the first frame update
    void Start()
    {
    }

    // Update is called once per frame
    void Update()
    {
        direction = transform.InverseTransformDirection(GetComponent<Rigidbody>().velocity);
    }
}
