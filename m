From: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [RFC PATCH 1/3] dt-bindings: Document the STM32F4 clock bindings
Date: Fri, 22 May 2015 21:41:11 +0100
Message-ID: <1432327273-6810-2-git-send-email-daniel.thompson@linaro.org>
References: <1432327273-6810-1-git-send-email-daniel.thompson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432327273-6810-1-git-send-email-daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kamil Lulko <rev13-5tc4TXWwyLM@public.gmane.org>, Andreas Farber <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds documentation of device tree bindings for the clock related
portions of the STM32 RCC block.

Signed-off-by: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/clock/st,stm32-rcc.txt     | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.txt

diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.txt b/Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
new file mode 100644
index 0000000..9715d09
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
@@ -0,0 +1,65 @@
+STMicroelectronics STM32 Reset and Clock Controller
+===================================================
+
+The RCC IP is both a reset and a clock controller. This documentation only
+describes the clock part.
+
+Please also refer to clock-bindings.txt in this directory for common clock
+controller binding usage.
+
+Required properties:
+- compatible: Should be "st,stm32f42xx-rcc"
+- reg: should be register base and length as documented in the
+  datasheet
+- #clock-cells: 2, device nodes should specify the clock in their "clocks"
+  property, containing a phandle to the clock device node, an index selecting
+  between gated clocks and other clocks and an index specifying the clock to
+  use.
+
+Example:
+
+	rcc: rcc@40023800 {
+		#clock-cells = <2>
+		compatible = "st,stm32f42xx-rcc", "st,stm32-rcc";
+		reg = <0x40023800 0x400>;
+	};
+
+Specifying gated clocks
+=======================
+
+The primary index must be set to 0.
+
+The secondary index is the bit number within the RCC register bank, starting
+from the first RCC clock enable register (RCC_AHB1ENR, address offset 0x30).
+
+It is calculated as: index = register_offset / 4 * 32 + bit_offset.
+Where bit_offset is the bit offset within the register (LSB is 0, MSB is 31).
+
+Example:
+
+	/* Gated clock, AHB1 bit 0 (GPIOA) */
+	... {
+		clocks = <&rcc 0 0>
+	};
+
+	/* Gated clock, AHB2 bit 4 (GPIOA) */
+	... {
+		clocks = <&rcc 0 36>
+	};
+
+Specifying other clocks
+=======================
+
+The primary index must be set to 1.
+
+The secondary index is bound with the following magic numbers:
+
+	0	SYSTICK
+	1	FCLK
+
+Example:
+
+	/* Misc clock, FCLK */
+	... {
+		clocks = <&rcc 1 1>
+	};
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
