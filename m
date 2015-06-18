From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v2 4/5] mfd: arizona: Update DT doc for new mic detection bindings
Date: Thu, 18 Jun 2015 15:43:50 +0100
Message-ID: <1434638631-16451-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1434638631-16451-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434638631-16451-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 Documentation/devicetree/bindings/mfd/arizona.txt |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
index 32a71b7..8d92c92 100644
--- a/Documentation/devicetree/bindings/mfd/arizona.txt
+++ b/Documentation/devicetree/bindings/mfd/arizona.txt
@@ -68,6 +68,22 @@ Optional properties:
     If this node is not mentioned or if the value is unknown, then
     headphone detection mode is set to HPDETL.
 
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
   - DCVDD-supply, MICVDD-supply : Power supplies, only need to be specified if
     they are being externally supplied. As covered in
     Documentation/devicetree/bindings/regulator/regulator.txt
-- 
1.7.2.5
