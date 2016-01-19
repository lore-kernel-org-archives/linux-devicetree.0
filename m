From: tiffany lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 4/8] dt-bindings: Add a binding for Mediatek Video
 Encoder
Date: Tue, 19 Jan 2016 16:03:36 +0800
Message-ID: <1453190616.1088.1.camel@mtksdaap41>
References: <1451902316-55931-1-git-send-email-tiffany.lin@mediatek.com>
	 <1451902316-55931-5-git-send-email-tiffany.lin@mediatek.com>
	 <569CB321.10206@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <569CB321.10206-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Matthias,

On Mon, 2016-01-18 at 10:40 +0100, Matthias Brugger wrote:
> 
> On 04/01/16 11:11, Tiffany Lin wrote:
> > Add a DT binding documentation of Video Encoder for the
> > MT8173 SoC from Mediatek.
> >
> > Signed-off-by: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >   .../devicetree/bindings/media/mediatek-vcodec.txt  |   58 ++++++++++++++++++++
> >   1 file changed, 58 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> >
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > new file mode 100644
> > index 0000000..5cc35ae
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
> 
> iommus have only one cell, as in the example below. Please fix the 
> binding description accordingly.
> 
I will fix this in next version.


best regards,
Tiffany

> Regards,
> Matthias
> 
> > +- mediatek,vpu : the node of video processor unit
> > +
> > +Example:
> > +vcodec_enc: vcodec@0x18002000 {
> > +    compatible = "mediatek,mt8173-vcodec-enc";
> > +    reg = <0 0x18002000 0 0x1000>,    /*VENC_SYS*/
> > +          <0 0x19002000 0 0x1000>;    /*VENC_LT_SYS*/
> > +    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>,
> > +           <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
> > +    mediatek,larb = <&larb3>,
> > +		    <&larb5>;
> > +    iommus = <&iommu M4U_PORT_VENC_RCPU>,
> > +             <&iommu M4U_PORT_VENC_REC>,
> > +             <&iommu M4U_PORT_VENC_BSDMA>,
> > +             <&iommu M4U_PORT_VENC_SV_COMV>,
> > +             <&iommu M4U_PORT_VENC_RD_COMV>,
> > +             <&iommu M4U_PORT_VENC_CUR_LUMA>,
> > +             <&iommu M4U_PORT_VENC_CUR_CHROMA>,
> > +             <&iommu M4U_PORT_VENC_REF_LUMA>,
> > +             <&iommu M4U_PORT_VENC_REF_CHROMA>,
> > +             <&iommu M4U_PORT_VENC_NBM_RDMA>,
> > +             <&iommu M4U_PORT_VENC_NBM_WDMA>,
> > +             <&iommu M4U_PORT_VENC_RCPU_SET2>,
> > +             <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
> > +             <&iommu M4U_PORT_VENC_BSDMA_SET2>,
> > +             <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
> > +             <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
> > +             <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
> > +             <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
> > +             <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
> > +             <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
> > +    mediatek,vpu = <&vpu>;
> > +    clocks = <&apmixedsys CLK_APMIXED_VENCPLL>,
> > +             <&topckgen CLK_TOP_VENC_LT_SEL>,
> > +             <&topckgen CLK_TOP_VCODECPLL_370P5>;
> > +    clock-names = "vencpll",
> > +                  "venc_lt_sel",
> > +                  "vcodecpll_370p5_ck";
> > +  };
> >


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
