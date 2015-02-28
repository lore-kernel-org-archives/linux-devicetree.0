From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH 5/5] mfd: arizona: Update DT binding documentation for inmode
Date: Sat, 28 Feb 2015 14:54:28 +0000
Message-ID: <1425135268-32340-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1425135268-32340-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425135268-32340-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Update the DT binding documentation for the inmode binding to mention
the new defines and clarify the text slightly.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/arizona.txt |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
index 8709f07..f5afa69 100644
--- a/Documentation/devicetree/bindings/mfd/arizona.txt
+++ b/Documentation/devicetree/bindings/mfd/arizona.txt
@@ -47,12 +47,11 @@ Optional properties:
     a value that is out of range for a 16 bit register then the chip default
     will be used. If present exactly five values must be specified.
 
-  - wlf,inmode : A list of INn_MODE register values, where n is the number
-    of input signals. Valid values are 0 (Differential), 1 (Single-ended) and
-    2 (Digital Microphone). If absent, INn_MODE registers set to 0 by default.
-    If present, values must be specified less than or equal to the number of
-    input singals. If values less than the number of input signals, elements
-    that has not been specifed are set to 0 by default.
+  - wlf,inmode : A list of the mode for each input. Each input can be set to
+    differential, single-ended or a digital microphone. Defines for all values
+    (ARIZONA_INMODE_xxxx) are located in <dt-bindings/mfd/arizona.txt>. If
+    present, the number of values should be less than or equal to the number
+    of inputs, unspecified inputs will use the chip default.
 
   - wlf,dmic-ref : DMIC reference for each input, can be selected from either
     MICVDD or one of the MICBIAS's, defines (ARIZONA_DMIC_xxxx) are provided
-- 
1.7.2.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
