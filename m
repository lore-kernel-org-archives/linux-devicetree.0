From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 2/2] bmips: add device tree example for BCM6358
Date: Mon,  4 Apr 2016 10:09:13 +0200
Message-ID: <1459757353-14683-2-git-send-email-noltari@gmail.com>
References: <1459677376-10449-1-git-send-email-noltari@gmail.com>
 <1459757353-14683-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459757353-14683-1-git-send-email-noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds a device tree example for SFR Neufbox4 (Sercomm version), whi=
ch
also serves as a real example for brcm,bcm6358-leds.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 v4: Device tree improvements:
  - Switch to native-endian for syscon.
  - Switch to bcm6345-l1-intc interrupt controller.
  - Add ehci and ohci nodes.
 v3: Device tree fixes
  - Use interrupt-controller instead of periph_intc.
  - Use led@# instead of naming the LEDs.
 v2: Remove led0 alias and use stdout-path only

 .../devicetree/bindings/mips/brcm/soc.txt          |   2 +-
 arch/mips/bmips/Kconfig                            |   4 +
 arch/mips/boot/dts/brcm/Makefile                   |   2 +
 arch/mips/boot/dts/brcm/bcm6358.dtsi               | 130 +++++++++++++=
++++++++
 arch/mips/boot/dts/brcm/bcm96358nb4ser.dts         |  46 ++++++++
 5 files changed, 183 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/boot/dts/brcm/bcm6358.dtsi
 create mode 100644 arch/mips/boot/dts/brcm/bcm96358nb4ser.dts

diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.txt b/Docu=
mentation/devicetree/bindings/mips/brcm/soc.txt
index 7bab90c..e58a4f6 100644
--- a/Documentation/devicetree/bindings/mips/brcm/soc.txt
+++ b/Documentation/devicetree/bindings/mips/brcm/soc.txt
@@ -4,7 +4,7 @@ Required properties:
=20
 - compatible: "brcm,bcm3384", "brcm,bcm33843"
               "brcm,bcm3384-viper", "brcm,bcm33843-viper"
-              "brcm,bcm6328", "brcm,bcm6368",
+              "brcm,bcm6328", "brcm,bcm6358", "brcm,bcm6368",
               "brcm,bcm7125", "brcm,bcm7346", "brcm,bcm7358", "brcm,bc=
m7360",
               "brcm,bcm7362", "brcm,bcm7420", "brcm,bcm7425"
=20
diff --git a/arch/mips/bmips/Kconfig b/arch/mips/bmips/Kconfig
index e2c4fd6..264328d 100644
--- a/arch/mips/bmips/Kconfig
+++ b/arch/mips/bmips/Kconfig
@@ -21,6 +21,10 @@ config DT_BCM93384WVG_VIPER
 	bool "BCM93384WVG Viper CPU (EXPERIMENTAL)"
 	select BUILTIN_DTB
=20
+config DT_BCM96358NB4SER
+	bool "BCM96358NB4SER"
+	select BUILTIN_DTB
+
 config DT_BCM96368MVWG
 	bool "BCM96368MVWG"
 	select BUILTIN_DTB
diff --git a/arch/mips/boot/dts/brcm/Makefile b/arch/mips/boot/dts/brcm=
/Makefile
index eabeb60..fda9d38 100644
--- a/arch/mips/boot/dts/brcm/Makefile
+++ b/arch/mips/boot/dts/brcm/Makefile
@@ -1,5 +1,6 @@
 dtb-$(CONFIG_DT_BCM93384WVG)		+=3D bcm93384wvg.dtb
 dtb-$(CONFIG_DT_BCM93384WVG_VIPER)	+=3D bcm93384wvg_viper.dtb
+dtb-$(CONFIG_DT_BCM96358NB4SER)		+=3D bcm96358nb4ser.dtb
 dtb-$(CONFIG_DT_BCM96368MVWG)		+=3D bcm96368mvwg.dtb
 dtb-$(CONFIG_DT_BCM9EJTAGPRB)		+=3D bcm9ejtagprb.dtb
 dtb-$(CONFIG_DT_BCM97125CBMB)		+=3D bcm97125cbmb.dtb
