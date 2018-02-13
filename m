From: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v2 1/3] Documentation: bindings: add dt documentation for cdn DP controller
Date: Tue, 13 Feb 2018 15:35:47 +0100
Message-ID: <20180213143549.15197-1-enric.balletbo@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

This patch adds a binding that describes the cdn DP controller for
rk3399.

Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
Changes since v1:
- Add the cdn-dp bindings as requested by Heiko
  - The bindingis were sent already and acked by Rob but for some reason
    never landed. So as these series are related I incorporated this
    patch again [1].

[1] https://patchwork.kernel.org/patch/9278077/

 .../bindings/display/rockchip/cdn-dp-rockchip.txt  | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt

diff --git a/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
new file mode 100644
index 000000000000..d34a56e4f47e
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
@@ -0,0 +1,74 @@
+Rockchip RK3399 specific extensions to the cdn Display Port
+================================
+
+Required properties:
+- compatible: must be "rockchip,rk3399-cdn-dp"
+
+- reg: physical base address of the controller and length
+
+- clocks: from common clock binding: handle to dp clock.
+
+- clock-names: from common clock binding:
+	       Required elements: "core-clk" "pclk" "spdif" "grf"
+
+- resets : a list of phandle + reset specifier pairs
+- reset-names : string reset name, must be:
+		"spdif"
+- power-domains : power-domain property defined with a phandle
+		  to respective power domain.
+- assigned-clocks: main clock, should be <&cru SCLK_DP_CORE>
+- assigned-clock-rates : the DP core clk frequency, shall be: 100000000
+
+- rockchip,grf: this soc should set GRF regs, so need get grf here.
+
+- ports: contain a port nodes with endpoint definitions as defined in
+	 Documentation/devicetree/bindings/media/video-interfaces.txt.
+	 contained 2 endpoints, connecting to the output of vop.
+
+- phys: from general PHY binding: the phandle for the PHY device.
+
+- extcon: extcon specifier for the Power Delivery
+
+- #sound-dai-cells = it must be 1 if your system is using 2 DAIs: I2S, SPDIF
+
+-------------------------------------------------------------------------------
+
+Example:
+	cdn_dp: dp@fec00000 {
+		compatible = "rockchip,rk3399-cdn-dp";
+		reg = <0x0 0xfec00000 0x0 0x100000>;
+		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_DP_CORE>, <&cru PCLK_DP_CTRL>,
+			 <&cru SCLK_SPDIF_REC_DPTX>, <&cru PCLK_VIO_GRF>;
+		clock-names = "core-clk", "pclk", "spdif", "grf";
+		assigned-clocks = <&cru SCLK_DP_CORE>;
+		assigned-clock-rates = <100000000>;
+		power-domains = <&power RK3399_PD_HDCP>;
+		phys = <&tcphy0_dp>, <&tcphy1_dp>;
+		resets = <&cru SRST_DPTX_SPDIF_REC>;
+		reset-names = "spdif";
+		extcon = <&fusb0>, <&fusb1>;
+		rockchip,grf = <&grf>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#sound-dai-cells = <1>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dp_in: port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				dp_in_vopb: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&vopb_out_dp>;
+				};
+
+				dp_in_vopl: endpoint@1 {
+					reg = <1>;
+					remote-endpoint = <&vopl_out_dp>;
+				};
+			};
+		};
+	};
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
