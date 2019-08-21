From: Sunil Mohan Adapa <sunil@medhas.org>
Subject: [PATCH v3 2/2] arm64: dts: allwinner: a64: Add A64 OlinuXino board
 (with eMMC)
Date: Wed, 21 Aug 2019 12:52:17 -0700
Message-ID: <20190821195217.4166-3-sunil@medhas.org>
References: <20190821195217.4166-1-sunil@medhas.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190821195217.4166-1-sunil@medhas.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, maxime.ripard@bootlin.com, Sunil Mohan Adapa <sunil@medhas.org>, Martin Ayotte <martinayotte@gmail.com>, wens@csie.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

A64 OLinuXino board from Olimex has three variants with onboard eMMC:
A64-OLinuXino-1Ge16GW, A64-OLinuXino-1Ge4GW and A64-OLinuXino-2Ge8G-IND. In
addition, there are two variants without eMMC. One without eMMC and one with SPI
flash. This suggests the need for separate device tree for the three eMMC
variants.

This patch has been tested on A64-OLinuXino-1Ge16GW with Linux 5.0 from Debain.
Basic benchmarks using Flexible IO Tester show reasonable performance from the
eMMC.

eMMC - Random Write: 21.3MiB/s
eMMC - Sequential Write: 68.2MiB/s
SD Card - Random Write: 1690KiB/s
SD Card - Sequential Write: 11.0MiB/s

Changes:

  v3: Separate dts for eMMC variants

  v2: Fix descriptions for VCC and VCCQ

Link: https://github.com/armbian/build/commit/174953de1eb09e6aa1ef7075066b573dba625398
Signed-off-by: Martin Ayotte <martinayotte@gmail.com>
[sunil@medhas.org Fix descriptions for VCC and VCCQ, separate dts for eMMC]
Signed-off-by: Sunil Mohan Adapa <sunil@medhas.org>
Tested-by: Sunil Mohan Adapa <sunil@medhas.org>
---
 arch/arm64/boot/dts/allwinner/Makefile        |  1 +
 .../allwinner/sun50i-a64-olinuxino-emmc.dts   | 23 +++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino-emmc.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 395fe76f6819..d2418021768b 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -4,6 +4,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-bananapi-m64.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-nanopi-a64.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-oceanic-5205-5inmfd.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-olinuxino.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-olinuxino-emmc.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-orangepi-win.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-lts.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-plus.dtb sun50i-a64-pine64.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino-emmc.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino-emmc.dts
new file mode 100644
index 000000000000..96ab0227e82d
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino-emmc.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2018 Martin Ayotte <martinayotte@gmail.com>
+ * Copyright (C) 2019 Sunil Mohan Adapa <sunil@medhas.org>
+ */
+
+#include "sun50i-a64-olinuxino.dts"
+
+/ {
+	model = "Olimex A64-Olinuxino-eMMC";
+	compatible = "olimex,a64-olinuxino-emmc", "allwinner,sun50i-a64";
+};
+
+&mmc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc2_pins>;
+	vmmc-supply = <&reg_dcdc1>;
+	vqmmc-supply = <&reg_dcdc1>;
+	bus-width = <8>;
+	non-removable;
+	cap-mmc-hw-reset;
+	status = "okay";
+};
-- 
2.20.1
