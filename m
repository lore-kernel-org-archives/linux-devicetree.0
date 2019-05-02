From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 3/5] ARM: dts: rockchip: Switch to builtin HDMI DDC bus on rk3288-veyron
Date: Thu,  2 May 2019 15:53:34 -0700
Message-ID: <20190502225336.206885-3-dianders@chromium.org>
References: <20190502225336.206885-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502225336.206885-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-rockchip@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, mka@chromium.org, Sean Paul <seanpaul@chromium.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Downstream Chrome OS kernels use the builtin DDC bus from dw_hdmi on
veyron.  This is the only way to get them to negotiate HDCP.

Although HDCP isn't currently all supported upstream, it still seems
like it makes sense to use dw_hdmi's builtin I2C.  Maybe eventually we
can get HDCP negotiation working.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm/boot/dts/rk3288-veyron.dtsi | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
index 1252522392c7..e1bee663d2c5 100644
--- a/arch/arm/boot/dts/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
@@ -163,7 +163,8 @@
 };
 
 &hdmi {
-	ddc-i2c-bus = <&i2c5>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_ddc>;
 	status = "okay";
 };
 
@@ -334,14 +335,6 @@
 	i2c-scl-rising-time-ns = <300>;		/* 225ns measured */
 };
 
-&i2c5 {
-	status = "okay";
-
-	clock-frequency = <100000>;
-	i2c-scl-falling-time-ns = <300>;
-	i2c-scl-rising-time-ns = <1000>;
-};
-
 &io_domains {
 	status = "okay";
 
-- 
2.21.0.1020.gf2820cf01a-goog
