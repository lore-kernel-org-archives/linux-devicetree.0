Return-Path: <SRS0=X76U=OJ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 01/21] ARM: dts: r8a7744-iwg20m: Add iWave RZ/G1N Qseven SOM
Date: Fri, 30 Nov 2018 15:26:15 +0000
Message-Id: <1543591595-37861-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1543591595-37861-1-git-send-email-biju.das@bp.renesas.com>
References: <1543591595-37861-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add support for iWave RZ/G1N Qseven System On Module.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V1-->V2
    * No change
---
 arch/arm/boot/dts/r8a7744-iwg20m.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 arch/arm/boot/dts/r8a7744-iwg20m.dtsi

diff --git a/arch/arm/boot/dts/r8a7744-iwg20m.dtsi b/arch/arm/boot/dts/r8a7744-iwg20m.dtsi
new file mode 100644
index 0000000..6166ae0
--- /dev/null
+++ b/arch/arm/boot/dts/r8a7744-iwg20m.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the iWave RZ/G1N Qseven SOM
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ */
+
+#include "r8a7744.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	compatible = "iwave,g20m", "renesas,r8a7744";
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x40000000>;
+	};
+
+	reg_3p3v: 3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3P3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <20000000>;
+};
-- 
2.7.4
