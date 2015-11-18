Return-Path: <tiffany.lin@mediatek.com>
Message-ID: <1447827690.22499.5.camel@mtksdaap41>
Subject: Re: [RESEND RFC/PATCH 4/8] dt-bindings: Add a binding for Mediatek
 Video Encoder
From: tiffany lin <tiffany.lin@mediatek.com>
Date: Wed, 18 Nov 2015 14:21:30 +0800
In-Reply-To: <20151117194100.GA3028@rob-hp-laptop>
References: <1447764885-23100-1-git-send-email-tiffany.lin@mediatek.com>
	 <1447764885-23100-5-git-send-email-tiffany.lin@mediatek.com>
	 <20151117194100.GA3028@rob-hp-laptop>
Content-Type: multipart/alternative; boundary="=-POSjJzpueILGWG3LRN4e"
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Sascha Hauer <s.hauer@pengutronix.de>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, Fabien Dessenne <fabien.dessenne@st.com>, Arnd Bergmann <arnd@arndb.de>, Darren Etheridge <detheridge@ti.com>, Peter Griffin <peter.griffin@linaro.org>, Benoit Parrot <bparrot@ti.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>, Daniel Hsiao <daniel.hsiao@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

--=-POSjJzpueILGWG3LRN4e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Rob,

On Tue, 2015-11-17 at 13:41 -0600, Rob Herring wrote:
> On Tue, Nov 17, 2015 at 08:54:41PM +0800, Tiffany Lin wrote:
> > add a DT binding documentation of Video Encoder for the
> > MT8173 SoC from Mediatek.
> > 
> > Signed-off-by: Tiffany Lin <tiffany.lin@mediatek.com>
> > ---
> >  .../devicetree/bindings/media/mediatek-vcodec.txt  |   58 ++++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > new file mode 100644
> > index 0000000..fea4d7c
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
> > +- larb : must contain the larbes of current platform
> 
> What is this?
This is SMI (Smart Multimedia Interface) Local Arbiter.
MT8173 has different local arbiters(larb).
Please see
http://lists.linuxfoundation.org/pipermail/iommu/2015-October/014587.html

Video Encoder HW has it's local arbiter (larb), by configuring ports in
this larb, we can have encoder HW go through the m4u to talk with EMI. 
We will change to mediatek,larb in next version.

> 
> > +- clocks : list of clock specifiers, corresponding to entries in
> > +  the clock-names property;
> > +- clock-names: must contain "vencpll", "venc_lt_sel", "vcodecpll_370p5_ck"
> > +- iommus : list of iommus specifiers should be enabled for hw encode.
> > +  There are 2 cells needed to enable/disable iommu.
> > +  The first one is local arbiter index(larbid), and the other is port
> > +  index(portid) within local arbiter. Specifies the larbid and portid
> > +  as defined in dt-binding/memory/mt8173-larb-port.h.
> > +- vpu : the node of video processor unit
> 
> This should be prefixed with mediatek.
Got it, we will prefix it with mediatek in next version.

> 
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


best regards,
Tiffany

--=-POSjJzpueILGWG3LRN4e
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/4.2.2">
</HEAD>
<BODY>
<PRE>
Hi Rob,

On Tue, 2015-11-17 at 13:41 -0600, Rob Herring wrote:
&gt; On Tue, Nov 17, 2015 at 08:54:41PM +0800, Tiffany Lin wrote:
&gt; &gt; add a DT binding documentation of Video Encoder for the
&gt; &gt; MT8173 SoC from Mediatek.
&gt; &gt; 
&gt; &gt; Signed-off-by: Tiffany Lin &lt;<A HREF="mailto:tiffany.lin@mediatek.com">tiffany.lin@mediatek.com</A>&gt;
&gt; &gt; ---
&gt; &gt;  .../devicetree/bindings/media/mediatek-vcodec.txt  |   58 ++++++++++++++++++++
&gt; &gt;  1 file changed, 58 insertions(+)
&gt; &gt;  create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec.txt
&gt; &gt; 
&gt; &gt; diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
&gt; &gt; new file mode 100644
&gt; &gt; index 0000000..fea4d7c
&gt; &gt; --- /dev/null
&gt; &gt; +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
&gt; &gt; @@ -0,0 +1,58 @@
&gt; &gt; +Mediatek Video Codec
&gt; &gt; +
&gt; &gt; +Mediatek Video Codec is the video codec hw present in Mediatek SoCs which
&gt; &gt; +supports high resolution encoding functionalities.
&gt; &gt; +
&gt; &gt; +Required properties:
&gt; &gt; +- compatible : &quot;mediatek,mt8173-vcodec-enc&quot; for encoder
&gt; &gt; +- reg : Physical base address of the video codec registers and length of
&gt; &gt; +  memory mapped region.
&gt; &gt; +- interrupts : interrupt number to the cpu.
&gt; &gt; +- larb : must contain the larbes of current platform
&gt; 
&gt; What is this?
This is SMI (Smart Multimedia Interface) Local Arbiter.
MT8173 has different local arbiters(larb).
Please see
<A HREF="http://lists.linuxfoundation.org/pipermail/iommu/2015-October/014587.html">http://lists.linuxfoundation.org/pipermail/iommu/2015-October/014587.html</A>

Video Encoder HW has it's local arbiter (larb), by configuring ports in
this larb, we can have encoder HW go through the m4u to talk with EMI. 
We will change to mediatek,larb in next version.

