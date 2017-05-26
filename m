From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Subject: [PATCH RFC 3/5] ARM: dts: at91-sama5d4: use IRQ_TYPE_* to specify irq flags
Date: Fri, 26 May 2017 20:06:07 +0200
Message-ID: <20170526180609.2699-3-uwe@kleine-koenig.org>
References: <20170526180609.2699-1-uwe@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170526180609.2699-1-uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

According to the binding documentation and the source code the atmel-gpio
controller takes IRQ_TYPE_* as its flags values, not GPIO_ACTIVE_*.

This patch uses the right variable type which yields the same result
when compiled. Note that this might be wrong and actually
IRQ_TYPE_LEVEL_LOW is intended by the dt author.

Signed-off-by: Uwe Kleine-König <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
---
Hello,

can somebody with the hardware or it's documentation please check which
flag is the right one?

Best regards
Uwe

 arch/arm/boot/dts/at91-sama5d4_ma5d4.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/at91-sama5d4_ma5d4.dtsi b/arch/arm/boot/dts/at91-sama5d4_ma5d4.dtsi
index b5a5a91bc2ef..b813fdfa2842 100644
--- a/arch/arm/boot/dts/at91-sama5d4_ma5d4.dtsi
+++ b/arch/arm/boot/dts/at91-sama5d4_ma5d4.dtsi
@@ -75,7 +75,7 @@
 					reg = <0>;
 					clocks = <&clk20m>;
 					interrupt-parent = <&pioE>;
-					interrupts = <6 GPIO_ACTIVE_LOW>;
+					interrupts = <6 IRQ_TYPE_EDGE_RISING>;
 					spi-max-frequency = <10000000>;
 				};
 
@@ -84,7 +84,7 @@
 					reg = <1>;
 					clocks = <&clk20m>;
 					interrupt-parent = <&pioE>;
-					interrupts = <7 GPIO_ACTIVE_LOW>;
+					interrupts = <7 IRQ_TYPE_EDGE_RISING>;
 					spi-max-frequency = <10000000>;
 				};
 			};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
