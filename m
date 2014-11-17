From: Caesar Wang <caesar.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v12 3/3] ARM: dts: add rk3288 power-domain node
Date: Mon, 17 Nov 2014 17:50:41 +0800
Message-ID: <1416217842-4716-4-git-send-email-caesar.wang@rock-chips.com>
References: <1416217842-4716-1-git-send-email-caesar.wang@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416217842-4716-1-git-send-email-caesar.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, fzf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, caesar.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, chris.zhong-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxm-TNX95d0MmH7DzftRWevZcw@public.gmane.org, chm-TNX95d0MmH7DzftRWevZcw@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Jack Dai <jack.dai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "jinkun.hong" <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch add the needed clocks into power-controller.

why need we do so that?

Firstly, we always be needed turn off clocks to save power when
the system enter suspend.So we need to enumerate the clocks are needed
to switch power doamin no and off.

Secondly, Rk3288 reset circuit should be syncchronous reset and
then sync revoked.so we need to enable clocks of all devices.

Signed-off-by: Jack Dai <jack.dai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: jinkun.hong <jinkun.hong-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Signed-off-by: Caesar Wang <caesar.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

Changes in v12:
    - Remove essential clocks from rk3288 PD_VIO domain,
      Some clocks are essential for the system health and should not be
      turned down. However there is no owner for them so if they listed as
      belonging to power domain we'll try toggling them up and down during
      power domain transition. As a result we either fail to suspend or resume
      the system.

Changes in v11: None
Changes in v10:
    - fix missing the #include <dt-bindings/power-domain/rk3288.h>
    - remove the notes

Changes in v9:
    - add decription for power-doamin node

Changes in v8:
    - DTS go back to v2

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3:
    - Decomposition power-controller, changed to multiple controller
    (gpu-power-controller, hevc-power-controller)

Changes in v2:
    - make pd_vio clocks all one entry per line and alphabetize.
    - power: power-controller move back to pinctrl: pinctrl.

 arch/arm/boot/dts/rk3288.dtsi | 59 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index cb18bb4..d9cd8c0 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/clock/rk3288-cru.h>
+#include <dt-bindings/power-domain/rk3288.h>
 #include "skeleton.dtsi"
 
 / {
@@ -989,4 +990,62 @@
 			};
 		};
 	};
+
+	power: power-controller {
+		compatible = "rockchip,rk3288-power-controller";
+		#power-domain-cells = <1>;
+		rockchip,pmu = <&pmu>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pd_gpu {
+			reg = <RK3288_PD_GPU>;
+			clocks = <&cru ACLK_GPU>;
+		};
+
+		pd_hevc {
+			reg = <RK3288_PD_HEVC>;
+			clocks = <&cru ACLK_HEVC>,
+				 <&cru SCLK_HEVC_CABAC>,
+				 <&cru SCLK_HEVC_CORE>,
+				 <&cru HCLK_HEVC>;
+		};
+
+		pd_vio {
+			reg = <RK3288_PD_VIO>;
+			clocks = <&cru ACLK_IEP>,
+				 <&cru ACLK_ISP>,
+				 <&cru ACLK_RGA>,
+				 <&cru ACLK_VIP>,
+				 <&cru ACLK_VOP0>,
+				 <&cru ACLK_VOP1>,
+				 <&cru DCLK_VOP0>,
+				 <&cru DCLK_VOP1>,
+				 <&cru HCLK_IEP>,
+				 <&cru HCLK_ISP>,
+				 <&cru HCLK_RGA>,
+				 <&cru HCLK_VIP>,
+				 <&cru HCLK_VOP0>,
+				 <&cru HCLK_VOP1>,
+				 <&cru PCLK_EDP_CTRL>,
+				 <&cru PCLK_HDMI_CTRL>,
+				 <&cru PCLK_LVDS_PHY>,
+				 <&cru PCLK_MIPI_CSI>,
+				 <&cru PCLK_MIPI_DSI0>,
+				 <&cru PCLK_MIPI_DSI1>,
+				 <&cru SCLK_EDP_24M>,
+				 <&cru SCLK_EDP>,
+				 <&cru SCLK_HDMI_CEC>,
+				 <&cru SCLK_HDMI_HDCP>,
+				 <&cru SCLK_ISP_JPE>,
+				 <&cru SCLK_ISP>,
+				 <&cru SCLK_RGA>;
+		};
+
+		pd_video {
+			reg = <RK3288_PD_VIDEO>;
+			clocks = <&cru ACLK_VCODEC>,
+				 <&cru HCLK_VCODEC>;
+		};
+	};
 };
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
