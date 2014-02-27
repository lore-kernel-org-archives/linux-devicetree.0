From: Fabian Vogt <fabian-O+IgeCt+IhXFOn1fZuaZsg@public.gmane.org>
Subject: Re: [PATCH V6] gpio: New driver for LSI ZEVIO SoCs
Date: Thu, 27 Feb 2014 15:43:21 +0100
Message-ID: <1584880.3T2YsxZdKp@fabians-laptop.fritz.box>
References: <1393271698-15829-1-git-send-email-fabian@ritter-vogt.de> <CACRpkdZqAMMvHiGwVDNnZ7Lg9RUVtjFGdfnZF3+QrX0KRPVJGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZqAMMvHiGwVDNnZ7Lg9RUVtjFGdfnZF3+QrX0KRPVJGA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 24, 2014 at 10:31:59, Linux Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Feb 24, 2014 at 8:54 PM, Fabian Vogt <fabian-O+IgeCt+IhXFOn1fZuaZsg@public.gmane.org> wrote:
> 
> > This driver supports the GPIO controller found in LSI ZEVIO SoCs.
> > It has been successfully tested on a TI nspire CX calculator.
> >
> > Signed-off-by: Fabian Vogt <fabian-O+IgeCt+IhXFOn1fZuaZsg@public.gmane.org>
> 
> I like this version. Patch applied.
> 
> Q:
> 
> > +config GPIO_ZEVIO
> > +       bool "LSI ZEVIO SoC memory mapped GPIOs"
> > +       depends on OF
> 
> So OF_GPIO is not needed for the systems using this driver?
> DT just used for probing the driver?
> 
I'm using of_mm_gpiochip_add to register the gpiochip.
In the platform's Kconfig only ARCH_WANT_OPTIONAL_GPIOLIB is needed, OF_GPIO seems to be selected automatically.
If I disable it in the .config and start "make menuconfig", it's selected again.
OF_GPIO seems to have the same state as GPIOLIB in menuconfig.

Bye,
Fabian

> Yours,
> Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
