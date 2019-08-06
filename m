From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 17/20] arm64: dts: marvell: Add support for Marvell CN9130 SoC
 support
Date: Tue,  6 Aug 2019 16:54:57 +0200
Message-ID: <20190806145500.24109-18-miquel.raynal@bootlin.com>
References: <20190806145500.24109-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190806145500.24109-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Yan Markman <ymarkman@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Stefan Chulski <stefanc@marvell.com>, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

A CN9130 SoC has one AP807 and one internal CP115.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/marvell/cn9130.dtsi | 37 +++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 arch/arm64/boot/dts/marvell/cn9130.dtsi

diff --git a/arch/arm64/boot/dts/marvell/cn9130.dtsi b/arch/arm64/boot/dts/marvell/cn9130.dtsi
new file mode 100644
index 000000000000..a2b7e5ec979d
--- /dev/null
+++ b/arch/arm64/boot/dts/marvell/cn9130.dtsi
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2019 Marvell International Ltd.
+ *
+ * Device tree for the CN9130 SoC.
+ */
+
+#include "armada-ap807-quad.dtsi"
+
+/ {
+	model = "Marvell Armada CN9130 SoC";
+	compatible = "marvell,cn9130", "marvell,armada-ap807-quad",
+		     "marvell,armada-ap807";
+};
+
+/*
+ * Instantiate the internal CP115
+ */
+
+#define CP11X_NAME		cp0
+#define CP11X_BASE		f2000000
+#define CP11X_PCIEx_MEM_BASE(iface) ((iface == 0) ? 0xc0000000 : \
+						    0xe0000000 + ((iface - 1) * 0x1000000))
+#define CP11X_PCIEx_MEM_SIZE(iface) ((iface == 0) ? 0x1ff00000 : 0xf00000)
+#define CP11X_PCIE0_BASE	f2600000
+#define CP11X_PCIE1_BASE	f2620000
+#define CP11X_PCIE2_BASE	f2640000
+
+#include "armada-cp115.dtsi"
+
+#undef CP11X_NAME
+#undef CP11X_BASE
+#undef CP11X_PCIEx_MEM_BASE
+#undef CP11X_PCIEx_MEM_SIZE
+#undef CP11X_PCIE0_BASE
+#undef CP11X_PCIE1_BASE
+#undef CP11X_PCIE2_BASE
-- 
2.20.1
