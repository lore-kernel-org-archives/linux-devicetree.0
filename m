From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/8] [RFC] arm64: dts: renesas: Add R-Car M3-W SiP (2 x 2 GiB) support
Date: Wed, 19 Apr 2017 11:15:47 +0200
Message-ID: <1492593351-13835-5-git-send-email-geert+renesas@glider.be>
References: <1492593351-13835-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1492593351-13835-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add support for the R-Car M3-W System-in-Package (r8j7796), which contains:
  - an R-Car M3-W SoC (r8a7796),
  - 2 channels of 2 GiB of RAM (4 GiB total),
  - HyperFlash (not yet described).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Questions:
  - Should this file be named r8j7796-4g.dtsi instead?
  - What's the official name of r8j7796 with 2 x 2 GiB of RAM?
---
 arch/arm64/boot/dts/renesas/r8j7796-2x2g.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8j7796-2x2g.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8j7796-2x2g.dtsi b/arch/arm64/boot/dts/renesas/r8j7796-2x2g.dtsi
new file mode 100644
index 0000000000000000..9623bd2b4a914ae3
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8j7796-2x2g.dtsi
@@ -0,0 +1,26 @@
+/*
+ * Device Tree Source for the r8a7796 SiP with 2 channels of 2 GiB RAM
+ *
+ * Copyright (C) 2016 Renesas Electronics Corp.
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+#include "r8a7796.dtsi"
+
+/ {
+	compatible = "renesas,r8j7796", "renesas,r8a7796";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+
+	memory@600000000 {
+		device_type = "memory";
+		reg = <0x6 0x00000000 0x0 0x80000000>;
+	};
+};
-- 
2.7.4
