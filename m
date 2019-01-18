From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/8] MIPS: DTS: CI20: Set BCH clock to 200 MHz
Date: Thu, 17 Jan 2019 22:06:27 -0300
Message-ID: <20190118010634.27399-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

This is currently done inside the jz4780-bch driver, but it really
should be done here instead.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 50cff3cbcc6d..aa892ec54d0a 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -111,6 +111,9 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&pins_nemc>;
 
+		assigned-clocks = <&cgu JZ4780_CLK_BCH>;
+		assigned-clock-rates = <200000000>;
+
 		nand@1 {
 			reg = <1>;
 
-- 
2.11.0
