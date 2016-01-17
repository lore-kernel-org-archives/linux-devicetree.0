From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
        <noltari@gmail.com>
Subject: [PATCH 2/2] bmips: add device tree example for BCM6358
Date: Sun, 17 Jan 2016 12:28:21 +0100
Message-ID: <1453030101-14794-2-git-send-email-noltari@gmail.com>
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
To: linux-mips@linux-mips.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

This adds a device tree example for SFR Neufbox4 (Sercomm version), whi=
ch
also serves as a real example for brcm,bcm6358-leds.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 .../devicetree/bindings/mips/brcm/soc.txt          |   2 +-
 arch/mips/bmips/Kconfig                            |   4 +
 arch/mips/boot/dts/brcm/Makefile                   |   2 +
 arch/mips/boot/dts/brcm/bcm6358.dtsi               | 111 +++++++++++++=
++++++++
 arch/mips/boot/dts/brcm/bcm96358nb4ser.dts         |  47 +++++++++
 5 files changed, 165 insertions(+), 1 deletion(-)
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
index 0000000..b2d11da
--- /dev/null
+++ b/arch/mips/boot/dts/brcm/bcm6358.dtsi
@@ -0,0 +1,111 @@
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
+		leds0 =3D &leds0;
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
+		};
+
+		reboot: syscon-reboot@fffe0008 {
+			compatible =3D "syscon-reboot";
+			regmap =3D <&periph_cntl>;
+			offset =3D <0x8>;
+			mask =3D <0x1>;
+		};
+
+		periph_intc: periph_intc@fffe000c {
+			compatible =3D "brcm,bcm3380-l2-intc";
+			reg =3D <0xfffe0010 0x4 0xfffe000c 0x4>,
+			      <0xfffe003c 0x4 0xfffe0038 0x4>;
+
+			interrupt-controller;
+			#interrupt-cells =3D <1>;
+
+			interrupt-parent =3D <&cpu_intc>;
+			interrupts =3D <2>;
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
+	};
+};
diff --git a/arch/mips/boot/dts/brcm/bcm96358nb4ser.dts b/arch/mips/boo=
t/dts/brcm/bcm96358nb4ser.dts
new file mode 100644
index 0000000..ca95084
--- /dev/null
+++ b/arch/mips/boot/dts/brcm/bcm96358nb4ser.dts
@@ -0,0 +1,47 @@
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
+		bootargs =3D "console=3DttyS0,115200";
+		stdout-path =3D &uart0;
+	};
+};
+
+&leds0 {
+	status =3D "ok";
+
+	alarm_white@0 {
+		reg =3D <0>;
+		active-low;
+		label =3D "nb4-ser:white:alarm";
+	};
+	tv_white@2 {
+		reg =3D <2>;
+		active-low;
+		label =3D "nb4-ser:white:tv";
+	};
+	tel_white@3 {
+		reg =3D <3>;
+		active-low;
+		label =3D "nb4-ser:white:tel";
+	};
+	adsl_white@4 {
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
1.9.1
