From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
        <noltari@gmail.com>
Subject: [PATCH 1/3] MIPS: BMIPS: Add device tree example for BCM63268
Date: Fri,  3 Jun 2016 10:12:02 +0200
Message-ID: <1464941524-3992-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ralf@linux-mips.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com, robh@kernel.org, simon@fire.lp0.eu
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

This adds a device tree example for Comtrend VR-3032u, which
also serves as a real example for brcm,bcm6328-leds.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 arch/mips/bmips/Kconfig                      |   4 +
 arch/mips/boot/dts/brcm/Makefile             |   2 +
 arch/mips/boot/dts/brcm/bcm63268.dtsi        | 134 +++++++++++++++++++=
++++++++
 arch/mips/boot/dts/brcm/bcm963268vr3032u.dts | 107 +++++++++++++++++++=
++
 4 files changed, 247 insertions(+)
 create mode 100644 arch/mips/boot/dts/brcm/bcm63268.dtsi
 create mode 100644 arch/mips/boot/dts/brcm/bcm963268vr3032u.dts

diff --git a/arch/mips/bmips/Kconfig b/arch/mips/bmips/Kconfig
index 264328d..14f4b4c 100644
--- a/arch/mips/bmips/Kconfig
+++ b/arch/mips/bmips/Kconfig
@@ -21,6 +21,10 @@ config DT_BCM93384WVG_VIPER
 	bool "BCM93384WVG Viper CPU (EXPERIMENTAL)"
 	select BUILTIN_DTB
=20
+config DT_BCM963268VR3032U
+        bool "BCM963268VR3032U"
+        select BUILTIN_DTB
+
 config DT_BCM96358NB4SER
 	bool "BCM96358NB4SER"
 	select BUILTIN_DTB
diff --git a/arch/mips/boot/dts/brcm/Makefile b/arch/mips/boot/dts/brcm=
/Makefile
index fda9d38..2060e70 100644
--- a/arch/mips/boot/dts/brcm/Makefile
+++ b/arch/mips/boot/dts/brcm/Makefile
@@ -1,5 +1,6 @@
 dtb-$(CONFIG_DT_BCM93384WVG)		+=3D bcm93384wvg.dtb
 dtb-$(CONFIG_DT_BCM93384WVG_VIPER)	+=3D bcm93384wvg_viper.dtb
+dtb-$(CONFIG_DT_BCM963268VR3032U)	+=3D bcm963268vr3032u.dtb
 dtb-$(CONFIG_DT_BCM96358NB4SER)		+=3D bcm96358nb4ser.dtb
 dtb-$(CONFIG_DT_BCM96368MVWG)		+=3D bcm96368mvwg.dtb
 dtb-$(CONFIG_DT_BCM9EJTAGPRB)		+=3D bcm9ejtagprb.dtb
@@ -15,6 +16,7 @@ dtb-$(CONFIG_DT_BCM97435SVMB)		+=3D bcm97435svmb.dtb
 dtb-$(CONFIG_DT_NONE)			+=3D \
 						bcm93384wvg.dtb		\
 						bcm93384wvg_viper.dtb	\
+						bcm963268vr3032u.dtb	\
 						bcm96358nb4ser.dtb	\
 						bcm96368mvwg.dtb	\
 						bcm9ejtagprb.dtb	\
