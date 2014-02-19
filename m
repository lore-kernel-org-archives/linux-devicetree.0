From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: devicetree repository separation/migration
Date: Wed, 19 Feb 2014 10:22:03 +0100
Message-ID: <20140219092203.GX17250@pengutronix.de>
References: <20140217180544.GU7862@titan.lakedaemon.net>
 <20140218155750.GS17250@pengutronix.de>
 <20140218181854.GB7862@titan.lakedaemon.net>
 <CAOesGMhvoB7vRf3H1kMaL5+MgZ2gJy=ZVNU0gsXVye9S4YGBOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMhvoB7vRf3H1kMaL5+MgZ2gJy=ZVNU0gsXVye9S4YGBOg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 18, 2014 at 11:47:56AM -0800, Olof Johansson wrote:
> On Tue, Feb 18, 2014 at 10:18 AM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> > On Tue, Feb 18, 2014 at 04:57:50PM +0100, Sascha Hauer wrote:
> >> On Mon, Feb 17, 2014 at 01:05:44PM -0500, Jason Cooper wrote:
> > ...
> >> >   - Is the Linux development workflow ready for devicetree to move out
> >> >     of the Linux Kernel?
> >>
> >> I hope so since keeping the devicetrees in sync with the kernel is a
> >> pain for all external users.
> >
> > Well, I haven't heard any screams yet.  I suspect people are waiting for
> > details on the exact form it would take before complaining...
> 
> I'M SCREAMING NOW. :-)
> 
> Honestly though, I think we need to do this carefully. Even though we
> don't like it, there are still lots of bindings in flux and
> cross-dependencies between two independent repos will be a major pain.
> 
> I think we have two options:
> 
> 1. Bring out everything in the current kernel repo to a separate one,
> but do it my mirroring over. Changes go into the kernel repo first and
> then comes over to this one, but other projects can mirror the
> standalone repo without downloading a whole kernel tree.
> 
> 2. Remove the kernel contents and move it over to the new repo. This
> should be done independently for each platform, and the maintainers
> get to decide if, when and how they do it. Some platforms are ready
> for it (some have been for a long time), others are not. And it's up
> to the maintainer, since they are the ones we will yell at when they
> make our life miserable by adding cross-dependencies with an external
> repo. Breakage due to the move is something we should have to put up
> with, etc.

Doing the move on a SoC/Maintainer basis is a good idea. I think the
move only makes sense for SoCs where the basic infrastructure devices
which are used by other devices are ironed out, namely interrupts,
GPIOs, DMA channels, pinctrl. As long as these are not present in a
devicetree it won't be usable by future kernels.

For i.MX I made the experience that the builtin barebox devicetree very
often is enough for my usecases so that I just throw a
imx_v6_v7_defcfonfig kernel to the board and don't have to think about
devicetrees anymore (This comes to an abrupt end when graphics is involved
though)

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
