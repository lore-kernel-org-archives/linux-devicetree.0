From: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Subject: [PATCH v2 4/4] arm64: dts: rockchip: Decrease emmc-phy's drive impedance on rk3399-puma
Date: Thu,  7 Mar 2019 09:41:56 +0100
Message-ID: <20190307084159.25236-4-christoph.muellner@theobroma-systems.com>
References: <20190307084159.25236-1-christoph.muellner@theobroma-systems.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190307084159.25236-1-christoph.muellner@theobroma-systems.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, heiko@sntech.de, shawn.lin@rock-chips.com
Cc: Christoph Muellner <christoph.muellner@theobroma-systems.com>, Philipp Tomsich <philipp.tomsich@theobroma-systems.com>, Kishon Vijay Abraham I <kishon@ti.com>, Douglas Anderson <dianders@chromium.org>, Brian Norris <briannorris@chromium.org>, Klaus Goger <klaus.goger@theobroma-systems.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger <mbrugger@suse.com>, Jeffy Chen <jeffy.chen@rock-chips.com>, Randy Li <ayaka@soulik.info>, Tony Xie <tony.xie@rock-chips.com>, Vicente Bergas <vicencb@gmail.com>, Ezequiel Garcia <ezequiel@collabora.com>, Lin Huang <hl@rock-chips.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.o
List-Id: devicetree@vger.kernel.org

The RK3399-Q7 (Puma) requires 33 Ohm drive strength to ensure signal
integrity at HS-400 (200MHz clock, DDR signalling).

A repeated EMC testing run validates that this increase does not
negatively impact EMC compliance (emissions have ample distance to
the regulatory limits).

Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
Signed-off-by: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>
Tested-by: Jakob Unterwurzacher <jakob.unterwurzacher@theobroma-systems.com>
Tested-by: Klaus Goger <klaus.goger@theobroma-systems.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
index 0130b9f98c9d..4f75bb6b2f14 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
@@ -146,6 +146,7 @@
 
 &emmc_phy {
 	status = "okay";
+	drive-impedance-ohm = <33>;
 };
 
 &gmac {
-- 
2.11.0
