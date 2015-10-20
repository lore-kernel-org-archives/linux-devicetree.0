From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 4/4] ARM: dts: rockchip: Add the OTP gpio pinctrl
Date: Tue, 20 Oct 2015 17:11:04 +0800
Message-ID: <1445332264-6054-5-git-send-email-wxt@rock-chips.com>
References: <1445332264-6054-1-git-send-email-wxt@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445332264-6054-1-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

We need the OTP pin is gpio state before resetting the TSADC controller,
since the tshut polarity will generate a high signal.

Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 arch/arm/boot/dts/rk3288.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 906e938..b59c451 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -447,8 +447,9 @@
 		clock-names = "tsadc", "apb_pclk";
 		resets = <&cru SRST_TSADC>;
 		reset-names = "tsadc-apb";
-		pinctrl-names = "default";
-		pinctrl-0 = <&otp_out>;
+		pinctrl-names = "default", "otp_out";
+		pinctrl-0 = <&otp_gpio>;
+		pinctrl-1 = <&otp_out>;
 		#thermal-sensor-cells = <1>;
 		rockchip,hw-tshut-temp = <95000>;
 		status = "disabled";
@@ -1273,6 +1274,10 @@
 		};
 
 		tsadc {
+			otp_gpio: otp-gpio {
+				rockchip,pins = <0 10 RK_FUNC_GPIO &pcfg_pull_none>;
+			};
+
 			otp_out: otp-out {
 				rockchip,pins = <0 10 RK_FUNC_1 &pcfg_pull_none>;
 			};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
