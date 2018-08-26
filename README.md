# DummyBLE_NeoPulse
Shared test by Preeti Dhawan @Pathway(neopulse) Fri, Aug 24, 6:54 PM

# Few points regarding code:
1. Architecture is MVVM 
2. In DashBoardVC class, fakeBLEDataFetch() method generates dummy data, considering it as didUpdateValueFor characteristic (steps value is not updated)
3. Most of the icons are extracted from shared image
4. In HistoryVC class, chart is generated using third party framework "Charts"
5. data in charts is random 20 values between 60-80 bmr. clicking on hourly, daily, etc just randomises values again
