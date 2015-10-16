From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: properties to describe a rotary encoder
Date: Fri, 16 Oct 2015 14:40:10 +0200
Message-ID: <20151016124010.GL3982@pengutronix.de>
References: <20151016095951.GA6533@pengutronix.de>
 <5620CCD1.8030509@zonque.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5620CCD1.8030509-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On Fri, Oct 16, 2015 at 12:09:21PM +0200, Daniel Mack wrote:
> Hi,
>=20
> On 10/16/2015 11:59 AM, Uwe Kleine-K=F6nig wrote:
> > there is already a driver for rotary encoders described in
> > Documentation/devicetree/bindings/input/rotary-encoder.txt. This ho=
wever
> > is not suitable to describe the device I have here for two reasons:
> >=20
> > First the driver can only make use of 2 gpio lines, while the devic=
e
> > here has 4 lines,
>=20
> How does the phase diagram of that device look like, on what edges is
> the system supposed to trigger?
>=20
> > so I have 16 sectors instead of only 4. And the
>=20
> What's a 'sector'?

My imagination is the image on the right on
https://en.wikipedia.org/wiki/Rotary_encoder#Gray_encoding .

With more than period per 360=B0 "sector" is probably not a lucky
choice. A colleague suggested "increment" instead, maybe this one is
better? So with a 4-line encoder there are 16 increments per period
while a 2-line encoder has only 4 increments per period.

An rotary encoder that is currently described by:

	{
		compatible =3D "rotary-encoder";
		gpios =3D <..>, <..>;
		rotary-encoder,steps =3D <24>;
		rotary-encoder,half-period;
	}

would then be described as:

	{
		compatible =3D ...;
		gpios =3D <..>, <..>;
		rotary-encoder,steps =3D <24>;
		rotary-encoder,increments-per-step =3D <2>;
	}

, an encoder without "..,half-period" would get
"...,increments-per-step =3D <4>" and for mine I'd use

	{
		compatible =3D ...;
		gpios =3D <..>, <..>, <..>, <..>;
		rotary-encoder,steps =3D <16>;
		rotary-encoder,increments-per-step =3D <1>;
	}

> > second difference is that my encoder has a detend for each sector w=
hile
> > the driver only supports "half-period" and "full-period" (default) =
mode.
> > These names really only make sense for the 2 line case and mean the
> > encoder has detends in 2 or 1 sector respectively.
> >=20
> > So I'm thinking about how to generalize the description to allow to=
 add
> > support for "my" device.
> >=20
> > For the added gpio lines it's easy, that's just allowing more than =
two
> > gpios for the "gpios" property.
>=20
> Doesn't the number of GPIOs already give enough information to implem=
ent
> proper support? Maybe there's no need for any other properties here.

No, that alone isn't enough because "my" encoder has one increment per
step while the driver only supports two increments per step
("half-period") or four increments per step (absence of "half-period").

> > Currently there is a property "rotary-encoder,steps" that describes=
 the
> > number of detends in a full turnaround. So if we stick to "steps" t=
o
> > describe detends, maybe something like "sectors-per-step" (with a
> > default of 4) would be needed to describe what "half-period" is now=
=2E
> > Does this make sense? Maybe someone has a better suggestion?
>=20
> I'm not sure what a sector is supposed to refer to, but the number of
> steps per 360=B0 is something that can vary for both 2-line and 4-lin=
e
> versions of a rotary encoder. So isn't that unrelated?

Yes, this is an (nearly) orthogonal property. But for a 4-line encoder
I'd say that "half-period" would mean 8 increments per step (because a
full period is 2**4 =3D=3D 16 increments), and that is hardly sensible.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
