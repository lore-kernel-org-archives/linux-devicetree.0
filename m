From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCHv4 01/10] arm: mvebu: fix vendor prefix typo in kirkwood-synology.dtsi
Date: Thu, 20 Nov 2014 08:35:43 +0100
Message-ID: <7770322.bXz9M2IL1d@wuerfel>
References: <cover.1416351425.git.arno@natisbad.org> <20141120015519.GA22670@titan.lakedaemon.net> <20141120050213.GB2596@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141120050213.GB2596-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 20 November 2014 06:02:13 Andrew Lunn wrote:
> On Wed, Nov 19, 2014 at 08:55:19PM -0500, Jason Cooper wrote:
> > Andrew,
> > 
> > On Wed, Nov 19, 2014 at 12:01:36AM +0100, Arnaud Ebalard wrote:
> > > 
> > > As reported by Andrew, the vendor prefix for Seiko Instruments, Inc.
> > > S-35390A I2C RTC chip in kirkwood-synology.dtsi has a typo (ssi
> > > instead of sii). This patches fixes it.
> > > 
> > > Reported-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> > > Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
> > > ---
> > >  arch/arm/boot/dts/kirkwood-synology.dtsi | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm/boot/dts/kirkwood-synology.dtsi b/arch/arm/boot/dts/kirkwood-synology.dtsi
> > > index 811e0971fc58..8be5b2e4626e 100644
> > > --- a/arch/arm/boot/dts/kirkwood-synology.dtsi
> > > +++ b/arch/arm/boot/dts/kirkwood-synology.dtsi
> > > @@ -266,7 +266,7 @@
> > >  
> > >                     s35390a: s35390a@30 {
> > >                             status = "disabled";
> > > -                           compatible = "ssi,s35390a";
> > > +                           compatible = "sii,s35390a";
> > 
> > Should the driver now support both variants for backward compatibility?
> 
> Hi Jason
> 
> This is an i2c device. i2c totally ignores the vendor. It is optional.
> So there is no backward compatibility issues.
> 

This question keeps coming up, so I'd suggest explaining it in the
patch changelog.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
