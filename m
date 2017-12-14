From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 08/15] drm/sun4i: Add LVDS support
Date: Thu, 14 Dec 2017 10:37:17 +0100
Message-ID: <20171214093717.nosble24bl5mngub@flea.lan>
References: <cover.825a49a4c1c565a548f3de0375e7537e7e8fd3a4.1512486553.git-series.maxime.ripard@free-electrons.com>
 <b900e5963180c94ca02bde178b6674622a127787.1512486553.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v65Voua-AjHDnCLgDOKqUeSG-yD4wuSO5-BJ230FCp4OuQ@mail.gmail.com>
 <20171207122521.frv5zgaay3sgol6f@flea.lan>
 <CAGb2v67CrZA0WXtQNwrAEvyPuAFa7yJuYdX4GgSoNtBYv2NJ4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hmldfe2flkfifmdm"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67CrZA0WXtQNwrAEvyPuAFa7yJuYdX4GgSoNtBYv2NJ4g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Priit Laes <plaes@plaes.org>, Icenowy Zheng <icenowy@aosc.io>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jernej Skrabec <jernej.skrabec@siol.net>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--hmldfe2flkfifmdm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2017 at 11:30:21AM +0800, Chen-Yu Tsai wrote:
> >> > +       /* Map output pins to channel 0 */
> >> > +       regmap_update_bits(tcon->regs, SUN4I_TCON_GCTL_REG,
> >> > +                          SUN4I_TCON_GCTL_IOMAP_MASK,
> >> > +                          SUN4I_TCON_GCTL_IOMAP_TCON0);
> >> > +
> >> > +       /* Enable the output on the pins */
> >> > +       regmap_write(tcon->regs, SUN4I_TCON0_IO_TRI_REG, 0xe0000000);
> >>
> >> Is this still needed? You are no longer using the TCON LCD pins
> >> with LVDS.
> >
> > We do. It's a separate function of the pins, but it's the same pins.
>=20
> OK. I assume you've tried it without setting it and it failed?
> I just assume that these refer to the TCON LCD output, whereas
> LVDS looks like a separate module and function, and shouldn't
> need it.

Argh, I forgot to test that. I'll test it for real this time and will
update that part with a comment if that's needed.

Sorry :/

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hmldfe2flkfifmdm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAloyRkkACgkQ0rTAlCFN
r3Sfkg/+O6vvYZTZYXh3jtRSR42DaCOWCdv8QeQv5srvK2jZ7mqfhIm1g8Bf+jvL
cTMAAyqYLO1hjvgZCxSxR/40pJ0RNM2ElQF230/yhVKeQ1NnIpB6pVJDqMMIqePK
iPnVWf+livJt76+BQtFcYnp5dMum1x3CpO3cS1DWf6LfJ9QH2gkhNBLKFG3Y5qUX
fF5LKjgYov/TRbUaC8xYnflXB1v3V03Q6pmqNBzYt6z6rStzudPkVx4ZYGGg7grj
v/jQG4K47752StemEdZV52yzvhZulA02qATFPfsBtFXujYhy1BBSMOr4SZZFGQ8M
rd/RMoUb1/9a/cjVP7O3q7Fne8pXnmfm2GskJWMrjGobhe3+XNwqdB2s+ZBEwHXZ
9ZlkpHiSeolkDCL1zhqOtqoqpDw/LIdhiXzLEl/oGFFvN2P4o+yGBpb1Fe5BZmE8
xDH2C14BhZMQNeLoTiEShyPzcBpPsKi6TKrEDPdVZ8bydG96EN9kjdTQFpAfZUbH
zDpxi1m4lxK/G70FmlBgk36cDohAJ/40tsgnq1nmlWWj/Z7P0OT4t3Y9wRowa+dS
UmfWoeAlRUzcYgkkJQbaoHYQkuL99BbPdSpOm8SzNXRp3XQNLGUpQlhamEWVHOJY
+2FNI1SMj00sbSIe36JNtQKZHwga1WzPvlVE9VP3QMiG1Zs2TJA=
=GJOS
-----END PGP SIGNATURE-----

--hmldfe2flkfifmdm--
