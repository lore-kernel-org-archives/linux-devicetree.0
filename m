From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/10] mfd: Add TI LMU driver
Date: Tue, 18 Feb 2014 08:21:27 +0000
Message-ID: <20140218082127.GD20218@lee--X1>
References: <1392359450-6890-1-git-send-email-milo.kim@ti.com>
 <20140217095734.GD17875@lee--X1>
 <53030F9C.8000605@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53030F9C.8000605-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> >>+static const struct resource lm3633_effect_resources[] =3D {
> >>+	{
> >>+		.name  =3D LM3633_EFFECT_BL0_RAMPUP,
> >>+		.flags =3D IORESOURCE_REG,
> >>+		.start =3D LM3633_EFFECT_REGISTER(BL0_RAMPUP),
> >>+	},

<snip>

> >>+	{
> >>+		.name  =3D LM3633_EFFECT_PTN_HIGHBRT,
> >>+		.flags =3D IORESOURCE_REG,
> >>+		.start =3D LM3633_EFFECT_REGISTER(HIGHBRT),
> >>+	},
> >>+};
> >
> >Can you define a MACRO to do all of these as one liners?
>=20
> Yes, resource definitions will be replaced by simple macro,
> LMU_EFFECT_RESOURCE().
>=20
> For example,
>=20
> #define LMU_EFFECT_RESOURCE(chip, effect)               \
> {                                                       \
>         .name  =3D chip##_EFFECT_##effect,                \
>         .flags =3D IORESOURCE_REG,                        \
>         .start =3D LMU_EFFECT_REGISTER(chip, effect),     \
> }
>=20
> static const struct resource lm3633_effect_resources[] =3D {
>         LMU_EFFECT_RESOURCE(LM3633, BL0_RAMPUP),

<snip>

>         LMU_EFFECT_RESOURCE(LM3633, PTN_HIGHBRT),
> };
>=20
> and so on.

Yes, this is what I had in mind.

> >>+	pdata->en_gpio =3D of_get_named_gpio(node, "ti,enable-gpio", 0);
> >
> >There is a global DT property for this already.
>=20
> I've not found it yet, but I agree it looks like general property.
> So I'll replace "ti,enable-gpio" with "ti,lmu-en-gpio".

Just re-use "gpio-enable". No need for it to be vendor specific.

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
