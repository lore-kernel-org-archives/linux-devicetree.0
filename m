Return-Path: <SRS0=lXjp=OG=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 12/22] ARM: dts: r8a7744-iwg20d-q7-dbcm-ca: Add device tree for camera DB
Date: Tue, 27 Nov 2018 11:56:25 +0000
Message-Id: <1543319795-48325-13-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com>
References: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds support for the camera daughter board which is
connected to iWave's RZ/G1N Qseven carrier board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm/boot/dts/Makefile                      |  1 +
 arch/arm/boot/dts/r8a7744-iwg20d-q7-dbcm-ca.dts | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm/boot/dts/r8a7744-iwg20d-q7-dbcm-ca.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index aba5a25..9cf6fdf 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -830,6 +830,7 @@ dtb-$(CONFIG_ARCH_RENESAS) += \
 	r8a7743-iwg20d-q7-dbcm-ca.dtb \
 	r8a7743-sk-rzg1m.dtb \
 	r8a7744-iwg20d-q7.dtb \
+	r8a7744-iwg20d-q7-dbcm-ca.dtb \
 	r8a7745-iwg22d-sodimm.dtb \
 	r8a7745-iwg22d-sodimm-dbhd-ca.dtb \
 	r8a7745-sk-rzg1e.dtb \
diff --git a/arch/arm/boot/dts/r8a7744-iwg20d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7744-iwg20d-q7-dbcm-ca.dts
new file mode 100644
index 0000000..3e58c2e9
--- /dev/null
+++ b/arch/arm/boot/dts/r8a7744-iwg20d-q7-dbcm-ca.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the iWave Systems RZ/G1N Qseven board development
+ * platform with camera daughter board
+ *
+ * Copyright (C) 2018 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a7744-iwg20m.dtsi"
+#include "iwg20d-q7-common.dtsi"
+#include "iwg20d-q7-dbcm-ca.dtsi"
+
+/ {
+	model = "iWave Systems RZ/G1N Qseven development platform with camera add-on";
+	compatible = "iwave,g20d", "iwave,g20m", "renesas,r8a7744";
+};
-- 
2.7.4
