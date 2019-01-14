From: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 1/4] arm64: dts: rockchip: Add DT for NanoPi M4
Date: Mon, 14 Jan 2019 12:05:31 +0000
Message-ID: <a96995cfa599792b24e740ce46d53bd68ef1d462.1547466003.git.robin.murphy@arm.com>
References: <cover.1547466003.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1547466003.git.robin.murphy@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: heiko@sntech.de
Cc: Mark Rutland <mark.rutland@arm.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

There are a number of subtle differences between the nanopi4 variants,
and where they disagree, the common DTSI currently follows the details
of NanoPi M4. In order to improve matters even more, let's add a
separate DTS for the M4 to which we can start splitting things out
appropriately. The third variant, NanoPi NEO4, is a lot closer to the M4
than either is to the larger T4, so arguably could get away with just
sharing the M4 DT for now (plus I have neither of the smaller boards to
actually test with).

CC: Rob Herring <robh+dt@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

v2: Fix the copy-paste binding thinko

 .../devicetree/bindings/arm/rockchip.yaml      |  6 ++++--
 arch/arm64/boot/dts/rockchip/Makefile          |  1 +
 .../boot/dts/rockchip/rk3399-nanopi-m4.dts     | 18 ++++++++++++++++++
 3 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dts

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index bcc60c492a12..fb46fecab542 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -87,9 +87,11 @@ properties:
           - const: firefly,roc-rk3399-pc
           - const: rockchip,rk3399
 
-      - description: FriendlyElec NanoPC-T4
+      - description: FriendlyElec NanoPi4 series boards
         items:
-          - const: friendlyarm,nanopc-t4
+          - enum:
+              - friendlyarm,nanopc-t4
+              - friendlyarm,nanopi-m4
           - const: rockchip,rk3399
 
       - description: GeekBuying GeekBox
diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 1c7406111dfd..91a669378605 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -17,6 +17,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-gru-kevin.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-gru-scarlet-inx.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-gru-scarlet-kd.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-nanopc-t4.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-nanopi-m4.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-puma-haikou.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-roc-pc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rock960.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dts b/arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dts
new file mode 100644
index 000000000000..8d3f0ba29c72
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * FriendlyElec NanoPi M4 board device tree source
+ *
+ * Copyright (c) 2018 FriendlyElec Computer Tech. Co., Ltd.
+ * (http://www.friendlyarm.com)
+ *
+ * Copyright (c) 2018 Collabora Ltd.
+ * Copyright (c) 2019 Arm Ltd.
+ */
+
+/dts-v1/;
+#include "rk3399-nanopi4.dtsi"
+
+/ {
+	model = "FriendlyElec NanoPi M4";
+	compatible = "friendlyarm,nanopi-m4", "rockchip,rk3399";
+};
-- 
2.20.1.dirty
