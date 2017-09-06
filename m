From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 05/18] arm64: dts: h3ulcb-kf: ES1.x SoC initial device tree
Date: Thu,  7 Sep 2017 01:35:40 +0300
Message-ID: <1504737340-23034-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Add the initial device tree for the H3ULCB ES1.x SoC with Kingfisher
extension infotainment board.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
 arch/arm64/boot/dts/renesas/Makefile                  |  1 +
 arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 54e8316..e745450 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -1,6 +1,7 @@
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb r8a7795-h3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-salvator-x.dtb r8a7795-es1-h3ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-h3ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb r8a7796-m3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-m3ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts
new file mode 100644
index 0000000..dcc9e68
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1-h3ulcb-kf.dts
@@ -0,0 +1,17 @@
+/*
+ * Device Tree Source for the H3ULCB Kingfisher board
+ *
+ * Copyright (C) 2017 Renesas Electronics Corp.
+ * Copyright (C) 2017 Cogent Embedded, Inc.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+#include "r8a7795-es1-h3ulcb.dts"
+#include "ulcb-kf.dtsi"
+
+/ {
+	model = "Renesas H3ULCB Kingfisher board based on r8a7795 ES1.x";
+};
-- 
1.9.1
