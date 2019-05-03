From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] ARM: dts: rockchip: Remove bogus 'i2s_clk_out' from rk3288-veyron-mickey
Date: Fri,  3 May 2019 16:48:14 -0700
Message-ID: <20190503234814.230901-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, briannorris@chromium.org, mka@chromium.org, amstan@chromium.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The rk3288-veyron-mickey device tree overrides the default "i2s" clock
settings to add the clock for "i2s_clk_out".

That clock is only present in the bindings downstream Chrome OS 3.14
tree.  Upstream the i2s port bindings doesn't specify that as a
possible clock.

Let's remove it.

NOTE: for other rk3288-veyron devices this clock is consumed by
'maxim,max98090'.  Presumably if this clock is needed for mickey it'll
need to be consumed by something similar.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm/boot/dts/rk3288-veyron-mickey.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron-mickey.dts b/arch/arm/boot/dts/rk3288-veyron-mickey.dts
index e852594417b5..f9c4ece3c0d3 100644
--- a/arch/arm/boot/dts/rk3288-veyron-mickey.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-mickey.dts
@@ -142,8 +142,6 @@
 
 &i2s {
 	status = "okay";
-	clock-names = "i2s_hclk", "i2s_clk", "i2s_clk_out";
-	clocks = <&cru HCLK_I2S0>, <&cru SCLK_I2S0>, <&cru SCLK_I2S0_OUT>;
 };
 
 &rk808 {
-- 
2.21.0.1020.gf2820cf01a-goog
