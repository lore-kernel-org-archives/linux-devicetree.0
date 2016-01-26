From: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 2/4] arm:dts:ls1021a: Add sii9022a dts node
Date: Tue, 26 Jan 2016 12:00:31 +0800
Message-ID: <1453780833-32289-2-git-send-email-meng.yi@nxp.com>
References: <1453780833-32289-1-git-send-email-meng.yi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1453780833-32289-1-git-send-email-meng.yi-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The SiI9022A is an ultra low-power HDMI transmitter. It supports
resolutions from standard definition 480i/p and 576i/p all the way
to high-definition 720p, 1080i, and 1080p, the highest resolution
supported by HDTVs today. It also supports all PC resolutions up
to UXGA for netbooks

Signed-off-by: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm/boot/dts/ls1021a-twr.dts | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a-twr.dts b/arch/arm/boot/dts/ls1021a-twr.dts
index fad2e3b..462b6a1 100644
--- a/arch/arm/boot/dts/ls1021a-twr.dts
+++ b/arch/arm/boot/dts/ls1021a-twr.dts
@@ -57,6 +57,17 @@
 		enet1_sgmii_phy = &sgmii_phy0;
 	};
 
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&sii9022a_out>;
+			};
+		};
+	};
+
 	sys_mclk: clock-mclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -180,6 +191,24 @@
 		VDDIO-supply = <&reg_3p3v>;
 		clocks = <&sys_mclk 1>;
 	};
+
+	sii9022a: hdmi@39 {
+		compatible = "sil,sii9022a";
+		reg = <0x39>;
+		interrupts = <GIC_SPI 167 IRQ_TYPE_EDGE_RISING>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <1>;
+				sii9022a_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
 };
 
 &ifc {
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
