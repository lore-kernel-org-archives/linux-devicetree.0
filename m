From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 2/2] Updates the media5200 dts file to use the new base
	mpc5200 dts file
Date: Mon, 18 Oct 2010 15:10:26 -0700
Message-ID: <20101018221026.25805.53584.stgit@riker>
References: <20101018220341.25805.71490.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101018220341.25805.71490.stgit@riker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 media5200.dts |  338 ++++++++++++---------------------------------------------
 1 files changed, 70 insertions(+), 268 deletions(-)

diff --git a/media5200.dts b/media5200.dts
index 0c3902b..d7f6a5d 100644
--- a/media5200.dts
+++ b/media5200.dts
@@ -11,306 +11,108 @@
  * option) any later version.
  */
 
-/dts-v1/;
+/include/ "mpc5200b.dtsi"
 
 / {
 	model = "fsl,media5200";
 	compatible = "fsl,media5200";
-	#address-cells = <1>;
-	#size-cells = <1>;
-	interrupt-parent = <&mpc5200_pic>;
 
 	aliases {
-		console = &console;
+		console = &psc6;
 		ethernet0 = &eth0;
 	};
 
 	chosen {
-		linux,stdout-path = &console;
-	};
-
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		PowerPC,5200@0 {
-			device_type = "cpu";
-			reg = <0>;
-			d-cache-line-size = <32>;
-			i-cache-line-size = <32>;
-			d-cache-size = <0x4000>;		// L1, 16K
-			i-cache-size = <0x4000>;		// L1, 16K
-			timebase-frequency = <33000000>;	// 33 MHz, these were configured by U-Boot
-			bus-frequency = <132000000>;		// 132 MHz
-			clock-frequency = <396000000>;		// 396 MHz
-		};
-	};
+		linux,stdout-path = &psc6;
+	};	
 
 	memory {
-		device_type = "memory";
 		reg = <0x00000000 0x08000000>;	// 128MB RAM
 	};
+};
 
