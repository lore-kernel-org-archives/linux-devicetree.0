From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 10/11] arm64: dts: Add PL022, PL330 and SP805 DT nodes for Stingray
Date: Sat,  6 May 2017 17:24:45 +0530
Message-ID: <1494071686-19098-11-git-send-email-anup.patel@broadcom.com>
References: <1494071686-19098-1-git-send-email-anup.patel@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1494071686-19098-1-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Oza Pawandeep <oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Pramod Kumar <pramod.kumar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sandeep Tripathy <sandeep.tripathy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

We have two instance of PL022 SPI controllers, one instance of
DMA PL330, and one non-secure SP805 Watchdog on Stingray SOC.

This patch adds DT nodes for the above mentioned devices in
Stingray DT.

Signed-off-by: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Pramod KUMAR <pramod.kumar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 .../boot/dts/broadcom/stingray/bcm958742k.dts      | 30 +++++++++++++
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi | 52 ++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dts b/arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dts
index c309cda..5671669 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dts
+++ b/arch/arm64/boot/dts/broadcom/stingray/bcm958742k.dts
@@ -46,3 +46,33 @@
 &uart3 {
 	status = "okay";
 };
+
+&ssp0 {
+	pinctrl-0 = <&spi0_pins>;
+	pinctrl-names = "default";
+	cs-gpios = <&gpio_hsls 34 0>;
+	status = "okay";
+
+	spi-flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
+
+&ssp1 {
+	pinctrl-0 = <&spi1_pins>;
+	pinctrl-names = "default";
+	cs-gpios = <&gpio_hsls 96 0>;
+	status = "okay";
+
+	spi-flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index d046b04..36b8ced 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -276,6 +276,14 @@
 			status = "disabled";
 		};
 
+		wdt0: watchdog@689c0000 {
+			compatible = "arm,sp805", "arm,primecell";
+			reg = <0x689c0000 0x1000>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&hsls_25m_div2_clk>, <&hsls_div4_clk>;
+			clock-names = "wdogclk", "apb_pclk";
+		};
+
 		gpio_hsls: gpio@689d0000 {
 			compatible = "brcm,iproc-gpio";
 			reg = <0x689d0000 0x864>;
@@ -356,11 +364,55 @@
 			status = "disabled";
 		};
 
+		ssp0: ssp@68a80000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0x68a80000 0x1000>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&hsls_div2_clk>, <&hsls_div2_clk>;
+			clock-names = "spiclk", "apb_pclk";
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		ssp1: ssp@68a90000 {
+			compatible = "arm,pl022", "arm,primecell";
+			reg = <0x68a90000 0x1000>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&hsls_div2_clk>, <&hsls_div2_clk>;
+			clock-names = "spiclk", "apb_pclk";
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		hwrng: hwrng@68b20000 {
 			compatible = "brcm,iproc-rng200";
 			reg = <0x68b20000 0x28>;
 		};
 
+		dma0: dma@68c10000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x68c10000 0x1000>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			#dma-channels = <8>;
+			#dma-requests = <32>;
+			clocks = <&hsls_div2_clk>;
+			clock-names = "apb_pclk";
+			iommus = <&smmu 0x6000 0x0000>;
+		};
+
 		nand: nand@68c60000 {
 			compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1";
 			reg = <0x68c60000 0x600>,
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
