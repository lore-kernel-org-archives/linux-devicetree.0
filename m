From: <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 01/14] dt-bindings: Document STM32MP1 Reset Clock Controller (RCC) bindings
Date: Fri, 2 Feb 2018 15:03:29 +0100
Message-ID: <1517580222-23301-2-git-send-email-gabriel.fernandez@st.com>
References: <1517580222-23301-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517580222-23301-1-git-send-email-gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gabriel.fernandez.st-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, olivier.bideau-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>

The RCC block is responsible of the management of the clock and reset
generation for the complete circuit.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
---
 .../devicetree/bindings/mfd/st,stm32-rcc.txt       | 85 ++++++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/st,stm32-rcc.txt

diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-rcc.txt b/Documentation/devicetree/bindings/mfd/st,stm32-rcc.txt
new file mode 100644
index 0000000..28017a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-rcc.txt
@@ -0,0 +1,85 @@
+STMicroelectronics STM32 Peripheral Reset Clock Controller
+==========================================================
+
+The RCC IP is both a reset and a clock controller.
+
+Please also refer to reset.txt for common reset controller binding usage.
+
+Please also refer to clock-bindings.txt for common clock controller
+binding usage.
+
+
+Required properties:
+- compatible: "simple-mfd", "syscon"
+- reg: should be register base and length as documented in the datasheet
+
+- Sub-nodes:
+  - compatible: "st,stm32mp1-rcc-clk"
+	- #clock-cells: 1, device nodes should specify the clock in their
+	  "clocks" property, containing a phandle to the clock device node,
+	  an index specifying the clock to use.
+
+  - compatible: "st,stm32mp1-rcc-rst"
+	- #reset-cells: Shall be 1
+
+Example:
+	rcc: rcc@50000000 {
+		compatible = "syscon", "simple-mfd";
+		reg = <0x50000000 0x1000>;
+
+		rcc_clk: rcc-clk@50000000 {
+			#clock-cells = <1>;
+			compatible = "st,stm32mp1-rcc-clk";
+		};
+
+		rcc_rst: rcc-reset@50000000 {
+			#reset-cells = <1>;
+			compatible = "st,stm32mp1-rcc-rst";
+		};
+	};
+
+Specifying clocks
+=================
+
+All available clocks are defined as preprocessor macros in
+dt-bindings/clock/stm32mp1-clks.h header and can be used in device
+tree sources.
+
+Example:
+
+	/* Accessing DMA1 clock */
+	... {
+		clocks = <&rcc_clk DMA1>
+	};
+
+	/* Accessing SPI6 kernel clock */
+	... {
+		clocks = <&rcc_clk SPI6_K>
+	};
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
+
+For example on STM32MP1, for LTDC reset:
+ ltdc = APB4_RSTSETR_offset / 4 * 32 + LTDC_bit_offset
+      = 0x180 / 4 * 32 + 0 = 3072
+
+The list of valid indices for STM32MP1 is available in:
+include/dt-bindings/reset-controller/stm32mp1-resets.h
+
+This file implements defines like:
+#define LTDC_R	3072
+
+example:
+
+	ltdc {
+		resets = <&rcc_rst LTDC_R>;
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
