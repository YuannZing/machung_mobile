package com.example.machung_mobile

import android.content.Context
import android.location.LocationManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "mock_location"

    override fun configureFlutterEngine(flutterEngine: io.flutter.embedding.engine.FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "checkMock") {
                result.success(isMockLocation())
            }
        }
    }

    private fun isMockLocation(): Boolean {
        val locationManager = getSystemService(Context.LOCATION_SERVICE) as LocationManager
        val providers = locationManager.getProviders(true)
        for (provider in providers) {
            val location = locationManager.getLastKnownLocation(provider)
            if (location != null && android.os.Build.VERSION.SDK_INT >= 18) {
                if (location.isFromMockProvider) return true
            }
        }
        return false
    }
}
