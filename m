From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH RFC V3 2/3] mxs: add driver for ocotp in i.MX23 and i.MX28
Date: Mon, 20 Oct 2014 19:32:48 +0200
Message-ID: <2122231.Xv3WK03QJQ@wuerfel>
References: <1413628372-2809-1-git-send-email-stefan.wahren@i2se.com> <3434817.dk7dLDFrcN@wuerfel> <54452B15.50502@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54452B15.50502-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 20 October 2014 17:32:37 Stefan Wahren wrote:
> 
> Am 20.10.2014 um 16:44 schrieb Arnd Bergmann:
> > On Saturday 18 October 2014 10:32:51 Stefan Wahren wrote:
> >> This patch brings readonly support for the On Chip OTP cells in the i.MX23
> >> and i.MX28 processor. The driver uses files (one for each cell) in sysfs
> >> as interface.
> >>
> >> ...
> > I think this needs to be an MTD driver, not a "misc" driver, and it
> > should use the proper MTD interfaces instead of introducing an
> > incompatible set of interfaces.
> >
> >       Arnd
> 
> phew that sounds like a lot of work and much complexity.
> 
> Am i right, that i should drop the sysfs interface?
> 
> Does MTD drivers have a readonly text (non binary) user interface?

I haven't looked at the MTD OTP interface in detail, but most
of the other SoCs seem to use it.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
