From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 4/4] ARM: dts: rockchip: Remove #address/#size-cells from rk3288-veyron gpio-keys
Date: Wed, 20 Mar 2019 13:14:02 -0700
Message-ID: <20190320201402.114309-4-dianders@chromium.org>
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
  /gpio-keys:
  unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Let's remove them.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm/boot/dts/rk3288-veyron.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
index 0bc2409f6903..192dbc089ade 100644
--- a/arch/arm/boot/dts/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
@@ -25,8 +25,6 @@
 
 	gpio_keys: gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&pwr_key_l>;
-- 
2.21.0.225.g810b269d1ac-goog
