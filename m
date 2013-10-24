From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv6][ 3/7] ARM: imx{25,27} DT: Permit the selection of the
 imxfb framebuffer driver.
Date: Thu, 24 Oct 2013 16:31:45 +0800
Message-ID: <20131024083143.GB13614@S2101-09.ap.freescale.net>
References: <1382601665-6830-1-git-send-email-denis@eukrea.com>
 <1382601665-6830-3-git-send-email-denis@eukrea.com>
 <20131024081531.GA13614@S2101-09.ap.freescale.net>
 <20131024102011.610e5d8b@e6520eb>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131024102011.610e5d8b@e6520eb>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Cc: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 24, 2013 at 10:20:11AM +0200, Eric B=E9nard wrote:
> Hi Shawn,
>=20
> Le Thu, 24 Oct 2013 16:15:34 +0800,
> Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> a =E9crit :
> > >  config FB_IMX
> > >  	tristate "Freescale i.MX1/21/25/27 LCD support"
> > > -	depends on FB && IMX_HAVE_PLATFORM_IMX_FB
> > > +	depends on FB && HAVE_IMX_FB
> >=20
> > Or simply have it depend on ARCH_MXC?
> >=20
> > 	depends on FB && ARCH_MXC
> >=20
> but not all MXC have IMX_FB : isn't that a problem ?

Is it really a problem that you see this option when you configure an
imx51 kernel?  The prompt clearly tells you do not need this option for
an imx51 kernel.  Or will it cause any real problem even if you select
it for an imx51 kernel, except you build in a driver which will never b=
e
instantiated?  I've seen drivers even start drop ARCH_* dependency to
get a better randconfig build test coverage.

Shawn

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
