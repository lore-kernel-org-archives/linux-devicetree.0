From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/7] spi: pl022: attempt to get sspclk by name
Date: Mon, 24 Feb 2014 13:26:48 +0100
Message-ID: <CACRpkdYKOTn9+6c6hJaoUq8pCJBpZrC_JF1AZJyt=Gt67WE4Vw@mail.gmail.com>
References: <1392118632-11312-1-git-send-email-mark.rutland@arm.com>
	<1786282.mNUF0ZaUg2@wuerfel>
	<20140212161206.GD25957@e106331-lin.cambridge.arm.com>
	<12776368.fUp5TWIUAS@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <12776368.fUp5TWIUAS@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 12, 2014 at 5:31 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:

> Ok. Both ssp{0,1}clk and spi{0,1,2,3}clk /only/ appear in
> arch/arm/boot/dts/ste-dbx5x0.dtsi and are clearly a bug, so unless
> Linus Walleij has objections, I'd declare those to be bugs that
> should be fixed by changing the DT file to spi_clk.

OK I'll fix. But didn't Mark just say that the preferred name should be
SSPCLK?

Here is the PL022 TRM:
http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0194g/index.html

The clock name on the silicon side is clearly "SSPCLK" so let's
stick with this.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
