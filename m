From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: RE: [PATCH v3] gpio: dwapb: Add support for 1 interrupt per port A
 GPIO
Date: Tue, 17 Apr 2018 11:43:58 +0000
Message-ID: <TY1PR01MB1769AE3A4B1E5EA521DDC867F5B70@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <1523609472-4481-1-git-send-email-phil.edworthy@renesas.com>
 <20180416200329.notqjtdztzjrnim7@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180416200329.notqjtdztzjrnim7@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Hoan Tran <hotran@apm.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 16 April 2018 21:03 Rob Herring wrote:
> On Fri, Apr 13, 2018 at 09:51:12AM +0100, Phil Edworthy wrote:
> > The DesignWare GPIO IP can be configured for either 1 interrupt or 1
> > per GPIO in port A, but the driver currently only supports 1 interrupt.
> > See the DesignWare DW_apb_gpio Databook description of the
> > 'GPIO_INTR_IO' parameter.
> >
> > This change allows the driver to work with up to 32 interrupts, it
> > will get as many interrupts as specified in the DT 'interrupts' propert=
y.
> > It doesn't do anything clever with the different interrupts, it just
> > calls the same handler used for single interrupt hardware.
> >
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > ---
> > One point to mention is that I have made it possible for users to have
> > unconncted interrupts by specifying holes in the list of interrupts.
> > This is done by supporting the interrupts-extended DT prop.
> > However, I have no use for this and had to hack some test case for this=
.
> > Perhaps the driver should support 1 interrupt or all GPIOa as interrupt=
s?
> >
> > v3:
> >  - Rolled mfd: intel_quark_i2c_gpio fix into this patch to avoid
> > bisect problems
> > v2:
> >  - Replaced interrupt-mask DT prop with support for the interrupts-
> extended
> >    prop. This means replacing the call to irq_of_parse_and_map() with c=
alls
> >    to of_irq_parse_one() and irq_create_of_mapping().
> >
> > Note: There are a few *code* lines over 80 chars, but this is just guid=
ance,
> >    right? Especially as there are already some lines over 80 chars.
> > ---
[snip]

> > +			for (j =3D 0; j < pp->ngpio; j++) {
> > +				if (of_irq_parse_one(np, j, &oirq))
> > +					continue;
> > +
> > +				pp->irq[j] =3D irq_create_of_mapping(&oirq);
>=20
> I'm hoping to not have new users of of_irq_parse_one and
> irq_create_of_mapping. Can you use of_irq_get instead? It will base back
> error codes so you can distinguish different conditions.
Sure, I hadn't noticed that particular variant!

Thanks
Phil

> > +				if (pp->irq[j])
> > +					pp->has_irq =3D true;
> > +			}
> > +
> > +			if (!pp->has_irq)
> >  				dev_warn(dev, "no irq for port%d\n", pp-
> >idx);
> >  		}
> >
> > -		if (has_acpi_companion(dev) && pp->idx =3D=3D 0)
> > -			pp->irq =3D
> platform_get_irq(to_platform_device(dev), 0);
> > +		if (has_acpi_companion(dev) && pp->idx =3D=3D 0) {
> > +			pp->irq[0] =3D
> platform_get_irq(to_platform_device(dev), 0);
> > +			if (pp->irq[0])
> > +				pp->has_irq =3D true;
> > +		}
> >
> >  		pp->irq_shared	=3D false;
> >  		pp->gpio_base	=3D -1;
