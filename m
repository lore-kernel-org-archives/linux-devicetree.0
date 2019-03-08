Return-Path: <SRS0=TKor=RL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from office2.cesnet.cz ([195.113.144.244]:53446 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbfCHMmf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Mar 2019 07:42:35 -0500
From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Subject: Re: [PATCH v2 3/4] pinctrl: mcp23s08: work around GPIO line naming
Date: Fri, 08 Mar 2019 13:35:26 +0100
MIME-Version: 1.0
Message-ID: <4d99bc24-293e-4a75-a6de-c40cd13b62e8@cesnet.cz>
In-Reply-To: <517dcdda21ea0b0df884bc6adcba1dadb78b66b1.1551966077.git.jan.kundrat@cesnet.cz>
References: <cover.1551966076.git.jan.kundrat@cesnet.cz>
 <517dcdda21ea0b0df884bc6adcba1dadb78b66b1.1551966077.git.jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Phil Reid <preid@electromag.com.au>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Mika Westerberg <mika.westerberg@linux.intel.com>
List-ID: <devicetree@vger.kernel.org>

Sorry for missing the DT maintainers on this one.

Jan

On =C4=8Dtvrtek 7. b=C5=99ezna 2019 14:31:02 CET, Jan Kundr=C3=A1t wrote:
> This driver is a bit weird because it can hide several gpio_chip
> instances underneath a single SPI slave. One cannot put the
> gpio-line-names DT stanza directly to the SPI slave when the
> spi-present-mask has more than one bit set.
>
> I'm making up the `gpio-bank` DT child name as well as its `address`
> property. We need something to match the DT entries with the SPI
> address.
>
> Signed-off-by: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>
> Reviewed-by: Phil Reid <preid@electromag.com.au>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> ---
> v2: Depend on exported devprop_gpiochip_set_names
> ---
>  .../bindings/pinctrl/pinctrl-mcp23s08.txt     | 35 +++++++++++++++++++
>  drivers/pinctrl/pinctrl-mcp23s08.c            | 11 ++++++
>  2 files changed, 46 insertions(+)
>
> diff --git=20
> a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt=20
> b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
> index 625a22e2f211..a0b1eb9aedad 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt
> @@ -144,3 +144,38 @@ gpio21: gpio@21 {
>  =09=09bias-pull-up;
>  =09};
>  };
> +
> +Line naming
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Because several gpio_chip instances are hidden below a single device tree
> +node, it is necessary to split the names into several child nodes. Ensure
> +that the configured addresses match those in the=20
> microchip,spi-present-mask:
> +
> +gpio@0 {
> +=09compatible =3D "microchip,mcp23s17";
> +=09gpio-controller;
> +=09#gpio-cells =3D <2>;
> +=09/* this bitmask has bits #0 (0x01) and #2 (0x04) set */
> +=09spi-present-mask =3D <0x05>;
> +=09reg =3D <0>;
> +=09spi-max-frequency =3D <1000000>;
> +
> +=09gpio-bank@1 {
> +=09=09address =3D <0>;
> +=09=09gpio-line-names =3D
> +=09=09=09"GPA0",
> +=09=09=09"GPA1",
> +=09=09=09...
> +=09=09=09"GPA7",
> +=09=09=09"GPB0",
> +=09=09=09"GPB1",
> +=09=09=09...
> +=09=09=09"GPB7";
> +=09};
> +
> +=09gpio-bank@2 {
> +=09=09address =3D <2>;
> +=09=09gpio-line-names =3D ...
> +=09};
> +};
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c=20
> b/drivers/pinctrl/pinctrl-mcp23s08.c
> index fd9d6f026d70..7810f56f8dd1 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -1102,6 +1102,7 @@ static int mcp23s08_probe(struct spi_device *spi)
>  =09int=09=09=09=09status, type;
>  =09unsigned=09=09=09ngpio =3D 0;
>  =09const struct=09=09=09of_device_id *match;
> +=09struct device_node=09=09*np;
> =20
>  =09match =3D of_match_device(of_match_ptr(mcp23s08_spi_of_match), &spi->de=
v);
>  =09if (match)
> @@ -1170,6 +1171,16 @@ static int mcp23s08_probe(struct spi_device *spi)
>  =09=09if (pdata->base !=3D -1)
>  =09=09=09pdata->base +=3D data->mcp[addr]->chip.ngpio;
>  =09=09ngpio +=3D data->mcp[addr]->chip.ngpio;
> +
> +=09=09for_each_available_child_of_node(spi->dev.of_node, np) {
> +=09=09=09u32 chip_addr;
> +=09=09=09status =3D of_property_read_u32(np, "address", &chip_addr);
> +=09=09=09if (status)
> +=09=09=09=09continue;
> +=09=09=09if (chip_addr !=3D addr)
> +=09=09=09=09continue;
> +=09=09=09devprop_gpiochip_set_names(&data->mcp[addr]->chip,=20
> of_fwnode_handle(np));
> +=09=09}
>  =09}
>  =09data->ngpio =3D ngpio;
> =20
