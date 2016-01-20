From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/4] Documentation: fsl-quadspi: Add fsl,ls2080a-dspi
 compatible string
Date: Wed, 20 Jan 2016 09:16:20 -0600
Message-ID: <20160120151620.GA11231@rob-hp-laptop>
References: <1450954863-7540-1-git-send-email-yao.yuan@freescale.com>
 <20151229183501.GH12450@rob-hp-laptop>
 <AM2PR04MB07228C97A751DA40EEDD231489FD0@AM2PR04MB0722.eurprd04.prod.outlook.com>
 <CAL_Jsq+fsqJkN+5859rLm56Ch1k48LRDsRMP6KFHywnCNyf=kA@mail.gmail.com>
 <AM2PR04MB07220B81AE758762CB6B13D489CA0@AM2PR04MB0722.eurprd04.prod.outlook.com>
 <CAL_Jsq+FVonqh8EbY4FFqHzxGZ_kDWGoC2jKNiGioEV96FXD+w@mail.gmail.com>
 <AM2PR04MB07222950482F090A9448115E89C00@AM2PR04MB0722.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AM2PR04MB07222950482F090A9448115E89C00-IPoeDzmMJYrzmGvksFXQpM9NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yao Yuan <yao.yuan-3arQi8VN3Tc@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 18, 2016 at 06:43:18AM +0000, Yao Yuan wrote:
> On Wed, Jan 13, 2016 at 06:13 AM, Rob Herring wrote:
> > On Mon, Jan 11, 2016 at 10:36 PM, Yao Yuan <yao.yuan-3arQi8VN3Tc@public.gmane.org> wrote:
> > > On Thu, Dec 31, 2015 at 10:35PM, Yao Yuan <yao.yuan-3arQi8VN3Tc@public.gmane.org> wrote:
> > >> On Wed, Dec 30, 2015 at 11:20 PM, Rob Herring wrote:
> > >> > On Tue, Dec 29, 2015 at 9:17 PM, Yao Yuan <yao.yuan-3arQi8VN3Tc@public.gmane.org> wrote:
> > >> > > Hi Rob,
> > >> > >
> > >> > > Thanks for your review.
> > >> > > So you mean that I should add the commit message for why I add
> > >> > > this new
> > >> > compatible?
> > >> >
> > >> > Please don't top post on the lists.
> > >> >
> > >> > No, the binding doc should explain what are valid combinations of
> > >> > compatible strings and the order when the dts can have multiple
> > >> > strings. For example, is this valid:
> > >> >
> > >> > compatible = "fsl,vf610-dspi", "fsl,ls2080a-dspi";
> > >> >
> > >> > In other words, I should be able to check a dts file against what
> > >> > the binding doc says.
> > >> >
> > >> > Rob
> > >>
> > >> OK, I got it.
> > >> The "fsl,vf610-dspi", "fsl,ls1021a-v1.0-dspi", "fsl,ls2085a-dspi" is
> > >> valid and used in driver.
> > >> But "fsl,ls2080a-dspi" is just used for platform flag.
> > >> Could you help to give an example that how can I explain it in Documents?
> > >> Or should I not write this compatible in Document.
> > >>
> > >> I find that many compatible strings like this (not valid just a
> > >> platform flag) for other driver are not record in document.
> > 
> > Well, things sneak in without getting documented. Also, lots of PPC bindings
> > predate our documentation requirement.
> > 
> > >>
> > >> Thanks.
> > >>
> > >> Yuan Yao
> > >
> > > Hi Rob,
> > > How about like this:
> > > diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> > > b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> > > index 00c587b..7a9a523 100644
> > > --- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> > > +++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> > > @@ -4,6 +4,8 @@ Required properties:
> > >    - compatible : Should be "fsl,vf610-qspi", "fsl,imx6sx-qspi",
> > >                  "fsl,imx7d-qspi", "fsl,imx6ul-qspi",
> > >                  "fsl,ls1021-qspi"
> > > +       Invalid compatible just for SOC flag:
> > > +               "fsl,ls2080a-qspi"
> > 
> > This doesn't make sense to me. Typically, we see something like:
> > 
> > Should be one of:
> >   "vendor,soc1-device"
> >   "vendor,soc2-device"
> > Followed by "vendor,soc0-device"
> > 
> > Sometime the last entry is a generic string. Here soc0 is the first SOC with the
> > block. Later SOCs have "the same" block, but new compatible strings in addition
> > in case any changes or errata are found that the driver needs to deal with.
> > 
> 
> Hi Rob,
> 
> Thanks for your suggestion,
> So how about like this:
> --- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> @@ -2,7 +2,10 @@
> 
>  Required properties:
>    - compatible : Should be "fsl,vf610-qspi", "fsl,imx6sx-qspi",
> -                "fsl,imx7d-qspi", "fsl,imx6ul-qspi"
> +                "fsl,imx7d-qspi", "fsl,imx6ul-qspi",
> +                "fsl,ls1021a-qspi",
> +                Or
> +                "fsl,ls2080a-qspi" followed by "fsl,ls1021a-qspi",

That looks fine.

> But if we add addition information in binging documents, once any changes or errata are found that the driver needs to deal (such as "vendor,soc1-device"), the binging document should also be update. 
> Because at that time the driver should also match "vendor,soc1-device"
> So at that time we can't say "vendor,soc1-device"should followed by "vendor,soc0-device"

>From day 1 of SOC1 you should have both compatible strings. Initially 
the driver can match on SOC0. When you find some errata or other 
difference, then you modify the driver and match on SOC1. No DTS change 
needed.
 
> It seems the only benefit that may keep the dts no changes.

That is the goal and why we require specific compatible strings even if 
not needed at the time.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
