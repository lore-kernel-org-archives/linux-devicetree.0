From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH] arm64: dts: rockchip: fix the incorrect otp-out pin on rk3368
Date: Mon, 15 Feb 2016 11:30:58 +0800
Message-ID: <1455507058-10824-1-git-send-email-wxt@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch fixes the incorrect Over-temperature protection pin.
since the rk3368 io list said the otp pin is gpio0a3.

Anyway, that should be fixed in here.

Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 49d1191..3949163 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -926,11 +926,11 @@
 
 		tsadc {
 			otp_gpio: otp-gpio {
-				rockchip,pins = <0 10 RK_FUNC_GPIO &pcfg_pull_none>;
+				rockchip,pins = <0 3 RK_FUNC_GPIO &pcfg_pull_none>;
 			};
 
 			otp_out: otp-out {
-				rockchip,pins = <0 10 RK_FUNC_1 &pcfg_pull_none>;
+				rockchip,pins = <0 3 RK_FUNC_1 &pcfg_pull_none>;
 			};
 		};
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
