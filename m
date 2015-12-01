From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 3/3] arm64: dts: rockchip: add the pwm node info for RK3368 SoCs
Date: Tue,  1 Dec 2015 17:13:26 +0800
Message-ID: <1448961206-23769-4-git-send-email-wxt@rock-chips.com>
References: <1448961206-23769-1-git-send-email-wxt@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448961206-23769-1-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The pulse-width modulator (PWM) feature is very common in
embedded systems. There exust 4 built-in PWM channels.

In general, the pwm pins can via the pinctrl to
configure iomux mode but the pwm2 since the pwm2 iomux mode from
the SoC control register.

Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 60 ++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 1f10b85..3b4cc84 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -472,6 +472,48 @@
 		status = "disabled";
 	};
 
+	pwm0: pwm@ff680000 {
+		compatible = "rockchip,rk3368-pwm", "rockchip,rk3288-pwm";
+		reg = <0x0 0xff680000 0x0 0x10>;
+		#pwm-cells = <3>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm0_pin>;
+		clocks = <&cru PCLK_PWM1>;
+		clock-names = "pwm";
+		status = "disabled";
+	};
+
+	pwm1: pwm@ff680010 {
+		compatible = "rockchip,rk3368-pwm", "rockchip,rk3288-pwm";
+		reg = <0x0 0xff680010 0x0 0x10>;
+		#pwm-cells = <3>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm1_pin>;
+		clocks = <&cru PCLK_PWM1>;
+		clock-names = "pwm";
+		status = "disabled";
+	};
+
+	pwm2: pwm@ff680020 {
+		compatible = "rockchip,rk3368-pwm", "rockchip,rk3288-pwm";
+		reg = <0x0 0xff680020 0x0 0x10>;
+		#pwm-cells = <3>;
+		clocks = <&cru PCLK_PWM1>;
+		clock-names = "pwm";
+		status = "disabled";
+	};
+
+	pwm3: pwm@ff680030 {
+		compatible = "rockchip,rk3368-pwm", "rockchip,rk3288-pwm";
+		reg = <0x0 0xff680030 0x0 0x10>;
+		#pwm-cells = <3>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm3_pin>;
+		clocks = <&cru PCLK_PWM1>;
+		clock-names = "pwm";
+		status = "disabled";
+	};
+
 	uart2: serial@ff690000 {
 		compatible = "rockchip,rk3368-uart", "snps,dw-apb-uart";
 		reg = <0x0 0xff690000 0x0 0x100>;
@@ -713,6 +755,24 @@
 			};
 		};
 
+		pwm0 {
+			pwm0_pin: pwm0-pin {
+				rockchip,pins = <3 8 RK_FUNC_2 &pcfg_pull_none>;
+			};
+		};
+
+		pwm1 {
+			pwm1_pin: pwm1-pin {
+				rockchip,pins = <0 8 RK_FUNC_2 &pcfg_pull_none>;
+			};
+		};
+
+		pwm3 {
+			pwm3_pin: pwm3-pin {
+				rockchip,pins = <3 29 RK_FUNC_3 &pcfg_pull_none>;
+			};
+		};
+
 		sdio0 {
 			sdio0_bus1: sdio0-bus1 {
 				rockchip,pins = <2 28 RK_FUNC_1 &pcfg_pull_up>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
