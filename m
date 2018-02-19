From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 2/2] arm64: dts: rockchip: add a standalone version of the
 rk3399 sapphire
Date: Mon, 19 Feb 2018 09:16:17 +0100
Message-ID: <7102557.xWtZfjvKIZ@phil>
References: <CAAMcf8CY1m+998+GpD2wOfAZb=oZNkL2GqYu_o5piGEh76uoYw@mail.gmail.com>
 <3840224.sEPfbROKII@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <3840224.sEPfbROKII@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Vicente Bergas <vicencb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

While the sapphire board is a system-on-module and mostly used with the
excavator baseboard, it is also possible to use it standalone without
any base. So add a board-variant for this type.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/rockchip.txt |  4 ++++
 arch/arm64/boot/dts/rockchip/Makefile              |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dts   | 12 ++++++++++++
 3 files changed, 17 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dts

diff --git a/Documentation/devicetree/bindings/arm/rockchip.txt b/Documentation/devicetree/bindings/arm/rockchip.txt
index 9a3e98356b1e..1c1d62d03c4f 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.txt
+++ b/Documentation/devicetree/bindings/arm/rockchip.txt
@@ -185,6 +185,10 @@ Rockchip platforms device tree bindings
     Required root node properties:
       - compatible = "rockchip,rk3399-evb", "rockchip,rk3399";
 
+- Rockchip RK3399 Sapphire board standalone:
+    Required root node properties:
+      - compatible = "rockchip,rk3399-sapphire", "rockchip,rk3399";
+
 - Rockchip RK3399 Sapphire Excavator board:
     Required root node properties:
       - compatible = "rockchip,rk3399-sapphire-excavator", "rockchip,rk3399";
diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 1e57f87f30c4..48a83f882947 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -12,4 +12,5 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-evb.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-firefly.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-gru-kevin.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-puma-haikou.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire-excavator.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dts b/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dts
new file mode 100644
index 000000000000..5a58060447cf
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3399-sapphire.dts
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2018 Fuzhou Rockchip Electronics Co., Ltd.
+ */
+
+/dts-v1/;
+#include "rk3399-sapphire.dtsi"
+
+/ {
+	model = "Sapphire-RK3399 Board";
+	compatible = "rockchip,rk3399-sapphire", "rockchip,rk3399";
+};
-- 
2.15.1
