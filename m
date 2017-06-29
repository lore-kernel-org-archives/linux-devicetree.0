From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/4] pinctrl: Add USB support for Aspeed SoCs
Date: Thu, 29 Jun 2017 14:53:41 +0200
Message-ID: <CACRpkdZpJuaedE=04we_bcLB7qzOdvJAz4QmTfnuZA=5PrMf0g@mail.gmail.com>
References: <20170627021214.23323-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170627021214.23323-1-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Ryan Chen <ryan_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 27, 2017 at 4:12 AM, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org> wrote:

> With recent interest in the USB virtual hub in the Aspeed SoCs[1] it is a good
> time to add pinmux support for the USB ports and controllers. The earlier
> series of pinmux patches for the Aspeed SoCs focussed on supporting pins which
> were capable of GPIO. This is not the case for the USB pins, hence they have
> been unsupported until now.
>
> Rob: I know you've mentioned previously you desired complete bindings to be
> provided up front, so apologies for continuing to add functionality. This looks
> to be the last of it.

Waiting for DT review and addressing of Beji's comment for these.

Please resend after the merge window.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
