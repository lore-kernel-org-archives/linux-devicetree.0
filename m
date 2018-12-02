From: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 12/17] dt-bindings: clock: Add Allwinner
 suniv F1C100s CCU
Date: Sun,  2 Dec 2018 23:23:46 +0300
Message-ID: <963e6608b509ae7a83966c76b9d0fc7d8bf1c07b.1543781680.git.mesihkilinc@gmail.com>
References: <cover.1543781680.git.mesihkilinc@gmail.com>
Reply-To: mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDI4VHO5SYLBBAH7SDQAKGQEOFMPQDQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.1543781680.git.mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add compatiple string for Allwinner suniv F1C100s CCU.
Add clock and reset definitions.

Signed-off-by: Mesih Kilinc <mesihkilinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Acked-by: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/clock/sunxi-ccu.txt        |  1 +
 include/dt-bindings/clock/suniv-ccu-f1c100s.h      | 70 ++++++++++++++++++++++
 include/dt-bindings/reset/suniv-ccu-f1c100s.h      | 38 ++++++++++++
 3 files changed, 109 insertions(+)
 create mode 100644 include/dt-bindings/clock/suniv-ccu-f1c100s.h
 create mode 100644 include/dt-bindings/reset/suniv-ccu-f1c100s.h

diff --git a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
index 47d2e90..e3bd88a 100644
--- a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
@@ -22,6 +22,7 @@ Required properties :
 		- "allwinner,sun50i-h5-ccu"
 		- "allwinner,sun50i-h6-ccu"
 		- "allwinner,sun50i-h6-r-ccu"
+		- "allwinner,suniv-f1c100s-ccu"
 		- "nextthing,gr8-ccu"
 
 - reg: Must contain the registers base address and length
diff --git a/include/dt-bindings/clock/suniv-ccu-f1c100s.h b/include/dt-bindings/clock/suniv-ccu-f1c100s.h
new file mode 100644
index 0000000..f5ac155
--- /dev/null
+++ b/include/dt-bindings/clock/suniv-ccu-f1c100s.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ *
+ * Copyright (c) 2018 Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
+ *
+ */
+
+#ifndef _DT_BINDINGS_CLK_SUNIV_F1C100S_H_
+#define _DT_BINDINGS_CLK_SUNIV_F1C100S_H_
+
+#define CLK_CPU			11
+
+#define CLK_BUS_DMA		14
+#define CLK_BUS_MMC0		15
+#define CLK_BUS_MMC1		16
+#define CLK_BUS_DRAM		17
+#define CLK_BUS_SPI0		18
+#define CLK_BUS_SPI1		19
+#define CLK_BUS_OTG		20
+#define CLK_BUS_VE		21
+#define CLK_BUS_LCD		22
+#define CLK_BUS_DEINTERLACE	23
+#define CLK_BUS_CSI		24
+#define CLK_BUS_TVD		25
+#define CLK_BUS_TVE		26
+#define CLK_BUS_DE_BE		27
+#define CLK_BUS_DE_FE		28
+#define CLK_BUS_CODEC		29
+#define CLK_BUS_SPDIF		30
+#define CLK_BUS_IR		31
+#define CLK_BUS_RSB		32
+#define CLK_BUS_I2S0		33
+#define CLK_BUS_I2C0		34
+#define CLK_BUS_I2C1		35
+#define CLK_BUS_I2C2		36
+#define CLK_BUS_PIO		37
+#define CLK_BUS_UART0		38
+#define CLK_BUS_UART1		39
+#define CLK_BUS_UART2		40
+
+#define CLK_MMC0		41
+#define CLK_MMC0_SAMPLE		42
+#define CLK_MMC0_OUTPUT		43
+#define CLK_MMC1		44
+#define CLK_MMC1_SAMPLE		45
+#define CLK_MMC1_OUTPUT		46
+#define CLK_I2S			47
+#define CLK_SPDIF		48
+
+#define CLK_USB_PHY0		49
+
+#define CLK_DRAM_VE		50
+#define CLK_DRAM_CSI		51
+#define CLK_DRAM_DEINTERLACE	52
+#define CLK_DRAM_TVD		53
+#define CLK_DRAM_DE_FE		54
+#define CLK_DRAM_DE_BE		55
+
+#define CLK_DE_BE		56
+#define CLK_DE_FE		57
+#define CLK_TCON		58
+#define CLK_DEINTERLACE		59
+#define CLK_TVE2_CLK		60
+#define CLK_TVE1_CLK		61
+#define CLK_TVD			62
+#define CLK_CSI			63
+#define CLK_VE			64
+#define CLK_CODEC		65
+#define CLK_AVS			66
+
+#endif
diff --git a/include/dt-bindings/reset/suniv-ccu-f1c100s.h b/include/dt-bindings/reset/suniv-ccu-f1c100s.h
new file mode 100644
index 0000000..6a4b438
--- /dev/null
+++ b/include/dt-bindings/reset/suniv-ccu-f1c100s.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ *
+ * Copyright (C) 2018 Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
+ *
+ */
+
+#ifndef _DT_BINDINGS_RST_SUNIV_F1C100S_H_
+#define _DT_BINDINGS_RST_SUNIV_F1C100S_H_
+
+#define RST_USB_PHY0		0
+#define RST_BUS_DMA		1
+#define RST_BUS_MMC0		2
+#define RST_BUS_MMC1		3
+#define RST_BUS_DRAM		4
+#define RST_BUS_SPI0		5
+#define RST_BUS_SPI1		6
+#define RST_BUS_OTG		7
+#define RST_BUS_VE		8
+#define RST_BUS_LCD		9
+#define RST_BUS_DEINTERLACE	10
+#define RST_BUS_CSI		11
+#define RST_BUS_TVD		12
+#define RST_BUS_TVE		13
+#define RST_BUS_DE_BE		14
+#define RST_BUS_DE_FE		15
+#define RST_BUS_CODEC		16
+#define RST_BUS_SPDIF		17
+#define RST_BUS_IR		18
+#define RST_BUS_RSB		19
+#define RST_BUS_I2S0		20
+#define RST_BUS_I2C0		21
+#define RST_BUS_I2C1		22
+#define RST_BUS_I2C2		23
+#define RST_BUS_UART0		24
+#define RST_BUS_UART1		25
+#define RST_BUS_UART2		26
+
+#endif /* _DT_BINDINGS_RST_SUNIV_F1C100S_H_ */
-- 
2.7.4
