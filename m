From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 1/2] video: ARM CLCD: Add DT support
Date: Mon, 10 Mar 2014 12:09:42 +0000
Message-ID: <1394453382.3853.6.camel@hornet>
References: <1394036606-17784-1-git-send-email-pawel.moll@arm.com>
	 <53184C2E.3000807@ti.com> <1394119431.4160.84.camel@hornet>
	 <5319AF00.5030602@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5319AF00.5030602-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Jonathan Austin <Jonathan.Austin-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2014-03-07 at 11:35 +0000, Tomi Valkeinen wrote:
> > ... and this makes me try to get out of its way. In other words, I fully
> > agree with you, but I don't think this applies to this particular patch,
> > as I'm not even trying to represent the display pipeline. The (optional)
> 
> Right, you are not, at the moment. My point was, if the driver is
> extended later to support pipelines, or common panel/encoder drivers,
> you (most likely) need to have similar bindings than the other people use.

No argument here.

> Note that the same DT bindings you add here should also work for the DRM
> driver in the future. So, in fact, the question is extended to: will the
> fbdev 

No, I don't think so. It's a end of line for it, I believe. From my
personal point of view the main goal is to fill the last gap between DT
and non-DT support on one of the Versatile Express boards - CLCD works
fine when booted with ATAGs, doesn't work when booted with DT. It looks
bad.

> or drm driver support common panels/encoders?

I would hope so, yes. VE display pipeline is quite complex (more than I
would hope ;-) so to implement KMS in a proper way (with hotplugging,
bells and whistles) it will have to know more than now. But it's out of
scope for me.

Pawel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
