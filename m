From: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/7] Samsung: SMDKV210 Added Basic DTS file The DTS file which
	descibes the SMDKV210 board is introduced. Support for VIC,
	Tiner and Uart are enabled at present.
Date: Mon, 20 Sep 2010 15:49:10 +0530
Message-ID: <1284977950-30687-1-git-send-email-shaju.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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

Signed-off-by: Shaju Abraham <shaju.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/v210.dts |  147 ++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 147 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/v210.dts

diff --git a/arch/arm/boot/dts/v210.dts b/arch/arm/boot/dts/v210.dts
new file mode 100644
index 0000000..7cd219f
--- /dev/null
+++ b/arch/arm/boot/dts/v210.dts
@@ -0,0 +1,147 @@
+/dts-v1/;
+
+/ {
+	model = "smdkv210";
+	compatible = "samsung,smdkv210";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&VIC0>;
+	
+	aliases{
+		vic0=&VIC0;
+	};
+
+
+	memory {
+		name = "memory";
+		device_type = "memory";
+		reg = <0x20000000 0x40000000>;
+	};
+
+	chosen {
+		bootargs = "root=/dev/nfs rw nfsroot=192.168.0.10:/opt/ubuntu-taiwan/ ip=192.168.0.1:192.168.0.10:192.168.0.10:255:255:255:0:eth0
+				console=ttySAC2,115200 init=/linuxrc";
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		ranges = <0x00000000 0x00000000 0xFFFFFFFF>;
+		
+		watchdog@0xE2700000{
+			compatible = "samsung,s3c2410-wdt";
+			reg = <0xE2700000 0x2000>;
+			interrupts = <27 >;
+			interrupt-parent = <&VIC0>;
+		};
+
+
+		VIC0:vic0@f2000000 {
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			reg = <0xf2000000 0x1000>;
+			virtual-reg = <0xf4000000>;
+			compatible = "arm,vic";
+			irq-src = <0xffffffff>;
+		};
+		VIC1:vic1@f2100000 {
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			reg = <0xf2100000 0x1000>;
+			virtual-reg = <0xf4010000>;
+			interrupt-parent = <&VIC0>;
+			irq-src = <0xffffffff>;
+			compatible = "arm,vic";
+		};
+		VIC2:vic2@f2200000{
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			reg = <0xf2200000 0x1000>;
+			virtual-reg = <0xf4020000>;
+			interrupt-parent = <&VIC1>;
+			irq-src = <0xffffffff>;
+			compatible = "arm,vic";
+		};
+		VIC3:vic3@f2300000 {
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			reg = <0xf2300000 0x1000>;
+			virtual-reg = <0xf4030000>;
+			interrupt-parent = <&VIC2>;
+			irq-src = <0xffffffff>;
+			compatible = "arm,vic";
+		};
+		uart@0xe2900000 {
+			reg = <0xe2900000 0x1000>;
+			virtual-reg = <0xf5000000>;
+			interrupts = <10>;
+			interrupt-parent = <&VIC1>;
+			compatible = "samsung,s3c-uart","samsung,s5pv210-uart_sh";
+		};
+		uart@0xe2900400 {
+			reg = <0xe2900400 0x1000>;
+			virtual-reg = <0xf5000400>;
+			interrupts = <11>;
+			interrupt-parent = <&VIC1>;
+			compatible = "samsung,s3c-uart","samsung,s5pv210-uart_sh";
+		};
+		uart@0xe2900800 {
+			reg = <0xe2900800 0x1000>;
+			virtual-reg = <0xf5000800>;
+			interrupts = <12>;
+			interrupt-parent = <&VIC1>;
+			compatible = "samsung,s3c-uart","samsung,s5pv210-uart_sh";
+		};
+		uart@0xe2900c00 {
+			reg = <0xe2900c00 0x1000>;
+			virtual-reg = <0xf5000c00>;
+			interrupts = <13>;
+			interrupt-parent = <&VIC1>;
+			compatible = "samsung,s3c-uart","samsung,s5pv210-uart_sh";
+		};
+
+		timer0@e2500000 {
+			reg = <0xe2500000 0x1000>;
+			virtual-reg = <0xf0300000>;
+			interrupts = <21 11>;
+			compatible = "samsung,s3c-timer","samsung,s5p-timer";
+
+		};
+		timer1@e2500000 {
+			reg = <0xe2500000 0x1000>;
+			virtual-reg = <0xf0300000>;
+			interrupts = <22 12>;
+			compatible = "samsung,s3c-timer","samsung,s5p-timer";
+
+		};
+		timer2@e2500000 {
+			reg = <0xe2500000 0x1000>;
+			virtual-reg = <0xf0300000>;
+			interrupts = <23 13>;
+			compatible = "samsung,s3c-timer","samsung,s5p-timer";
+
+		};
+		timer3@e2500000 {
+			reg = <0xe2500000 0x1000>;
+			virtual-reg = <0xf0300000>;
+			interrupts = <24 14>;
+			compatible = "samsung,s3c-timer","samsung,s5p-timer";
+
+		};
+
+		timer4@e2600000 {
+			reg = <0xe2600000 0x1000>;
+			virtual-reg = <0xf5200000>;
+			interrupts = <25 15>;
+			compatible = "samsung,s3c-timer","samsung,s5p-timer";
+
+		};
+		SROM@e2600000 {
+			reg = <0xe8000000 0x1000>;
+			virtual-reg = <0xf5100000>;
+
+		};
+
+	};
+};
-- 
1.7.2
