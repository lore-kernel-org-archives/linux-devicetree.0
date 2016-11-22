From: Rick Chang <rick.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v6 3/3] arm: dts: mt2701: Add node for Mediatek JPEG
 Decoder
Date: Tue, 22 Nov 2016 11:21:45 +0800
Message-ID: <1479784905.8964.15.camel@mtksdaap41>
References: <1479353915-5043-1-git-send-email-rick.chang@mediatek.com>
         <1479353915-5043-4-git-send-email-rick.chang@mediatek.com>
         <d602365a-e87b-5bae-8698-bd43063ef079@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d602365a-e87b-5bae-8698-bd43063ef079-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Hans,

On Mon, 2016-11-21 at 15:51 +0100, Hans Verkuil wrote:
> On 17/11/16 04:38, Rick Chang wrote:
> > Signed-off-by: Rick Chang <rick.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> > This patch depends on:
> >   CCF "Add clock support for Mediatek MT2701"[1]
> >   iommu and smi "Add the dtsi node of iommu and smi for mt2701"[2]
> >
> > [1] http://lists.infradead.org/pipermail/linux-mediatek/2016-October/007271.html
> > [2] https://patchwork.kernel.org/patch/9164013/
> 
> I assume that 1 & 2 will appear in 4.10? So this patch needs to go in 
> after the
> other two are merged in 4.10?
> 
> Regards,
> 
> 	Hans

[1] will appear in 4.10, but [2] will appear latter than 4.10.So this
patch needs to go in after [1] & [2] will be merged in 4.11.

> > ---
> >  arch/arm/boot/dts/mt2701.dtsi | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
> > index 8f13c70..4dd5048 100644
> > --- a/arch/arm/boot/dts/mt2701.dtsi
> > +++ b/arch/arm/boot/dts/mt2701.dtsi
> > @@ -298,6 +298,20 @@
> >  		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
> >  	};
> >
> > +	jpegdec: jpegdec@15004000 {
> > +		compatible = "mediatek,mt2701-jpgdec";
> > +		reg = <0 0x15004000 0 0x1000>;
> > +		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
> > +		clocks =  <&imgsys CLK_IMG_JPGDEC_SMI>,
> > +			  <&imgsys CLK_IMG_JPGDEC>;
> > +		clock-names = "jpgdec-smi",
> > +			      "jpgdec";
> > +		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
> > +		mediatek,larb = <&larb2>;
> > +		iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
> > +			 <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
> > +	};
> > +
> >  	vdecsys: syscon@16000000 {
> >  		compatible = "mediatek,mt2701-vdecsys", "syscon";
> >  		reg = <0 0x16000000 0 0x1000>;
> >


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
