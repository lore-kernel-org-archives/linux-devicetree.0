From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH v6 5/5] mfd: arizona: Update DT doc for new mic detection bindings
Date: Thu,  9 Jul 2015 11:09:16 +0100
Message-ID: <1436436556-15540-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1436436556-15540-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436436556-15540-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---

As this patch is still outstanding from the last series I
just updated the patch from the last series to include the
additions from this series.

This patch can obviously be applied seperately from the
rest of the series as there are no dependencies but I have
included it so everyone can see the series together.

Thanks,
Charles

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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
