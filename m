From: andrew-ct chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [RESEND RFC/PATCH 1/8] dt-bindings: Add a binding for Mediatek
 Video Processor Unit
Date: Thu, 19 Nov 2015 10:47:10 +0800
Message-ID: <1447901230.6731.3.camel@mtksdaap41>
References: <1447764885-23100-1-git-send-email-tiffany.lin@mediatek.com>
	 <1447764885-23100-2-git-send-email-tiffany.lin@mediatek.com>
	 <20151117141320.GJ12586@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151117141320.GJ12586@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Mikhail Ulyanov <mikhail.ulyanov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Darren Etheridge <detheridge-l0cyMroinI0@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benoit Parr
List-Id: devicetree@vger.kernel.org

On Tue, 2015-11-17 at 14:13 +0000, Mark Rutland wrote:
> On Tue, Nov 17, 2015 at 08:54:38PM +0800, Tiffany Lin wrote:
> > From: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > 
> > Add a DT binding documentation of Video Processor Unit for the
> > MT8173 SoC from Mediatek.
> > 
> > Signed-off-by: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  .../devicetree/bindings/media/mediatek-vpu.txt     |   27 ++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek-vpu.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-vpu.txt b/Documentation/devicetree/bindings/media/mediatek-vpu.txt
> > new file mode 100644
> > index 0000000..99a4e5e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek-vpu.txt
> > @@ -0,0 +1,27 @@
> > +* Mediatek Video Processor Unit
> > +
> > +Video Processor Unit is a HW video controller. It controls HW Codec including
> > +H.264/VP8/VP9 Decode, H.264/VP8 Encode and Image Processor (scale/rotate/color convert).
> > +
> > +Required properties:
> > +  - compatible: "mediatek,mt8173-vpu"
> > +  - reg: Must contain an entry for each entry in reg-names.
> > +  - reg-names: Must include the following entries:
> > +    "sram": SRAM base
> > +    "cfg_reg": Main configuration registers base
> > +  - interrupts: interrupt number to the cpu.
> > +  - clocks : clock name from clock manager
> > +  - clock-names: the clocks of the VPU H/W
> 
> You need to explicitly define the set of clock-names you expect here.
> 
> Mark.

Sorry, only one clock to enable VPU hardware.
We will modify to
- clocks : must contain one entry for each clock-names.
- clock-names : must be "main", It is the main clock of VPU.

Thanks..

> 
> > +  - iommus : phandle and IOMMU spcifier for the IOMMU that serves the VPU.
> > +
> > +Example:
> > +	vpu: vpu@10020000 {
> > +		compatible = "mediatek,mt8173-vpu";
> > +		reg = <0 0x10020000 0 0x30000>,
> > +		      <0 0x10050000 0 0x100>;
> > +		reg-names = "sram", "cfg_reg";
> > +		interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
> > +		clocks = <&topckgen TOP_SCP_SEL>;
> > +		clock-names = "main";
> > +		iommus = <&iommu M4U_PORT_VENC_RCPU>;
> > +	};
> > -- 
> > 1.7.9.5
> > 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
