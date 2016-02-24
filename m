From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v3 0/6] arm: Add Artpec-6 SoC
Date: Wed, 24 Feb 2016 14:00:03 -0800
Message-ID: <20160224220003.GO10126@localhost>
References: <cover.1455205057.git.larper@axis.com>
 <2697188.EpDoHh0fx4@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2697188.EpDoHh0fx4@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Lars Persson <lars.persson-VrBV9hrLPhE@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lars Persson <larper-VrBV9hrLPhE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hej,

On Thu, Feb 11, 2016 at 05:20:27PM +0100, Arnd Bergmann wrote:
> On Thursday 11 February 2016 17:06:15 Lars Persson wrote:
> > Basic support for the Axis Artpec-6 ARM SoC. Timers, interrupts, UARTs and
> > ethernet are wired up.
> > 
> > Changes since v2:
> > - Create a syscon binding for the system controller.
> > - Clock patches split out to new patch series "clk: Add Artpec-6 SoC support".
> 
> Looks all good to me now, impressive for v3 on a new platform port!
> 
> We'll apply it in the next few days, unless further review comments come in.

Indeed, nice and clean. I have two minor nits:

1) We prefix with ARM:, not arm:. I fixed this up for you. I also added ARM:
   dts: artpeg: ... on the dts changes. Not a huge deail on those.

2) Several of the patches lacked description. Subject pretty much says it all,
   but it's still nice to have a sentence or two as description. Again, not
   a huge deal, and I applied anyway, but for the future think about it.


That being said, I've applied the series across next/soc, next/dt and
next/defconfig. Thanks!


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
