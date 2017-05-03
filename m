From: Christophe Leroy <christophe.leroy-GgN8y9CXRhA@public.gmane.org>
Subject: [PATCH] mtd: nand: gpio: update binding
Date: Wed,  3 May 2017 14:18:24 +0200 (CEST)
Message-ID: <20170503121824.DD82C67889@pc13941vm.idsi0.si.c-s.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch updates the binding documentation in accordance with
commit 44dd182861f99 ("mtd: nand: gpio: make nCE GPIO optional")

Signed-off-by: Christophe Leroy <christophe.leroy-GgN8y9CXRhA@public.gmane.org>
Reported-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/mtd/gpio-control-nand.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
index af8915b41ccf..486a17d533d7 100644
--- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
@@ -12,7 +12,7 @@ Required properties:
 - #address-cells, #size-cells : Must be present if the device has sub-nodes
   representing partitions.
 - gpios : Specifies the GPIO pins to control the NAND device.  The order of
-  GPIO references is:  RDY, nCE, ALE, CLE, and an optional nWP.
+  GPIO references is:  RDY, nCE, ALE, CLE, and nWP. nCE and nWP are optional.
 
 Optional properties:
 - bank-width : Width (in bytes) of the device.  If not present, the width
@@ -36,7 +36,7 @@ gpio-nand@1,0 {
 	#address-cells = <1>;
 	#size-cells = <1>;
 	gpios = <&banka 1 0>,	/* RDY */
-		<&banka 2 0>, 	/* nCE */
+		<0>, 		/* nCE */
 		<&banka 3 0>, 	/* ALE */
 		<&banka 4 0>, 	/* CLE */
 		<0>;		/* nWP */
-- 
2.12.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
