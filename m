From: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: at91: sama5/dts: reduce the NFC command register map
Date: Thu, 2 Apr 2015 14:17:56 +0800
Message-ID: <1427955477-9176-1-git-send-email-josh.wu@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

commit 111573ccd89b ("mtd: atmel_nand: check NFC busy flag by HSMC_SR
instead of NFC cmd regs")
check NFC busy by nfc SR instead of NFC cmd regs. So we don't need to
map NFC cmd registers to include NFCBUSY bit.
That means we only need map 0x08000000 instead of 0x10000000 for NFC
cmd regs.

This patch reduce the NFC cmd regs map for sama5d3 & sama5d4.

Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
This patch is based on linux-next git repo.

 arch/arm/boot/dts/sama5d3.dtsi | 2 +-
 arch/arm/boot/dts/sama5d4.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
index 261311b..5b2c235 100644
--- a/arch/arm/boot/dts/sama5d3.dtsi
+++ b/arch/arm/boot/dts/sama5d3.dtsi
@@ -1445,7 +1445,7 @@
 				#address-cells = <1>;
 				#size-cells = <1>;
 				reg = <
-					0x70000000 0x10000000	/* NFC Command Registers */
+					0x70000000 0x08000000	/* NFC Command Registers */
 					0xffffc000 0x00000070	/* NFC HSMC regs */
 					0x00200000 0x00100000	/* NFC SRAM banks */
 					>;
diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4.dtsi
index d986b41..87705ad 100644
--- a/arch/arm/boot/dts/sama5d4.dtsi
+++ b/arch/arm/boot/dts/sama5d4.dtsi
@@ -294,7 +294,7 @@
 				#address-cells = <1>;
 				#size-cells = <1>;
 				reg = <
-					0x90000000 0x10000000	/* NFC Command Registers */
+					0x90000000 0x08000000	/* NFC Command Registers */
 					0xfc05c000 0x00000070	/* NFC HSMC regs */
 					0x00100000 0x00100000	/* NFC SRAM banks */
                                          >;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
