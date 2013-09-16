From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 1/2] video: ARM CLCD: Add DT support
Date: Mon, 16 Sep 2013 13:52:32 -0600
Message-ID: <52376180.1090001@wwwdotorg.org>
References: <1379351934-25415-1-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379351934-25415-1-git-send-email-pawel.moll-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd.bergmann-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/16/2013 11:18 AM, Pawel Moll wrote:
> This patch adds basic DT bindings for the PL11x CLCD controllers
> and make their fbdev driver use them (initially only TFT panels
> are supported).

> diff --git a/Documentation/devicetree/bindings/video/arm,pl11x.txt b/Documentation/devicetree/bindings/video/arm,pl11x.txt

> +- interrupts: either a single interrupt specifier representing the
> +		combined interrupt output (CLCDINTR) or an array of
> +		four interrupt specifiers for CLCDMBEINTR,
> +		CLCDVCOMPINTR, CLCDLNBUINTR, CLCDFUFINTR; in the
> +		latter case interrupt names must be specified
> +		(see below)
> +- interrupt-names: when four interrupts are specified, their names:
> +			"mbe", "vcomp", "lnbu", "fuf"
> +			must be specified in order respective to the
> +			interrupt specifiers

I think the binding should either always use names as the key, or use
indices in interrupts as the key. Hence, I'd word that more like:

- interrupt-names: either the single entry "combined" representing a
			combined interrupt output (CLCDINTR), or the
			four entries "mbe", "vcomp", "lnbu", "fuf"
			representing the individual CLCDMBEINTR,
			CLCDVCOMPINTR, CLCDLNBUINTR, CLCDFUFINTR
			interrupts.
- interrupts: contains an interrupt specifier for each entry in
		 interrupt-names.

> +- arm,pl11x,panel-data-pads: array of 24 cells, each of them describing
> +				a function of one of the CLD pads,
> +				starting from 0 up to 23; each pad can
> +				be described by one of the following values:
> +	- 0: reserved (not connected)
> +	- 0x100-0x107: color upper STN panel data 0 to 7
...

I assume those are the raw values that go into the HW?

> +				Example sets of values for standard
> +				panel interfaces:
> +	- PL110 single colour STN panel:
> +			<0x107 0x106 0x105 0x104 0x103 0x102 0x101 0x100>,
> +			<0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0>;

The indentation of the introductory text seems a little odd. Do we
really need so many examples?

> +Optional properties:
> +
> +- arm,pl11x,framebuffer-base: a pair of two values, address and size,
> +				defining the framebuffer to be used;
> +				to be used only if it is *not*
> +				part of normal memory, as described
> +				in /memory node

If the framebuffer is part of /memory, what happens then? Is the address
not fixed (so the HW isn't yet set up) and hence a driver should
allocate it?

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
