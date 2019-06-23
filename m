From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v3 6/9] ARM: sunxi: dts: s3/s3l/v3: add DTSI files for S3/S3L/V3 SoCs
Date: Sun, 23 Jun 2019 12:37:58 +0800
Message-ID: <20190623043801.14040-7-icenowy@aosc.io>
References: <20190623043801.14040-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190623043801.14040-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

The Allwinner S3/S3L/V3 SoCs all share the same die with the V3s SoC,
but with more GPIO wired out of the package.

Add DTSI files for these SoCs. The DTSI file for V3 just replaces the
pinctrl compatible string, and the S3/S3L DTSI files just include the V3
DTSI file.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
No changes in v3/v2.

 arch/arm/boot/dts/sun8i-s3.dtsi  |  6 ++++++
 arch/arm/boot/dts/sun8i-s3l.dtsi |  6 ++++++
 arch/arm/boot/dts/sun8i-v3.dtsi  | 14 ++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun8i-s3.dtsi
 create mode 100644 arch/arm/boot/dts/sun8i-s3l.dtsi
 create mode 100644 arch/arm/boot/dts/sun8i-v3.dtsi

diff --git a/arch/arm/boot/dts/sun8i-s3.dtsi b/arch/arm/boot/dts/sun8i-s3.dtsi
new file mode 100644
index 000000000000..0f41a25ecb30
--- /dev/null
+++ b/arch/arm/boot/dts/sun8i-s3.dtsi
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2019 Icenowy Zheng <icenowy@aosc.io>
+ */
+
+#include "sun8i-v3.dtsi"
diff --git a/arch/arm/boot/dts/sun8i-s3l.dtsi b/arch/arm/boot/dts/sun8i-s3l.dtsi
new file mode 100644
index 000000000000..0f41a25ecb30
--- /dev/null
+++ b/arch/arm/boot/dts/sun8i-s3l.dtsi
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2019 Icenowy Zheng <icenowy@aosc.io>
+ */
+
+#include "sun8i-v3.dtsi"
diff --git a/arch/arm/boot/dts/sun8i-v3.dtsi b/arch/arm/boot/dts/sun8i-v3.dtsi
new file mode 100644
index 000000000000..6ae8645ade50
--- /dev/null
+++ b/arch/arm/boot/dts/sun8i-v3.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2019 Icenowy Zheng <icenowy@aosc.io>
+ */
+
+#include "sun8i-v3s.dtsi"
+
+&ccu {
+	compatible = "allwinner,sun8i-v3-ccu";
+};
+
+&pio {
+	compatible = "allwinner,sun8i-v3-pinctrl";
+};
-- 
2.21.0
