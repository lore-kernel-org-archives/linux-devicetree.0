From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC PATCH alt 4/4] pinctrl: at91: rework debounce configuration
Date: Fri, 13 Sep 2013 16:40:57 -0600
Message-ID: <52339479.6030402@wwwdotorg.org>
References: <1379058213-3245-1-git-send-email-b.brezillon@overkiz.com> <1379058813-3489-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379058813-3489-1-git-send-email-b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Richard Genoud <richard.genoud-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jiri Kosina <jkosina-AlSwsSmVLrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/13/2013 01:53 AM, Boris BREZILLON wrote:
> AT91 SoCs do not support per pin debounce time configuration.
> Instead you have to configure a debounce time which will be used for all
> pins of a given bank (PIOA, PIOB, ...).

> diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt

> +Optional properties for iomux controller:
> +- atmel,default-debounce-div: array of debounce divisors (one divisor per bank)
> +  which describes the debounce timing in use for all pins of a given bank
> +  configured with the DEBOUNCE option (see the following description).
> +  Debounce timing is obtained with this formula:
> +  Tdebounce = 2 * (debouncediv + 1) / Fslowclk
> +  with Fslowclk = 32KHz
> +
>  Required properties for pin configuration node:
>  - atmel,pins: 4 integers array, represents a group of pins mux and config
>    setting. The format is atmel,pins = <PIN_BANK PIN_BANK_NUM PERIPH CONFIG>.
> @@ -91,7 +99,6 @@ DEGLITCH	(1 << 2): indicate this pin need deglitch.
>  PULL_DOWN	(1 << 3): indicate this pin need a pull down.
>  DIS_SCHMIT	(1 << 4): indicate this pin need to disable schmit trigger.
>  DEBOUNCE	(1 << 16): indicate this pin need debounce.
> -DEBOUNCE_VAL	(0x3fff << 17): debounce val.

This change would break the DT ABI since it removes a feature that's
already present.

I suppose it's still up to the Atmel maintainers to decide whether this
is appropriate, or whether the impact to out-of-tree DT files would be
problematic.

Assuming the DT ABI can be broken, I think I'd prefer to do so, rather
than take "non-alt" patch 4/4, since a per-pin DEBOUNCE_VAL clearly
doesn't correctly model the HW, assuming the patch description is
correct. I don't think arguments re: the generic pinconf debounce
property hold; if the Linux-specific/internal generic property doesn't
apply, the DT binding should not be bent to adjust to it, but should
rather still represent the HW itself.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
