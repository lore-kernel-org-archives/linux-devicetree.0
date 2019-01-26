From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 2/3] arm64: dts: rockchip: fix rk3399-gru-kevin graph_port warning
Date: Sat, 26 Jan 2019 11:37:29 +0100
Message-ID: <20190126103730.3883-2-enric.balletbo@collabora.com>
References: <20190126103730.3883-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190126103730.3883-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Vicente Bergas <vicencb@gmail.com>, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, Brian Norris <briannorris@chromium.org>, Klaus Goger <klaus.goger@theobroma-systems.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>
List-Id: devicetree@vger.kernel.org

Ports are described by child 'port' nodes contained in the device node.
'ports' is optional and is used to group all 'port' nodes which is not
the case here.

This patch fixes the following warning:

arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts:46.9-50.5: Warningi (graph_port): /edp-panel/ports: graph port node name should be 'port'

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
index 81e73103fa78..15e254a77391 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
@@ -43,7 +43,7 @@
 		backlight = <&backlight>;
 		power-supply = <&pp3300_disp>;
 
-		ports {
+		port {
 			panel_in_edp: endpoint {
 				remote-endpoint = <&edp_out_panel>;
 			};
-- 
2.20.1
