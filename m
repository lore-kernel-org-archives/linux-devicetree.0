From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/2] video: ARM CLCD: Add DT support
Date: Thu, 13 Mar 2014 10:30:50 +0100
Message-ID: <CACRpkdYBuxYko5JD5ZCfoQq+PeXtkKP9eprk9HM=ghW2YMoMuA@mail.gmail.com>
References: <1394036606-17784-1-git-send-email-pawel.moll@arm.com>
	<53184C2E.3000807@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53184C2E.3000807-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Jonathan Austin <Jonathan.Austin-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 6, 2014 at 11:21 AM, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org> wrote:
> Hi Pawel,
>
> On 05/03/14 18:23, Pawel Moll wrote:
>> This patch adds basic DT bindings for the PL11x CLCD cells
>> and make their fbdev driver use them.
>
> Is this an old HW, and presumably there won't be new users for it?

AFAICT ARM really like to re-synthesize this piece of HW in every
new reference design they make. Plus a number of manufacturers
have used it in elder systems.

> If
> yes, this is probably fine. If not, you might want to look at the video
> ports and endpoints, which is used by at least three not-yet-merged series:
>
> [PATCHv3 00/41] OMAPDSS: DT support v3
> [PATCH v5 00/11] imx-drm dt bindings
> [RFC PATCH v2 00/21] Add DSI display support for Exynos based boards
>
> Using bindings like that would be more future proof, even if the current
> driver doesn't use them.

I take it that it shouldn't matter if the driver is for framebuffer or
DRM (as was implied by some answer here) the hardware
description should be the same no matter what, so the more
furture-proof the better.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
