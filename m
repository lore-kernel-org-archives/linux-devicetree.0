From: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2 2/2] backlight: lm3630a: add an enable gpio for the
 HWEN pin
Date: Wed, 11 Sep 2019 22:25:13 +0200
Message-ID: <20190911222513.489b5235@aktux>
References: <20190910212909.18095-1-andreas@kemnade.info>
        <20190910212909.18095-3-andreas@kemnade.info>
        <20190911102533.not4ta3xwgm6bhjo@holly.lan>
        <a3f10318-11f4-3b78-47e5-d9add8a46791@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a3f10318-11f4-3b78-47e5-d9add8a46791@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, lee.jones@linaro.org, jingoohan1@gmail.com, jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, "H. Nikolaus Schaller" <hns@goldelico.com>
List-Id: devicetree@vger.kernel.org

On Wed, 11 Sep 2019 13:48:36 -0500
Dan Murphy <dmurphy@ti.com> wrote:


> >> @@ -535,6 +538,13 @@ static int lm3630a_probe(struct i2c_client *clien=
t,
> >>   	}
> >>   	pchip->pdata =3D pdata;
> >>  =20
> >> +	pchip->enable_gpio =3D devm_gpiod_get_optional(&client->dev, "enable=
",
> >> +						GPIOD_OUT_HIGH);
> >> +	if (IS_ERR(pchip->enable_gpio)) {
> >> +		rval =3D PTR_ERR(pchip->enable_gpio);
> >> +		return rval; =20
>=20
> the enable gpio is optional so if it fails you log the error and move on
>
well, if the gpio is not there, then it returns NULL.
It might return e.g. -EDEFER. So I need to check for errors here.
=20
> Also on driver removal did you want to set the GPIO to low to disable=20
> the device to save power?
>=20
page 5 of the datasheet says:

Ishdn =3D Typ. 1=C2=B5A max. 4=C2=B5A.
For HWEN=3DVin, I2c shutdown  (I guess this means outputs powered off)
ond for HWEN=3DGND.

So are we really saving something here?

Regards,
Andreas
