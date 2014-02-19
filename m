From: Warner Losh <wlosh-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Wed, 19 Feb 2014 13:28:30 -0700
Message-ID: <32DE2EF2-161A-42D5-A2CC-44C4C31FD504@bsdimp.com>
References: <20140217180544.GU7862@titan.lakedaemon.net> <20140218155750.GS17250@pengutronix.de> <20140218181854.GB7862@titan.lakedaemon.net> <5303DB5B.2090505@gmail.com> <20140219184626.GP7862@titan.lakedaemon.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140219184626.GP7862-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Feb 19, 2014, at 11:46 AM, Jason Cooper wrote:
> I think the long term health of the devicetree would benefit greatly
> from being more detached than it currently is.  It would force everyone
> to "Pay the bills".
> 
> The time might not be right now, and it probably will take one of the
> more gradual forms Olof suggested.  But I think it should happen at some
> point to help it grow up.
> 
> And we still have the short term problem of facilitating other projects
> use of the devicetree.  Which can only make it more robust and accepted
> by default.

I know it would be easier to import new device tree files into FreeBSD, and
support the latest version of the spec if there was a clean way of doing so.
Right now, with the files comingled with other files in the Linux tree it is harder
to do so than if they were stand-alone. Especially if the compiler could also
come from a near-by place.

Warner

P.S. I've been championing the use of fdt in FreeBSD for a few years now. I
am presently converting over all our Atmel support to use fdt, as well as
championing cross-SoC and cross-architecture use of fdt + gpio, fdt + i2c, etc.
Just so you know who I am, in case the name in unfamiliar to you...--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
