From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
Subject: Re: [PATCH v9 1/2] media: rcar-csi2: add Renesas R-Car MIPI CSI-2
 receiver documentation
Date: Fri, 10 Nov 2017 12:20:13 +0100
Message-ID: <20171110112013.GC30830@bigcity.dyn.berto.se>
References: <20171109234320.13016-1-niklas.soderlund+renesas@ragnatech.se>
 <20171109234320.13016-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWDfxFQO8bwxHim=BXHtC37cWFgU-keDDNiLDtEhh7=Dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWDfxFQO8bwxHim=BXHtC37cWFgU-keDDNiLDtEhh7=Dw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fukawa <tomoharu.fukawa.eb-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

Thanks for your feedback.

On 2017-11-10 09:09:39 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Fri, Nov 10, 2017 at 12:43 AM, Niklas Söderlund
> <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org> wrote:
> > Documentation for Renesas R-Car MIPI CSI-2 receiver. The CSI-2 receivers
> > are located between the video sources (CSI-2 transmitters) and the video
> > grabbers (VIN) on Gen3 of Renesas R-Car SoC.
> >
> > Each CSI-2 device is connected to more then one VIN device which
> > simultaneously can receive video from the same CSI-2 device. Each VIN
> > device can also be connected to more then one CSI-2 device. The routing
> > of which link are used are controlled by the VIN devices. There are only
> > a few possible routes which are set by hardware limitations, which are
> > different for each SoC in the Gen3 family.
> >
> > To work with the limitations of routing possibilities it is necessary
> > for the DT bindings to describe which VIN device is connected to which
> > CSI-2 device. This is why port 1 needs to to assign reg numbers for each
> > VIN device that be connected to it. To setup and to know which links are
> > valid for each SoC is the responsibility of the VIN driver since the
> > register to configure it belongs to the VIN hardware.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>
> > ---
> >  .../devicetree/bindings/media/rcar-csi2.txt        | 103 +++++++++++++++++++++
> >  MAINTAINERS                                        |   1 +
> >  2 files changed, 104 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/rcar-csi2.txt
> >
> > diff --git a/Documentation/devicetree/bindings/media/rcar-csi2.txt b/Documentation/devicetree/bindings/media/rcar-csi2.txt
> > new file mode 100644
> > index 0000000000000000..39d41d82b71b60eb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/rcar-csi2.txt
> 
> > +Example:
> > +
> > +       csi20: csi2@fea80000 {
> > +               compatible = "renesas,r8a7796-csi2", "renesas,rcar-gen3-csi2";
> > +               reg = <0 0xfea80000 0 0x10000>;
> > +               interrupts = <0 184 IRQ_TYPE_LEVEL_HIGH>;
> > +               clocks = <&cpg CPG_MOD 714>;
> > +               power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> 
> resets?
> 
> I know this is just an example, but your prototype patches to add the
> csi nodes to r8a7795.dtsi also don't have reset properties.

Thanks for catching this, I had updated the DT series but forgot the 
example.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas Söderlund
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
