From: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 5/8] arm64: dts: mediatek: Add Video Encoder for MT8173
Date: Fri, 11 Dec 2015 17:55:40 +0800
Message-ID: <1449827743-22895-6-git-send-email-tiffany.lin@mediatek.com>
References: <1449827743-22895-1-git-send-email-tiffany.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1449827743-22895-1-git-send-email-tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Mikhail Ulyanov <mikhail.ulyanov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Darren Etheridge <detheridge-l0cyMroinI0@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Daniel Hsiao <daniel.hsiao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, PoChun.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add video encoder node for MT8173

Signed-off-by: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi |   47 ++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index b8c8ff0..a6b0fcf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -545,6 +545,53 @@
 			#clock-cells = <1>;
 		};
 
+		larb3: larb@18001000 {
+			compatible = "mediatek,mt8173-smi-larb";
+			reg = <0 0x18001000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_VENC>;
+			clocks = <&vencsys CLK_VENC_CKE1>,
+				 <&vencsys CLK_VENC_CKE0>;
+			clock-names = "apb", "smi";
+		};
+
+		vcodec_enc: vcodec@18002000 {
+			compatible = "mediatek,mt8173-vcodec-enc";
+			reg = <0 0x18002000 0 0x1000>,	/* VENC_SYS */
+			      <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
+			larb = <&larb3>,
+			       <&larb5>;
+			iommus = <&iommu M4U_LARB3_ID M4U_PORT_VENC_RCPU>,
+				 <&iommu M4U_LARB3_ID M4U_PORT_VENC_REC>,
+				 <&iommu M4U_LARB3_ID M4U_PORT_VENC_BSDMA>,
+				 <&iommu M4U_LARB3_ID M4U_PORT_VENC_SV_COMV>,
+				 <&iommu M4U_LARB3_ID M4U_PORT_VENC_RD_COMV>,
+				 <&iommu M4U_LARB3_ID M4U_PORT_VENC_CUR_LUMA>,
+				 <&iommu M4U_LARB3_ID M4U_PORT_VENC_CUR_CHROMA>,
+				 <&iommu M4U_LARB3_ID M4U_PORT_VENC_REF_LUMA>,
+				 <&iommu M4U_LARB3_ID M4U_PORT_VENC_REF_CHROMA>,
+				 <&iommu M4U_LARB3_ID M4U_PORT_VENC_NBM_RDMA>,
+				 <&iommu M4U_LARB3_ID M4U_PORT_VENC_NBM_WDMA>,
+				 <&iommu M4U_LARB5_ID M4U_PORT_VENC_RCPU_SET2>,
+				 <&iommu M4U_LARB5_ID M4U_PORT_VENC_REC_FRM_SET2>,
+				 <&iommu M4U_LARB5_ID M4U_PORT_VENC_BSDMA_SET2>,
+				 <&iommu M4U_LARB5_ID M4U_PORT_VENC_SV_COMA_SET2>,
+				 <&iommu M4U_LARB5_ID M4U_PORT_VENC_RD_COMA_SET2>,
+				 <&iommu M4U_LARB5_ID M4U_PORT_VENC_CUR_LUMA_SET2>,
+				 <&iommu M4U_LARB5_ID M4U_PORT_VENC_CUR_CHROMA_SET2>,
+				 <&iommu M4U_LARB5_ID M4U_PORT_VENC_REF_LUMA_SET2>,
+				 <&iommu M4U_LARB5_ID M4U_PORT_VENC_REC_CHROMA_SET2>;
+			vpu = <&vpu>;
+			clocks = <&apmixedsys CLK_APMIXED_VENCPLL>,
+				 <&topckgen CLK_TOP_VENC_LT_SEL>,
+				 <&topckgen CLK_TOP_VCODECPLL_370P5>;
+			clock-names = "vencpll",
+				      "venc_lt_sel",
+				      "vcodecpll_370p5_ck";
+		};
+
 		vencltsys: clock-controller@19000000 {
 			compatible = "mediatek,mt8173-vencltsys", "syscon";
 			reg = <0 0x19000000 0 0x1000>;
-- 
1.7.9.5
