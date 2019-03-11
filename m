From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: rk3399: rock960: Add missing GPIO for vcc5v0_host
Date: Mon, 11 Mar 2019 20:33:32 +0530
Message-ID: <20190311150332.19492-3-jagan@amarulasolutions.com>
References: <20190311150332.19492-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311150332.19492-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>, Akash Gajjar <akash@openedev.com>
List-Id: devicetree@vger.kernel.org

vcc5v0_host on rock960 is bound to have GPIO4_PD1.

Add support for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Akash Gajjar <akash@openedev.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
index 68ca3bf9ea2f..c3d3343d6dde 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi
@@ -68,6 +68,7 @@
 	vcc5v0_host: vcc5v0-host-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
+		gpio = <&gpio4 RK_PD1 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&host_vbus_drv>;
 		regulator-name = "vcc5v0_host";
-- 
2.18.0.321.gffc6fa0e3
