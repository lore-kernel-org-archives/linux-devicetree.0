From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 3/5] ARM: dts: rockchip: Add DDR retention/poweroff to rk3288-veyron hogs
Date: Thu, 11 Apr 2019 16:21:55 -0700
Message-ID: <20190411232157.55125-3-dianders@chromium.org>
References: <20190411232157.55125-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411232157.55125-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Elaine Zhang <zhangqing@rock-chips.com>
Cc: dbasehore@chromium.org, amstan@chromium.org, linux-rockchip@lists.infradead.org, briannorris@chromium.org, mka@chromium.org, ryandcase@chromium.org, Chris Zhong <zyw@rock-chips.com>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Even though upstream Linux doesn't yet go into deep enough suspend to
get DDR into self refresh, there is no harm in setting these pins up.
They'll only actually do something if we go into a deeper suspend but
leaving them configed always is fine.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi | 4 ++++
 arch/arm/boot/dts/rk3288-veyron.dtsi            | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi b/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
index 72c4754032e9..b9cc90f0f25c 100644
--- a/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
@@ -229,6 +229,8 @@
 &pinctrl {
 	pinctrl-0 = <
 		/* Common for sleep and wake, but no owners */
+		&ddr0_retention
+		&ddrio_pwroff
 		&global_pwroff
 
 		/* Wake only */
@@ -236,6 +238,8 @@
 	>;
 	pinctrl-1 = <
 		/* Common for sleep and wake, but no owners */
+		&ddr0_retention
+		&ddrio_pwroff
 		&global_pwroff
 
 		/* Sleep only */
diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
index 5c67acc3e6d8..279d7f4ecce0 100644
--- a/arch/arm/boot/dts/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
@@ -451,10 +451,14 @@
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <
 		/* Common for sleep and wake, but no owners */
+		&ddr0_retention
+		&ddrio_pwroff
 		&global_pwroff
 	>;
 	pinctrl-1 = <
 		/* Common for sleep and wake, but no owners */
+		&ddr0_retention
+		&ddrio_pwroff
 		&global_pwroff
 	>;
 
-- 
2.21.0.392.gf8f6787159e-goog
