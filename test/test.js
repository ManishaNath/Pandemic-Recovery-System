const PandemicRecoverySystem = artifacts.require("PandemicRecoverySystem");
    contract("PandemicRecoverySystem", (accounts) => {
     let instance;
      before(async () => {
       instance = await PandemicRecoverySystem.deployed();
     });
     // for filling patient details:-
      it("should fill patient details", async () => {
       await instance.FillPatientDetails("John", 30, "Fever");
       const patientSymptom = await instance.GetPatientSymptom(accounts[0]);
       assert.equal(patientSymptom, "Fever");
     });
     // for filling recoverer details :-
      it("should fill recoverer details", async () => {
       await instance.FillRecovererDetails(
         "Smith",
         "Fever",
         "Hospital A",
         "Bangalore",
         10,
         "Test A",
         100,
         "Medication A"
       );

       // to get symptom matching
       const recovererSymptom = await instance.GetRecovererSymptom(accounts[0]);
       assert.equal(recovererSymptom, "Fever");
     });
      it("should get recoverer details by symptom", async () => {
       const recovererDetails = await instance.HowToRecoverDetails("Fever");
       assert.equal(recovererDetails.Rname, "Smith");
       assert.equal(recovererDetails.HospitalName, "Hospital A");
       assert.equal(recovererDetails.HospitalLocation, "Bangalore");
       assert.equal(recovererDetails.DaysForRecovery, 10);
       assert.equal(recovererDetails.TestUndergone, "Test A");
       assert.equal(recovererDetails.AmtSpent, 100);
       assert.equal(recovererDetails.MedicationsTaken, "Medication A");
     });
   });