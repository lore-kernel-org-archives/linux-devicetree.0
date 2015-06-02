From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/2] clk: at91: add a new compatible string for Flexcom in the DT documentation
Date: Tue, 2 Jun 2015 18:57:18 +0200
Message-ID: <359f6b85c3a8b51a0ea35bacdbdc0443b9fbedcc.1433264017.git.cyrille.pitchen@atmel.com>
References: <cover.1433264017.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1433264017.git.cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patches documents the new bindings for the Flexcom clock, which will
be introduced by Atmel sama5d2x chips.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/clock/at91-clock.txt         | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/at91-clock.txt b/Documentation/devicetree/bindings/clock/at91-clock.txt
index 7a4d492..df4f40b 100644
--- a/Documentation/devicetree/bindings/clock/at91-clock.txt
+++ b/Documentation/devicetree/bindings/clock/at91-clock.txt
@@ -77,6 +77,9 @@ Required properties:
 	"atmel,sama5d4-clk-h32mx":
 		at91 h32mx clock
 
+	"atmel,sama5d2-flexcom":
+		at91 flexcom clock
+
 Required properties for SCKC node:
 - reg : defines the IO memory reserved for the SCKC.
 - #size-cells : shall be 0 (reg is used to encode clk id).
@@ -461,3 +464,20 @@ For example:
 		compatible = "atmel,sama5d4-clk-h32mx";
 		clocks = <&mck>;
 	};
+
+Required properties for flexcom clock:
+- #clock-cells : from common clock binding; shall be set to 0.
+- clocks : shall be the Flexcom peripheral clock from PMC.
+- reg : shall be the range for Flexcom dedicated I/O registers (without USART,
+  TWI or SPI registers).
+- atmel,flexcom-mode : shall be a string value among { "spi", "usart", "i2c",
+  "twi" }. "i2c" and "twi" are synonymous.
+
+For example:
+	flx0: flexcom@f8034000 {
+		compatible = "atmel,sama5d2-flexcom";
+		#clock-cells = <0>;
+		reg = <0xf8034000 0x200>;
+		clocks = <&flx0_clk>;
+		atmel,flexcom-mode = "spi";
+	};
-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
