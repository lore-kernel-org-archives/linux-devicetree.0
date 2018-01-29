From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH 05/15] ARM: dts: ipq4019: Add ipq4019-ap-dk01-c2 board file
Date: Mon, 29 Jan 2018 10:41:19 +0530
Message-ID: <1517202689-14212-6-git-send-email-sricharan@codeaurora.org>
References: <1517202689-14212-1-git-send-email-sricharan@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1517202689-14212-1-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, robh@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, andy.gross@linaro.org, david.brown@linaro.org, catalin.marinas@arm.com, will.deacon@arm.com, sboyd@codeaurora.org, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
Cc: sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

The board has a spi-nand interface on spi0 bus chipselect1.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 arch/arm/boot/dts/Makefile                      |  1 +
 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c2.dts | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d0381e9..21ed56d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -724,6 +724,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-apq8084-ifc6540.dtb \
 	qcom-apq8084-mtp.dtb \
 	qcom-ipq4019-ap.dk01.1-c1.dtb \
+	qcom-ipq4019-ap.dk01.1-c2.dtb \
 	qcom-ipq8064-ap148.dtb \
 	qcom-msm8660-surf.dtb \
 	qcom-msm8960-cdp.dtb \
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c2.dts b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c2.dts
new file mode 100644
index 0000000..e3442da
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk01.1-c2.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2017, The Linux Foundation. All rights reserved.
+
+#include "qcom-ipq4019-ap.dk01.1.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ40xx/AP-DK01.1-C2";
+
+	soc {
+		spi_0: spi@78b5000 { /* BLSP1 QUP1 */
+			status = "ok";
+			cs-gpios = <&tlmm 54 0>, <&tlmm 59 0>;
+			num-cs = <2>;
+
+			mt29f@1 {
+				#address-cells = <1>;
+				#size-cells = <1>;
+				compatible = "spinand,mt29f";
+				reg = <1>;
+				spi-max-frequency = <24000000>;
+			};
+
+		};
+	};
+};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
