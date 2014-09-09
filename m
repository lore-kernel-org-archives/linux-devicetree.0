From: Jingchang Lu <jingchang.lu@freescale.com>
Subject: [PATCHv3 3/6] ARM: dts: Add initial LS1021A TWR board dts support
Date: Tue, 9 Sep 2014 17:12:29 +0800
Message-ID: <1410253952-15631-4-git-send-email-jingchang.lu@freescale.com>
References: <1410253952-15631-1-git-send-email-jingchang.lu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1410253952-15631-1-git-send-email-jingchang.lu@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawn.guo@freescale.com
Cc: devicetree@vger.kernel.org, Chao Fu <B44548@freescale.com>, Chen Lu <B46807@freescale.com>, linux-arm-kernel@lists.infradead.org, Jingchang Lu <jingchang.lu@freescale.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Chen Lu <B46807@freescale.com>
Signed-off-by: Chao Fu <B44548@freescale.com>
Signed-off-by: Jingchang Lu <jingchang.lu@freescale.com>
---
 arch/arm/boot/dts/Makefile        |   1 +
 arch/arm/boot/dts/ls1021a-twr.dts | 117 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 118 insertions(+)
 create mode 100755 arch/arm/boot/dts/ls1021a-twr.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d2609c4..a972457 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -246,6 +246,7 @@ dtb-$(CONFIG_ARCH_MXC) += \
 	imx6sl-evk.dtb \
 	imx6sx-sdb.dtb \
 	ls1021a-qds.dtb \
+	ls1021a-twr.dtb \
 	vf610-colibri-eval-v3.dtb \
 	vf610-cosmic.dtb \
 	vf610-twr.dtb
diff --git a/arch/arm/boot/dts/ls1021a-twr.dts b/arch/arm/boot/dts/ls1021a-twr.dts
new file mode 100755
index 0000000..1a7e9fb
--- /dev/null
+++ b/arch/arm/boot/dts/ls1021a-twr.dts
@@ -0,0 +1,117 @@
+/*
+ * Copyright 2013-2014 Freescale Semiconductor, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+/dts-v1/;
+#include "ls1021a.dtsi"
+
+/ {
+	model = "LS1021A TWR Board";
+
+	aliases {
+		enet2_rgmii_phy = &rgmii_phy1;
+		enet0_sgmii_phy = &sgmii_phy2;
+		enet1_sgmii_phy = &sgmii_phy0;
+	};
+};
+
+&dspi1 {
+	bus-num = <0>;
+	status = "okay";
+
+	dspiflash: s25fl064k@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "spansion,s25fl064k";
+		spi-max-frequency = <16000000>;
+		spi-cpol;
+		spi-cpha;
+		reg = <0>;
+	};
+};
+
+&enet0 {
+	tbi-handle = <&tbi1>;
+	phy-handle = <&sgmii_phy2>;
+	phy-connection-type = "sgmii";
+	status = "okay";
+};
+
+&enet1 {
+	tbi-handle = <&tbi1>;
+	phy-handle = <&sgmii_phy0>;
+	phy-connection-type = "sgmii";
+	status = "okay";
+};
+
+&enet2 {
+	phy-handle = <&rgmii_phy1>;
+	phy-connection-type = "rgmii-id";
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&ifc {
+	status = "okay";
+	#address-cells = <2>;
+	#size-cells = <1>;
+	/* NOR, and CPLD on board */
+	ranges = <0x0 0x0 0x0 0x60000000 0x08000000>;
+
+		nor@0,0 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "cfi-flash";
+			reg = <0x0 0x0 0x8000000>;
+			bank-width = <2>;
+			device-width = <1>;
+		};
+};
+
+&lpuart0 {
+	status = "okay";
+};
+
+&mdio0 {
+	sgmii_phy0: ethernet-phy@0 {
+		reg = <0x0>;
+	};
+	rgmii_phy1: ethernet-phy@1 {
+		reg = <0x1>;
+	};
+	sgmii_phy2: ethernet-phy@2 {
+		reg = <0x2>;
+	};
+	tbi1: tbi-phy@1f {
+		reg = <0x1f>;
+		device_type = "tbi-phy";
+	};
+};
+
+&pwm6 {
+	status = "okay";
+};
+
+&pwm7 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
-- 
1.8.0
