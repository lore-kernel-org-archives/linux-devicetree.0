From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 2/2] arm64: dts: Add Mediatek X20 Development Board support
Date: Thu, 19 Jul 2018 16:24:50 +0530
Message-ID: <1531997690-6040-3-git-send-email-manivannan.sadhasivam@linaro.org>
References: <1531997690-6040-1-git-send-email-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531997690-6040-1-git-send-email-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@gmail.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, taiten.peng@linaro.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, manivannanece23@gmail.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add initial device tree support for Mediatek X20 Development Board
based on MT6797 Deca core SoC. This board is one of the 96Boards
Consumer Edition platform.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/mediatek/Makefile           |  1 +
 arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dts | 33 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index ac17f60..5b7fd6a 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -3,5 +3,6 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt2712-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6755-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dts b/arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dts
new file mode 100644
index 0000000..742938a
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dts
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for MediaTek X20 Development Board
+ *
+ * Copyright (C) 2018, Linaro Ltd.
+ *
+ */
+
+/dts-v1/;
+
+#include "mt6797.dtsi"
+
+/ {
+	model = "Mediatek X20 Development Board";
+	compatible = "archermind,mt6797-x20-dev", "mediatek,mt6797";
+
+	aliases {
+		serial0 = &uart1;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x80000000>;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart1 {
+	status = "okay";
+};
-- 
2.7.4
