From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 6/6] MIPS: BMIPS: Add device tree example for BCM6362
Date: Mon, 13 Jun 2016 09:38:54 +0200
Message-ID: <1465803534-25840-6-git-send-email-noltari@gmail.com>
References: <1465803534-25840-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465803534-25840-1-git-send-email-noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds a device tree example for SFR NeufBox 6.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/bmips/Kconfig                    |   4 +
 arch/mips/boot/dts/brcm/Makefile           |   2 +
 arch/mips/boot/dts/brcm/bcm6362.dtsi       | 134 +++++++++++++++++++++=
++++++++
 arch/mips/boot/dts/brcm/bcm96362nb6ser.dts |  22 +++++
 4 files changed, 162 insertions(+)
 create mode 100644 arch/mips/boot/dts/brcm/bcm6362.dtsi
 create mode 100644 arch/mips/boot/dts/brcm/bcm96362nb6ser.dts

diff --git a/arch/mips/bmips/Kconfig b/arch/mips/bmips/Kconfig
index 5b0ad8c..43da496 100644
--- a/arch/mips/bmips/Kconfig
+++ b/arch/mips/bmips/Kconfig
@@ -33,6 +33,10 @@ config DT_BCM96358NB4SER
 	bool "BCM96358NB4SER"
 	select BUILTIN_DTB
=20
+config DT_BCM96362NB6SER
+	bool "BCM96362NB6SER"
+	select BUILTIN_DTB
+
 config DT_BCM96368MVWG
 	bool "BCM96368MVWG"
 	select BUILTIN_DTB
diff --git a/arch/mips/boot/dts/brcm/Makefile b/arch/mips/boot/dts/brcm=
/Makefile
index c553b95..161e54b 100644
--- a/arch/mips/boot/dts/brcm/Makefile
+++ b/arch/mips/boot/dts/brcm/Makefile
@@ -3,6 +3,7 @@ dtb-$(CONFIG_DT_BCM93384WVG)		+=3D bcm93384wvg.dtb
 dtb-$(CONFIG_DT_BCM93384WVG_VIPER)	+=3D bcm93384wvg_viper.dtb
 dtb-$(CONFIG_DT_BCM963268VR3032U)	+=3D bcm963268vr3032u.dtb
 dtb-$(CONFIG_DT_BCM96358NB4SER)		+=3D bcm96358nb4ser.dtb
+dtb-$(CONFIG_DT_BCM96362NB6SER)		+=3D bcm96362nb6ser.dtb
 dtb-$(CONFIG_DT_BCM96368MVWG)		+=3D bcm96368mvwg.dtb
 dtb-$(CONFIG_DT_BCM9EJTAGPRB)		+=3D bcm9ejtagprb.dtb
 dtb-$(CONFIG_DT_BCM97125CBMB)		+=3D bcm97125cbmb.dtb
@@ -20,6 +21,7 @@ dtb-$(CONFIG_DT_NONE)			+=3D \
 						bcm93384wvg_viper.dtb	\
 						bcm963268vr3032u.dtb	\
 						bcm96358nb4ser.dtb	\
+						bcm96362nb6ser.dtb	\
 						bcm96368mvwg.dtb	\
 						bcm9ejtagprb.dtb	\
 						bcm97125cbmb.dtb	\
diff --git a/arch/mips/boot/dts/brcm/bcm6362.dtsi b/arch/mips/boot/dts/=
brcm/bcm6362.dtsi
new file mode 100644
index 0000000..c507da5
--- /dev/null
+++ b/arch/mips/boot/dts/brcm/bcm6362.dtsi
@@ -0,0 +1,134 @@
+/ {
+	#address-cells =3D <1>;
+	#size-cells =3D <1>;
+	compatible =3D "brcm,bcm6362";
+
+	cpus {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		mips-hpt-frequency =3D <200000000>;
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
+		periph_cntl: syscon@10000000 {
+			compatible =3D "syscon";
+			reg =3D <0x10000000 0x14>;
+			native-endian;
+		};
+
+		reboot: syscon-reboot@10000008 {
+			compatible =3D "syscon-reboot";
+			regmap =3D <&periph_cntl>;
+			offset =3D <0x8>;
+			mask =3D <0x1>;
+		};
+
+		periph_intc: interrupt-controller@10000020 {
+			compatible =3D "brcm,bcm6345-l1-intc";
+			reg =3D <0x10000020 0x10>,
+			      <0x10000030 0x10>;
+
+			interrupt-controller;
+			#interrupt-cells =3D <1>;
+
+			interrupt-parent =3D <&cpu_intc>;
+			interrupts =3D <2>, <3>;
+		};
+
+		uart0: serial@10000100 {
+			compatible =3D "brcm,bcm6345-uart";
+			reg =3D <0x10000100 0x18>;
+
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <3>;
+
+			clocks =3D <&periph_clk>;
+
+			status =3D "disabled";
+		};
+
+		uart1: serial@10000120 {
+			compatible =3D "brcm,bcm6345-uart";
+			reg =3D <0x10000120 0x18>;
+
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <4>;
+
+			clocks =3D <&periph_clk>;
+
+			status =3D "disabled";
+		};
+
+		leds0: led-controller@10001900 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			compatible =3D "brcm,bcm6328-leds";
+			reg =3D <0x10001900 0x24>;
+
+			status =3D "disabled";
+		};
+
+		ehci: usb@10002500 {
+			compatible =3D "brcm,bcm6362-ehci", "generic-ehci";
+			reg =3D <0x10002500 0x100>;
+			big-endian;
+
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <10>;
+
+			status =3D "disabled";
+		};
+
+		ohci: usb@10002600 {
+			compatible =3D "brcm,bcm6362-ohci", "generic-ohci";
+			reg =3D <0x10002600 0x100>;
+			big-endian;
+			no-big-frame-no;
+
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <9>;
+
+			status =3D "disabled";
+		};
+	};
+};
diff --git a/arch/mips/boot/dts/brcm/bcm96362nb6ser.dts b/arch/mips/boo=
t/dts/brcm/bcm96362nb6ser.dts
new file mode 100644
index 0000000..a470230
--- /dev/null
+++ b/arch/mips/boot/dts/brcm/bcm96362nb6ser.dts
@@ -0,0 +1,22 @@
+/dts-v1/;
+
+/include/ "bcm6362.dtsi"
+
+/ {
+	compatible =3D "sfr,nb6-ser", "brcm,bcm6362";
+	model =3D "SFT NeufBox 6 (Sercomm)";
+
+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0x00000000 0x08000000>;
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
