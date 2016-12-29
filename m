From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/2] dt-bindings: Document the hi3660 clock bindings
Date: Thu, 29 Dec 2016 10:33:24 +0800
Message-ID: <1482978805-6981-2-git-send-email-zhangfei.gao@linaro.org>
References: <1482978805-6981-1-git-send-email-zhangfei.gao@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1482978805-6981-1-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add DT bindings documentation for hi3660 SoC clock.

Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/clock/hi3660-clock.txt     | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/hi3660-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/hi3660-clock.txt b/Documentation/devicetree/bindings/clock/hi3660-clock.txt
new file mode 100644
index 0000000..cc9b86c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/hi3660-clock.txt
@@ -0,0 +1,42 @@
+* Hisilicon Hi3660 Clock Controller
+
+The Hi3660 clock controller generates and supplies clock to various
+controllers within the Hi3660 SoC.
+
+Required Properties:
+
+- compatible: the compatible should be one of the following strings to
+	indicate the clock controller functionality.
+
+	- "hisilicon,hi3660-crgctrl"
+	- "hisilicon,hi3660-pctrl"
+	- "hisilicon,hi3660-pmuctrl"
+	- "hisilicon,hi3660-sctrl"
+	- "hisilicon,hi3660-iomcu"
+
+- reg: physical base address of the controller and length of memory mapped
+  region.
+
+- #clock-cells: should be 1.
+
+Each clock is assigned an identifier and client nodes use this identifier
+to specify the clock which they consume.
+
+All these identifier could be found in <dt-bindings/clock/hi3660-clock.h>.
+
+Examples:
+	crg_ctrl: clock-controller@fff35000 {
+		compatible = "hisilicon,hi3660-crgctrl", "syscon";
+		reg = <0x0 0xfff35000 0x0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	uart0: serial@fdf02000 {
+		compatible = "arm,pl011", "arm,primecell";
+		reg = <0x0 0xfdf02000 0x0 0x1000>;
+		interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&crg_ctrl HI3660_CLK_MUX_UART0>,
+			 <&crg_ctrl HI3660_PCLK>;
+		clock-names = "uartclk", "apb_pclk";
+		status = "disabled";
+	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
