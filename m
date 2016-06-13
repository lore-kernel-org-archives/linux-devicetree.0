From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 4/6] MIPS: BMIPS: Add device tree example for BCM3368
Date: Mon, 13 Jun 2016 09:38:52 +0200
Message-ID: <1465803534-25840-4-git-send-email-noltari@gmail.com>
References: <1465803534-25840-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465803534-25840-1-git-send-email-noltari@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ralf@linux-mips.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com, robh@kernel.org, simon@fire.lp0.eu
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

This adds a device tree example for Netgear CVG834G.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 arch/mips/bmips/Kconfig                     |   4 ++
 arch/mips/boot/dts/brcm/Makefile            |   2 +
 arch/mips/boot/dts/brcm/bcm3368.dtsi        | 101 ++++++++++++++++++++=
++++++++
 arch/mips/boot/dts/brcm/bcm93368cvg834g.dts |  22 ++++++
 4 files changed, 129 insertions(+)
 create mode 100644 arch/mips/boot/dts/brcm/bcm3368.dtsi
 create mode 100644 arch/mips/boot/dts/brcm/bcm93368cvg834g.dts

diff --git a/arch/mips/bmips/Kconfig b/arch/mips/bmips/Kconfig
index 14f4b4c..5b0ad8c 100644
--- a/arch/mips/bmips/Kconfig
+++ b/arch/mips/bmips/Kconfig
@@ -13,6 +13,10 @@ choice
 config DT_NONE
 	bool "None"
=20
+config DT_BCM93368CVG834G
+	bool "BCM93368CVG834G"
+	select BUILTIN_DTB
+
 config DT_BCM93384WVG
 	bool "BCM93384WVG Zephyr CPU"
 	select BUILTIN_DTB
diff --git a/arch/mips/boot/dts/brcm/Makefile b/arch/mips/boot/dts/brcm=
/Makefile
index 2060e70..c553b95 100644
--- a/arch/mips/boot/dts/brcm/Makefile
+++ b/arch/mips/boot/dts/brcm/Makefile
@@ -1,3 +1,4 @@
+dtb-$(CONFIG_DT_BCM93368CVG834G)	+=3D bcm93368cvg834g.dtb
 dtb-$(CONFIG_DT_BCM93384WVG)		+=3D bcm93384wvg.dtb
 dtb-$(CONFIG_DT_BCM93384WVG_VIPER)	+=3D bcm93384wvg_viper.dtb
 dtb-$(CONFIG_DT_BCM963268VR3032U)	+=3D bcm963268vr3032u.dtb
@@ -14,6 +15,7 @@ dtb-$(CONFIG_DT_BCM97425SVMB)		+=3D bcm97425svmb.dtb
 dtb-$(CONFIG_DT_BCM97435SVMB)		+=3D bcm97435svmb.dtb
=20
 dtb-$(CONFIG_DT_NONE)			+=3D \
+						bcm93368cvg834g.dtb	\
 						bcm93384wvg.dtb		\
 						bcm93384wvg_viper.dtb	\
 						bcm963268vr3032u.dtb	\
diff --git a/arch/mips/boot/dts/brcm/bcm3368.dtsi b/arch/mips/boot/dts/=
brcm/bcm3368.dtsi
new file mode 100644
index 0000000..bee855c
--- /dev/null
+++ b/arch/mips/boot/dts/brcm/bcm3368.dtsi
@@ -0,0 +1,101 @@
+/ {
+	#address-cells =3D <1>;
+	#size-cells =3D <1>;
+	compatible =3D "brcm,bcm3368";
+
+	cpus {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		mips-hpt-frequency =3D <150000000>;
+
+		cpu@0 {
+			compatible =3D "brcm,bmips4350";
+			device_type =3D "cpu";
+			reg =3D <0>;
+		};
+
+		cpu@1 {
+			compatible =3D "brcm,bmips4350";
+			device_type =3D "cpu";
+			reg =3D <1>;
+		};
+	};
+
+	clocks {
+		periph_clk: periph-clk {
+			compatible =3D "fixed-clock";
+			#clock-cells =3D <0>;
+			clock-frequency =3D <50000000>;
+		};
+	};
+
+	aliases {
+		serial0 =3D &uart0;
+		serial1 =3D &uart1;
+	};
+
+	cpu_intc: interrupt-controller {
+		#address-cells =3D <0>;
+		compatible =3D "mti,cpu-interrupt-controller";
+
+		interrupt-controller;
+		#interrupt-cells =3D <1>;
+	};
+
+	ubus {
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+
+		compatible =3D "simple-bus";
+		ranges;
+
+		periph_cntl: syscon@fff8c000 {
+			compatible =3D "syscon";
+			reg =3D <0xfff8c000 0xc>;
+			native-endian;
+		};
+
+		reboot: syscon-reboot@fff8c008 {
+			compatible =3D "syscon-reboot";
+			regmap =3D <&periph_cntl>;
+			offset =3D <0x8>;
+			mask =3D <0x1>;
+		};
+
+		periph_intc: interrupt-controller@fff8c00c {
+			compatible =3D "brcm,bcm6345-l1-intc";
+			reg =3D <0xfff8c00c 0x8>;
+
+			interrupt-controller;
+			#interrupt-cells =3D <1>;
+
+			interrupt-parent =3D <&cpu_intc>;
+			interrupts =3D <2>;
+		};
+
+		uart0: serial@fff8c100 {
+			compatible =3D "brcm,bcm6345-uart";
+			reg =3D <0xfff8c100 0x18>;
+
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <2>;
+
+			clocks =3D <&periph_clk>;
+
+			status =3D "disabled";
+		};
+
+		uart1: serial@fff8c120 {
+			compatible =3D "brcm,bcm6345-uart";
+			reg =3D <0xfff8c120 0x18>;
+
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <3>;
+
+			clocks =3D <&periph_clk>;
+
+			status =3D "disabled";
+		};
+	};
+};
diff --git a/arch/mips/boot/dts/brcm/bcm93368cvg834g.dts b/arch/mips/bo=
ot/dts/brcm/bcm93368cvg834g.dts
new file mode 100644
index 0000000..68475c4
--- /dev/null
+++ b/arch/mips/boot/dts/brcm/bcm93368cvg834g.dts
@@ -0,0 +1,22 @@
+/dts-v1/;
+
+/include/ "bcm3368.dtsi"
+
+/ {
+	compatible =3D "netgear,cvg834g", "brcm,bcm3368";
+	model =3D "Netgear CVG834G";
+
+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0x00000000 0x02000000>;
+	};
+
+	chosen {
+		bootargs =3D "console=3DttyS0,115200";
+		stdout-path =3D &uart0;
+	};
+};
+
+&uart0 {
+	status =3D "okay";
+};
--=20
2.1.4
