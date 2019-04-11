From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 5/5] ARM: dts: rockchip: vdd_gpu off in suspend for rk3288-veyron
Date: Thu, 11 Apr 2019 16:21:57 -0700
Message-ID: <20190411232157.55125-5-dianders@chromium.org>
References: <20190411232157.55125-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411232157.55125-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Elaine Zhang <zhangqing@rock-chips.com>
Cc: dbasehore@chromium.org, amstan@chromium.org, linux-rockchip@lists.infradead.org, briannorris@chromium.org, mka@chromium.org, ryandcase@chromium.org, Chris Zhong <zyw@rock-chips.com>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

At some point long long ago the downstream GPU driver would crash if
we turned the GPU off during suspend.  For some context you can see:

https://chromium-review.googlesource.com/#/c/215780/5..6/arch/arm/boot/dts/rk3288-pinky-rev2.dts

At some point in time not too long after that got fixed.

It's unclear why the GPU is left enabled during suspend on the
mainline kernel.  Everything seems fine if I turn this off, so let's
do it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm/boot/dts/rk3288-veyron.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron.dtsi b/arch/arm/boot/dts/rk3288-veyron.dtsi
index 279d7f4ecce0..1252522392c7 100644
--- a/arch/arm/boot/dts/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron.dtsi
@@ -217,8 +217,7 @@
 				regulator-max-microvolt = <1250000>;
 				regulator-ramp-delay = <6001>;
 				regulator-state-mem {
-					regulator-on-in-suspend;
-					regulator-suspend-microvolt = <1000000>;
+					regulator-off-in-suspend;
 				};
 			};
 
-- 
2.21.0.392.gf8f6787159e-goog
