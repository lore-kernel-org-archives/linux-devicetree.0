From: Sricharan R <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 08/15] ARM: dts: ipq4019: Add qcom-ipq4019-ap.dk04.1-c5 board file
Date: Mon, 29 Jan 2018 10:41:22 +0530
Message-ID: <1517202689-14212-9-git-send-email-sricharan@codeaurora.org>
References: <1517202689-14212-1-git-send-email-sricharan@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517202689-14212-1-git-send-email-sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

dk04.1-c5 has a spinand connected to spi bus0 chipselect 1.

Signed-off-by: Sricharan R <sricharan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                      |  1 +
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c5.dts | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c5.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 1a8ab050..68e4b15 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -726,6 +726,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-ipq4019-ap.dk01.1-c1.dtb \
 	qcom-ipq4019-ap.dk01.1-c2.dtb \
 	qcom-ipq4019-ap.dk04.1-c1.dtb \
+	qcom-ipq4019-ap.dk04.1-c5.dtb \
 	qcom-ipq8064-ap148.dtb \
 	qcom-msm8660-surf.dtb \
 	qcom-msm8960-cdp.dtb \
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c5.dts b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c5.dts
new file mode 100644
index 0000000..270b197
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1-c5.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2017, The Linux Foundation. All rights reserved.
+
+#include "qcom-ipq4019-ap.dk04.1.dtsi"
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ4019/AP-DK04.1-C5";
+
+	soc {
+		spi_0: spi@78b5000 { /* BLSP1 QUP1 */
+			status = "ok";
+			cs-gpios = <&tlmm 12 0>, <&tlmm 45 0>;
+			num-cs = <2>;
+
+			mt29f@1 {
+				#address-cells = <1>;
+				#size-cells = <1>;
+				compatible = "spinand,mt29f";
+				reg = <1>;
+				spi-max-frequency = <24000000>;
+			};
+		};
+	};
+};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
