From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/6] clk: oxnas: Add dt-bindings include file for OX810SE
Date: Wed,  5 Oct 2016 17:07:47 +0200
Message-ID: <20161005150752.22618-2-narmstrong@baylibre.com>
References: <20161005150752.22618-1-narmstrong@baylibre.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20161005150752.22618-1-narmstrong@baylibre.com>
Sender: linux-clk-owner@vger.kernel.org
To: sboyd@codeaurora.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-oxnas@lists.tuxfamily.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In order to prepare support for the Oxford Semiconductor OX820, add
a dt-bindings include file used by the ox810se dtsi.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/oxsemi,ox810se.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 include/dt-bindings/clock/oxsemi,ox810se.h

diff --git a/include/dt-bindings/clock/oxsemi,ox810se.h b/include/dt-bindings/clock/oxsemi,ox810se.h
new file mode 100644
index 0000000..d5facb5
--- /dev/null
+++ b/include/dt-bindings/clock/oxsemi,ox810se.h
@@ -0,0 +1,30 @@
+/*
+ * Copyright (C) 2016 Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef DT_CLOCK_OXSEMI_OX810SE_H
+#define DT_CLOCK_OXSEMI_OX810SE_H
+
+#define CLK_810_LEON		0
+#define CLK_810_DMA_SGDMA	1
+#define CLK_810_CIPHER		2
+#define CLK_810_SATA		3
+#define CLK_810_AUDIO		4
+#define CLK_810_USBMPH		5
+#define CLK_810_ETHA		6
+#define CLK_810_PCIEA		7
+#define CLK_810_NAND		8
+
+#endif /* DT_CLOCK_OXSEMI_OX810SE_H */
-- 
2.7.0

