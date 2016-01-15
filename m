From: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 8/8] ARM: at91/dt: sama5d2: add nand0 and nfc0 nodes
Date: Fri, 15 Jan 2016 11:35:02 +0100
Message-ID: <1452854102-6125-9-git-send-email-romain.izard.pro@gmail.com>
References: <1452854102-6125-1-git-send-email-romain.izard.pro@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452854102-6125-1-git-send-email-romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Both nodes are required to access NAND Flash memory. Additional
settings will be necessary at the board level to use it.

Signed-off-by: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v2: Fix device address, hexadecimal with minuscules

 arch/arm/boot/dts/sama5d2.dtsi | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index 4dfca8fc49b3..6715296ba0f7 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -263,6 +263,44 @@
 			cache-level = <2>;
 		};
 
+		nand0: nand@80000000 {
+			compatible = "atmel,sama5d2-nand";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			reg = < /* EBI CS3 */
+				0x80000000 0x08000000
+				/* SMC PMECC regs */
+				0xf8014070 0x00000490
+				/* SMC PMECC Error Location regs */
+				0xf8014500 0x00000200
+				/* ROM Galois tables */
+				0x00040000 0x00018000
+				>;
+			interrupts = <17 IRQ_TYPE_LEVEL_HIGH 6>;
+			atmel,nand-addr-offset = <21>;
+			atmel,nand-cmd-offset = <22>;
+			atmel,nand-has-dma;
+			atmel,has-pmecc;
+			atmel,pmecc-lookup-table-offset = <0x0 0x8000>;
+			status = "disabled";
+
+			nfc@c0000000 {
+				compatible = "atmel,sama5d4-nfc";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = < /* NFC Command Registers */
+					0xc0000000 0x08000000
+					/* NFC HSMC regs */
+					0xf8014000 0x00000070
+					/* NFC SRAM banks */
+					0x00100000 0x00100000
+					>;
+				clocks = <&hsmc_clk>;
+				atmel,write-by-sram;
+			};
+		};
+
 		sdmmc0: sdio-host@a0000000 {
 			compatible = "atmel,sama5d2-sdhci";
 			reg = <0xa0000000 0x300>;
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
