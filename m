From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 6/7] ARM: dts: rockchip: Specify rk3288-veyron-jerry's display timings
Date: Thu, 28 Mar 2019 10:17:09 -0700
Message-ID: <20190328171710.31949-7-dianders@chromium.org>
References: <20190328171710.31949-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328171710.31949-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@chromium.org>
Cc: linux-rockchip@lists.infradead.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, Boris Brezillon <boris.brezillon@collabora.com>, Ezequiel Garcia <ezequiel@collabora.com>, =?UTF-8?q?Enric=20Balletb=C3=B2?= <enric.balletbo@collabora.com>, Rob Herring <robh+dt@kernel.org>, mka@chromium.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Let's document the display timings that jerry has been using out in
the field.  This uses the standard blankings but a slightly slower
clock rate, thus getting a refresh rate 58.3 Hz.

NOTE: this won't really do anything except cause DRM to properly
report the refresh rate since vop_crtc_mode_fixup() was rounding the
pixel clock to 74.25 MHz anyway.  Apparently the adjusted rate isn't
exposed to userspace so it's important that the rate we're trying to
achieve is mostly right.

For the downstream kernel change related to this see See
https://crrev.com/c/324558.

NOTE: minnie will be fixed up in a future patch, so for now we'll just
delete the panel timings there.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- rk3288-veyron-jerry patch new for v4.

Changes in v3: None
Changes in v2: None

 arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi | 14 ++++++++++++++
 arch/arm/boot/dts/rk3288-veyron-minnie.dts      |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi b/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
index b54746df3661..0b1789b50c21 100644
--- a/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
@@ -76,6 +76,20 @@
 		power-supply = <&vcc33_lcd>;
 		backlight = <&backlight>;
 
+		panel-timing {
+			clock-frequency = <74250000>;
+			hactive = <1366>;
+			hfront-porch = <136>;
+			hback-porch = <60>;
+			hsync-len = <30>;
+			hsync-active = <0>;
+			vactive = <768>;
+			vfront-porch = <8>;
+			vback-porch = <12>;
+			vsync-len = <12>;
+			vsync-active = <0>;
+		};
+
 		ports {
 			panel_in: port {
 				panel_in_edp: endpoint {
diff --git a/arch/arm/boot/dts/rk3288-veyron-minnie.dts b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
index f95d0c5fcf71..ca7512ade222 100644
--- a/arch/arm/boot/dts/rk3288-veyron-minnie.dts
+++ b/arch/arm/boot/dts/rk3288-veyron-minnie.dts
@@ -142,6 +142,8 @@
 &panel {
 	compatible = "auo,b101ean01", "simple-panel";
 	power-supply= <&panel_regulator>;
+
+	/delete-node/ panel-timing;
 };
 
 &rk808 {
-- 
2.21.0.392.gf8f6787159e-goog
