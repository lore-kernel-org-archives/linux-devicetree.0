From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 5/5] ARM: dts: rockchip: Add HDMI i2c unwedging for rk3288-veyron
Date: Thu,  2 May 2019 15:53:36 -0700
Message-ID: <20190502225336.206885-5-dianders@chromium.org>
References: <20190502225336.206885-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502225336.206885-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-rockchip@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, mka@chromium.org, Sean Paul <seanpaul@chromium.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Veyron uses the builtin i2c controller that's part of dw-hdmi.  Hook
up the unwedging feature.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm/boot/dts/rk3288-veyron.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
index e1bee663d2c5..340b276b6333 100644
--- a/arch/arm/boot/dts/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
@@ -163,8 +163,9 @@
 };
 
 &hdmi {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "unwedge";
 	pinctrl-0 = <&hdmi_ddc>;
+	pinctrl-1 = <&hdmi_ddc_unwedge>;
 	status = "okay";
 };
 
-- 
2.21.0.1020.gf2820cf01a-goog
