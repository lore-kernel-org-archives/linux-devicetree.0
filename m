From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 5/6] mfd: arizona: Update DT binding documentation for mic detection
Date: Wed, 16 Sep 2015 10:56:43 +0100
Message-ID: <1442397404-7579-6-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1442397404-7579-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442397404-7579-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com, lee.jones@linaro.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add additional bindings to allow configuration of the system specific
microphone detection settings.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 Documentation/devicetree/bindings/mfd/arizona.txt |   21 +++++++++++++++++++++
 include/dt-bindings/mfd/arizona.h                 |    5 +++++
 2 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
index a8fee60..b98a11b 100644
--- a/Documentation/devicetree/bindings/mfd/arizona.txt
+++ b/Documentation/devicetree/bindings/mfd/arizona.txt
@@ -73,6 +73,27 @@ Optional properties:
     If this node is not mentioned or if the value is unknown, then
     headphone detection mode is set to HPDETL.
 
+  - wlf,micd-software-compare : Use a software comparison to determine mic
+    presence
+  - wlf,micd-detect-debounce : Additional software microphone detection
+    debounce specified in milliseconds.
+  - wlf,micd-pol-gpio : GPIO specifier for the GPIO controlling the headset
+    polarity if one exists.
+  - wlf,micd-bias-start-time : Time allowed for MICBIAS to startup prior to
+    performing microphone detection, specified as per the ARIZONA_MICD_TIME_XXX
+    defines.
+  - wlf,micd-rate : Delay between successive microphone detection measurements,
+    specified as per the ARIZONA_MICD_TIME_XXX defines.
+  - wlf,micd-dbtime : Microphone detection hardware debounces specified as the
+    number of measurements to take, valid values being 2 and 4.
+  - wlf,micd-timeout : Timeout for microphone detection, specified in
+    milliseconds.
+  - wlf,micd-force-micbias : Force MICBIAS continuously on during microphone
+    detection.
+
+  - wlf,gpsw : Settings for the general purpose switch, set as one of the
+    ARIZONA_GPSW_XXX defines.
+
   - DCVDD-supply, MICVDD-supply : Power supplies, only need to be specified if
     they are being externally supplied. As covered in
     Documentation/devicetree/bindings/regulator/regulator.txt
diff --git a/include/dt-bindings/mfd/arizona.h b/include/dt-bindings/mfd/arizona.h
index c40f665..dedf46f 100644
--- a/include/dt-bindings/mfd/arizona.h
+++ b/include/dt-bindings/mfd/arizona.h
@@ -110,4 +110,9 @@
 #define ARIZONA_ACCDET_MODE_HPM 4
 #define ARIZONA_ACCDET_MODE_ADC 7
 
+#define ARIZONA_GPSW_OPEN           0
+#define ARIZONA_GPSW_CLOSED         1
+#define ARIZONA_GPSW_CLAMP_ENABLED  2
+#define ARIZONA_GPSW_CLAMP_DISABLED 3
+
 #endif
-- 
1.7.2.5
