From: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] ARM: at91: sama5/dts: move hsmc_clk out of nfc node
Date: Tue, 10 Feb 2015 14:14:44 +0800
Message-ID: <1423548885-27589-2-git-send-email-josh.wu@atmel.com>
References: <1423548885-27589-1-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423548885-27589-1-git-send-email-josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In sama5d3, sama5d4 chips, pmecc will use the hsmc clock. As pmecc is
part of HSMC. So move out hsmc_clk from nfc node to nand node.

Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---

 arch/arm/boot/dts/sama5d3.dtsi | 2 +-
 arch/arm/boot/dts/sama5d4.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
index 5f4144d..c0c3597 100644
--- a/arch/arm/boot/dts/sama5d3.dtsi
+++ b/arch/arm/boot/dts/sama5d3.dtsi
@@ -1413,6 +1413,7 @@
 			atmel,nand-has-dma;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_nand0_ale_cle>;
+			clocks = <&hsmc_clk>;
 			atmel,pmecc-lookup-table-offset = <0x0 0x8000>;
 			status = "disabled";
 
@@ -1425,7 +1426,6 @@
 					0xffffc000 0x00000070	/* NFC HSMC regs */
 					0x00200000 0x00100000	/* NFC SRAM banks */
 					>;
-				clocks = <&hsmc_clk>;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4.dtsi
index c3b07d9..9b2139a 100644
--- a/arch/arm/boot/dts/sama5d4.dtsi
+++ b/arch/arm/boot/dts/sama5d4.dtsi
@@ -281,6 +281,7 @@
 			atmel,nand-has-dma;
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_nand>;
+			clocks = <&hsmc_clk>;
 			status = "disabled";
 
 			nfc@90000000 {
@@ -292,7 +293,6 @@
 					0xfc05c000 0x00000070	/* NFC HSMC regs */
 					0x00100000 0x00100000	/* NFC SRAM banks */
                                          >;
-				clocks = <&hsmc_clk>;
 				atmel,write-by-sram;
 			};
 		};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
