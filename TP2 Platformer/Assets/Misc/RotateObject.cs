using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotateObject : MonoBehaviour
{
    public Vector3 rotationDirection;
    public float speed;

    void Update()
    {
        transform.Rotate(rotationDirection * Time.deltaTime * speed);
    }
}
