From: <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 2/4] dt-bindings: Document the STM32 reset bindings
Date: Mon, 4 Jul 2016 15:47:30 +0200
Message-ID: <1467640052-6770-2-git-send-email-gabriel.fernandez@st.com>
References: <1467640052-6770-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467640052-6770-1-git-send-email-gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, patrice.chotard-qxv4g6HH51o@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This adds documentation of device tree bindings for the
STM32 reset controller.

Signed-off-by: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/reset/st,stm32-rcc.txt     | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/st,stm32-rcc.txt

diff --git a/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt b/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
new file mode 100644
index 0000000..333080c
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/st,stm32-rcc.txt
@@ -0,0 +1,50 @@
+STMicroelectronics STM32 Peripheral Reset Controller
+====================================================
+
+The RCC IP is both a reset and a clock controller. This documentation only
+documents the reset part.
+
+Please also refer to reset.txt in this directory for common reset
+controller binding usage.
+
+Required properties:
+- compatible: Should be "st,stm32-rcc"
+- reg: should be register base and length as documented in the
+  datasheet
+- #reset-cells: 1, see below
+
+example:
+
+rcc: reset@40023800 {
+	#reset-cells = <1>;
+	compatible = "st,stm32-rcc";
+	reg = <0x40023800 0x400>;
+};
+
+Specifying softreset control of devices
+=======================================
+
+Device nodes should specify the reset channel required in their "resets"
+property, containing a phandle to the reset device node and an index specifying
+which channel to use.
+The index is the bit number within the RCC registers bank, starting from RCC
+base address.
+It is calculated as: index = register_offset / 4 * 32 + bit_offset.
+Where bit_offset is the bit offset within the register.
+For example, for CRC reset:
+  crc = AHB1RSTR_offset / 4 * 32 + CRCRST_bit_offset = 0x10 / 4 * 32 + 12 = 140
+
+To simplify the usagen and to share bit definition with the clock driver of
+the RCC IP, macros are available to generate the index in human-readble
+format.
+
+For STM32F4 series, the macro are available here:
+ - include/dt-bindings/mfd/stm32f4-rcc.h
+
+example:
+
+	timer2 {
+		resets			= <&rcc STM32F4_APB1_RESET(TIM2)>;
+	};
+
+
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
