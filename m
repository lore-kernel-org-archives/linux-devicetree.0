From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Subject: [PATCH v2 3/4] hw_random: jz4780-rng: Add RNG node to jz4780.dtsi
Date: Sat, 27 Aug 2016 23:44:56 +0530
Message-ID: <1472321697-3094-4-git-send-email-prasannatsmkumar@gmail.com>
References: <1472321697-3094-1-git-send-email-prasannatsmkumar@gmail.com>
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <1472321697-3094-1-git-send-email-prasannatsmkumar@gmail.com>
Sender: linux-crypto-owner@vger.kernel.org
To: mpm@selenic.com, herbert@gondor.apana.org.au, robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, gregkh@linuxfoundation.org, boris.brezillon@free-electrons.com, harvey.hunt@imgtec.com, prarit@redhat.com, f.fainelli@gmail.com, joshua.henderson@microchip.com, narmstrong@baylibre.com, linus.walleij@linaro.org, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org
Cc: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch adds RNG node to jz4780.dtsi.

Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index b868b42..f11d139 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -36,7 +36,7 @@
 
 	cgu: jz4780-cgu@10000000 {
 		compatible = "ingenic,jz4780-cgu";
-		reg = <0x10000000 0x100>;
+		reg = <0x10000000 0xD8>;
 
 		clocks = <&ext>, <&rtc>;
 		clock-names = "ext", "rtc";
@@ -44,6 +44,11 @@
 		#clock-cells = <1>;
 	};
 
+	rng: jz4780-rng@100000D8 {
+		compatible = "ingenic,jz4780-rng";
+		reg = <0x100000D8 0x8>;
+	};
+
 	uart0: serial@10030000 {
 		compatible = "ingenic,jz4780-uart";
 		reg = <0x10030000 0x100>;
-- 
2.5.0
