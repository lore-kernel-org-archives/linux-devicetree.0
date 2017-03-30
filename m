From: Wang Xiaoyin <hw.wangxiaoyin@hisilicon.com>
Subject: [PATCH 1/2] arm64: dts: add drive-strength levels of pin for Hi3660 SoC
Date: Thu, 30 Mar 2017 14:48:02 +0800
Message-ID: <20170330064803.18648-1-hw.wangxiaoyin@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: hw.wangxiaoyin@hisilicon.com, chenya99@hisilicon.com
List-Id: devicetree@vger.kernel.org

Add drive-strength levels of pin for Hi3660 Soc.

Signed-off-by: Wang Xiaoyin <hw.wangxiaoyin@hisilicon.com>
---
 include/dt-bindings/pinctrl/hisi.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/dt-bindings/pinctrl/hisi.h b/include/dt-bindings/pinctrl/hisi.h
index 38f1ea879ea1..0359bfdc9119 100644
--- a/include/dt-bindings/pinctrl/hisi.h
+++ b/include/dt-bindings/pinctrl/hisi.h
@@ -56,4 +56,19 @@
 #define DRIVE4_08MA	(4 << 4)
 #define DRIVE4_10MA	(6 << 4)
 
+/* drive strength definition for hi3660 */
+#define DRIVE6_MASK	(15 << 4)
+#define DRIVE6_04MA	(0 << 4)
+#define DRIVE6_12MA	(4 << 4)
+#define DRIVE6_19MA	(8 << 4)
+#define DRIVE6_27MA	(10 << 4)
+#define DRIVE6_32MA	(15 << 4)
+#define DRIVE7_02MA	(0 << 4)
+#define DRIVE7_04MA	(1 << 4)
+#define DRIVE7_06MA	(2 << 4)
+#define DRIVE7_08MA	(3 << 4)
+#define DRIVE7_10MA	(4 << 4)
+#define DRIVE7_12MA	(5 << 4)
+#define DRIVE7_14MA	(6 << 4)
+#define DRIVE7_16MA	(7 << 4)
 #endif
-- 
2.11.0-rc2
