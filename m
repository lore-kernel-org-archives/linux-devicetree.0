From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 1/1] gpio: of: provide option generic property for
 initial line states
Date: Fri, 9 Jun 2017 10:41:30 -0500
Message-ID: <CAL_JsqJeSCN88JnVnofb2Ncy4bDyXiKQbLniHmvbE4j854ZePA@mail.gmail.com>
References: <20170609141622.21502-1-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170609141622.21502-1-o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, barebox-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 9, 2017 at 9:16 AM, Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> This property is needed for barebox or may be other bootloaders
> to set proper gpio configuration as early as possible.
>
> This example is mainly based on "lines-initial-states" property
> from this binding documentation:
> Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt

Don't we have a binding for this already based on gpio-hogs.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
