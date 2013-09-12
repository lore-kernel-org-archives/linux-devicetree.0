From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] video: ARM CLCD: Add DT support
Date: Thu, 12 Sep 2013 16:19:45 -0600
Message-ID: <52323E01.2070902@wwwdotorg.org>
References: <1378488201-21146-1-git-send-email-pawel.moll@arm.com>  <522BAED9.4020301@gmail.com> <1378725559.4082.28.camel@hornet>  <522F91F8.6010207@gmail.com> <1378907036.4082.105.camel@hornet>  <5230DD1C.6060606@gmail.com> <1378999425.13571.54.camel@hornet> <1379009416.13571.68.camel@hornet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379009416.13571.68.camel@hornet>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/12/2013 12:10 PM, Pawel Moll wrote:
> On Thu, 2013-09-12 at 16:23 +0100, Pawel Moll wrote:
>> Anyway, I think I've got an idea how to render the problem custom panel
>> properties invalid. If so, I'll send another version of the patch.
> 
> So, instead of describing the panel I thought I'd go lower level and try
> to describe the CLCD's signal functions. It gets down to something like
> this:
> 
> 8<----
> - arm,pl11x,panel-data-pads: array of 24 cells, each of them describing
> 				a function of one of the CLD pads,
> 				starting from 0 up to 23; each pad can
> 				be described by one of the following values:
> 	- 0: reserved (not connected)
> 	- 0x100-0x107: color upper STN panel data 0 to 7
...
> Such approach would also solve problem with bizarre cases like the
> Versatile's (not Express ;-) muxer Russell mentioned (where there is a
> de-facto custom wiring used). And no, I had a look at pinmux bindings
> and I don't think they fit here at all...
> 
> Thoughts?

I think pinctrl would work just fine here. However, I suspect there's
little need for pinctrl. pinctrl is required when one module may impose
requirements on another module's muxable pins. I assume that the
configuration for pins on CLCD is only relevant for CLCD itself, so
there's no need to export an interface by which something else can
configure the pins. Now, if any of the pins could be e.g. "GPIO", then
this argument might not apply. Hence, I think pinctrl is only "possible"
here, not "required", and the approach above seems fine to me.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
