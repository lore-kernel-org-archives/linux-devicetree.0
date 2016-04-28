From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH V10 2/6] mfd: max77620: add core driver for
 MAX77620/MAX20024
Date: Thu, 28 Apr 2016 08:25:59 +0100
Message-ID: <20160428072559.GK4892@dell>
References: <1459348188-11726-1-git-send-email-ldewangan@nvidia.com>
 <1459348188-11726-3-git-send-email-ldewangan@nvidia.com>
 <20160427151947.GD4892@dell>
 <572104AA.7080500@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <572104AA.7080500@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, gnurou@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, ijc+devicetree@hellion.org.uk, swarren@nvidia.com, treding@nvidia.com, Mallikarjun Kasoju <mkasoju@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Wed, 27 Apr 2016, Laxman Dewangan wrote:

>=20
> On Wednesday 27 April 2016 08:49 PM, Lee Jones wrote:
> >On Wed, 30 Mar 2016, Laxman Dewangan wrote:
> >
> >>+#define MAX77620_MFD_CELL_RES(_name, _res)			\
> >>+	{							\
> >>+		.name =3D (_name),				\
> >>+		.resources =3D (_res),				\
> >>+		.num_resources =3D ARRAY_SIZE((_res)),		\
> >>+	}
> >I'm *still* not accepting this.
> >
> >>+
> >>+static struct mfd_cell max20024_children[] =3D {
> >>+	MAX77620_MFD_CELL_NAME("max20024-pinctrl"),
> >>+	MAX77620_MFD_CELL_RES("max20024-gpio", gpio_resources),
> >>+	MAX77620_MFD_CELL_NAME("max20024-pmic"),
> >>+	MAX77620_MFD_CELL_RES("max77620-rtc", rtc_resources),
> >>+	MAX77620_MFD_CELL_RES("max20024-power", power_resources),
> >>+	MAX77620_MFD_CELL_NAME("max20024-watchdog"),
> >>+	MAX77620_MFD_CELL_NAME("max20024-clock"),
> >>+};
> >If you want this submission to be accepted this cycle, you're going =
to
> >have to convert this to the traditional way of defining MFD children=
=2E
>=20
> Yaah, I want to have this in current cycle.
> Will it be fine as follows? (To have quick agreement)
>=20
> static const struct mfd_cell max77620_children[] =3D {
>         {
>                 .name =3D "max77620-pinctrl",
>         }, {
>                 .name =3D "max77620-gpio",
>                 .resource =3D gpio_resources,
>                 .num_resources =3D ARRAY_SIZE(gpio_resources),
>         }, {
>         /* and so on */
>         },
> };

Yes.  Although, if there are no run-time ordering dependencies, I
usually like to a) have the one line entries on one line i.e.

         { .name =3D "max77620-pinctrl" }

=2E.. and b) for all the one line entries to be grouped together and
the multi line ones grouped together as well.

> >
> >>+		if (x >=3D tperiod)
> >>+			return i;
> >>+	}
> >>+
> >>+	return i;
> >>+}
> >>+
> >>+static int max77620_config_fps(struct max77620_chip *chip,
> >>+			       struct device_node *fps_np)
> >Lots of mention of 'FPS' here, but noting to so what that is?
> >
> >What does FPS stand for and what does the FPS do?
>=20
> FPS is Flexible Power Sequence. It is explained in DT binding doc.
>=20
> However, I will document the function to make it more clear in next
> revision.
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
