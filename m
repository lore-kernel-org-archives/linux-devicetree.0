Return-Path: <SRS0=vJB2=FN=cesnet.cz=jan.kundrat@kernel.org>
From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Subject: Re: [PATCH v4 3/3] pinctrl: mcp23s08: add open drain configuration =?iso-8859-1?Q?for_irq_output?=
Date: Mon, 19 Feb 2018 22:43:18 +0100
MIME-Version: 1.0
Message-ID: <56c7f046-21af-4105-a2a0-1a79ceda2858@cesnet.cz>
In-Reply-To: <1519032320-103817-4-git-send-email-preid@electromag.com.au>
References: <1519032320-103817-1-git-send-email-preid@electromag.com.au>
 <1519032320-103817-4-git-send-email-preid@electromag.com.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Phil Reid <preid@electromag.com.au>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, sre@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Thanks for looking into this.

Is there a reason why the DT documentation is updated in a separate commit?

>  =09if ((status & IOCON_SEQOP) || !(status & IOCON_HAEN) || mirror ||
> -=09     mcp->irq_active_high) {
> +=09     mcp->irq_active_high || open_drain) {

This `if` is getting quite complex. I don't think that saving one SPI write=20=

transaction is worth the effort here. What about just setting the chip to a=20=

known-good state unconditionally by removing that `if`?

The condition also looks wrong to me (as-is in the kernel now). If the chip=20=

is somehow configured to use active-high IRQ and the DT does not ask for=20
either active-high or open-drain IRQ, then the reconfiguration gets skipped=20=

and the chip runs with wrong settings.

>  =09=09/* mcp23s17 has IOCON twice, make sure they are in sync */
>  =09=09status &=3D ~(IOCON_SEQOP | (IOCON_SEQOP << 8));
>  =09=09status |=3D IOCON_HAEN | (IOCON_HAEN << 8);
> @@ -898,6 +900,9 @@ static int mcp23s08_probe_one(struct=20
> mcp23s08 *mcp, struct device *dev,
>  =09=09if (mirror)
>  =09=09=09status |=3D IOCON_MIRROR | (IOCON_MIRROR << 8);
> =20
> +=09=09if (open_drain)
> +=09=09=09status |=3D IOCON_ODR | (IOCON_ODR << 8);
> +
>  =09=09if (type =3D=3D MCP_TYPE_S18 || type =3D=3D MCP_TYPE_018)
>  =09=09=09status |=3D IOCON_INTCC | (IOCON_INTCC << 8);

I think that it would be better to explicitly error out if irq_active_high=20=

and open_drain are both set. When I sent my attempt at this, I did it like=20=

this:

+=09=09if (irq_active_high && irq_open_drain) {
+=09=09=09dev_err(dev, "microchip,irq-open-drain and "
+=09=09=09=09"drive-active-high are mutually exclusive\n");
+=09=09=09ret =3D -EINVAL;
+=09=09=09goto fail;
+=09=09} else if (irq_active_high) {
+=09=09=09...
+=09=09} else if (irq_open_drain) {
+=09=09=09...
+=09=09}

But anyway, even as-is, the patch is a net improvement, so:

Reviewed-by: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>

With kind regards,
Jan
