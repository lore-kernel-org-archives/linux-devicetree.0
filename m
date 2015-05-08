From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: Overlays and aliases
Date: Fri, 8 May 2015 16:26:33 +0300
Message-ID: <9AB113AE-5DFD-44FA-969D-F2EBFB8293A8@konsulko.com>
References: <CAMuHMdVK0oLR2UPh-A=-mNayX5HwHoiUrvrKkgmW9=7yZOEJSQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdVK0oLR2UPh-A=-mNayX5HwHoiUrvrKkgmW9=7yZOEJSQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

> On May 8, 2015, at 16:20 , Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> =
wrote:
>=20
> Kalimera Pantelis,
>=20
> I'm trying to use an overlay to enable an additional serial port on a=
n
> expansion port. The serial driver relies on of_alias_get_id() to find=
 the
> serial index, so I have to update /aliases.
>=20

Ugh, yeah, aliases are =E2=80=98special=E2=80=99.

> My first naive try:
>=20
>        fragment@0 {
>                target-path =3D "/aliases";
>=20
>                __overlay__ {
>                        serial3 =3D <&scif3>;
>                };
>        };
>=20
> didn't work, as now /aliases/serial3 is a phandle, not a string.
>=20
> Next try:
>=20
>                        serial3 =3D &scif3;
>=20
> That one isn't liked by dtc:
>=20
>    ERROR (path_references): Reference to non-existent node or label "=
scif3"
>=20
> Am I correct in assuming that fixup_path_references() needs updating =
to
> support this, cfr. fixup_phandle_references()?
>=20
> Finally, let's hardcode the path:
>=20
>                        serial3 =3D "/serial@e6ea8000";
>=20
> Now /sys/firmware/devicetree/base/aliases/serial3 is correct, but it
> still doesn't
> work, as the list of aliases is created only once (by of_alias_scan_a=
liases()),
> after unpacking the device tree. I guess of_alias_add() should be cal=
led when
> adding a property to /aliases.
>=20

Yes, you should be updating the aliases when adding something there.

I=E2=80=99ve run into the same problem with the omap-serial driver but =
I=E2=80=99ve handled it differently.

Here=E2=80=99s how I=E2=80=99ve handled it.

> commit cc9d3f8406c8058dd5d0bd254d2452189365aac3
> Author: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> Date:   Thu Nov 6 14:12:14 2014 +0200
>=20
>     serial: omap: Fix port line number without aliases
>=20
>     Having an omap serial device without a serial aliases doesn't
>     work. For now fallback to using the hwmod instance.
>=20
>     Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>=20
> diff --git a/drivers/tty/serial/omap-serial.c b/drivers/tty/serial/om=
ap-serial.c
> index 211479a..d839418 100644
> --- a/drivers/tty/serial/omap-serial.c
> +++ b/drivers/tty/serial/omap-serial.c
> @@ -1616,6 +1616,31 @@ static int serial_omap_probe_rs485(struct uart=
_omap_port *up,
>  	return 0;
>  }
>=20
> +static int serial_omap_of_get_port_line(struct device_node *np)
> +{
> +	unsigned long val;
> +	const char *hwmod;
> +	int ret;
> +
> +	/* first try the serial alias */
> +	ret =3D of_alias_get_id(np, "serial");
> +	if (ret >=3D 0)
> +		return ret;
> +
> +	/* no? calculate it from hwmods */
> +	ret =3D of_property_read_string(np, "ti,hwmods", &hwmod);
> +	if (ret !=3D 0 || strncmp(hwmod, "uart", 4) ||
> +			kstrtoul(hwmod + 4, 10, &val))
> +		return -ENODEV;
> +
> +	/* numbering of hwmods is +1 */
> +	ret =3D (int)val - 1;
> +	if (ret < 0)
> +		return -ENODEV;
> +
> +	return ret;
> +}
> +
>  static int serial_omap_probe(struct platform_device *pdev)
>  {
>  	struct omap_uart_port_info *omap_up_info =3D dev_get_platdata(&pdev=
->dev);
> @@ -1659,7 +1684,7 @@ static int serial_omap_probe(struct platform_de=
vice *pdev)
>  	up->port.ops =3D &serial_omap_pops;
>=20
>  	if (pdev->dev.of_node)
> -		ret =3D of_alias_get_id(pdev->dev.of_node, "serial");
> +		ret =3D serial_omap_of_get_port_line(pdev->dev.of_node);
>  	else
>  		ret =3D pdev->id;
>=20
>=20

It is possible for this to be fixed when adding something under aliases=
; give it a shot!


> Gr{oetje,eeting}s,
>=20
>                        Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>=20
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
>                                -- Linus Torvalds

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
