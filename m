From: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 2/4] arm64: dts: rk3399: add power domain for some peripheral
Date: Wed, 12 Apr 2017 15:10:42 +0800
Message-ID: <1491981044-24635-2-git-send-email-kever.yang@rock-chips.com>
References: <1491981044-24635-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491981044-24635-1-git-send-email-kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Elaine Zhang <zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add power domain for sd, usb, edp.

Signed-off-by: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 36 +++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 387ae34..9d44c19 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -947,6 +947,10 @@
 			};
 
 			/* These power domains are grouped by VD_LOGIC */
+			pd_edp@RK3399_PD_EDP {
+				reg = <RK3399_PD_EDP>;
+				clocks = <&cru PCLK_EDP_CTRL>;
+			};
 			pd_emmc@RK3399_PD_EMMC {
 				reg = <RK3399_PD_EMMC>;
 				clocks = <&cru ACLK_EMMC>;
@@ -958,11 +962,33 @@
 					 <&cru PCLK_GMAC>;
 				pm_qos = <&qos_gmac>;
 			};
-			pd_sd@RK3399_PD_SD {
-				reg = <RK3399_PD_SD>;
-				clocks = <&cru HCLK_SDMMC>,
-					 <&cru SCLK_SDMMC>;
-				pm_qos = <&qos_sd>;
+			pd_perihp@RK3399_PD_PERIHP {
+				reg = <RK3399_PD_PERIHP>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&cru ACLK_PERIHP>;
+				pm_qos = <&qos_perihp>,
+					 <&qos_pcie>,
+					 <&qos_usb_host0>,
+					 <&qos_usb_host1>;
+
+				pd_sd@RK3399_PD_SD {
+					reg = <RK3399_PD_SD>;
+					clocks = <&cru HCLK_SDMMC>,
+						 <&cru SCLK_SDMMC>;
+					pm_qos = <&qos_sd>;
+				};
+			};
+			pd_sdioaudio@RK3399_PD_SDIOAUDIO {
+				reg = <RK3399_PD_SDIOAUDIO>;
+				clocks = <&cru HCLK_SDIO>;
+				pm_qos = <&qos_sdioaudio>;
+			};
+			pd_usb3@RK3399_PD_USB3 {
+				reg = <RK3399_PD_USB3>;
+				clocks = <&cru ACLK_USB3>;
+				pm_qos = <&qos_usb_otg0>,
+					 <&qos_usb_otg1>;
 			};
 			pd_vio@RK3399_PD_VIO {
 				reg = <RK3399_PD_VIO>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
