From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V10 2/6] mfd: max77620: add core driver for
 MAX77620/MAX20024
Date: Thu, 28 Apr 2016 09:51:55 +0100
Message-ID: <20160428085155.GL4892@dell>
References: <1459348188-11726-1-git-send-email-ldewangan@nvidia.com>
 <1459348188-11726-3-git-send-email-ldewangan@nvidia.com>
 <20160427151947.GD4892@dell>
 <572104AA.7080500@nvidia.com>
 <20160428072559.GK4892@dell>
 <5721B962.4090503@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5721B962.4090503@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, ijc+devicetree@hellion.org.uk, swarren@nvidia.com, treding@nvidia.com, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Thu, 28 Apr 2016, Laxman Dewangan wrote:
> On Thursday 28 April 2016 12:55 PM, Lee Jones wrote:
> >On Wed, 27 Apr 2016, Laxman Dewangan wrote:
> >
> >>On Wednesday 27 April 2016 08:49 PM, Lee Jones wrote:
> >>>On Wed, 30 Mar 2016, Laxman Dewangan wrote:
> >>>
> >>>>+#define MAX77620_MFD_CELL_RES(_name, _res)			\
> >>>>+	{							\
> >>>>+		.name =3D (_name),				\
> >>>>+		.resources =3D (_res),				\
> >>>>+		.num_resources =3D ARRAY_SIZE((_res)),		\
> >>>>+	}
> >>>I'm *still* not accepting this.
> >>>
> >>>>+
> >>>>+static struct mfd_cell max20024_children[] =3D {
> >>>>+	MAX77620_MFD_CELL_NAME("max20024-pinctrl"),
> >>>>+	MAX77620_MFD_CELL_RES("max20024-gpio", gpio_resources),
> >>>>+	MAX77620_MFD_CELL_NAME("max20024-pmic"),
> >>>>+	MAX77620_MFD_CELL_RES("max77620-rtc", rtc_resources),
> >>>>+	MAX77620_MFD_CELL_RES("max20024-power", power_resources),
> >>>>+	MAX77620_MFD_CELL_NAME("max20024-watchdog"),
> >>>>+	MAX77620_MFD_CELL_NAME("max20024-clock"),
> >>>>+};
> >>>If you want this submission to be accepted this cycle, you're goin=
g to
> >>>have to convert this to the traditional way of defining MFD childr=
en.
> >>Yaah, I want to have this in current cycle.
> >>Will it be fine as follows? (To have quick agreement)
> >>
> >>static const struct mfd_cell max77620_children[] =3D {
> >>         {
> >>                 .name =3D "max77620-pinctrl",
> >>         }, {
> >>                 .name =3D "max77620-gpio",
> >>                 .resource =3D gpio_resources,
> >>                 .num_resources =3D ARRAY_SIZE(gpio_resources),
> >>         }, {
> >>         /* and so on */
> >>         },
> >>};
> >Yes.  Although, if there are no run-time ordering dependencies, I
> >usually like to a) have the one line entries on one line i.e.
> >
> >          { .name =3D "max77620-pinctrl" }
> >
> >... and b) for all the one line entries to be grouped together and
> >the multi line ones grouped together as well.
> >
>=20
>=20
> It is turning like as follows:
>=20
> static const struct mfd_cell max77620_children[] =3D {
>         { .name =3D "max77620-pinctrl", },
>         { .name =3D "max77620-clock", },
>         { .name =3D "max77620-pmic", },
>         { .name =3D "max77620-watchdog", },
>         {
>                 .name =3D "max77620-gpio",
>                 .resources =3D gpio_resources,
>                 .num_resources =3D ARRAY_SIZE(gpio_resources),
>         }, {
>                 .name =3D "max77620-rtc",
>                 .resources =3D rtc_resources,
>                 .num_resources =3D ARRAY_SIZE(rtc_resources),
>         }, {
>                 .name =3D "max77620-power",
>                 .resources =3D power_resources,
>                 .num_resources =3D ARRAY_SIZE(power_resources),
>         }, {
>                 .name =3D "max77620-thermal",
>                 .resources =3D thermal_resources,
>                 .num_resources =3D ARRAY_SIZE(thermal_resources),
>         },
> };
>=20
> Will it be fine?

Yes, looks good.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
