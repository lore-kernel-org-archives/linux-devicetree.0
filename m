From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] arm: dts: qcom: fix missing #phy-cells for apq8064
Date: Thu,  9 Nov 2017 16:54:22 -0600
Message-ID: <20171109225422.14280-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fix dtc warnings for missing #phy-cells for apq8064:

Warning (phys_property): Missing property '#phy-cells' in node /soc/dsi-phy@4700200 or bad phandle (referred from /soc/mdss_dsi@4700000:phys[0])
Warning (phys_property): Missing property '#phy-cells' in node /soc/hdmi-phy@4a00400 or bad phandle (referred from /soc/hdmi-tx@4a00000:phys[0])

Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index f3db185a6809..a2b030d08fc5 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1263,6 +1263,7 @@
 		dsi0_phy: dsi-phy@4700200 {
 			compatible = "qcom,dsi-phy-28nm-8960";
 			#clock-cells = <1>;
+			#phy-cells = <0>;
 
 			reg = <0x04700200 0x100>,
 				<0x04700300 0x200>,
@@ -1414,6 +1415,7 @@
 			      <0x4a00500 0x100>;
 			reg-names = "hdmi_phy",
 				    "hdmi_pll";
+			#phy-cells = <0>;
 
 			clocks = <&mmcc HDMI_S_AHB_CLK>;
 			clock-names = "slave_iface_clk";
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
