using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering.PostProcessing;

public class GameManager : MonoBehaviour
{
	public static GameManager Instance{ get; private set; }

	public Camera mainCam;
	public PostProcessVolume volume;
	public PostProcessProfile ppp_present;
	public PostProcessProfile ppp_past;


	public bool TimeIsPresent = true;
	public List<GameObject> ObjectsInPresent;
	public List<GameObject> ObjectsInPast;

	void Start() {
		SwitchToPresent();
	}

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

		Instance.mainCam.GetComponent<PostProcessScript>().enabled = true; // Sepia
		Instance.volume.profile = Instance.ppp_past;		
	}

	public static void SwitchToPresent()
	{
		foreach (var pastObject in Instance.ObjectsInPast)
			pastObject.SetActive(false);

		foreach (var presentObject in Instance.ObjectsInPresent)
			presentObject.SetActive(true);

		Instance.TimeIsPresent = true;

		Instance.mainCam.GetComponent<PostProcessScript>().enabled = false; // Sepia
		Instance.volume.profile = Instance.ppp_present;		
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
