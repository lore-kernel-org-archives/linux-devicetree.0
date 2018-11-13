From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 1/6] ARM: dts: rockchip: add #sound-dai-cells to Cortex-A9 i2s
Date: Tue, 13 Nov 2018 14:05:54 +0100
Message-ID: <20181113130559.31221-2-heiko@sntech.de>
References: <20181113130559.31221-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20181113130559.31221-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>

The Rockchip i2s always just requires a sound-dail-cells value of 0,
so add them to the core soc dtsi for convenience.

Signed-off-by: Heiko Stuebner <heiko.stuebner-K3U4GQvHnyU@public.gmane.org>
---
 arch/arm/boot/dts/rk3066a.dtsi | 3 +++
 arch/arm/boot/dts/rk3188.dtsi  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index 57f75a7a529b..971cd10592e2 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -153,6 +153,7 @@
 		clocks = <&cru HCLK_I2S0>, <&cru SCLK_I2S0>;
 		rockchip,playback-channels = <8>;
 		rockchip,capture-channels = <2>;
+		#sound-dai-cells = <0>;
 		status = "disabled";
 	};
 
@@ -170,6 +171,7 @@
 		clocks = <&cru HCLK_I2S1>, <&cru SCLK_I2S1>;
 		rockchip,playback-channels = <2>;
 		rockchip,capture-channels = <2>;
+		#sound-dai-cells = <0>;
 		status = "disabled";
 	};
 
@@ -187,6 +189,7 @@
 		clocks = <&cru HCLK_I2S2>, <&cru SCLK_I2S2>;
 		rockchip,playback-channels = <2>;
 		rockchip,capture-channels = <2>;
+		#sound-dai-cells = <0>;
 		status = "disabled";
 	};
 
diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
index 7e0dc52630d9..fd896b0a46e3 100644
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@ -139,6 +139,7 @@
 		clocks = <&cru HCLK_I2S0>, <&cru SCLK_I2S0>;
 		rockchip,playback-channels = <2>;
 		rockchip,capture-channels = <2>;
+		#sound-dai-cells = <0>;
 		status = "disabled";
 	};
 
-- 
2.18.0
