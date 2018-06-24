From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RfC v1 4/5] ARM64: dts: meson-gxl: add support for the S905W SoC and
 the P281 board - WiP
Date: Sun, 24 Jun 2018 20:28:13 +0200
Message-ID: <20180624182814.31691-5-martin.blumenstingl@googlemail.com>
References: <20180624182814.31691-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180624182814.31691-1-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, carlo@caione.org, khilman@baylibre.com
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, jbrunet@baylibre.com, yixun.lan@amlogic.com, linux-arm-kernel@lists.infradead.org, narmstrong@baylibre.com
List-Id: devicetree@vger.kernel.org

S905W is a new SoC from the GXL series. It is a cost-reduced version of
the S905X.
The P281 development board from Amlogic uses the same layout as the P231
(S905D development board). Thus the new P281 board inherits
meson-gx-p23x-q20x.dtsi to avoid code-duplication.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../boot/dts/amlogic/meson-gxl-s905w-p281.dts | 22 +++++++++++++++++++
 .../boot/dts/amlogic/meson-gxl-s905w.dtsi     | 20 +++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905w.dtsi

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 34dd0e9b5cbb..6de2e7f5a9cc 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -17,6 +17,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p230.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p231.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-p281.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-nexbox-a1.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q200.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dts
new file mode 100644
index 000000000000..d4faed54c223
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2018 Martin Blumenstingl <martin.blumenstingl@googlemail.com>.
+ * Based on meson-gxl-s905d-p231.dts:
+ * - Copyright (c) 2016 Endless Computers, Inc.
+ *   Author: Carlo Caione <carlo@endlessm.com>
+ */
+
+/dts-v1/;
+
+#include "meson-gxl-s905w.dtsi"
+#include "meson-gx-p23x-q20x.dtsi"
+
+/ {
+	compatible = "amlogic,p281", "amlogic,s905w", "amlogic,meson-gxl";
+	model = "Amlogic Meson GXL (S905W) P281 Development Board";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w.dtsi
new file mode 100644
index 000000000000..a4ed586d328b
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2018 Martin Blumenstingl <martin.blumenstingl@googlemail.com>.
+ * Based on meson-gxl-s905x.dtsi:
+ * - Copyright (c) 2016 Endless Computers, Inc.
+ *   Author: Carlo Caione <carlo@endlessm.com>
+ */
+
+#include "meson-gxl.dtsi"
+#include "meson-gxl-mali.dtsi"
+
+/ {
+	compatible = "amlogic,s905w", "amlogic,meson-gxl";
+};
+
+/* S905W only has access to it's internal PHY */
+&ethmac {
+	phy-mode = "rmii";
+	phy-handle = <&internal_phy>;
+};
-- 
2.18.0
