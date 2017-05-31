From: <sean.wang@mediatek.com>
Subject: [PATCH v3 3/3] arm64: dts: mt7622: add dts file for MT7622 reference
 board variant 1
Date: Thu, 1 Jun 2017 01:29:01 +0800
Message-ID: <ca25972aafe7788c98de8fa161922b691c20f109.1496250798.git.sean.wang@mediatek.com>
References: <cover.1496250798.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1496250798.git.sean.wang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, matthias.bgg@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Add the support for the MT7622 reference board variant 1 from
MediaTek.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/Makefile        |  1 +
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 9fbfd32..e71456a2 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -1,5 +1,6 @@
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6755-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
 
 always		:= $(dtb-y)
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
new file mode 100644
index 0000000..c08309d
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -0,0 +1,27 @@
+/*
+ * Copyright (c) 2017 MediaTek Inc.
+ * Author: Ming Huang <ming.huang@mediatek.com>
+ *	   Sean Wang <sean.wang@mediatek.com>
+ *
+ * SPDX-License-Identifier: (GPL-2.0 OR MIT)
+ */
+
+/dts-v1/;
+#include "mt7622.dtsi"
+
+/ {
+	model = "MediaTek MT7622 RFB1 board";
+	compatible = "mediatek,mt7622-rfb1", "mediatek,mt7622";
+
+	chosen {
+		bootargs = "console=ttyS0,115200n1";
+	};
+
+	memory {
+		reg = <0 0x40000000 0 0x3F000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
1.9.1
