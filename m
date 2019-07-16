From: Pramod Kumar <pramod.kumar_1@nxp.com>
Subject: [PATCH v4 2/2] arm64: dts: nxp: add ls1046a-frwy board support
Date: Tue, 16 Jul 2019 13:43:31 +0000
Message-ID: <1563284586-29928-3-git-send-email-pramod.kumar_1@nxp.com>
References: <1563284586-29928-1-git-send-email-pramod.kumar_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563284586-29928-1-git-send-email-pramod.kumar_1@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "Michal.Vokac@ysoft.com" <Michal.Vokac@ysoft.com>, Leo Li <leoyang.li@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pramod Kumar <pramod.kumar_1@nxp.com>, Vabhav Sharma <vabhav.sharma@nxp.com>
List-Id: devicetree@vger.kernel.org

ls1046afrwy board is based on nxp ls1046a SoC.
Board support's 4GB ddr memory, i2c, microSD card,
serial console,qspi nor flash,ifc nand flash,qsgmii network interface,
usb 3.0 and serdes interface to support two x1gen3 pcie interface.

Signed-off-by: Vabhav Sharma <vabhav.sharma@nxp.com>
Signed-off-by: Pramod Kumar <pramod.kumar_1@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts | 156 +++++++++++++++++=
++++
 2 files changed, 157 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/f=
reescale/Makefile
index 0bd122f..1211531 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1028a-qds.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1028a-rdb.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1043a-qds.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1043a-rdb.dtb
+dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1046a-frwy.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1046a-qds.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1046a-rdb.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) +=3D fsl-ls1088a-qds.dtb
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts b/arch/arm6=
4/boot/dts/freescale/fsl-ls1046a-frwy.dts
new file mode 100644
index 0000000..cda4998
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dts
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree Include file for Freescale Layerscape-1046A family SoC.
+ *
+ * Copyright 2019 NXP.
+ *
+ */
+
+/dts-v1/;
+
+#include "fsl-ls1046a.dtsi"
+
+/ {
+	model =3D "LS1046A FRWY Board";
+	compatible =3D "fsl,ls1046a-frwy", "fsl,ls1046a";
+
+	aliases {
+		serial0 =3D &duart0;
+		serial1 =3D &duart1;
+		serial2 =3D &duart2;
+		serial3 =3D &duart3;
+	};
+
+	chosen {
+		stdout-path =3D "serial0:115200n8";
+	};
+
+	sb_3v3: regulator-sb3v3 {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "LT8642SEV-3.3V";
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&duart0 {
+	status =3D "okay";
+};
+
+&duart1 {
+	status =3D "okay";
+};
+
+&duart2 {
+	status =3D "okay";
+};
+
+&duart3 {
+	status =3D "okay";
+};
+
+&i2c0 {
+	status =3D "okay";
+
+	i2c-mux@77 {
+		compatible =3D "nxp,pca9546";
+		reg =3D <0x77>;
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		i2c@0 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			reg =3D <0>;
+
+			power-monitor@40 {
+				compatible =3D "ti,ina220";
+				reg =3D <0x40>;
+				shunt-resistor =3D <1000>;
+			};
+
+
+			temperature-sensor@4c {
+				compatible =3D "nxp,sa56004";
+				reg =3D <0x4c>;
+				vcc-supply =3D <&sb_3v3>;
+			};
+
+			rtc@51 {
+				compatible =3D "nxp,pcf2129";
+				reg =3D <0x51>;
+			};
+
+			eeprom@52 {
+				compatible =3D "atmel,24c512";
+				reg =3D <0x52>;
+			};
+
+			eeprom@53 {
+				compatible =3D "atmel,24c512";
+				reg =3D <0x53>;
+			};
+
+		};
+	};
+};
+
+&ifc {
+	#address-cells =3D <2>;
+	#size-cells =3D <1>;
+	/* NAND Flash */
+	ranges =3D <0x0 0x0 0x0 0x7e800000 0x00010000>;
+	status =3D "okay";
+
+	nand@0,0 {
+		compatible =3D "fsl,ifc-nand";
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+		reg =3D <0x0 0x0 0x10000>;
+	};
+
+};
+
+#include "fsl-ls1046-post.dtsi"
+
+&fman0 {
+	ethernet@e0000 {
+		phy-handle =3D <&qsgmii_phy4>;
+		phy-connection-type =3D "qsgmii";
+	};
+
+	ethernet@e8000 {
+		phy-handle =3D <&qsgmii_phy2>;
+		phy-connection-type =3D "qsgmii";
+	};
+
+	ethernet@ea000 {
+		phy-handle =3D <&qsgmii_phy1>;
+		phy-connection-type =3D "qsgmii";
+	};
+
+	ethernet@f2000 {
+		phy-handle =3D <&qsgmii_phy3>;
+		phy-connection-type =3D "qsgmii";
+	};
+
+	mdio@fd000 {
+		qsgmii_phy1: ethernet-phy@1c {
+			reg =3D <0x1c>;
+		};
+
+		qsgmii_phy2: ethernet-phy@1d {
+			reg =3D <0x1d>;
+		};
+
+		qsgmii_phy3: ethernet-phy@1e {
+			reg =3D <0x1e>;
+		};
+
+		qsgmii_phy4: ethernet-phy@1f {
+			reg =3D <0x1f>;
+		};
+	};
+};
--=20
2.7.4
