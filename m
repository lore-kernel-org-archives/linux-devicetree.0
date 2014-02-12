From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6qdl-sabresd: Do not place regulator nodes
 under simple-bus
Date: Wed, 12 Feb 2014 20:28:39 +0800
Message-ID: <20140212122837.GD24834@S2101-09.ap.freescale.net>
References: <1392165078-25794-1-git-send-email-festevam@gmail.com>
 <20140212092227.GA24834@S2101-09.ap.freescale.net>
 <20140212095450.GB21992@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140212095450.GB21992-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 12, 2014 at 09:54:50AM +0000, Mark Rutland wrote:
> > I take it as an unnecessary churn, unless I see the consensus from most
> > of DT maintainers and arm-soc folks that we should make this change.
> > And see comment below ...
> 
> My concern is that the simple-bus is being used in a nonsensical way,
> with a meaningless address space and reg values on children. While this
> currently works it is not correct, and it's not even necessary. I would
> like to limit the misuse of these constructs so as to prevent others
> from making the same mistakes.

Unfortunately, it's already been used quite widely.  This is not IMX
specific, and you can grep arch/arm/boot/dts to get the idea.  I'm not
sure if it's worth the churn to 'fix' it.  In these days, arm-soc folks
are quite sensitive to the number of IMX patches and change sets.  50
LOC change for one board dts, and we now have ~70 files for IMX.  That's
why I would like to get the agreement from arm-soc folks that we should
really make such change. 

> 
> > 
> > > 
> > >  arch/arm/boot/dts/imx6qdl-sabresd.dtsi | 51 ++++++++++++++--------------------
> > >  1 file changed, 21 insertions(+), 30 deletions(-)
> > > 
> > > diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> > > index 0d816d3..d7df5b2 100644
> > > --- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> > > +++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> > > @@ -18,38 +18,29 @@
> > >  		reg = <0x10000000 0x40000000>;
> > >  	};
> > >  
> > > -	regulators {
> > > -		compatible = "simple-bus";
> > > -		#address-cells = <1>;
> > > -		#size-cells = <0>;
> > > -
> > > -		reg_usb_otg_vbus: regulator@0 {
> > > -			compatible = "regulator-fixed";
> > > -			reg = <0>;
> > > -			regulator-name = "usb_otg_vbus";
> > > -			regulator-min-microvolt = <5000000>;
> > > -			regulator-max-microvolt = <5000000>;
> > > -			gpio = <&gpio3 22 0>;
> > > -			enable-active-high;
> > > -		};
> > > +	reg_usb_otg_vbus: regulator@0 {
> > 
> > nodename@num should only be used for nodes that have 'reg' property.
> > Why are you dropping 'reg' property here?  Right, it does not compile if
> > you do not drop it.  You can take it as a reason of why I endorse
> > simple-bus regulators container.
> 
> I don't think the logical jump from "it does not compile" to "I endorse
> simple-bus regulators container" makes any sense. They're two separate
> issues.

You're right :)

> 
> The unit-addresses and reg values can be dropped. They are not in the
> regulator-fixed binding, and were never necessary. All that's necessary
> is a unique name, and unit-addresses (which required a reg) were misused
> to provide uniqueness. With that fixed, this will compile.

IIRC, ePAPR recommends to use generic node name and have
unit-addresses for uniqueness.  That's why I sent patch [1] to follow
the way that tegra and other platforms names them.  Now you're
suggesting to go back?

Shawn

[1] http://www.spinics.net/lists/arm-kernel/msg284474.html

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
