From: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 2/2] ARM: mvebu: Netgear RN2120: Use Hardware BCH ECC
Date: Sat, 06 Sep 2014 22:49:38 +0200
Message-ID: <61f6a1b7ad0adc57a0e201b9680bc2e5f214a317.1410035142.git.arno@natisbad.org>
References: <cover.1410035142.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1410035142.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


The bootloader on the Netgear ReadyNAS RN2120 uses Hardware BCH
ECC (strength = 4), while the pxa3xx NAND driver by default uses
Hamming ECC (strength = 1).

This patch changes the ECC mode on these machines to match that
of the bootloader and of the stock firmware. That way, it is
now possible to update the kernel from userland (e.g. using
standard tools from mtd-utils package); u-boot will happily
load and boot it.

The issue was initially reported and fixed by Ben Pedell for
RN102. The RN2120 shares the same Hynix H27U1G8F2BTR NAND
flash and setup. This patch is based on Ben's fix for RN102.

Fixes: ad51eddd95ad ("ARM: mvebu: Enable NAND controller in ReadyNAS 2120 .dts file")
Depends-on: 5b3e507820c6 ("mtd: nand: pxa3xx: Use ECC strength and step size devicetree binding")
Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
---
 arch/arm/boot/dts/armada-xp-netgear-rn2120.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts b/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
index 0cf999abc4ed..c5ed85a70ed9 100644
--- a/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
+++ b/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
@@ -223,6 +223,10 @@
 				marvell,nand-enable-arbiter;
 				nand-on-flash-bbt;
 
+				/* Use Hardware BCH ECC */
+				nand-ecc-strength = <4>;
+				nand-ecc-step-size = <512>;
+
 				partition@0 {
 					label = "u-boot";
 					reg = <0x0000000 0x180000>;  /* 1.5MB */
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
