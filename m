From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH v3 01/20] dt-bindings: clock: Add ASPEED constants
Date: Wed, 20 Dec 2017 13:53:09 +1030
Message-ID: <20171220032328.30584-2-joel@jms.id.au>
References: <20171220032328.30584-1-joel@jms.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171220032328.30584-1-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Xo Wang <xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lei YU <mine260309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

These will be used by the clock driver. This commit is included so
the tree will build without the clock series being applied.

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
---
 v3:
  - Clarify that the clock defines will be merged as part of the dt
  changes, so that the device tree merge will not depend on the clock
  tree
 v2:
  - remove NUM_CLKS define. There's no need for it to be part of ABI
---
 include/dt-bindings/clock/aspeed-clock.h | 52 ++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 include/dt-bindings/clock/aspeed-clock.h

diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindings/clock/aspeed-clock.h
new file mode 100644
index 000000000000..d3558d897a4d
--- /dev/null
+++ b/include/dt-bindings/clock/aspeed-clock.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+
+#ifndef DT_BINDINGS_ASPEED_CLOCK_H
+#define DT_BINDINGS_ASPEED_CLOCK_H
+
+#define ASPEED_CLK_GATE_ECLK		0
+#define ASPEED_CLK_GATE_GCLK		1
+#define ASPEED_CLK_GATE_MCLK		2
+#define ASPEED_CLK_GATE_VCLK		3
+#define ASPEED_CLK_GATE_BCLK		4
+#define ASPEED_CLK_GATE_DCLK		5
+#define ASPEED_CLK_GATE_REFCLK		6
+#define ASPEED_CLK_GATE_USBPORT2CLK	7
+#define ASPEED_CLK_GATE_LCLK		8
+#define ASPEED_CLK_GATE_USBUHCICLK	9
+#define ASPEED_CLK_GATE_D1CLK		10
+#define ASPEED_CLK_GATE_YCLK		11
+#define ASPEED_CLK_GATE_USBPORT1CLK	12
+#define ASPEED_CLK_GATE_UART1CLK	13
+#define ASPEED_CLK_GATE_UART2CLK	14
+#define ASPEED_CLK_GATE_UART5CLK	15
+#define ASPEED_CLK_GATE_ESPICLK		16
+#define ASPEED_CLK_GATE_MAC1CLK		17
+#define ASPEED_CLK_GATE_MAC2CLK		18
+#define ASPEED_CLK_GATE_RSACLK		19
+#define ASPEED_CLK_GATE_UART3CLK	20
+#define ASPEED_CLK_GATE_UART4CLK	21
+#define ASPEED_CLK_GATE_SDCLKCLK	22
+#define ASPEED_CLK_GATE_LHCCLK		23
+#define ASPEED_CLK_HPLL			24
+#define ASPEED_CLK_AHB			25
+#define ASPEED_CLK_APB			26
+#define ASPEED_CLK_UART			27
+#define ASPEED_CLK_SDIO			28
+#define ASPEED_CLK_ECLK			29
+#define ASPEED_CLK_ECLK_MUX		30
+#define ASPEED_CLK_LHCLK		31
+#define ASPEED_CLK_MAC			32
+#define ASPEED_CLK_BCLK			33
+#define ASPEED_CLK_MPLL			34
+
+#define ASPEED_RESET_XDMA		0
+#define ASPEED_RESET_MCTP		1
+#define ASPEED_RESET_ADC		2
+#define ASPEED_RESET_JTAG_MASTER	3
+#define ASPEED_RESET_MIC		4
+#define ASPEED_RESET_PWM		5
+#define ASPEED_RESET_PCIVGA		6
+#define ASPEED_RESET_I2C		7
+#define ASPEED_RESET_AHB		8
+
+#endif
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
