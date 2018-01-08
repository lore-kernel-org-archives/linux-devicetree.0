From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v3 0/3] usb: renesas_usbhs: Add RZ/A1 support
Date: Mon, 8 Jan 2018 08:36:39 +0100
Message-ID: <CAMuHMdV+1Y+OozRa0P2MJZQ-rT+ZfmW4iy2AYya1EMgrjb+y8Q@mail.gmail.com>
References: <20180105224647.42262-1-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180105224647.42262-1-chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Fri, Jan 5, 2018 at 11:46 PM, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> This series adds RZ/A1 gadget support to the renesas_usbhs driver.
> Basically, it's almost the same HW as the R-Car (and SH) parts.
> The only real difference is the some extra registers for the PHY.
>
> This was tested on an RSK board by connecting to a PC as an
> Ethernet CDC gadget.
>
> v3:
>  * Changed from "renesas,usbhs-r7s72100" to "renesas,rza1-usbhs"
>  * Removed "renesas,usbhs-r7s72100"
>  * Changed License of rza.c

Thanks for the update, but I think there has been a misunderstanding.
I didn't mean to drop "renesas,usbhs-r7s72100" everywhere, only from
the matching in the driver.

Summarized:
1. DT bindings should document _all_ compatible values (SoC-specific,
   and/or family-specific, generic, ...),
2. DTS should list _all applicable_ compatible values, ordered from
    most-specific to least-specific,
3. Drivers should match against the least-specific compatible value to get
   the job done.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
