From: Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM: dt: da850: add nand_cs3 node label in the dtsi
Date: Thu, 4 Aug 2016 20:53:34 +0000
Message-ID: <20160804205334.GB15013@gobelin>
References: <20160803162528.2337-1-kbeldan@baylibre.com>
 <CAJaRCXNB+fC=0H_A4zSgQmeynZJsacY8kS2dLfstX=gfRzzfpA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJaRCXNB+fC=0H_A4zSgQmeynZJsacY8kS2dLfstX=gfRzzfpA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Karl Beldan <karl.beldan+oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 04, 2016 at 08:43:54PM +0000, Karl Beldan wrote:
> 2016-08-03 16:25 GMT+00:00 Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>:
> 
> > This will allow to adjust the related settings in the board files.
> >
> > Cc: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/da850.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> > index 25f0f8e..3a00978 100644
> > --- a/arch/arm/boot/dts/da850.dtsi
> > +++ b/arch/arm/boot/dts/da850.dtsi
> > @@ -375,7 +375,7 @@
> >                         dma-names = "tx", "rx";
> >                 };
> >         };
> > -       nand_cs3@62000000 {
> > +       nand_cs3: nand_cs3@62000000 {
> >                 compatible = "ti,davinci-nand";
> >                 reg = <0x62000000 0x807ff
> >                        0x68000000 0x8000>;
> > --
> > 2.9.0.rc1
> >
Please discard this one, I think I'll move things around for the nand.
 
Karl
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
