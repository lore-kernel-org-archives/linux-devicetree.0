From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH v3 1/3] Documentation: Add documentation for the APM X-Gene SoC RTC DTS binding
Date: Thu,  3 Apr 2014 00:17:51 -0600
Message-ID: <1396505873-5507-2-git-send-email-lho@apm.com>
References: <1396505873-5507-1-git-send-email-lho@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396505873-5507-1-git-send-email-lho-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds documentation for the APM X-Gene SoC RTC DTS binding.

Signed-off-by: Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
Signed-off-by: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
---
 .../devicetree/bindings/rtc/xgene-rtc.txt          |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/xgene-rtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/xgene-rtc.txt b/Documentation/devicetree/bindings/rtc/xgene-rtc.txt
new file mode 100644
index 0000000..2e9c503
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/xgene-rtc.txt
@@ -0,0 +1,27 @@
+* APM X-Gene Real Time Clock
+
+RTC controller for the APM X-Gene Real Time Clock
+
+Required properties:
+- compatible : Should be "apm,xgene-rtc"
+- reg: physical base address of the controller and length of memory mapped
+  region.
+- interrupts: IRQ line for the RTC.
+- clocks: Reference to the clock entry.
+
+Example:
+
+rtcclk: rtcclk {
+	compatible = "fixed-clock";
+	#clock-cells = <1>;
+	clock-frequency = <100000000>;
+	clock-output-names = "rtcclk";
+};
+
+rtc: rtc@10510000 {
+	compatible = "apm,xgene-rtc";
+	reg = <0x0 0x10510000 0x0 0x400>;
+	interrupts = <0x0 0x46 0x4>;
+	#clock-cells = <1>;
+	clocks = <&rtcclk 0>;
+};
-- 
1.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
