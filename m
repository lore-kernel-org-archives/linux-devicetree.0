From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 4/4] arch: arm: boot: dts: Added correct vendor-prefix
 with device name to compatible property
Date: Tue, 7 Oct 2014 13:35:14 +0100
Message-ID: <20141007123514.GP24725@leverpostej>
References: <1412682308-8784-1-git-send-email-darshanapadmadas@gmail.com>
 <11076749.g7xZQflTCQ@wuerfel>
 <20141007120812.GJ24725@leverpostej>
 <8401228.DSnFf2fgRn@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8401228.DSnFf2fgRn@wuerfel>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Darshana Padmadas <darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 07, 2014 at 01:31:23PM +0100, Arnd Bergmann wrote:
> On Tuesday 07 October 2014 13:08:12 Mark Rutland wrote:
> > On Tue, Oct 07, 2014 at 12:49:02PM +0100, Arnd Bergmann wrote:
> > > On Tuesday 07 October 2014 17:15:08 Darshana Padmadas wrote:
> > > >                 /* ALS and Proximity sensor */
> > > >                 isl29028@44 {
> > > > -                       compatible = "isil,isl29028";
> > > > +                       compatible = "isl,isl29028";
> > > >                         reg = <0x44>;
> > > >                         interrupt-parent = <&gpio>;
> > > >                         interrupts = <TEGRA_GPIO(L, 0) IRQ_TYPE_LEVEL_HIGH>;
> > > > 
> > > 
> > > Does this intentionally list only the new string?
> > > 
> > > If we want compatibility between new dts files and old kernels, this would
> > > need to be 
> > > 
> > >       compatible = "isl,isl29028", compatible = "isil,isl29028";
> > 
> > Are we aiming for new dts wto work with old kernels? It's nice if they
> > do, but I don't think it should be necessary. Old DTBs should definitely
> > work with a new kernel, though.
> > 
> > Personally I'd rather see one string (preferably the canonical one, but
> > the deprecated one is ok) than two strings when those strings are for
> > the exact same device.
> > 
> 
> Ok, fair enough. I think we should have the new name in dts files
> normally then, in order to avoid spreading the mistake further when
> someone copies it.

Sounds good to me.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
