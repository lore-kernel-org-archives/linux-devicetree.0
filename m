From: Peter Maydell <peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 1/2] video: ARM CLCD: Add DT support
Date: Fri, 20 Jun 2014 23:27:26 +0100
Message-ID: <CAFEAcA-NZiRDDeUc7n+6hxgjG1V3qYXPAwyfSdtyz=ZCcD8kiw@mail.gmail.com>
References: <1403018494-10264-1-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403018494-10264-1-git-send-email-pawel.moll-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lkml - Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-mail-list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 17 June 2014 16:21, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org> wrote:
> This patch adds basic DT bindings for the PL11x CLCD cells
> and make their fbdev driver use them.

> +* ARM PrimeCell Color LCD Controller PL110/PL111
> +
> +See also Documentation/devicetree/bindings/arm/primecell.txt
> +
> +Required properties:
> +
> +- compatible: must be one of:
> +       "arm,pl110", "arm,primecell"
> +       "arm,pl111", "arm,primecell"
> +
> +- reg: base address and size of the control registers block
> +
> +- interrupt-names: either the single entry "combined" representing a
> +       combined interrupt output (CLCDINTR), or the four entries
> +       "mbe", "vcomp", "lnbu", "fuf" representing the individual
> +       CLCDMBEINTR, CLCDVCOMPINTR, CLCDLNBUINTR, CLCDFUFINTR interrupts
> +
> +- interrupts: contains an interrupt specifier for each entry in
> +       interrupt-names
> +
> +- clocks-names: should contain "clcdclk" and "apb_pclk"
> +
> +- clocks: contains phandle and clock specifier pairs for the entries
> +       in the clock-names property. See
> +       Documentation/devicetree/binding/clock/clock-bindings.txt
> +
> +Optional properties:
> +
> +- arm,pl11x,framebuffer-base: a pair of two 32-bit values, address and size,
> +       defining the framebuffer that must be used; if not present, the
> +       framebuffer may be located anywhere in the memory
> +
> +- max-memory-bandwidth: maximum bandwidth in bytes per second that the
> +       cell's memory interface can handle
> +
> +Required sub-nodes:
> +
> +- port: describes LCD panel signals, following the common binding
> +       for video transmitter interfaces; see
> +       Documentation/devicetree/bindings/media/video-interfaces.txt;
> +       when it is a TFT panel, the port's endpoint must define the
> +       following property:
> +
> +       - arm,pl11x,tft-r0g0b0-pads: an array of three 32-bit values,
> +               defining the way CLD pads are wired up; this implicitly
> +               defines available color modes, for example:
> +               - PL111 TFT 4:4:4 panel:
> +                       arm,pl11x,tft-r0g0b0-pads = <4 15 20>;
> +               - PL110 TFT (1:)5:5:5 panel:
> +                       arm,pl11x,tft-r0g0b0-pads = <1 7 13>;
> +               - PL111 TFT (1:)5:5:5 panel:
> +                       arm,pl11x,tft-r0g0b0-pads = <3 11 19>;
> +               - PL111 TFT 5:6:5 panel:
> +                       arm,pl11x,tft-r0g0b0-pads = <3 10 19>;
> +               - PL110 and PL111 TFT 8:8:8 panel:
> +                       arm,pl11x,tft-r0g0b0-pads = <0 8 16>;
> +               - PL110 and PL111 TFT 8:8:8 panel, R & B components swapped:
> +                       arm,pl11x,tft-r0g0b0-pads = <16 8 0>;

How does this work for boards like the versatilepb which have a
mux between a PL110 and the TFT, allowing it to efffectively
rewire the pads at runtime under control of the SYS_CLCD
sysreg (to give a wider range of colour modes than the
PL110 supports natively)?

thanks
-- PMM
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