-	soc@f0000000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "fsl,mpc5200b-immr";
-		ranges = <0 0xf0000000 0x0000c000>;
-		reg = <0xf0000000 0x00000100>;
-		bus-frequency = <132000000>;// 132 MHz
-		system-frequency = <0>;		// from bootloader
-
-		cdm@200 {
-			compatible = "fsl,mpc5200b-cdm","fsl,mpc5200-cdm";
-			reg = <0x200 0x38>;
-		};
-
-		mpc5200_pic: interrupt-controller@500 {
-			// 5200 interrupts are encoded into two levels;
-			interrupt-controller;
-			#interrupt-cells = <3>;
-			compatible = "fsl,mpc5200b-pic","fsl,mpc5200-pic";
-			reg = <0x500 0x80>;
-		};
-
-		timer@600 {	// General Purpose Timer
-			compatible = "fsl,mpc5200b-gpt","fsl,mpc5200-gpt";
-			reg = <0x600 0x10>;
-			interrupts = <1 9 0>;
-			fsl,has-wdt;
-		};
-
-		timer@610 {	// General Purpose Timer
-			compatible = "fsl,mpc5200b-gpt","fsl,mpc5200-gpt";
-			reg = <0x610 0x10>;
-			interrupts = <1 10 0>;
-		};
-
-		timer@620 {	// General Purpose Timer
-			compatible = "fsl,mpc5200b-gpt","fsl,mpc5200-gpt";
-			reg = <0x620 0x10>;
-			interrupts = <1 11 0>;
-		};
-
-		timer@630 {	// General Purpose Timer
-			compatible = "fsl,mpc5200b-gpt","fsl,mpc5200-gpt";
-			reg = <0x630 0x10>;
-			interrupts = <1 12 0>;
-		};
-
-		timer@640 {	// General Purpose Timer
-			compatible = "fsl,mpc5200b-gpt","fsl,mpc5200-gpt";
-			reg = <0x640 0x10>;
-			interrupts = <1 13 0>;
-		};
-
-		timer@650 {	// General Purpose Timer
-			compatible = "fsl,mpc5200b-gpt","fsl,mpc5200-gpt";
-			reg = <0x650 0x10>;
-			interrupts = <1 14 0>;
-		};
-
-		timer@660 {	// General Purpose Timer
-			compatible = "fsl,mpc5200b-gpt","fsl,mpc5200-gpt";
-			reg = <0x660 0x10>;
-			interrupts = <1 15 0>;
-		};
-
-		timer@670 {	// General Purpose Timer
-			compatible = "fsl,mpc5200b-gpt","fsl,mpc5200-gpt";
-			reg = <0x670 0x10>;
-			interrupts = <1 16 0>;
-		};
-
-		rtc@800 {	// Real time clock
-			compatible = "fsl,mpc5200b-rtc","fsl,mpc5200-rtc";
-			reg = <0x800 0x100>;
-			interrupts = <1 5 0 1 6 0>;
-		};
-
-		can@900 {
-			compatible = "fsl,mpc5200b-mscan","fsl,mpc5200-mscan";
-			interrupts = <2 17 0>;
-			reg = <0x900 0x80>;
-		};
-
-		can@980 {
-			compatible = "fsl,mpc5200b-mscan","fsl,mpc5200-mscan";
-			interrupts = <2 18 0>;
-			reg = <0x980 0x80>;
-		};
-
-		gpio_simple: gpio@b00 {
-			compatible = "fsl,mpc5200b-gpio","fsl,mpc5200-gpio";
-			reg = <0xb00 0x40>;
-			interrupts = <1 7 0>;
-			gpio-controller;
-			#gpio-cells = <2>;
-		};
-
-		gpio_wkup: gpio@c00 {
-			compatible = "fsl,mpc5200b-gpio-wkup","fsl,mpc5200-gpio-wkup";
-			reg = <0xc00 0x40>;
-			interrupts = <1 8 0 0 3 0>;
-			gpio-controller;
-			#gpio-cells = <2>;
-		};
-
-		spi@f00 {
-			compatible = "fsl,mpc5200b-spi","fsl,mpc5200-spi";
-			reg = <0xf00 0x20>;
-			interrupts = <2 13 0 2 14 0>;
-		};
+&powerpc {
+	timebase-frequency = <33000000>;	// 33 MHz, these were configured by U-Boot
+	bus-frequency = <132000000>;		// 132 MHz
+	clock-frequency = <396000000>;		// 396 MHz
+};
 
-		usb@1000 {
-			compatible = "fsl,mpc5200b-ohci","fsl,mpc5200-ohci","ohci-be";
-			reg = <0x1000 0x100>;
-			interrupts = <2 6 0>;
-		};
+&soc {
+	bus-frequency = <132000000>;// 132 MHz
+};
 
-		dma-controller@1200 {
-			compatible = "fsl,mpc5200b-bestcomm","fsl,mpc5200-bestcomm";
-			reg = <0x1200 0x80>;
-			interrupts = <3 0 0  3 1 0  3 2 0  3 3 0
-			              3 4 0  3 5 0  3 6 0  3 7 0
-			              3 8 0  3 9 0  3 10 0  3 11 0
-			              3 12 0  3 13 0  3 14 0  3 15 0>;
-		};
+&usb {
+	reg = <0x1000 0x100>;
+};
 
-		xlb@1f00 {
-			compatible = "fsl,mpc5200b-xlb","fsl,mpc5200-xlb";
-			reg = <0x1f00 0x100>;
-		};
+/remove-node/ &psc1;
+/remove-node/ &psc2;
+/remove-node/ &psc3;
+/remove-node/ &{/soc5200@f0000000/serial@2600};  /* an example of using the path instead of the label */
+/remove-node/ &psc5;
 
