From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 4/8] dts: sun8i-h3: move uart1 pinmux/peripheral
 assocation to DSTI
Date: Mon, 12 Sep 2016 11:47:45 +0200
Message-ID: <20160912094745.GH9449@lukather>
References: <1473235141-12768-1-git-send-email-jorik@kippendief.biz>
 <1473235141-12768-5-git-send-email-jorik@kippendief.biz>
 <20160908062317.GD8913@lukather>
 <20160908080213.GA32547@carbon.kippendief.biz>
 <20160908090153.GL8913@lukather>
 <20160908095108.GA14915@carbon.kippendief.biz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="HuscSE0D68UGttcd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160908095108.GA14915@carbon.kippendief.biz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorik Jonker <jorik@kippendief.biz>
Cc: wens@csie.org, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--HuscSE0D68UGttcd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2016 at 11:51:09AM +0200, Jorik Jonker wrote:
> >>- put rts/cts in seperate pinmux sets for uart1 (2,3: see below)
> >>- associate rx/tx for uart1-3 in H3 DTSI (this is the only option)
> >
> >I'm still a bit skeptical about this. This wouldn't be in any way
> >consistant. I prefer to have something consistant and a bit duplicated
> >over something without any duplication but that confuses everyone
> >about what should be placed where.
> >
> >>- associate UART1 rts/cts as pinctrl-1 in sun8i-h3-bananapi-m2-plus
> >> (to prevent breakage for existing users)
> >
> >You can also set it in pinctrl-0.
>=20
> OK, sounds reasonable, but also a bit contradictive. One the one hand you
> prefer consistency (so, let uart2-3 follow uart1 and include rts/cts in
> them)

Hmm, I never said that, quite the opposite actually. Any board might
use either just RX/TX, or RX/TX and RTS/CTS. I don't see why we should
enable RTS/CTS on any board by default.

> , on the other hand the common case over the rare (so split off
> rts/cts). What should I do with uarts2-3 and should I do that to
> uart1 too?

You do the exact same thing in both cases.

My point was that you could just do:

pinctrl-0 =3D <&uart0_pins_a>, <&uart0_rts_cts_pins_a>;
pinctrl-names =3D "default";

instead of

pinctrl-0 =3D <&uart0_pins_a>;
pinctrl-1 =3D <&uart0_rts_cts_pins_a>;
pinctrl-names =3D "default", "default";

Since they are the exact same pin state.

> Moreover, Chen-Yu prefers to drop _a and @0 when they are redundant, which
> does not appear to be the convention, looking at existing sun*dsti. What's
> your opinion on this?

AFAIK, he wanted to remove them when they're not relevant (ie, only
one pin state possible).

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--HuscSE0D68UGttcd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX1nnBAAoJEBx+YmzsjxAgWMAP/0Q/rTHsDrz2AwlDw21D/cmi
aebyhYsMbD0F7Uesm0vNhdE+On2mhpgahkt4jg3ZFaalQ6xvlCLilJpHC0NYPa8d
dpQm0OtutwbHA6Iu6voJExn1fbeub0XQ5hDrq8Lh2PNaAx8++ahoytqLk+LhEKst
YdIsUo1r3/Du5cbqzrnRSWpimoevOYJxYR+B7e0tp/aQsWZQZ+JORCwc4N2GRyby
CYdD8WkS8g+qJKzDxv7S8hPfM9LaRQZESAELd2DwnEqozpNUlrd3ilj+axuwnBIU
hJPtYkSoKGKtzmfFQJElF79yRNDqqChIyOZ16IOriX0jOAJ3H4K1H07VUFotTgoR
0qX1aMTkpDl8Kzzh220Bo4mv9mp9ch+n7Q/hoY+VGEpOvcGfHZuo7oa787ynyyAD
JFYfH40Svw16cY1RokmulTzrrLG8rSwedKWHj4DZNhky4xmLHR76RZYKFZsNRqxf
+zBQfFW0QlTF21avh2Rj6DrIFTG8TI6hPMCRZvVGaRTLAsnTvsrIAEidbxhG1xvZ
2JMBVn86Gu4ldgVDMC58U7MnCoET8snKQdvy+26QF4PlvaBX/i2F6qTebllYCv69
alXUBK7zqKeQYXIzajbgLALjEqtYcrQrlueD7b2QAsFYQ8RNdqAJVVbWR3OaMOj/
eU5Kx24lWCnWUgnrW1wi
=h73l
-----END PGP SIGNATURE-----

--HuscSE0D68UGttcd--
