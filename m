From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 4/5] ARM: dts: rockchip: vcc33_ccd off in suspend for rk3288-veyron-chromebook
Date: Thu, 11 Apr 2019 16:21:56 -0700
Message-ID: <20190411232157.55125-4-dianders@chromium.org>
References: <20190411232157.55125-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411232157.55125-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Elaine Zhang <zhangqing@rock-chips.com>
Cc: dbasehore@chromium.org, amstan@chromium.org, linux-rockchip@lists.infradead.org, briannorris@chromium.org, mka@chromium.org, ryandcase@chromium.org, Chris Zhong <zyw@rock-chips.com>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

As per my comments when the device tree for rk3288-veyron-chromebook
first landed:

> Technically I think vcc33_ccd can be off since we have
> 'needs-reset-on-resume' down in the EHCI port (this regulator is for
> the USB webcam that's connected to the EHCI port).
>
>  ...but leaving it on for now seems fine until we get suspend/resume
> more solid.

It's probably about time to do it right.

[1] https://lore.kernel.org/linux-arm-kernel/CAD=FV=U37Yx8Mqk75_x05zxonvdc3qRMhqp8TyTDPWGHqSuRqg@mail.gmail.com/

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi b/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
index b9cc90f0f25c..fbef34578100 100644
--- a/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi
@@ -176,8 +176,7 @@
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
 			regulator-state-mem {
-				regulator-on-in-suspend;
-				regulator-suspend-microvolt = <3300000>;
+				regulator-off-in-suspend;
 			};
 		};
 	};
-- 
2.21.0.392.gf8f6787159e-goog
