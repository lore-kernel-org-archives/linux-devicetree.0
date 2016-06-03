From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 3/3] MIPS: BMIPS: Add device tree example for BCM6345
Date: Fri,  3 Jun 2016 10:12:04 +0200
Message-ID: <1464941524-3992-3-git-send-email-noltari@gmail.com>
References: <1464941524-3992-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464941524-3992-1-git-send-email-noltari@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ralf@linux-mips.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com, robh@kernel.org, simon@fire.lp0.eu
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

This adds a device tree example for generic BCM96345GW2.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 arch/mips/bmips/Kconfig                 |  4 ++
 arch/mips/boot/dts/brcm/Makefile        |  2 +
 arch/mips/boot/dts/brcm/bcm6345.dtsi    | 94 +++++++++++++++++++++++++=
++++++++
 arch/mips/boot/dts/brcm/bcm96345GW2.dts | 21 ++++++++
 4 files changed, 121 insertions(+)
 create mode 100644 arch/mips/boot/dts/brcm/bcm6345.dtsi
 create mode 100644 arch/mips/boot/dts/brcm/bcm96345GW2.dts

diff --git a/arch/mips/bmips/Kconfig b/arch/mips/bmips/Kconfig
index 14f4b4c..b2426eb 100644
--- a/arch/mips/bmips/Kconfig
+++ b/arch/mips/bmips/Kconfig
@@ -25,6 +25,10 @@ config DT_BCM963268VR3032U
         bool "BCM963268VR3032U"
         select BUILTIN_DTB
=20
+config DT_BCM96345GW2
+        bool "BCM96345GW2"
+        select BUILTIN_DTB
+
 config DT_BCM96358NB4SER
 	bool "BCM96358NB4SER"
 	select BUILTIN_DTB
diff --git a/arch/mips/boot/dts/brcm/Makefile b/arch/mips/boot/dts/brcm=
/Makefile
index 2060e70..fe1f189 100644
--- a/arch/mips/boot/dts/brcm/Makefile
+++ b/arch/mips/boot/dts/brcm/Makefile
@@ -1,6 +1,7 @@
 dtb-$(CONFIG_DT_BCM93384WVG)		+=3D bcm93384wvg.dtb
 dtb-$(CONFIG_DT_BCM93384WVG_VIPER)	+=3D bcm93384wvg_viper.dtb
 dtb-$(CONFIG_DT_BCM963268VR3032U)	+=3D bcm963268vr3032u.dtb
+dtb-$(CONFIG_DT_BCM96345GW2)		+=3D bcm96345gw2.dtb
 dtb-$(CONFIG_DT_BCM96358NB4SER)		+=3D bcm96358nb4ser.dtb
 dtb-$(CONFIG_DT_BCM96368MVWG)		+=3D bcm96368mvwg.dtb
 dtb-$(CONFIG_DT_BCM9EJTAGPRB)		+=3D bcm9ejtagprb.dtb
@@ -17,6 +18,7 @@ dtb-$(CONFIG_DT_NONE)			+=3D \
 						bcm93384wvg.dtb		\
 						bcm93384wvg_viper.dtb	\
 						bcm963268vr3032u.dtb	\
+						bcm96345gw2.dtb		\
 						bcm96358nb4ser.dtb	\
 						bcm96368mvwg.dtb	\
 						bcm9ejtagprb.dtb	\
diff --git a/arch/mips/boot/dts/brcm/bcm6345.dtsi b/arch/mips/boot/dts/=
brcm/bcm6345.dtsi
new file mode 100644
index 0000000..49b6439
--- /dev/null
+++ b/arch/mips/boot/dts/brcm/bcm6345.dtsi
@@ -0,0 +1,94 @@
+/ {
+	#address-cells =3D <1>;
+	#size-cells =3D <1>;
+	compatible =3D "brcm,bcm6345";
+
+	cpus {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		mips-hpt-frequency =3D <70000000>;
+
+		cpu@0 {
+			compatible =3D "brcm,bmips3300";
+			device_type =3D "cpu";
+			reg =3D <0>;
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
+		periph_cntl: syscon@fffe0000 {
+			compatible =3D "syscon";
+			reg =3D <0xfffe0000 0xc>;
+			native-endian;
+		};
+
+		reboot: syscon-reboot@fffe0008 {
+			compatible =3D "syscon-reboot";
+			regmap =3D <&periph_cntl>;
+			offset =3D <0x8>;
+			mask =3D <0x1>;
+		};
+
+		periph_intc: interrupt-controller@fffe000c {
+			compatible =3D "brcm,bcm6345-l1-intc";
+			reg =3D <0xfffe000c 0x8>;
+
+			interrupt-controller;
+			#interrupt-cells =3D <1>;
+
+			interrupt-parent =3D <&cpu_intc>;
+			interrupts =3D <2>;
+		};
+
+		uart0: serial@fffe0300 {
+			compatible =3D "brcm,bcm6345-uart";
+			reg =3D <0xfffe0300 0x18>;
+
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <2>;
+
+			clocks =3D <&periph_clk>;
+
+			status =3D "disabled";
+		};
+
+		ohci: usb@fffe2100 {
+			compatible =3D "brcm,bcm6345-ohci", "generic-ohci";
+			reg =3D <0xfffe2100 0x100>;
+			big-endian;
+			no-big-frame-no;
+
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <5>;
+
+			status =3D "disabled";
+		};
+	};
+};
diff --git a/arch/mips/boot/dts/brcm/bcm96345GW2.dts b/arch/mips/boot/d=
ts/brcm/bcm96345GW2.dts
new file mode 100644
index 0000000..91271f3
--- /dev/null
+++ b/arch/mips/boot/dts/brcm/bcm96345GW2.dts
@@ -0,0 +1,21 @@
+/dts-v1/;
+
+/include/ "bcm6345.dtsi"
+
+/ {
+	compatible =3D "brcm,bcm96345gw2", "brcm,bcm6345";
+	model =3D "Broadcom BCM96345GW2";
+
+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0x00000000 0x01000000>;
+	};
+
+	chosen {
+		stdout-path =3D &uart0;
+	};
+};
+
+&uart0 {
+	status =3D "okay";
+};
--=20
2.1.4
