From: Josh Cartwright <joshc@codeaurora.org>
Subject: [PATCH v2 6/6] documentation: bindings: document PMIC8921/8058 RTC
Date: Mon, 10 Mar 2014 13:44:49 -0500
Message-ID: <1394477089-3996-7-git-send-email-joshc@codeaurora.org>
References: <1394477089-3996-1-git-send-email-joshc@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1394477089-3996-1-git-send-email-joshc@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Alessandro Zummo <a.zummo@towertech.it>, linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, rtc-linux@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This RTC is found on the Qualcomm 8921 and 8058 PMICs.

Signed-off-by: Josh Cartwright <joshc@codeaurora.org>
---
 .../devicetree/bindings/rtc/qcom,pm8xxx-rtc.txt     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/qcom,pm8xxx-rtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/qcom,pm8xxx-rtc.txt b/Documentation/devicetree/bindings/rtc/qcom,pm8xxx-rtc.txt
new file mode 100644
index 0000000..3eaa582
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/qcom,pm8xxx-rtc.txt
@@ -0,0 +1,21 @@
+* Real-Time Clock for Qualcomm 8058/8921 PMICs
+
+Required properties:
+- compatible: should be one of the following.
+    * "qcom,pm8058-rtc"
+    * "qcom,pm8921-rtc"
+- reg: base address of the register region
+- interrupts: interrupt list for the RTC, must contain a single interrupt
+              specifier for the alarm interrupt
+
+Optional properties:
+- allow-set-time: indicates that the setting of RTC time is allowed by
+                  the host CPU
+
+Example:
+
+	rtc@11d {
+		compatible = "qcom,pm8921-rtc";
+		reg = <0x11d>;
+		interrupts = <0x27 0>;
+	};
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
