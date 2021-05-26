using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Spring : MonoBehaviour
{
    public float forceMagnitude = 0;

    void OnTriggerEnter(Collider collider)
    {
        if (collider.gameObject.tag == "Player")
        {
            Debug.Log("SPRINGY SPRING");
            collider.gameObject.transform.GetComponent<Rigidbody>().velocity = Vector3.zero;
            collider.gameObject.transform.GetComponent<Rigidbody>().AddForce(this.transform.up * forceMagnitude, ForceMode.Impulse);
        }
        
    }
}
