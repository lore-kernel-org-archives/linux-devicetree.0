From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [RESEND Patch 3/3] ARM: Kirkwood: DT: Add missing vendor prefix
Date: Thu, 6 Mar 2014 10:05:07 +0100
Message-ID: <20140306090507.GB4780@lunn.ch>
References: <1394055207-4639-1-git-send-email-andrew@lunn.ch>
 <1394055207-4639-4-git-send-email-andrew@lunn.ch>
 <CAL_JsqKGGgA_bGLXsBV7QrEjEvzupXBPNegWyxMhMGeoiWQ++Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKGGgA_bGLXsBV7QrEjEvzupXBPNegWyxMhMGeoiWQ++Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 05, 2014 at 08:53:25PM -0600, Rob Herring wrote:
> On Wed, Mar 5, 2014 at 3:33 PM, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:
> > Add vendor prefixes to compatible strings where they are missing.
> 
> Please explain why you are breaking the ABI and why that is okay.
> Normally, you should just leave this as is or add the new compatible
> string rather than change it.

Ah, sorry, thought it was well known. Both I2C and MTD ignore the
vendor prefix. I'm adding them for consistency, and to keep checkpatch
happy.

I can respin and add a comment about this.

  Andrew

> 
> Rob
> 
> >
> > Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/kirkwood-b3.dts              | 2 +-
> >  arch/arm/boot/dts/kirkwood-cloudbox.dts        | 2 +-
> >  arch/arm/boot/dts/kirkwood-dreamplug.dts       | 2 +-
> >  arch/arm/boot/dts/kirkwood-mv88f6281gtw-ge.dts | 2 +-
> >  arch/arm/boot/dts/kirkwood-ns2-common.dtsi     | 2 +-
> >  arch/arm/boot/dts/kirkwood-nsa310.dts          | 2 +-
> >  arch/arm/boot/dts/kirkwood-nsa310a.dts         | 2 +-
> >  arch/arm/boot/dts/kirkwood-openblocks_a6.dts   | 2 +-
> >  arch/arm/boot/dts/kirkwood-openblocks_a7.dts   | 2 +-
> >  9 files changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/kirkwood-b3.dts b/arch/arm/boot/dts/kirkwood-b3.dts
> > index 40791053106b..6becedebaa4e 100644
> > --- a/arch/arm/boot/dts/kirkwood-b3.dts
> > +++ b/arch/arm/boot/dts/kirkwood-b3.dts
> > @@ -76,5 +76,5 @@
> >                                 #address-cells = <1>;
> >                                 #size-cells = <1>;
> > -                               compatible = "m25p16";
> > +                               compatible = "st,m25p16";
> >                                 reg = <0>;
> >                                 spi-max-frequency = <40000000>;
> > diff --git a/arch/arm/boot/dts/kirkwood-cloudbox.dts b/arch/arm/boot/dts/kirkwood-cloudbox.dts
> > index 0e06fd3cee4d..3b62aeeaa3a2 100644
> > --- a/arch/arm/boot/dts/kirkwood-cloudbox.dts
> > +++ b/arch/arm/boot/dts/kirkwood-cloudbox.dts
> > @@ -47,5 +47,5 @@
> >                                 #address-cells = <1>;
> >                                 #size-cells = <1>;
> > -                               compatible = "mx25l4005a";
> > +                               compatible = "mxicy,mx25l4005a";
> >                                 reg = <0>;
> >                                 spi-max-frequency = <20000000>;
> > diff --git a/arch/arm/boot/dts/kirkwood-dreamplug.dts b/arch/arm/boot/dts/kirkwood-dreamplug.dts
> > index ef3463e0ae19..28b3ee369778 100644
> > --- a/arch/arm/boot/dts/kirkwood-dreamplug.dts
> > +++ b/arch/arm/boot/dts/kirkwood-dreamplug.dts
> > @@ -44,5 +44,5 @@
> >                                 #address-cells = <1>;
> >                                 #size-cells = <1>;
> > -                               compatible = "mx25l1606e";
> > +                               compatible = "mxicy,mx25l1606e";
> >                                 reg = <0>;
> >                                 spi-max-frequency = <50000000>;
> > diff --git a/arch/arm/boot/dts/kirkwood-mv88f6281gtw-ge.dts b/arch/arm/boot/dts/kirkwood-mv88f6281gtw-ge.dts
> > index 2cb0dc529165..32c6fb4a1162 100644
> > --- a/arch/arm/boot/dts/kirkwood-mv88f6281gtw-ge.dts
> > +++ b/arch/arm/boot/dts/kirkwood-mv88f6281gtw-ge.dts
> > @@ -57,5 +57,5 @@
> >                                 #address-cells = <1>;
> >                                 #size-cells = <1>;
> > -                               compatible = "mx25l12805d";
> > +                               compatible = "mxicy,mx25l12805d";
> >                                 reg = <0>;
> >                                 spi-max-frequency = <50000000>;
> > diff --git a/arch/arm/boot/dts/kirkwood-ns2-common.dtsi b/arch/arm/boot/dts/kirkwood-ns2-common.dtsi
> > index 743152f31a81..594bad0e386e 100644
> > --- a/arch/arm/boot/dts/kirkwood-ns2-common.dtsi
> > +++ b/arch/arm/boot/dts/kirkwood-ns2-common.dtsi
> > @@ -33,5 +33,5 @@
> >                                 #address-cells = <1>;
> >                                 #size-cells = <1>;
> > -                               compatible = "mx25l4005a";
> > +                               compatible = "mxicy,mx25l4005a";
> >                                 reg = <0>;
> >                                 spi-max-frequency = <20000000>;
> > diff --git a/arch/arm/boot/dts/kirkwood-nsa310.dts b/arch/arm/boot/dts/kirkwood-nsa310.dts
> > index 03fa24cf3344..0a07af9d8e58 100644
> > --- a/arch/arm/boot/dts/kirkwood-nsa310.dts
> > +++ b/arch/arm/boot/dts/kirkwood-nsa310.dts
> > @@ -105,5 +105,5 @@
> >
> >                         adt7476: adt7476a@2e {
> > -                               compatible = "adt7476";
> > +                               compatible = "adi,adt7476";
> >                                 reg = <0x2e>;
> >                         };
> > diff --git a/arch/arm/boot/dts/kirkwood-nsa310a.dts b/arch/arm/boot/dts/kirkwood-nsa310a.dts
> > index a5e779452867..27ca6a79c48a 100644
> > --- a/arch/arm/boot/dts/kirkwood-nsa310a.dts
> > +++ b/arch/arm/boot/dts/kirkwood-nsa310a.dts
> > @@ -95,5 +95,5 @@
> >
> >                         lm85: lm85@2e {
> > -                               compatible = "lm85";
> > +                               compatible = "national,lm85";
> >                                 reg = <0x2e>;
> >                         };
> > diff --git a/arch/arm/boot/dts/kirkwood-openblocks_a6.dts b/arch/arm/boot/dts/kirkwood-openblocks_a6.dts
> > index b88da9392c32..0650beafc1de 100644
> > --- a/arch/arm/boot/dts/kirkwood-openblocks_a6.dts
> > +++ b/arch/arm/boot/dts/kirkwood-openblocks_a6.dts
> > @@ -41,5 +41,5 @@
> >
> >                         s35390a: s35390a@30 {
> > -                               compatible = "s35390a";
> > +                               compatible = "sii,s35390a";
> >                                 reg = <0x30>;
> >                         };
> > diff --git a/arch/arm/boot/dts/kirkwood-openblocks_a7.dts b/arch/arm/boot/dts/kirkwood-openblocks_a7.dts
> > index b2f7cae06839..895506743e4d 100644
> > --- a/arch/arm/boot/dts/kirkwood-openblocks_a7.dts
> > +++ b/arch/arm/boot/dts/kirkwood-openblocks_a7.dts
> > @@ -53,5 +53,5 @@
> >
> >                         s24c02: s24c02@50 {
> > -                               compatible = "24c02";
> > +                               compatible = "at,24c02";
> >                                 reg = <0x50>;
> >                         };
> > --
> > 1.9.0
> >
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