&gt; 
&gt; &gt; +- clocks : list of clock specifiers, corresponding to entries in
&gt; &gt; +  the clock-names property;
&gt; &gt; +- clock-names: must contain &quot;vencpll&quot;, &quot;venc_lt_sel&quot;, &quot;vcodecpll_370p5_ck&quot;
&gt; &gt; +- iommus : list of iommus specifiers should be enabled for hw encode.
&gt; &gt; +  There are 2 cells needed to enable/disable iommu.
&gt; &gt; +  The first one is local arbiter index(larbid), and the other is port
&gt; &gt; +  index(portid) within local arbiter. Specifies the larbid and portid
&gt; &gt; +  as defined in dt-binding/memory/mt8173-larb-port.h.
&gt; &gt; +- vpu : the node of video processor unit
&gt; 
&gt; This should be prefixed with mediatek.
Got it, we will prefix it with mediatek in next version.

&gt; 
&gt; &gt; +
&gt; &gt; +Example:
&gt; &gt; +vcodec_enc: vcodec@0x18002000 {
&gt; &gt; +    compatible = &quot;mediatek,mt8173-vcodec-enc&quot;;
&gt; &gt; +    reg = &lt;0 0x18002000 0 0x1000&gt;,    /*VENC_SYS*/
&gt; &gt; +          &lt;0 0x19002000 0 0x1000&gt;;    /*VENC_LT_SYS*/
&gt; &gt; +    interrupts = &lt;GIC_SPI 198 IRQ_TYPE_LEVEL_LOW&gt;,
&gt; &gt; +           &lt;GIC_SPI 202 IRQ_TYPE_LEVEL_LOW&gt;;
&gt; &gt; +    larb = &lt;&amp;larb3&gt;,
&gt; &gt; +           &lt;&amp;larb5&gt;;
&gt; &gt; +    iommus = &lt;&amp;iommu M4U_LARB3_ID M4U_PORT_VENC_RCPU&gt;,
&gt; &gt; +             &lt;&amp;iommu M4U_LARB3_ID M4U_PORT_VENC_REC&gt;,
&gt; &gt; +             &lt;&amp;iommu M4U_LARB3_ID M4U_PORT_VENC_BSDMA&gt;,
&gt; &gt; +             &lt;&amp;iommu M4U_LARB3_ID M4U_PORT_VENC_SV_COMV&gt;,
&gt; &gt; +             &lt;&amp;iommu M4U_LARB3_ID M4U_PORT_VENC_RD_COMV&gt;,
&gt; &gt; +             &lt;&amp;iommu M4U_LARB3_ID M4U_PORT_VENC_CUR_LUMA&gt;,
&gt; &gt; +             &lt;&amp;iommu M4U_LARB3_ID M4U_PORT_VENC_CUR_CHROMA&gt;,
&gt; &gt; +             &lt;&amp;iommu M4U_LARB3_ID M4U_PORT_VENC_REF_LUMA&gt;,
&gt; &gt; +             &lt;&amp;iommu M4U_LARB3_ID M4U_PORT_VENC_REF_CHROMA&gt;,
&gt; &gt; +             &lt;&amp;iommu M4U_LARB3_ID M4U_PORT_VENC_NBM_RDMA&gt;,
&gt; &gt; +             &lt;&amp;iommu M4U_LARB3_ID M4U_PORT_VENC_NBM_WDMA&gt;,
&gt; &gt; +             &lt;&amp;iommu M4U_LARB5_ID M4U_PORT_VENC_RCPU_SET2&gt;,
&gt; &gt; +             &lt;&amp;iommu M4U_LARB5_ID M4U_PORT_VENC_REC_FRM_SET2&gt;,
&gt; &gt; +             &lt;&amp;iommu M4U_LARB5_ID M4U_PORT_VENC_BSDMA_SET2&gt;,
&gt; &gt; +             &lt;&amp;iommu M4U_LARB5_ID M4U_PORT_VENC_SV_COMA_SET2&gt;,
&gt; &gt; +             &lt;&amp;iommu M4U_LARB5_ID M4U_PORT_VENC_RD_COMA_SET2&gt;,
&gt; &gt; +             &lt;&amp;iommu M4U_LARB5_ID M4U_PORT_VENC_CUR_LUMA_SET2&gt;,
&gt; &gt; +             &lt;&amp;iommu M4U_LARB5_ID M4U_PORT_VENC_CUR_CHROMA_SET2&gt;,
&gt; &gt; +             &lt;&amp;iommu M4U_LARB5_ID M4U_PORT_VENC_REF_LUMA_SET2&gt;,
&gt; &gt; +             &lt;&amp;iommu M4U_LARB5_ID M4U_PORT_VENC_REC_CHROMA_SET2&gt;;
&gt; &gt; +    vpu = &lt;&amp;vpu&gt;;
&gt; &gt; +    clocks = &lt;&amp;apmixedsys CLK_APMIXED_VENCPLL&gt;,
&gt; &gt; +             &lt;&amp;topckgen CLK_TOP_VENC_LT_SEL&gt;,
&gt; &gt; +             &lt;&amp;topckgen CLK_TOP_VCODECPLL_370P5&gt;;
&gt; &gt; +    clock-names = &quot;vencpll&quot;,
&gt; &gt; +                  &quot;venc_lt_sel&quot;,
&gt; &gt; +                  &quot;vcodecpll_370p5_ck&quot;;
&gt; &gt; +  };
&gt; &gt; -- 
&gt; &gt; 1.7.9.5
&gt; &gt; 

</PRE>
best regards,<BR>
Tiffany
</BODY>
</HTML>

--=-POSjJzpueILGWG3LRN4e--
