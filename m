From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH 2/3] clk: meson: add sub EMMC clock dt-bindings IDs
Date: Tue, 3 Jul 2018 14:57:15 +0000
Message-ID: <20180703145716.31860-3-yixun.lan@amlogic.com>
References: <20180703145716.31860-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703145716.31860-1-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Yixun Lan <yixun.lan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <boris.brezillon@bootlin.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liang Yang <liang.yang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add two clock bindings IDs which provided by the EMMC clock controller,
These two clocks will be used by EMMC or NAND driver.

Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 include/dt-bindings/clock/emmc-clkc.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 include/dt-bindings/clock/emmc-clkc.h

diff --git a/include/dt-bindings/clock/emmc-clkc.h b/include/dt-bindings/clock/emmc-clkc.h
new file mode 100644
index 000000000000..d9972c400e58
--- /dev/null
+++ b/include/dt-bindings/clock/emmc-clkc.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Meson EMMC sub clock tree IDs
+ *
+ * Copyright (c) 2018 Amlogic, Inc. All rights reserved.
+ */
+
+#ifndef __EMMC_CLKC_H
+#define __EMMC_CLKC_H
+
+#define CLKID_EMMC_C_MUX				0
+#define CLKID_EMMC_C_DIV				1
+
+#endif
-- 
2.18.0
