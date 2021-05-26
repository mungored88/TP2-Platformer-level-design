using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DestroyOnTouch : MonoBehaviour
{

    void OnTriggerEnter(Collider collider)
    {
        
        if (collider.gameObject.tag == "Player")
        {
            Destroy(this.gameObject, 0.1f);
        }
    }

}
