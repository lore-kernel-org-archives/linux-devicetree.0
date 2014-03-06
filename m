From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 1/2] video: ARM CLCD: Add DT support
Date: Thu, 06 Mar 2014 15:23:51 +0000
Message-ID: <1394119431.4160.84.camel@hornet>
References: <1394036606-17784-1-git-send-email-pawel.moll@arm.com>
	 <53184C2E.3000807@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53184C2E.3000807-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Jonathan Austin <Jonathan.Austin-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2014-03-06 at 10:21 +0000, Tomi Valkeinen wrote:
> Is this an old HW, and presumably there won't be new users for it? If
> yes, this is probably fine. 

There is a DRM driver in the works, actually...

> If not, you might want to look at the video
> ports and endpoints, which is used by at least three not-yet-merged series:
> 
> [PATCHv3 00/41] OMAPDSS: DT support v3
> [PATCH v5 00/11] imx-drm dt bindings
> [RFC PATCH v2 00/21] Add DSI display support for Exynos based boards
> 
> Using bindings like that would be more future proof, even if the current
> driver doesn't use them.

... and this makes me try to get out of its way. In other words, I fully
agree with you, but I don't think this applies to this particular patch,
as I'm not even trying to represent the display pipeline. The (optional)
"display-timings" sub-node has been "borrowed" from other older drivers
and can be easily deprecated in the future, replaced by standard ones
(whatever final shape they will take :-). All other extra properties are
CLCD-specific and orthogonal.

Pawel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
