From: Michael van der Westhuizen <michael@smart-africa.com>
Subject: Re: [PATCH 1/2] gpio: dwapb: Use human understandable gpio numbering.
Date: Thu, 2 Jul 2015 08:05:26 +0100
Message-ID: <267A46E7-C5C5-4696-90CC-D44F4130B3EF@smart-africa.com>
References: <cover.1435777856.git.rcochran@linutronix.de> <d6b5ce85a17164970d454583560e07f7aed7b8ca.1435777856.git.rcochran@linutronix.de>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <d6b5ce85a17164970d454583560e07f7aed7b8ca.1435777856.git.rcochran@linutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alan Tull <atull@altera.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Dinh Nguyen <dinguyen@altera.com>
List-Id: devicetree@vger.kernel.org

I have a very similar patch in my tree, and I=E2=80=99ve substituted th=
is patch for mine,
tested it and it works correctly.  However, there are administrative is=
sues with
this change.

> On 01 Jul 2015, at 8:34 PM, Richard Cochran <richardcochran@gmail.com=
> wrote:
>=20
> The system-on-chips using this IP core have well defined gpio numbers=
=2E
> Instead of using random numbers, this patch lets the device tree spec=
ify
> the correct gpio numbering.

The subject should not end with a full-stop.

Also, the commit message should explain why the change is needed, not w=
hat
it does.  While the message is accurate, the problem is not that humans=
 can=E2=80=99t
really make sense of the GPIO numbering, its that the GPIO numbering ex=
posed
to userland is often important for backward compatibility with a vendor=
 BSP and
it can be important (conceptually) to tie this numbering to the vendor =
documentation.

Ultimately, the numbering is inconsequential to users in kernel-space w=
hen DT is
in use.  It=E2=80=99s the userland users we=E2=80=99re trying to help.

In my case, I have quite a lot of vendor-supplied code that needs the n=
umbers to
be stable and backward compatible.  This quickly devolves into a discus=
sion of
GPIOs in sysfs as an ABI, which is not a discussion I want to have :)

>=20
> Signed-off-by: Richard Cochran <rcochran@linutronix.de>
> ---
> Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt | 2 ++
> drivers/gpio/gpio-dwapb.c                                  | 8 ++++++=
+-
> 2 files changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.t=
xt b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> index dd5d2c0..5c9effd 100644
> --- a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> @@ -28,6 +28,7 @@ controller.
> - interrupt-parent : The parent interrupt controller.
> - interrupts : The interrupt to the parent controller raised when GPI=
Os
>   generate the interrupts.
> +- snps,base : The base gpio number.
> - snps,nr-gpios : The number of pins in the port, a single cell.
>=20
> Example:
> @@ -42,6 +43,7 @@ gpio: gpio@20000 {
> 		compatible =3D "snps,dw-apb-gpio-port";
> 		gpio-controller;
> 		#gpio-cells =3D <2>;
> +		snps,base =3D <8>;
> 		snps,nr-gpios =3D <8>;
> 		reg =3D <0>;
> 		interrupt-controller;

This bindings change need to be in a separate patch for review by the d=
evicetree maintainers.

> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 58faf04..b7e7977 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -491,6 +491,13 @@ dwapb_gpio_get_pdata_of(struct device *dev)
> 			return ERR_PTR(-EINVAL);
> 		}
>=20
> +		if (of_property_read_u32(port_np, "snps,base",
> +					 &pp->gpio_base)) {
> +			dev_info(dev, "no base gpio specified for %s\n",
> +				 port_np->full_name);

This should be dev_dbg, or should just be removed.  This is not a probl=
em, as it is simply
maintaining existing behaviour.

Michael

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
