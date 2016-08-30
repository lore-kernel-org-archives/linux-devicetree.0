From: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 4/5] arm64: dts: mediatek: Add MDP for MT8173
Date: Tue, 30 Aug 2016 20:25:43 +0800
Message-ID: <1472559944-55114-5-git-send-email-minghsiu.tsai@mediatek.com>
References: <1472559944-55114-1-git-send-email-minghsiu.tsai@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472559944-55114-1-git-send-email-minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add MDP node for MT8173

Signed-off-by: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi |   84 ++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 10f638f..cd93228 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -41,6 +41,14 @@
 		dpi0 = &dpi0;
 		dsi0 = &dsi0;
 		dsi1 = &dsi1;
+		mdp_rdma0 = &mdp_rdma0;
+		mdp_rdma1 = &mdp_rdma1;
+		mdp_rsz0 = &mdp_rsz0;
+		mdp_rsz1 = &mdp_rsz1;
+		mdp_rsz2 = &mdp_rsz2;
+		mdp_wdma0 = &mdp_wdma0;
+		mdp_wrot0 = &mdp_wrot0;
+		mdp_wrot1 = &mdp_wrot1;
 	};
 
 	cpus {
@@ -716,6 +724,82 @@
 			#clock-cells = <1>;
 		};
 
+		mdp {
+			compatible = "mediatek,mt8173-mdp";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			mediatek,vpu = <&vpu>;
+
+			mdp_rdma0: rdma@14001000 {
+				compatible = "mediatek,mt8173-mdp-rdma";
+				reg = <0 0x14001000 0 0x1000>;
+				clocks = <&mmsys CLK_MM_MDP_RDMA0>,
+					 <&mmsys CLK_MM_MUTEX_32K>;
+				power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+				iommus = <&iommu M4U_PORT_MDP_RDMA0>;
+				mediatek,larb = <&larb0>;
+			};
+
+			mdp_rdma1: rdma@14002000 {
+				compatible = "mediatek,mt8173-mdp-rdma";
+				reg = <0 0x14002000 0 0x1000>;
+				clocks = <&mmsys CLK_MM_MDP_RDMA1>,
+					 <&mmsys CLK_MM_MUTEX_32K>;
+				power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+				iommus = <&iommu M4U_PORT_MDP_RDMA1>;
+				mediatek,larb = <&larb4>;
+			};
+
+			mdp_rsz0: rsz@14003000 {
+				compatible = "mediatek,mt8173-mdp-rsz";
+				reg = <0 0x14003000 0 0x1000>;
+				clocks = <&mmsys CLK_MM_MDP_RSZ0>;
+				power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			};
+
+			mdp_rsz1: rsz@14004000 {
+				compatible = "mediatek,mt8173-mdp-rsz";
+				reg = <0 0x14004000 0 0x1000>;
+				clocks = <&mmsys CLK_MM_MDP_RSZ1>;
+				power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			};
+
+			mdp_rsz2: rsz@14005000 {
+				compatible = "mediatek,mt8173-mdp-rsz";
+				reg = <0 0x14005000 0 0x1000>;
+				clocks = <&mmsys CLK_MM_MDP_RSZ2>;
+				power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+			};
+
+			mdp_wdma0: wdma@14006000 {
+				compatible = "mediatek,mt8173-mdp-wdma";
+				reg = <0 0x14006000 0 0x1000>;
+				clocks = <&mmsys CLK_MM_MDP_WDMA>;
+				power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+				iommus = <&iommu M4U_PORT_MDP_WDMA>;
+				mediatek,larb = <&larb0>;
+			};
+
+			mdp_wrot0: wrot@14007000 {
+				compatible = "mediatek,mt8173-mdp-wrot";
+				reg = <0 0x14007000 0 0x1000>;
+				clocks = <&mmsys CLK_MM_MDP_WROT0>;
+				power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+				iommus = <&iommu M4U_PORT_MDP_WROT0>;
+				mediatek,larb = <&larb0>;
+			};
+
+			mdp_wrot1: wrot@14008000 {
+				compatible = "mediatek,mt8173-mdp-wrot";
+				reg = <0 0x14008000 0 0x1000>;
+				clocks = <&mmsys CLK_MM_MDP_WROT1>;
+				power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+				iommus = <&iommu M4U_PORT_MDP_WROT1>;
+				mediatek,larb = <&larb4>;
+			};
+		};
+
 		ovl0: ovl@1400c000 {
 			compatible = "mediatek,mt8173-disp-ovl";
 			reg = <0 0x1400c000 0 0x1000>;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
