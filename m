From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v14 3/3] ARM: dts: add RK3288 power-domain node
Date: Fri, 24 Apr 2015 16:07:48 +0800
Message-ID: <1429862868-14218-4-git-send-email-wxt@rock-chips.com>
References: <1429862868-14218-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429862868-14218-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, khilman@linaro.org, linux-arm-kernel@lists.infradead.org
Cc: linus.walleij@linaro.org, tomasz.figa@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, grant.likely@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, rdunlap@infradead.org, linux-doc@vger.kernel.org, dianders@chromium.org, linux-rockchip@lists.infradead.org, ulf.hansson@linaro.org, dmitry.torokhov@gmail.com, broonie@kernel.org, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk, Caesar Wang <wxt@rock-chips.com>, "jinkun.hong" <jinkun.hong@rock-chips.com>
List-Id: devicetree@vger.kernel.org

This patch add the needed clocks into power-controller.

why need we do so that?

Firstly, we always be needed turn off clocks to save power when
the system enter suspend.So we need to enumerate the clocks are needed
to switch power doamin no and off.

Secondly, RK3288 reset circuit should be syncchronous reset and
then sync revoked.so we need to enable clocks of all devices.

Signed-off-by: jinkun.hong <jinkun.hong@rock-chips.com>
Signed-off-by: Caesar Wang <wxt@rock-chips.com>
---

Changes in v14:
    - does not need to set an owner,remove the "THIS_MODULE".

Changes in v13:
    - Remove essential clocks from rk3288 PD_VIO domain
    Some clocks are essential for the system health and should not
    be turned down. However there is no owner for them so if they listed
    as belonging to power domain we'll try toggling them up and down
    during power domain.
    - Device drivers expect their devices to be powered on before their
    probing code is invoked. To achieve that we should start with
    power domains powered on (we may turn them off later once all
    devices enable runtime power managment and go idle).
    - This change switches Rockchip power domain driver to use updated
    device_attach and device_detach API.
    - set the gpu/core power domain power delay time.
    - fix enumerating PM clocks for devices.
    - fix use after free
    We can't use clk after we did clk_put(clk).

Changes in v12:
    - Remove essential clocks from rk3288 PD_VIO domain,
    Some clocks are essential for the system health and should
    not be turned down. However there is no owner for them so
    if they listed as belonging to power domain we'll try toggling
    them up and down during power domain transition. As a result we
    either fail to suspend or resume the system.

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

---

 arch/arm/boot/dts/rk3288.dtsi             | 59 +++++++++++++++++++++++++++++++
 include/dt-bindings/power-domain/rk3288.h | 11 ++++++
 2 files changed, 70 insertions(+)
 create mode 100644 include/dt-bindings/power-domain/rk3288.h

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 5999029..f3992db 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/clock/rk3288-cru.h>
+#include <dt-bindings/power-domain/rk3288.h>
 #include <dt-bindings/thermal/thermal.h>
 #include "skeleton.dtsi"
 
@@ -1277,4 +1278,62 @@
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
diff --git a/include/dt-bindings/power-domain/rk3288.h b/include/dt-bindings/power-domain/rk3288.h
new file mode 100644
index 0000000..ca68c11
--- /dev/null
+++ b/include/dt-bindings/power-domain/rk3288.h
@@ -0,0 +1,11 @@
+#ifndef __DT_BINDINGS_POWER_DOMAIN_RK3288_H__
+#define __DT_BINDINGS_POWER_DOMAIN_RK3288_H__
+
+/* RK3288 power domain index */
+#define RK3288_PD_GPU          0
+#define RK3288_PD_VIO          1
+#define RK3288_PD_VIDEO        2
+#define RK3288_PD_HEVC         3
+#define RK3288_PD_PERI         4
+
+#endif
-- 
1.9.1
