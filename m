From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v3 5/6] extcon: arizona: Update DT binding documentation for mic detection
Date: Thu, 19 Nov 2015 15:45:39 +0000
Message-ID: <1447947940-3054-6-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1447947940-3054-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447947940-3054-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Add additional bindings to allow configuration of the system specific
microphone detection settings.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 .../devicetree/bindings/extcon/extcon-arizona.txt  |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
index e1705fa..d661811 100644
--- a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
+++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
@@ -13,3 +13,23 @@ Optional properties:
     ARIZONA_ACCDET_MODE_HPR or 2 - Headphone detect mode is set to HPDETR
     If this node is not mentioned or if the value is unknown, then
     headphone detection mode is set to HPDETL.
+
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
+  - wlf,gpsw : Settings for the general purpose switch
-- 
1.7.2.5
