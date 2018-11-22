Return-Path: <SRS0=JPrT=OB=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 3/7] ARM: dts: r8a7744-iwg20d-q7: Add support for iWave G20D-Q7 board based on RZ/G1N
Date: Thu, 22 Nov 2018 09:14:31 +0000
Message-Id: <1542878075-61314-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1542878075-61314-1-git-send-email-biju.das@bp.renesas.com>
References: <1542878075-61314-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add support for iWave RainboW-G20D-Qseven board based on RZ/G1N.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm/boot/dts/Makefile              |  1 +
 arch/arm/boot/dts/r8a7744-iwg20d-q7.dts | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 arch/arm/boot/dts/r8a7744-iwg20d-q7.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b0e966d..aba5a25 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -829,6 +829,7 @@ dtb-$(CONFIG_ARCH_RENESAS) += \
 	r8a7743-iwg20d-q7.dtb \
 	r8a7743-iwg20d-q7-dbcm-ca.dtb \
 	r8a7743-sk-rzg1m.dtb \
+	r8a7744-iwg20d-q7.dtb \
 	r8a7745-iwg22d-sodimm.dtb \
 	r8a7745-iwg22d-sodimm-dbhd-ca.dtb \
 	r8a7745-sk-rzg1e.dtb \
diff --git a/arch/arm/boot/dts/r8a7744-iwg20d-q7.dts b/arch/arm/boot/dts/r8a7744-iwg20d-q7.dts
new file mode 100644
index 0000000..1fdac52
--- /dev/null
+++ b/arch/arm/boot/dts/r8a7744-iwg20d-q7.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the iWave-RZ/G1N Qseven board
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a7744-iwg20m.dtsi"
+#include "iwg20d-q7-common.dtsi"
+
+/ {
+	model = "iWave Systems RainboW-G20D-Qseven board based on RZ/G1N";
+	compatible = "iwave,g20d", "iwave,g20m", "renesas,r8a7744";
+};
-- 
2.7.4