diff --git a/arch/mips/boot/dts/brcm/bcm63268.dtsi b/arch/mips/boot/dts=
/brcm/bcm63268.dtsi
new file mode 100644
index 0000000..7e6bf2c
--- /dev/null
+++ b/arch/mips/boot/dts/brcm/bcm63268.dtsi
@@ -0,0 +1,134 @@
+/ {
+	#address-cells =3D <1>;
+	#size-cells =3D <1>;
+	compatible =3D "brcm,bcm63268";
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
+			reg =3D <0x10000020 0x20>,
+			      <0x10000040 0x20>;
+
+			interrupt-controller;
+			#interrupt-cells =3D <1>;
+
+			interrupt-parent =3D <&cpu_intc>;
+			interrupts =3D <2>, <3>;
+		};
+
+		uart0: serial@10000180 {
+			compatible =3D "brcm,bcm6345-uart";
+			reg =3D <0x10000180 0x18>;
+
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <5>;
+
+			clocks =3D <&periph_clk>;
+
+			status =3D "disabled";
+		};
+
+		uart1: serial@100001a0 {
+			compatible =3D "brcm,bcm6345-uart";
+			reg =3D <0x100001a0 0x18>;
+
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <34>;
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
+			compatible =3D "brcm,bcm63268-ehci", "generic-ehci";
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
+			compatible =3D "brcm,bcm63268-ohci", "generic-ohci";
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
diff --git a/arch/mips/boot/dts/brcm/bcm963268vr3032u.dts b/arch/mips/b=
oot/dts/brcm/bcm963268vr3032u.dts
new file mode 100644
index 0000000..930726f
--- /dev/null
+++ b/arch/mips/boot/dts/brcm/bcm963268vr3032u.dts
@@ -0,0 +1,107 @@
+/dts-v1/;
+
+/include/ "bcm63268.dtsi"
+
+/ {
+	compatible =3D "comtrend,vr-3032u", "brcm,bcm63268";
+	model =3D "Comtrend VR-3032u";
+
+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0x00000000 0x04000000>;
+	};
+
+	chosen {
+		stdout-path =3D &uart0;
+	};
+};
+
+&leds0 {
+	status =3D "ok";
+	brcm,serial-leds;
+	brcm,serial-dat-low;
+	brcm,serial-shift-inv;
+
+	led@0 {
+		reg =3D <0>;
+		brcm,hardware-controlled;
+		brcm,link-signal-sources =3D <0>;
+		/* GPHY0 Speed 0 */
+	};
+	led@1 {
+		reg =3D <1>;
+		brcm,hardware-controlled;
+		brcm,link-signal-sources =3D <1>;
+		/* GPHY0 Speed 1 */
+	};
+	led@2 {
+		reg =3D <2>;
+		active-low;
+		label =3D "vr-3032u:red:inet";
+	};
+	led@3 {
+		reg =3D <3>;
+		active-low;
+		label =3D "vr-3032u:green:dsl";
+	};
+	led@4 {
+		reg =3D <4>;
+		active-low;
+		label =3D "vr-3032u:green:usb";
+	};
+	led@7 {
+		reg =3D <7>;
+		active-low;
+		label =3D "vr-3032u:green:wps";
+	};
+	led@8 {
+		reg =3D <8>;
+		active-low;
+		label =3D "vr-3032u:green:inet";
+	};
+	led@9 {
+		reg =3D <9>;
+		brcm,hardware-controlled;
+		/* EPHY0 Activity */
+	};
+	led@10 {
+		reg =3D <10>;
+		brcm,hardware-controlled;
+		/* EPHY1 Activity */
+	};
+	led@11 {
+		reg =3D <11>;
+		brcm,hardware-controlled;
+		/* EPHY2 Activity */
+	};
+	led@12 {
+		reg =3D <12>;
+		brcm,hardware-controlled;
+		/* GPHY0 Activity */
+	};
+	led@13 {
+		reg =3D <13>;
+		brcm,hardware-controlled;
+		/* EPHY0 Speed */
+	};
+	led@14 {
+		reg =3D <14>;
+		brcm,hardware-controlled;
+		/* EPHY1 Speed */
+	};
+	led@15 {
+		reg =3D <15>;
+		brcm,hardware-controlled;
+		/* EPHY2 Speed */
+	};
+	led@20 {
+		reg =3D <20>;
+		active-low;
+		label =3D "vr-3032u:green:power";
+		default-state =3D "on";
+	};
+};
+
+&uart0 {
+	status =3D "okay";
+};
--=20
2.1.4
