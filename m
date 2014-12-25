From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V6 23/25] MIPS: BMIPS: Refresh BCM3384 DTS files
Date: Thu, 25 Dec 2014 09:49:18 -0800
Message-ID: <1419529760-9520-24-git-send-email-cernekee@gmail.com>
References: <1419529760-9520-1-git-send-email-cernekee@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419529760-9520-1-git-send-email-cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The DT bindings for this platform have changed as the bootloader and
product requirements evolved.  In particular, there are both
Linux-on-Zephyr and Linux-on-Viper configurations.

Signed-off-by: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/boot/dts/brcm/bcm3384.dtsi        | 109 ------------------------
 arch/mips/boot/dts/brcm/bcm3384_zephyr.dtsi | 126 ++++++++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm93384wvg.dts     |   9 +-
 3 files changed, 127 insertions(+), 117 deletions(-)
 delete mode 100644 arch/mips/boot/dts/brcm/bcm3384.dtsi
 create mode 100644 arch/mips/boot/dts/brcm/bcm3384_zephyr.dtsi

diff --git a/arch/mips/boot/dts/brcm/bcm3384.dtsi b/arch/mips/boot/dts/brcm/bcm3384.dtsi
deleted file mode 100644
index 21b074a..0000000
diff --git a/arch/mips/boot/dts/brcm/bcm3384_zephyr.dtsi b/arch/mips/boot/dts/brcm/bcm3384_zephyr.dtsi
new file mode 100644
index 0000000..a7bd856
--- /dev/null
+++ b/arch/mips/boot/dts/brcm/bcm3384_zephyr.dtsi
@@ -0,0 +1,126 @@
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "brcm,bcm3384", "brcm,bcm33843";
+
+	memory@0 {
+		device_type = "memory";
+
+		/* Typical range.  The bootloader should fill this in. */
+		reg = <0x0 0x08000000>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* On BMIPS5000 this is 1/8th of the CPU core clock */
+		mips-hpt-frequency = <100000000>;
+
+		cpu@0 {
+			compatible = "brcm,bmips5000";
+			device_type = "cpu";
+			reg = <0>;
+		};
+
+		cpu@1 {
+			compatible = "brcm,bmips5000";
+			device_type = "cpu";
+			reg = <1>;
+		};
+	};
+
+	cpu_intc: cpu_intc {
+		#address-cells = <0>;
+		compatible = "mti,cpu-interrupt-controller";
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+	};
+
+	clocks {
+		periph_clk: periph_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <54000000>;
+		};
+	};
+
+	aliases {
+		uart0 = &uart0;
+	};
+
+	ubus {
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		compatible = "brcm,ubus", "simple-bus";
+		ranges;
+		dma-ranges = <0x00000000 0x08000000 0x08000000>,
+			     <0x08000000 0x00000000 0x08000000>;
+
+		periph_intc: periph_intc@14e00038 {
+			compatible = "brcm,bcm3380-l2-intc";
+			reg = <0x14e00038 0x4 0x14e0003c 0x4>,
+			      <0x14e00340 0x4 0x14e00344 0x4>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			interrupt-parent = <&cpu_intc>;
+			interrupts = <4>;
+		};
+
+		zmips_intc: zmips_intc@104b0060 {
+			compatible = "brcm,bcm3380-l2-intc";
+			reg = <0x104b0060 0x4 0x104b0064 0x4>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			interrupt-parent = <&periph_intc>;
+			interrupts = <29>;
+			brcm,int-map-mask = <0xffffffff>;
+		};
+
+		iop_intc: iop_intc@14e00058 {
+			compatible = "brcm,bcm3380-l2-intc";
+			reg = <0x14e00058 0x4 0x14e0005c 0x4>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			interrupt-parent = <&cpu_intc>;
+			interrupts = <6>;
+			brcm,int-map-mask = <0xffffffff>;
+		};
+
+		uart0: serial@14e00520 {
+			compatible = "brcm,bcm6345-uart";
+			reg = <0x14e00520 0x18>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <2>;
+			clocks = <&periph_clk>;
+			status = "disabled";
+		};
+
+		ehci0: usb@15400300 {
+			compatible = "brcm,bcm3384-ehci", "generic-ehci";
+			reg = <0x15400300 0x100>;
+			big-endian;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <41>;
+			status = "disabled";
+		};
+
+		ohci0: usb@15400400 {
+			compatible = "brcm,bcm3384-ohci", "generic-ohci";
+			reg = <0x15400400 0x100>;
+			big-endian;
+			no-big-frame-no;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <40>;
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/mips/boot/dts/brcm/bcm93384wvg.dts b/arch/mips/boot/dts/brcm/bcm93384wvg.dts
index 8317411..d1e44a1 100644
--- a/arch/mips/boot/dts/brcm/bcm93384wvg.dts
+++ b/arch/mips/boot/dts/brcm/bcm93384wvg.dts
@@ -1,6 +1,6 @@
 /dts-v1/;
 
-/include/ "bcm3384.dtsi"
+/include/ "bcm3384_zephyr.dtsi"
 
 / {
 	compatible = "brcm,bcm93384wvg", "brcm,bcm3384";
@@ -10,13 +10,6 @@
 		bootargs = "console=ttyS0,115200";
 		stdout-path = &uart0;
 	};
-
-	memory@0 {
-		device_type = "memory";
-		reg = <0x0 0x04000000>;
-		dma-xor-mask = <0x08000000>;
-		dma-xor-limit = <0x0fffffff>;
-	};
 };
 
 &uart0 {
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
