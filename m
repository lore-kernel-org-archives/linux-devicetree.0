From: tiffany lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 5/8] arm64: dts: mediatek: Add Video Encoder for
 MT8173
Date: Tue, 15 Dec 2015 16:29:40 +0800
Message-ID: <1450168180.31617.6.camel@mtksdaap41>
References: <1449827743-22895-1-git-send-email-tiffany.lin@mediatek.com>
	 <1449827743-22895-6-git-send-email-tiffany.lin@mediatek.com>
	 <1598527.2ooU1eBZYB@linux-gy6r.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1598527.2ooU1eBZYB-FL1YVkE3Js+HtQ08XqlRiA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Mikhail Ulyanov <mikhail.ulyanov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Darren Etheridge <detheridge-l0cyMroinI0@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen@mediatek>
List-Id: devicetree@vger.kernel.org

Hi Matthias,

On Mon, 2015-12-14 at 19:18 +0100, Matthias Brugger wrote:
> On Friday 11 Dec 2015 17:55:40 Tiffany Lin wrote:
> > Add video encoder node for MT8173
> > 
> > Signed-off-by: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8173.dtsi |   47
> > ++++++++++++++++++++++++++++++ 1 file changed, 47 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8173.dtsi index b8c8ff0..a6b0fcf 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > @@ -545,6 +545,53 @@
> >  			#clock-cells = <1>;
> >  		};
> > 
> > +		larb3: larb@18001000 {
> > +			compatible = "mediatek,mt8173-smi-larb";
> > +			reg = <0 0x18001000 0 0x1000>;
> > +			mediatek,smi = <&smi_common>;
> > +			power-domains = <&scpsys MT8173_POWER_DOMAIN_VENC>;
> > +			clocks = <&vencsys CLK_VENC_CKE1>,
> > +				 <&vencsys CLK_VENC_CKE0>;
> > +			clock-names = "apb", "smi";
> > +		};
> > +
> > +		vcodec_enc: vcodec@18002000 {
> > +			compatible = "mediatek,mt8173-vcodec-enc";
> > +			reg = <0 0x18002000 0 0x1000>,	/* VENC_SYS */
> > +			      <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
> > +			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>,
> > +				     <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> > +			larb = <&larb3>,
> > +			       <&larb5>;
> 
> should be mediatek,larb or just larb for all instances of the larb's.
> See my other email about the bindings.
> 
Yes, it should be mediatek,larb.
We will fix this and mediatek,vpu in next version.

best regards,
Tiffany

> Regards,
> Matthias
> 
> > +			iommus = <&iommu M4U_LARB3_ID M4U_PORT_VENC_RCPU>,
> > +				 <&iommu M4U_LARB3_ID M4U_PORT_VENC_REC>,
> > +				 <&iommu M4U_LARB3_ID M4U_PORT_VENC_BSDMA>,
> > +				 <&iommu M4U_LARB3_ID M4U_PORT_VENC_SV_COMV>,
> > +				 <&iommu M4U_LARB3_ID M4U_PORT_VENC_RD_COMV>,
> > +				 <&iommu M4U_LARB3_ID M4U_PORT_VENC_CUR_LUMA>,
> > +				 <&iommu M4U_LARB3_ID M4U_PORT_VENC_CUR_CHROMA>,
> > +				 <&iommu M4U_LARB3_ID M4U_PORT_VENC_REF_LUMA>,
> > +				 <&iommu M4U_LARB3_ID M4U_PORT_VENC_REF_CHROMA>,
> > +				 <&iommu M4U_LARB3_ID M4U_PORT_VENC_NBM_RDMA>,
> > +				 <&iommu M4U_LARB3_ID M4U_PORT_VENC_NBM_WDMA>,
> > +				 <&iommu M4U_LARB5_ID M4U_PORT_VENC_RCPU_SET2>,
> > +				 <&iommu M4U_LARB5_ID M4U_PORT_VENC_REC_FRM_SET2>,
> > +				 <&iommu M4U_LARB5_ID M4U_PORT_VENC_BSDMA_SET2>,
> > +				 <&iommu M4U_LARB5_ID M4U_PORT_VENC_SV_COMA_SET2>,
> > +				 <&iommu M4U_LARB5_ID M4U_PORT_VENC_RD_COMA_SET2>,
> > +				 <&iommu M4U_LARB5_ID M4U_PORT_VENC_CUR_LUMA_SET2>,
> > +				 <&iommu M4U_LARB5_ID M4U_PORT_VENC_CUR_CHROMA_SET2>,
> > +				 <&iommu M4U_LARB5_ID M4U_PORT_VENC_REF_LUMA_SET2>,
> > +				 <&iommu M4U_LARB5_ID M4U_PORT_VENC_REC_CHROMA_SET2>;
> > +			vpu = <&vpu>;
> > +			clocks = <&apmixedsys CLK_APMIXED_VENCPLL>,
> > +				 <&topckgen CLK_TOP_VENC_LT_SEL>,
> > +				 <&topckgen CLK_TOP_VCODECPLL_370P5>;
> > +			clock-names = "vencpll",
> > +				      "venc_lt_sel",
> > +				      "vcodecpll_370p5_ck";
> > +		};
> > +
> >  		vencltsys: clock-controller@19000000 {
> >  			compatible = "mediatek,mt8173-vencltsys", "syscon";
> >  			reg = <0 0x19000000 0 0x1000>;
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
