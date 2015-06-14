From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v15 4/4] ARM: dts: add RK3288 power-domain node
Date: Sun, 14 Jun 2015 13:13:39 +0800
Message-ID: <1434258820-26779-5-git-send-email-wxt@rock-chips.com>
References: <1434258820-26779-1-git-send-email-wxt@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434258820-26779-1-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "jinkun.hong" <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch add the needed clocks into power-controller.

There are several reasons as follows:

Firstly, the clocks need be turned off to save power when
the system enter the suspend state. So we need to enumerate the clocks
in the dts. In order to power domain can turn on and off.

Secondly, the reset-circuit should reset be synchronous on rk3288,
then sync revoked. So we need to enable clocks of all devices.

Signed-off-by: jinkun.hong <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

Changes in v15:
- As Tomasz remarked previously the dts should represent the hardware
  and the power-domains are part of the pmu.
Series-changes: 12
- Remove essential clocks from rk3288 PD_VIO domain, Some clocks are
  essential for the system health and should not be turned down.
  However there is no owner for them so if they listed as belonging to power
  domain we'll try toggling them up and down during power domain transition.
  As a result we either fail to suspend or resume the system.
Series-changes: 10
- fix missing the #include <dt-bindings/power-domain/rk3288.h>.
- remove the notes.
Series-changes: 9
- add decription for power-doamin node.
Series-changes: 8
- DTS go back to v2.
Series-changes: 3
- Decomposition power-controller, changed to multiple controller
  (gpu-power-controller, hevc-power-controller).
Series-changes: 2
- make pd_vio clocks all one entry per line and alphabetize.
- power: power-controller move back to pinctrl: pinctrl.

Changes in v9: None

 arch/arm/boot/dts/rk3288.dtsi | 62 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 165968d..8224070 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -550,6 +550,68 @@
 	pmu: power-management@ff730000 {
 		compatible = "rockchip,rk3288-pmu", "syscon";
 		reg = <0xff730000 0x100>;
+
+		pmu: power-management@ff730000 {
+		compatible = "rockchip,rk3288-pmu", "syscon", "simple-mfd";
+		reg = <0xff730000 0x100>;
+
+		power: power-controller {
+			compatible = "rockchip,rk3288-power-controller";
+			#power-domain-cells = <1>;
+			rockchip,pmu = <&pmu>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			pd_gpu {
+				reg = <RK3288_PD_GPU>;
+				clocks = <&cru ACLK_GPU>;
+			};
+
+			pd_hevc {
+				reg = <RK3288_PD_HEVC>;
+				clocks = <&cru ACLK_HEVC>,
+					 <&cru SCLK_HEVC_CABAC>,
+					 <&cru SCLK_HEVC_CORE>,
+					 <&cru HCLK_HEVC>;
+			};
+
+			pd_vio {
+				reg = <RK3288_PD_VIO>;
+				clocks = <&cru ACLK_IEP>,
+					 <&cru ACLK_ISP>,
+					 <&cru ACLK_RGA>,
+					 <&cru ACLK_VIP>,
+					 <&cru ACLK_VOP0>,
+					 <&cru ACLK_VOP1>,
+					 <&cru DCLK_VOP0>,
+					 <&cru DCLK_VOP1>,
+					 <&cru HCLK_IEP>,
+					 <&cru HCLK_ISP>,
+					 <&cru HCLK_RGA>,
+					 <&cru HCLK_VIP>,
+					 <&cru HCLK_VOP0>,
+					 <&cru HCLK_VOP1>,
+					 <&cru PCLK_EDP_CTRL>,
+					 <&cru PCLK_HDMI_CTRL>,
+					 <&cru PCLK_LVDS_PHY>,
+					 <&cru PCLK_MIPI_CSI>,
+					 <&cru PCLK_MIPI_DSI0>,
+					 <&cru PCLK_MIPI_DSI1>,
+					 <&cru SCLK_EDP_24M>,
+					 <&cru SCLK_EDP>,
+					 <&cru SCLK_HDMI_CEC>,
+					 <&cru SCLK_HDMI_HDCP>,
+					 <&cru SCLK_ISP_JPE>,
+					 <&cru SCLK_ISP>,
+					 <&cru SCLK_RGA>;
+			};
+
+			pd_video {
+				reg = <RK3288_PD_VIDEO>;
+				clocks = <&cru ACLK_VCODEC>,
+					 <&cru HCLK_VCODEC>;
+			};
+		};
 	};
 
 	sgrf: syscon@ff740000 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
