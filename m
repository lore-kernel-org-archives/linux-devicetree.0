Return-Path: <SRS0=WWNl=FN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:49942 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932163AbeBSWgH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 19 Feb 2018 17:36:07 -0500
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 5/6] arm: dts: pxa: use reworked NAND controller driver
Date: Mon, 19 Feb 2018 23:35:56 +0100
Message-Id: <20180219223557.2458-6-miquel.raynal@bootlin.com>
In-Reply-To: <20180219223557.2458-1-miquel.raynal@bootlin.com>
References: <20180219223557.2458-1-miquel.raynal@bootlin.com>
Sender: devicetree-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Eric Miao <eric.y.miao@gmail.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, devicetree@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Use the new bindings of the reworked Marvell NAND controller driver.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm/boot/dts/pxa3xx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/pxa3xx.dtsi b/arch/arm/boot/dts/pxa3xx.dtsi
index 55c75b67351c..982d1a62661d 100644
--- a/arch/arm/boot/dts/pxa3xx.dtsi
+++ b/arch/arm/boot/dts/pxa3xx.dtsi
@@ -117,15 +117,15 @@
 			status = "disabled";
 		};
 
-		nand0: nand@43100000 {
-			compatible = "marvell,pxa3xx-nand";
+		nand_controller: nand-controller@43100000 {
+			compatible = "marvell,pxa3xx-nand-controller";
 			reg = <0x43100000 90>;
 			interrupts = <45>;
 			clocks = <&clks CLK_NAND>;
 			dmas = <&pdma 97 3>;
 			dma-names = "data";
 			#address-cells = <1>;
-			#size-cells = <1>;	
+			#size-cells = <0>;
 			status = "disabled";
 		};
 
-- 
2.14.1