@@ -14,6 +15,7 @@ dtb-$(CONFIG_DT_BCM97435SVMB)		+=3D bcm97435svmb.dtb
 dtb-$(CONFIG_DT_NONE)			+=3D \
 						bcm93384wvg.dtb		\
 						bcm93384wvg_viper.dtb	\
+						bcm96358nb4ser.dtb	\
 						bcm96368mvwg.dtb	\
 						bcm9ejtagprb.dtb	\
 						bcm97125cbmb.dtb	\
diff --git a/arch/mips/boot/dts/brcm/bcm6358.dtsi b/arch/mips/boot/dts/=
brcm/bcm6358.dtsi
new file mode 100644
index 0000000..5dc8432
--- /dev/null
+++ b/arch/mips/boot/dts/brcm/bcm6358.dtsi
@@ -0,0 +1,130 @@
+/ {
+	#address-cells =3D <1>;
+	#size-cells =3D <1>;
+	compatible =3D "brcm,bcm6358";
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
+		periph_clk: periph_clk {
+			compatible =3D "fixed-clock";
+			#clock-cells =3D <0>;
+			clock-frequency =3D <50000000>;
+		};
+	};
+
+	aliases {
+		uart0 =3D &uart0;
+		uart1 =3D &uart1;
+	};
+
+	cpu_intc: cpu_intc {
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
+			reg =3D <0xfffe000c 0x8>,
+			      <0xfffe0038 0x8>;
+
+			interrupt-controller;
+			#interrupt-cells =3D <1>;
+
+			interrupt-parent =3D <&cpu_intc>;
+			interrupts =3D <2>, <3>;
+		};
+
+		leds0: led-controller@fffe00d0 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			compatible =3D "brcm,bcm6358-leds";
+			reg =3D <0xfffe00d0 0x8>;
+
+			status =3D "disabled";
+		};
+
+		uart0: serial@fffe0100 {
+			compatible =3D "brcm,bcm6345-uart";
+			reg =3D <0xfffe0100 0x18>;
+
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <2>;
+
+			clocks =3D <&periph_clk>;
+
+			status =3D "disabled";
+		};
+
+		uart1: serial@fffe0120 {
+			compatible =3D "brcm,bcm6345-uart";
+			reg =3D <0xfffe0120 0x18>;
+
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <3>;
+
+			clocks =3D <&periph_clk>;
+
+			status =3D "disabled";
+		};
+
+		ehci0: usb@fffe1300 {
+			compatible =3D "brcm,bcm6358-ehci", "generic-ehci";
+			reg =3D <0xfffe1300 0x100>;
+			big-endian;
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <10>;
+			status =3D "disabled";
+		};
+
+		ohci0: usb@fffe1400 {
+			compatible =3D "brcm,bcm6358-ohci", "generic-ohci";
+			reg =3D <0xfffe1400 0x100>;
+			big-endian;
+			no-big-frame-no;
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <5>;
+			status =3D "disabled";
+		};
+	};
+};
diff --git a/arch/mips/boot/dts/brcm/bcm96358nb4ser.dts b/arch/mips/boo=
t/dts/brcm/bcm96358nb4ser.dts
new file mode 100644
index 0000000..f412117
--- /dev/null
+++ b/arch/mips/boot/dts/brcm/bcm96358nb4ser.dts
@@ -0,0 +1,46 @@
+/dts-v1/;
+
+/include/ "bcm6358.dtsi"
+
+/ {
+	compatible =3D "sfr,nb4-ser", "brcm,bcm6358";
+	model =3D "SFR Neufbox 4 (Sercomm)";
+
+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0x00000000 0x02000000>;
+	};
+
+	chosen {
+		stdout-path =3D &uart0;
+	};
+};
+
+&leds0 {
+	status =3D "ok";
+
+	led@0 {
+		reg =3D <0>;
+		active-low;
+		label =3D "nb4-ser:white:alarm";
+	};
+	led@2 {
+		reg =3D <2>;
+		active-low;
+		label =3D "nb4-ser:white:tv";
+	};
+	led@3 {
+		reg =3D <3>;
+		active-low;
+		label =3D "nb4-ser:white:tel";
+	};
+	led@4 {
+		reg =3D <4>;
+		active-low;
+		label =3D "nb4-ser:white:adsl";
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
