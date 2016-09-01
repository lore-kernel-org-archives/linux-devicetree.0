From: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] arm64: dts: rockchip: Add pinctrl entry for 32k clock on rk3399
Date: Thu,  1 Sep 2016 16:53:22 -0700
Message-ID: <1472774002-25986-1-git-send-email-dianders@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, tonie.xie-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On some rk3399 boards GPIO0_A0 is hooked up to a 32 kHz clock.  This can
be used as the source for various clocks in the system.

Add a pinmux so boards can get this pin properly configured.

Signed-off-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 62d450935a57..13e2a440fe43 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1171,6 +1171,12 @@
 			drive-strength = <13>;
 		};
 
+		clock {
+			clk_32k: clk-32k {
+				rockchip,pins = <0 0 RK_FUNC_2 &pcfg_pull_none>;
+			};
+		};
+
 		i2c0 {
 			i2c0_xfer: i2c0-xfer {
 				rockchip,pins =
-- 
2.8.0.rc3.226.g39d4020

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
