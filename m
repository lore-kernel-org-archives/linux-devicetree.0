From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v4 2/9] ARM: dts: rockchip: add hdmi/vop device node for rk3036
Date: Thu, 28 Jan 2016 16:43:31 +0800
Message-ID: <1453970618-4383-3-git-send-email-wxt@rock-chips.com>
References: <1453970618-4383-1-git-send-email-wxt@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1453970618-4383-1-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, leozwang-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds the needed display info for rk3036 SOCs.

The rk3036 support two overlay plane and one hwc plane,
it supports IOMMU, and its IOMMU same as rk3288's.
Meanwhile, add the inno hdmi for HDMI display.

Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

Changes in v4:
- solve the lastest conflict, picked up from
  https://patchwork.kernel.org/patch/8040961/.

 arch/arm/boot/dts/rk3036-kylin.dts | 12 +++++++
 arch/arm/boot/dts/rk3036.dtsi      | 66 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/arch/arm/boot/dts/rk3036-kylin.dts b/arch/arm/boot/dts/rk3036-kylin.dts
index 3332a7f..1037ad6 100644
--- a/arch/arm/boot/dts/rk3036-kylin.dts
+++ b/arch/arm/boot/dts/rk3036-kylin.dts
@@ -116,6 +116,10 @@
 	status = "okay";
 };
 
+&hdmi {
+	status = "okay";
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 
@@ -369,6 +373,14 @@
 	status = "okay";
 };
 
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
 &pinctrl {
 	leds {
 		led_ctl: led-ctl {
diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
index 7897449..7abe3e2 100644
--- a/arch/arm/boot/dts/rk3036.dtsi
+++ b/arch/arm/boot/dts/rk3036.dtsi
@@ -147,6 +147,42 @@
 		};
 	};
 
+	vop: vop@10118000 {
+		compatible = "rockchip,rk3036-vop";
+		reg = <0x10118000 0x19c>;
+		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_LCDC>, <&cru SCLK_LCDC>, <&cru HCLK_LCDC>;
+		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
+		resets = <&cru SRST_LCDC1_A>, <&cru SRST_LCDC1_H>, <&cru SRST_LCDC1_D>;
+		reset-names = "axi", "ahb", "dclk";
+		iommus = <&vop_mmu>;
+
+		status = "disabled";
+
+		vop_out: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			vop_out_hdmi: endpoint@0 {
+				reg = <1>;
+				remote-endpoint = <&hdmi_in_vop>;
+			};
+		};
+	};
+
+	display-subsystem {
+		compatible = "rockchip,display-subsystem";
+		ports = <&vop_out>;
+	};
+
+	vop_mmu: iommu@10118300 {
+		compatible = "rockchip,iommu";
+		reg = <0x10118300 0x100>;
+		interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "vop_mmu";
+		#iommu-cells = <0>;
+		status = "disabled";
+	};
+
 	gic: interrupt-controller@10139000 {
 		compatible = "arm,gic-400";
 		interrupt-controller;
@@ -274,6 +310,27 @@
 		status = "disabled";
 	};
 
+	hdmi: hdmi@20034000 {
+		compatible = "rockchip,rk3036-inno-hdmi";
+		reg = <0x20034000 0x4000>;
+		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru  PCLK_HDMI>;
+		clock-names = "pclk";
+		rockchip,grf = <&grf>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmi_ctl>;
+		status = "disabled";
+
+		hdmi_in: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			hdmi_in_vop: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&vop_out_hdmi>;
+			};
+		};
+	};
+
 	timer: timer@20044000 {
 		compatible = "rockchip,rk3036-timer", "rockchip,rk3288-timer";
 		reg = <0x20044000 0x20>;
@@ -588,6 +645,15 @@
 			};
 		};
 
+		hdmi {
+			hdmi_ctl: hdmi-ctl {
+				rockchip,pins = <1 8  RK_FUNC_1 &pcfg_pull_none>,
+						<1 9  RK_FUNC_1 &pcfg_pull_none>,
+						<1 10 RK_FUNC_1 &pcfg_pull_none>,
+						<1 11 RK_FUNC_1 &pcfg_pull_none>;
+			};
+		};
+
 		uart0 {
 			uart0_xfer: uart0-xfer {
 				rockchip,pins = <0 16 RK_FUNC_1 &pcfg_pull_default>,
-- 
1.9.1
