From: tiffany lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 4/8] dt-bindings: Add a binding for Mediatek Video
 Encoder
Date: Mon, 14 Dec 2015 16:26:58 +0800
Message-ID: <1450081618.5745.3.camel@mtksdaap41>
References: <1449827743-22895-1-git-send-email-tiffany.lin@mediatek.com>
	 <1449827743-22895-5-git-send-email-tiffany.lin@mediatek.com>
	 <20151211172919.GA2896@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151211172919.GA2896@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Mikhail Ulyanov <mikhail.ulyanov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Darren Etheridge <detheridge-l0cyMroinI0@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen>
List-Id: devicetree@vger.kernel.org

On Fri, 2015-12-11 at 11:29 -0600, Rob Herring wrote:
> On Fri, Dec 11, 2015 at 05:55:39PM +0800, Tiffany Lin wrote:
> > Add a DT binding documentation of Video Encoder for the
> > MT8173 SoC from Mediatek.
> > 
> > Signed-off-by: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> A question and minor issue below, otherwise:
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> > ---
> >  .../devicetree/bindings/media/mediatek-vcodec.txt  |   58 ++++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > new file mode 100644
> > index 0000000..510cd81
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > @@ -0,0 +1,58 @@
> > +Mediatek Video Codec
> > +
> > +Mediatek Video Codec is the video codec hw present in Mediatek SoCs which
> > +supports high resolution encoding functionalities.
> > +
> > +Required properties:
> > +- compatible : "mediatek,mt8173-vcodec-enc" for encoder
> > +- reg : Physical base address of the video codec registers and length of
> > +  memory mapped region.
> > +- interrupts : interrupt number to the cpu.
> > +- mediatek,larb : must contain the local arbiters in the current Socs.
> > +- clocks : list of clock specifiers, corresponding to entries in
> > +  the clock-names property;
> > +- clock-names: must contain "vencpll", "venc_lt_sel", "vcodecpll_370p5_ck"
> > +- iommus : list of iommus specifiers should be enabled for hw encode.
> > +  There are 2 cells needed to enable/disable iommu.
> > +  The first one is local arbiter index(larbid), and the other is port
> > +  index(portid) within local arbiter. Specifies the larbid and portid
> > +  as defined in dt-binding/memory/mt8173-larb-port.h.
> > +- mediatek,vpu : the node of video processor unit
> > +
> > +Example:
> > +vcodec_enc: vcodec@0x18002000 {
> > +    compatible = "mediatek,mt8173-vcodec-enc";
> > +    reg = <0 0x18002000 0 0x1000>,    /*VENC_SYS*/
> > +          <0 0x19002000 0 0x1000>;    /*VENC_LT_SYS*/
> > +    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>,
> > +           <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> > +    larb = <&larb3>,
> > +           <&larb5>;
> > +    iommus = <&iommu M4U_LARB3_ID M4U_PORT_VENC_RCPU>,
> 
> Is this the same iommu as the VPU? If so, you can't have a mixed number 
> of cells.
Yes, its same iommus as the VPU.
Now we use two parameters for iommus.
We will fix this in next version.

> > +             <&iommu M4U_LARB3_ID M4U_PORT_VENC_REC>,
> > +             <&iommu M4U_LARB3_ID M4U_PORT_VENC_BSDMA>,
> > +             <&iommu M4U_LARB3_ID M4U_PORT_VENC_SV_COMV>,
> > +             <&iommu M4U_LARB3_ID M4U_PORT_VENC_RD_COMV>,
> > +             <&iommu M4U_LARB3_ID M4U_PORT_VENC_CUR_LUMA>,
> > +             <&iommu M4U_LARB3_ID M4U_PORT_VENC_CUR_CHROMA>,
> > +             <&iommu M4U_LARB3_ID M4U_PORT_VENC_REF_LUMA>,
> > +             <&iommu M4U_LARB3_ID M4U_PORT_VENC_REF_CHROMA>,
> > +             <&iommu M4U_LARB3_ID M4U_PORT_VENC_NBM_RDMA>,
> > +             <&iommu M4U_LARB3_ID M4U_PORT_VENC_NBM_WDMA>,
> > +             <&iommu M4U_LARB5_ID M4U_PORT_VENC_RCPU_SET2>,
> > +             <&iommu M4U_LARB5_ID M4U_PORT_VENC_REC_FRM_SET2>,
> > +             <&iommu M4U_LARB5_ID M4U_PORT_VENC_BSDMA_SET2>,
> > +             <&iommu M4U_LARB5_ID M4U_PORT_VENC_SV_COMA_SET2>,
> > +             <&iommu M4U_LARB5_ID M4U_PORT_VENC_RD_COMA_SET2>,
> > +             <&iommu M4U_LARB5_ID M4U_PORT_VENC_CUR_LUMA_SET2>,
> > +             <&iommu M4U_LARB5_ID M4U_PORT_VENC_CUR_CHROMA_SET2>,
> > +             <&iommu M4U_LARB5_ID M4U_PORT_VENC_REF_LUMA_SET2>,
> > +             <&iommu M4U_LARB5_ID M4U_PORT_VENC_REC_CHROMA_SET2>;
> > +    vpu = <&vpu>;
> 
> Need to update the example.
Sorry, I didn't get it.
Do you means update VPU binding document "media/mediatek-vpu.txt"?

> 
> > +    clocks = <&apmixedsys CLK_APMIXED_VENCPLL>,
> > +             <&topckgen CLK_TOP_VENC_LT_SEL>,
> > +             <&topckgen CLK_TOP_VCODECPLL_370P5>;
> > +    clock-names = "vencpll",
> > +                  "venc_lt_sel",
> > +                  "vcodecpll_370p5_ck";
> > +  };
> > -- 
> > 1.7.9.5
> > 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
