From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 4/5] ARM: dts: rockchip: Add unwedge pinctrl entries for dw_hdmi on rk3288
Date: Thu,  2 May 2019 15:53:35 -0700
Message-ID: <20190502225336.206885-4-dianders@chromium.org>
References: <20190502225336.206885-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502225336.206885-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-rockchip@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, mka@chromium.org, Sean Paul <seanpaul@chromium.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This adds the "unwedge" pinctrl entries introduced by a recent dw_hdmi
change that can unwedge the dw_hdmi i2c bus in some cases.  It's
expected that any boards using this would add:

  pinctrl-names = "default", "unwedge";
  pinctrl-0 = <&hdmi_ddc>;
  pinctrl-1 = <&hdmi_ddc_unwedge>;

Note that this isn't added by default because some boards may choose
to mux i2c5 for their DDC bus (if that is more tested for them).

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm/boot/dts/rk3288.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 74c9517c4f92..eebc04fa1e4d 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -1545,6 +1545,15 @@
 				rockchip,pins = <7 RK_PC3 2 &pcfg_pull_none>,
 						<7 RK_PC4 2 &pcfg_pull_none>;
 			};
+
+			hdmi_ddc_unwedge: hdmi-ddc-unwedge {
+				rockchip,pins = <7 RK_PC3 RK_FUNC_GPIO &pcfg_output_low>,
+						<7 RK_PC4 2 &pcfg_pull_none>;
+			};
+		};
+
+		pcfg_output_low: pcfg-output-low {
+			output-low;
 		};
 
 		pcfg_pull_up: pcfg-pull-up {
-- 
2.21.0.1020.gf2820cf01a-goog