-		// PSC6 in uart mode
-		console: serial@2c00 {		// PSC6
-			compatible = "fsl,mpc5200b-psc-uart","fsl,mpc5200-psc-uart";
-			cell-index = <5>;
-			port-number = <0>;  // Logical port assignment
-			reg = <0x2c00 0x100>;
-			interrupts = <2 4 0>;
-		};
+&psc6 {
+	cell-index = <5>;
+	port-number = <0>;
+};
 
-		eth0: ethernet@3000 {
-			compatible = "fsl,mpc5200b-fec","fsl,mpc5200-fec";
-			reg = <0x3000 0x400>;
-			local-mac-address = [ 00 00 00 00 00 00 ];
-			interrupts = <2 5 0>;
-			phy-handle = <&phy0>;
-		};
 
-		mdio@3000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "fsl,mpc5200b-mdio","fsl,mpc5200-mdio";
-			reg = <0x3000 0x400>;	// fec range, since we need to setup fec interrupts
-			interrupts = <2 5 0>;	// these are for "mii command finished", not link changes & co.
+&pci {
+	interrupt-map = <0xc000 0 0 1 &media5200_fpga 0 2 // 1st slot
+			 0xc000 0 0 2 &media5200_fpga 0 3
+			 0xc000 0 0 3 &media5200_fpga 0 4
+			 0xc000 0 0 4 &media5200_fpga 0 5
 
-			phy0: ethernet-phy@0 {
-				reg = <0>;
-			};
-		};
+			 0xc800 0 0 1 &media5200_fpga 0 3 // 2nd slot
+			 0xc800 0 0 2 &media5200_fpga 0 4
+			 0xc800 0 0 3 &media5200_fpga 0 5
+			 0xc800 0 0 4 &media5200_fpga 0 2
 
-		ata@3a00 {
-			compatible = "fsl,mpc5200b-ata","fsl,mpc5200-ata";
-			reg = <0x3a00 0x100>;
-			interrupts = <2 7 0>;
-		};
+			 0xd000 0 0 1 &media5200_fpga 0 4 // miniPCI
+			 0xd000 0 0 2 &media5200_fpga 0 5
 
-		i2c@3d00 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "fsl,mpc5200b-i2c","fsl,mpc5200-i2c","fsl-i2c";
-			reg = <0x3d00 0x40>;
-			interrupts = <2 15 0>;
-		};
+			 0xe000 0 0 1 &media5200_fpga 0 5 // CoralIP
+			>;
 
-		i2c@3d40 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			compatible = "fsl,mpc5200b-i2c","fsl,mpc5200-i2c","fsl-i2c";
-			reg = <0x3d40 0x40>;
-			interrupts = <2 16 0>;
-		};
+	interrupt-parent = <&mpc5200_pic>;
+};
 
