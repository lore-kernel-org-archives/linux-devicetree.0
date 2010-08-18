From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH 13/14] ARM: vexpress: Definition of vexpress dts
	specification
Date: Wed, 18 Aug 2010 19:59:59 +0100
Message-ID: <1282158000-23081-14-git-send-email-lorenzo.pieralisi@arm.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-6-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-7-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-8-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-9-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-10-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-11-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-12-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-13-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1282158000-23081-13-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, philippe.robin-5wv7dgnIgG8@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The device tree methodology requires a dts file to be defined per
platform in order to describe the platform address space and topology,
in short the device tree in source format.

This patch adds the dts file for the Versatile Express board.
Some device names are still temporary and non-compliant waiting for the
definition of proper clock bindings.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/boot/dts/vexpress.dts |  199 ++++++++++++++++++++++++++++++++++++++++
 1 files changed, 199 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/vexpress.dts

diff --git a/arch/arm/boot/dts/vexpress.dts b/arch/arm/boot/dts/vexpress.dts
new file mode 100644
index 0000000..cc58603
--- /dev/null
+++ b/arch/arm/boot/dts/vexpress.dts
@@ -0,0 +1,199 @@
+/dts-v1/;
+
+/ {
+	model = "versatile-express";
+	compatible = "arm,versatile-express";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	#interrupt-cells = <1>;
+	interrupt-parent = <&intc>;
+
+	memory {
+		name = "memory";
+		device_type = "memory";
+		reg = <0x60000000 0x20000000>;
+	};
+
+	chosen {
+		bootargs = "rdinit=/bin/ash console=ttyAMA0 vga=0x311 mem=512M debug earlyprintk";
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		device_type = "soc";
+		compatible = "simple-bus";
+		ranges = <0x00000000 0x00000000 0xFFFFFFFF>;
+
+		gic-cpu {
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			reg = <0x1e000100 0x1000>;
+			compatible = "arm,gic-cpu-interrupt-controller";
+			device_type = "gic";
+		};
+
+		intc: gic-dist {
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			reg = <0x1e001000 0x1000>;
+			compatible = "arm,gic-dist-interrupt-controller";
+			device_type = "gic";
+			irq-start = <29>;
+		};
+
+		smsc@4e000000 {
+			compatible = "smc,smsc-911";
+			 reg = <0x4e000000 0x1000>;
+			interrupts = <47>;
+			flags = <2>;
+			irq-polarity = <1>;
+			irq-type = <1>;
+			phy-interface = <0>;
+		};
+
+		flash@40000000 {
+			compatible = "arm,arm-flash";
+			reg = <0x40000000 0x4000000
+			       0x44000000 0x4000000>;
+		};
+
+		isp@4f000000 {
+			compatible = "nxp,usb-isp1761";
+			reg = <0x4f000000 0x20000>;
+			interrupts = <48>;
+			port1_otg;
+		};
+
+		ddc@10016000 {
+			compatible = "arm,versatile-i2c";
+			reg = <0x10016000 0x1000>;
+		};
+
+		pmu@0 {
+			compatible = "arm,arm-pmu";
+			interrupts = <92 93 94 95>;
+		};
+
+		timer@10011000 {
+			compatible = "arm,arm-sp804";
+			reg = <0x10011000 0x1000>;
+			interrupts = <34>;
+		};
+
+		timer@10012000 {
+			compatible = "arm,arm-sp804";
+			reg = <0x10012000 0x1000>;
+		};
+
+	};
+
+	amba {
+		compatible = "arm,amba";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		uart@0 {
+			compatible = "arm,amba-device";
+			reg = <0x10009000 0x1000>;
+			arm,amba-deviceid = <0x00141011>;
+			interrupts = <37>;
+			clock-map = <&ref24_clk 0>;
+		};
+
+		uart@1 {
+			compatible = "arm,amba-device";
+			reg = <0x1000a000 0x1000>;
+			arm,amba-deviceid = <0x00141011>;
+			interrupts = <38>;
+			clock-map = <&ref24_clk 0>;
+		};
+
+		kbd@0 {
+			compatible = "arm,amba-device";
+			reg = <0x10006000 0x1000>;
+			arm,amba-deviceid = <0x00041050>;
+			interrupts = <44>;
+			clock-map = <&ref24_clk 0>;
+		};
+
+		aaci@0 {
+			compatible = "arm,amba-device";
+			reg = <0x10004000 0x1000>;
+			arm,amba-deviceid = <0x00041041>;
+			interrupts = <43>;
+			clock-map = <&ref24_clk 0>;
+		};
+
+		ps2@0 {
+			compatible = "arm,amba-device";
+			reg = <0x10007000 0x1000>;
+			arm,amba-deviceid = <0x00041050>;
+			interrupts = <45>;
+			clock-map = <&ref24_clk 0>;
+		};
+
+		rtc@0 {
+			compatible = "arm,amba-device";
+			reg = <0x10017000 0x1000>;
+			arm,amba-deviceid = <0x00041031>;
+			interrupts = <36>;
+			clock-map = <&ref24_clk 0>;
+		};
+
+		wdt@0 {
+			compatible = "arm,amba-device";
+			reg = <0x1000f000 0x1000>;
+			arm,amba-deviceid = <0x00041085>;
+			interrupts = <32>;
+			clock-map = <&ref24_clk 0>;
+		};
+
+		clcd@0 {
+			compatible = "arm,clcd-pl11x","arm,amba-device";
+			reg = <0x10020000 0x1000>;
+			arm,amba-deviceid = <0x00041111>;
+			interrupts = <76>;
+			clock-map = <&ref24_clk 0>;
+		};
+
+		mmci@0 {
+			compatible = "arm,mmc-pl18x","arm,amba-device";
+			reg = <0x10005000 0x1000>;
+			interrupts = <41 42>;
+			clock-map = <&ref24_clk 0>;
+		};
+
+		dmc@0 {
+			compatible = "arm,dmc","arm,amba-device";
+			reg = <0x100e0000 0x1000>;
+			clock-map = <&ref24_clk 0>;
+		};
+
+		smc@0 {
+			compatible = "arm,smc","arm,amba-device";
+			reg = <0x100e1000 0x1000>;
+			interrupts = <77 78>;
+			clock-map = <&ref24_clk 0>;
+		};
+
+		gpio@0 {
+			compatible = "arm,gpio","arm,amba-device";
+			reg = <0x100e8000 0x1000>;
+			interrupts = <82>;
+			clock-map = <&ref24_clk 0>;
+		};
+	};
+
+	clocks {
+		ref24_clk: clock@0 {
+			device_type = "clock";
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+			clock-output-names = "ref";
+		};
+	};
+
+};
-- 
1.6.3.3
