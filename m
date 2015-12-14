From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH v2 2/2] mfd: arizona: Update binding docs for selecting mono/stereo outputs
Date: Mon, 14 Dec 2015 10:19:12 +0000
Message-ID: <1450088352-10470-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1450088352-10470-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450088352-10470-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Update the device tree binding documentation to include the wlf,out-mono
property that is used to specify whether each output is a mono or stereo
output.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---

Changes since v1:
 - Clarify which outputs correspond to which entry in the out-mono list.

Thanks,
Charles

 Documentation/devicetree/bindings/mfd/arizona.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
index 2b6ccdb..069e31d 100644
--- a/Documentation/devicetree/bindings/mfd/arizona.txt
+++ b/Documentation/devicetree/bindings/mfd/arizona.txt
@@ -65,6 +65,12 @@ Optional properties:
     that have not been specified are set to 0 by default. Entries are:
     <IN1, IN2, IN3, IN4> (wm5102, wm5110, wm8280, wm8997)
     <IN1A, IN2A, IN1B, IN2B> (wm8998, wm1814)
+  - wlf,out-mono : A list of boolean values indicating whether each output is
+    mono or stereo. Position within the list indicates the output affected
+    (eg. First entry in the list corresponds to output 1). A non-zero value
+    indicates a mono output. If present, the number of values should be less
+    than or equal to the number of outputs, if less values are supplied the
+    additional outputs will be treated as stereo.
 
   - wlf,dmic-ref : DMIC reference voltage source for each input, can be
     selected from either MICVDD or one of the MICBIAS's, defines
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