-		sram@8000 {
-			compatible = "fsl,mpc5200b-sram","fsl,mpc5200-sram";
-			reg = <0x8000 0x4000>;
-		};
+&localbus {
+	ranges = < 0 0 0xfc000000 0x02000000
+	       1 0 0xfe000000 0x02000000
+	       2 0 0xf0010000 0x00010000
+	       3 0 0xf0020000 0x00010000 >;
+
+	flash@0,0 {
+		compatible = "amd,am29lv28ml", "cfi-flash";
+		reg = <0 0x0 0x2000000>;		// 32 MB
+		bank-width = <4>;			// Width in bytes of the flash bank
+		device-width = <2>;			// Two devices on each bank
 	};
 
-	pci@f0000d00 {
-		#interrupt-cells = <1>;
-		#size-cells = <2>;
-		#address-cells = <3>;
-		device_type = "pci";
-		compatible = "fsl,mpc5200b-pci","fsl,mpc5200-pci";
-		reg = <0xf0000d00 0x100>;
-		interrupt-map-mask = <0xf800 0 0 7>;
-		interrupt-map = <0xc000 0 0 1 &media5200_fpga 0 2 // 1st slot
-				 0xc000 0 0 2 &media5200_fpga 0 3
-				 0xc000 0 0 3 &media5200_fpga 0 4
-				 0xc000 0 0 4 &media5200_fpga 0 5
-
-				 0xc800 0 0 1 &media5200_fpga 0 3 // 2nd slot
-				 0xc800 0 0 2 &media5200_fpga 0 4
-				 0xc800 0 0 3 &media5200_fpga 0 5
-				 0xc800 0 0 4 &media5200_fpga 0 2
+	flash@1,0 {
+		compatible = "amd,am29lv28ml", "cfi-flash";
+		reg = <1 0 0x2000000>;			// 32 MB
+		bank-width = <4>;			// Width in bytes of the flash bank
+		device-width = <2>;			// Two devices on each bank
+	};
 
-				 0xd000 0 0 1 &media5200_fpga 0 4 // miniPCI
-				 0xd000 0 0 2 &media5200_fpga 0 5
+	media5200_fpga: fpga@2,0 {
+		compatible = "fsl,media5200-fpga";
+		interrupt-controller;
+		#interrupt-cells = <2>;	// 0:bank 1:id; no type field
+		reg = <2 0 0x10000>;
 
-				 0xe000 0 0 1 &media5200_fpga 0 5 // CoralIP
-				>;
-		clock-frequency = <0>; // From boot loader
-		interrupts = <2 8 0 2 9 0 2 10 0>;
 		interrupt-parent = <&mpc5200_pic>;
-		bus-range = <0 0>;
-		ranges = <0x42000000 0 0x80000000 0x80000000 0 0x20000000
-			  0x02000000 0 0xa0000000 0xa0000000 0 0x10000000
-			  0x01000000 0 0x00000000 0xb0000000 0 0x01000000>;
+		interrupts = <0 0 3	// IRQ bank 0
+			      1 1 3>;	// IRQ bank 1
 	};
 
-	localbus {
-		compatible = "fsl,mpc5200b-lpb","simple-bus";
-		#address-cells = <2>;
-		#size-cells = <1>;
-
-		ranges = < 0 0 0xfc000000 0x02000000
-			   1 0 0xfe000000 0x02000000
-			   2 0 0xf0010000 0x00010000
-			   3 0 0xf0020000 0x00010000 >;
-
-		flash@0,0 {
-			compatible = "amd,am29lv28ml", "cfi-flash";
-			reg = <0 0x0 0x2000000>;		// 32 MB
-			bank-width = <4>;			// Width in bytes of the flash bank
-			device-width = <2>;			// Two devices on each bank
-		};
-
-		flash@1,0 {
-			compatible = "amd,am29lv28ml", "cfi-flash";
-			reg = <1 0 0x2000000>;			// 32 MB
-			bank-width = <4>;			// Width in bytes of the flash bank
-			device-width = <2>;			// Two devices on each bank
-		};
-
-		media5200_fpga: fpga@2,0 {
-			compatible = "fsl,media5200-fpga";
-			interrupt-controller;
-			#interrupt-cells = <2>;	// 0:bank 1:id; no type field
-			reg = <2 0 0x10000>;
-
-			interrupt-parent = <&mpc5200_pic>;
-			interrupts = <0 0 3	// IRQ bank 0
-			              1 1 3>;	// IRQ bank 1
-		};
-
-		uart@3,0 {
-			compatible = "ti,tl16c752bpt";
-			reg = <3 0 0x10000>;
-			interrupt-parent = <&media5200_fpga>;
-			interrupts = <0 0  0 1>; // 2 irqs
-		};
+	uart@3,0 {
+		compatible = "ti,tl16c752bpt";
+		reg = <3 0 0x10000>;
+		interrupt-parent = <&media5200_fpga>;
+		interrupts = <0 0  0 1>; // 2 irqs
 	};
 };
+
