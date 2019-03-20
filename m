From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 3/4] ARM: dts: rockchip: Remove #address/#size-cells from rk3288 mipi_dsi
Date: Wed, 20 Mar 2019 13:14:01 -0700
Message-ID: <20190320201402.114309-3-dianders@chromium.org>
References: <20190320201402.114309-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190320201402.114309-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: mka@chromium.org, ryandcase@chromium.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

They are pointless.  As dtc points out:
  Warning (avoid_unnecessary_addr_size):
  /mipi@ff960000:
  unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Let's remove them.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm/boot/dts/rk3288.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 79cd3c53e737..99a7620bddac 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -1119,8 +1119,6 @@
 		clock-names = "ref", "pclk";
 		power-domains = <&power RK3288_PD_VIO>;
 		rockchip,grf = <&grf>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 		status = "disabled";
 
 		ports {
-- 
2.21.0.225.g810b269d1ac-goog
