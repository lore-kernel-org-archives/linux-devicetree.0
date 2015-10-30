From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 5/5] gpio: tps65912: Add GPIO driver for the TPS65912
 PMIC
Date: Fri, 30 Oct 2015 17:10:45 +0000
Message-ID: <20151030171045.GA4058@x1>
References: <1446161922-8755-1-git-send-email-afd@ti.com>
 <1446161922-8755-6-git-send-email-afd@ti.com>
 <CACRpkdb+C1M=cFKDNbJW74hUEA=87aA_weR0u22-9bDKgif6xQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdb+C1M=cFKDNbJW74hUEA=87aA_weR0u22-9bDKgif6xQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 30 Oct 2015, Linus Walleij wrote:

> On Fri, Oct 30, 2015 at 12:38 AM, Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org> wrote:
>=20
> > This patch adds support for the TPS65912 PMIC GPIOs.
> >
> > TPS65912 has five configurable GPIOs that can be used for several
> > purposes.
> >
> > Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
>=20
> This looks like a fine driver, can't really see anything wrong with i=
t so:
> Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>=20
> > +#define to_tps65912_gpio(gc) container_of(gc, struct tps65912_gpio=
, gpio_chip)
>=20
> I would rewrite that to static inline however.
>=20
> Lee can take this into the MFD tree with my review-tag if he wants.

Please fix this, then resubmit the set with Acks/Reviewed-by's applied.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
