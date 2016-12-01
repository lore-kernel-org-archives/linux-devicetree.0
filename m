From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Re: [PATCH v7 4/8] drm/sunxi: Add DT bindings
 documentation of Allwinner HDMI
Date: Thu, 1 Dec 2016 09:55:20 +0100
Message-ID: <20161201085520.tk2kdi33rn6fyld2@lukather>
References: <cover.1480414715.git.moinejf@free.fr>
 <4614815.L3DQhhBy6d@avalon>
 <20161130102757.9eec1f7f3377d0f4787e3829@free.fr>
 <3478036.d2UQM8n6lv@avalon>
 <20161130114415.2280151e2965280733a629e5@free.fr>
 <1971681480527210@web5g.yandex.ru>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4t2trd4x3htxeqol"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB6OK77AQKGQEBWX744Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1971681480527210-RAIFsGP/6J5uio3avFS2gg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Cc: "moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--4t2trd4x3htxeqol
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2016 at 01:33:30AM +0800, Icenowy Zheng wrote:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hdmi-out {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0compatible =3D "hdmi-connector";
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0type =3D "a";
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* I2C bus and GPIO references are made up=
 for the example */
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ddc-i2c-bus =3D <&i2c4>;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hpd-gpios =3D <&gpio4 7 GPIO_ACTIVE_HIGH>
> >
> > the "hdmi-connector" is a big piece of software. It must handle a lot
> > of more and more exotic connectors.
> > So, I hope that you have written a "simple-hdmi-connector" which does
> > nothing but setting the connector type.
> > Where is it?
>=20
> I suddenly thought about something...
>=20
> If a DVI connector instead of a HDMI connector is soldered, how
> should such a device tree be written?

Use a dvi-connector instead :)

> How about solder a HDMI-to-VGA bridge on the board? (Maybe there
> should be "dumb-hdmi-dvi-bridge" and "dumb-hdmi-vga-bridge"
> drivers?)

It probably wouldn't be dumb, but yeah, it would definitely be a
bridge instead of the connector.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--4t2trd4x3htxeqol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYP+V0AAoJEBx+YmzsjxAgWMoP/0PeynKoqGej5MdOWpYljPaz
sj3AlxtQ20VcXeYZqdGT/iGfIcdk5fZgfAe6rgE0SG8hI97fowD+dXu086Bh08/Z
88EmbySsghw60KZHINzEDlUv6bg78sizGK0nPbDpBLwKTwG7ooTgwJajF6M7wHwX
TUfb7fMJ38yokvgBQo4yObBhdsDIulJU6Szt0ZWHM19699V3QzYJZA5VJ/9xzN+j
l2pAyV5uAcQNN1IGWGG5dxwdtdgtGuFunk1n4DQ4CUvy0h4jQLx5xzLFEp1w5dfO
E5mKBTXhddTO/7fMjGon6diVG3e4mKsvCJxtolQFwfCidGvF1hYzzYILseIzfo7f
/2icIWTV8r94dw7a8f9ekWtyXY5PISEg1A2K4pEcJVVD9wNP3l5S1Gg43slbjUEE
JvDrFlGyx0Oe4U0fRS8sbFJxI2TpIE2h/aciY3SvwD/irl90HKvYltfCmXF21U/J
arkNvQYtolEIUyRZu0TIIYpKdzZD42cWfgVe13UfWbPjhZ+b7iS8NXjFyTZueh9N
PsURIqCwFeyAIWnULhpxlHfAAhQWOtj+I3EzoAsR4Q0d3LSDQTXf3cAI7m9UxTJr
2IdwQBr0Qd/DZcjDrZjy8jt9YRr5cnAd/6FEDEYCwZ+yeyAKDKyyY+RptdjCfbVM
Ny5Ff40vV0zvyDwHS3xp
=Qp4e
-----END PGP SIGNATURE-----

--4t2trd4x3htxeqol--
