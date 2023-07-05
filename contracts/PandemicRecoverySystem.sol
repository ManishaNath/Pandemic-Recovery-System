// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PandemicRecoverySystem {
    // PATIENT Module
    struct Patient {
        string Pname;
        uint16 age;
        string symptom;
    }

    mapping(address => Patient) public patients;
    event PatientDetails(string Pname, uint16 age, string symptom);


    function FillPatientDetails(
        string memory _Pname,
        uint16 _age,
        string memory _symptom
    ) external {
    
        Patient memory eachpatient = Patient(_Pname, _age, _symptom);
        patients[msg.sender] = eachpatient;
    }

    function GetPatientSymptom(address _patientaddress)
        external
        view
        returns (string memory)
    {
       
        Patient storage patient1 = patients[_patientaddress];
        return patient1.symptom;
    }

    function PatientAddress(address _patientaddress) external returns (bool) {
        Patient storage patient1 = patients[_patientaddress];
        emit PatientDetails(patient1.Pname, patient1.age, patient1.symptom);
        return true;
    }

    // RECOVERER Module

    struct Recoverer {
        string Rname;
        string Symptoms;
        string HospitalName;
        string HospitalLocation;
        uint16 DaysForRecovery;
        string TestUndergone;
        uint16 AmtSpent;
        string MedicationsTaken;
    }

    mapping(address => Recoverer) public recoverers;
    event RecovererDetails(
        string Rname,
        string Symptoms,
        string HospitalName,
        string HospitalLocation,
        uint256 DaysForRecovery,
        string TestUndergone,
        uint16 AmtSpent,
        string MedicationsTaken
    );


    function FillRecovererDetails(
        string memory _Rname,
        string memory _Symptom,
        string memory _HospitalName,
        string memory _HospitalLocation,
        uint16 _DaysForRecovery,
        string memory _TestUndergone,
        uint16 _AmtSpent,
        string memory _MedicationsTaken
    ) external {
     
        Recoverer memory EachRecoverer = Recoverer(
            _Rname,
            _Symptom,
            _HospitalName,
            _HospitalLocation,
            _DaysForRecovery,
            _TestUndergone,
            _AmtSpent,
            _MedicationsTaken
        );
        recoverers[msg.sender] = EachRecoverer;
  
        findTheDetail[_Symptom] = msg.sender;
    }

    function GetRecovererSymptom(address _RecovererAddress)
        external
        view
        returns (string memory)
    {
     
        Recoverer storage Recoverer1 = recoverers[_RecovererAddress];
        return Recoverer1.Symptoms;
    }

    function RecovererAddressIs(address _RecovererAddress)
        external
        returns (bool)
    {
       
        Recoverer storage Recoverer1 = recoverers[_RecovererAddress];
           emit RecovererDetails(
            Recoverer1.Rname,
            Recoverer1.Symptoms,
            Recoverer1.HospitalName,
            Recoverer1.HospitalLocation,
            Recoverer1.DaysForRecovery,
            Recoverer1.TestUndergone,
            Recoverer1.AmtSpent,
            Recoverer1.MedicationsTaken
        );
        return true;
    }


    mapping(string => address) findTheDetail;

    function HowToRecoverDetails(string memory _symptom)
        external
        view
        returns (Recoverer memory)
    {
        address recovererAddress = findTheDetail[_symptom];
        return recoverers[recovererAddress];
    }
}
