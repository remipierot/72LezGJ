using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
	public static GameManager Instance{ get; private set; }

	public bool TimeIsPresent = true;
	public List<GameObject> ObjectsInPresent;
	public List<GameObject> ObjectsInPast;

	private void Update()
	{
		if(Instance == null)
			Instance = this;
	}

	public static void SwitchToPast()
	{
		foreach(var presentObject in Instance.ObjectsInPresent)
			presentObject.SetActive(false);

		foreach (var pastObject in Instance.ObjectsInPast)
			pastObject.SetActive(true);

		Instance.TimeIsPresent = false;
	}

	public static void SwitchToPresent()
	{
		foreach (var pastObject in Instance.ObjectsInPast)
			pastObject.SetActive(false);

		foreach (var presentObject in Instance.ObjectsInPresent)
			presentObject.SetActive(true);

		Instance.TimeIsPresent = true;
	}

	public static void LinkObjectToPast(GameObject go)
	{
		Instance.ObjectsInPresent.Remove(go);
		Instance.ObjectsInPast.Add(go);

		go.SetActive(!Instance.TimeIsPresent);
	}

	public static void LinkObjectToPresent(GameObject go)
	{
		Instance.ObjectsInPast.Remove(go);
		Instance.ObjectsInPresent.Add(go);

		go.SetActive(Instance.TimeIsPresent);
	}
}
