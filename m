From: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 9/9] arm64: dts: mediatek: Add Video Decoder for MT8173
Date: Mon, 30 May 2016 20:29:23 +0800
Message-ID: <1464611363-14936-10-git-send-email-tiffany.lin@mediatek.com>
References: <1464611363-14936-1-git-send-email-tiffany.lin@mediatek.com>
 <1464611363-14936-2-git-send-email-tiffany.lin@mediatek.com>
 <1464611363-14936-3-git-send-email-tiffany.lin@mediatek.com>
 <1464611363-14936-4-git-send-email-tiffany.lin@mediatek.com>
 <1464611363-14936-5-git-send-email-tiffany.lin@mediatek.com>
 <1464611363-14936-6-git-send-email-tiffany.lin@mediatek.com>
 <1464611363-14936-7-git-send-email-tiffany.lin@mediatek.com>
 <1464611363-14936-8-git-send-email-tiffany.lin@mediatek.com>
 <1464611363-14936-9-git-send-email-tiffany.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1464611363-14936-9-git-send-email-tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, PoChun.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add video decoder node for MT8173

Signed-off-by: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi |   44 ++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 348ce0e..4ac06d3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -691,6 +691,50 @@
 			#clock-cells = <1>;
 		};
 
+		vcodec_dec: vcodec@16000000 {
+			compatible = "mediatek,mt8173-vcodec-dec";
+			reg = <0 0x16000000 0 0x100>,	/* VDEC_SYS */
+			      <0 0x16020000 0 0x1000>,	/* VDEC_MISC */
+			      <0 0x16021000 0 0x800>,	/* VDEC_LD */
+			      <0 0x16021800 0 0x800>,	/* VDEC_TOP */
+			      <0 0x16022000 0 0x1000>,	/* VDEC_CM */
+			      <0 0x16023000 0 0x1000>,	/* VDEC_AD */
+			      <0 0x16024000 0 0x1000>,	/* VDEC_AV */
+			      <0 0x16025000 0 0x1000>,	/* VDEC_PP */
+			      <0 0x16026800 0 0x800>,	/* VDEC_HWD */
+			      <0 0x16027000 0 0x800>,	/* VDEC_HWQ */
+			      <0 0x16027800 0 0x800>,	/* VDEC_HWB */
+			      <0 0x16028400 0 0x400>;	/* VDEC_HWG */
+			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
+			mediatek,larb = <&larb1>;
+			iommus = <&iommu M4U_PORT_HW_VDEC_MC_EXT>,
+				 <&iommu M4U_PORT_HW_VDEC_PP_EXT>,
+				 <&iommu M4U_PORT_HW_VDEC_AVC_MV_EXT>,
+				 <&iommu M4U_PORT_HW_VDEC_PRED_RD_EXT>,
+				 <&iommu M4U_PORT_HW_VDEC_PRED_WR_EXT>,
+				 <&iommu M4U_PORT_HW_VDEC_UFO_EXT>,
+				 <&iommu M4U_PORT_HW_VDEC_VLD_EXT>,
+				 <&iommu M4U_PORT_HW_VDEC_VLD2_EXT>;
+			mediatek,vpu = <&vpu>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_VDEC>;
+			clocks = <&apmixedsys CLK_APMIXED_VCODECPLL>,
+				 <&topckgen CLK_TOP_UNIVPLL_D2>,
+				 <&topckgen CLK_TOP_CCI400_SEL>,
+				 <&topckgen CLK_TOP_VDEC_SEL>,
+				 <&topckgen CLK_TOP_VCODECPLL>,
+				 <&apmixedsys CLK_APMIXED_VENCPLL>,
+				 <&topckgen CLK_TOP_VENC_LT_SEL>,
+				 <&topckgen CLK_TOP_VCODECPLL_370P5>;
+			clock-names = "vcodecpll",
+				      "univpll_d2",
+				      "clk_cci400_sel",
+				      "vdec_sel",
+				      "vdecpll",
+				      "vencpll",
+				      "venc_lt_sel",
+				      "vdec_bus_clk_src";
+		};
+
 		larb1: larb@16010000 {
 			compatible = "mediatek,mt8173-smi-larb";
 			reg = <0 0x16010000 0 0x1000>;
-- 
1.7.9.5
