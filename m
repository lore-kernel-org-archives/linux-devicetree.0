From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/7] Documentation: devicetree: fix up pl022 clocks
Date: Thu, 13 Feb 2014 13:55:19 +0100
Message-ID: <CACRpkdbPbRkTEJQQ3tjS_OFPF9TKY6HOFe-zTxAqeJ7nxA1H1w@mail.gmail.com>
References: <1392118632-11312-1-git-send-email-mark.rutland@arm.com>
	<1392118632-11312-4-git-send-email-mark.rutland@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392118632-11312-4-git-send-email-mark.rutland-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 11, 2014 at 12:37 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:

> Currently the pl022 driver expects clocks, and dts provide them, yet the
> binding does not mention clocks at all.
>
> This patch adds a description of the clocks, "apb_pclk" (as required by
> the primecell binding) and "sspclk" for the pl022 itself. The "sspclk"
> name was chosen to match the official documentation, as currently a
> variety of names are used in its place; it is expected that any
> operating system supporting these can continue to do so in the absence
> of an "sspclk" entry.
>
> Signed-off-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>

Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
