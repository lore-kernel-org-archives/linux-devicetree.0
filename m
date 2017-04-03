From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] pinctrl: Add bindings for ARTPEC-6 pinmux
Date: Mon, 3 Apr 2017 11:01:15 -0500
Message-ID: <20170403160115.xxzm6nm4cdxr53vw@rob-hp-laptop>
References: <20170330112744.GE29118@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170330112744.GE29118-VrBV9hrLPhE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jesper Nilsson <jesper.nilsson-VrBV9hrLPhE@public.gmane.org>
Cc: Jesper Nilsson <jespern-VrBV9hrLPhE@public.gmane.org>, Lars Persson <larper-VrBV9hrLPhE@public.gmane.org>, Niklas Cassel <niklass-VrBV9hrLPhE@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-VrBV9hrLPhE@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 30, 2017 at 01:27:44PM +0200, Jesper Nilsson wrote:
> Add the bindings for the pinmux functions in the
> ARTPEC-6 SoC, including bias and drive strength.
> 
> Signed-off-by: Jesper Nilsson <jesper.nilsson-VrBV9hrLPhE@public.gmane.org>
> ---
>  .../bindings/pinctrl/axis,artpec6-pinctrl.txt      | 85 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/axis,artpec6-pinctrl.txt

A couple of nits, otherwise:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
