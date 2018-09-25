Return-Path: <SRS0=iaC9=MH=the-dreams.de=wsa@kernel.org>
Date: Tue, 25 Sep 2018 10:22:16 +0200
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/4] dt-bindings: mmc: renesas_sdhi: Add r8a77470 support
Message-ID: <20180925082216.GA2270@kunai>
References: <1537530911-443-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537530911-443-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVY1ty4fGoBg7qxfkRaEBEgBEK5YDgwNryDx_tCUYpiaw@mail.gmail.com>
 <TY1PR01MB1770218E44B1C365EE23299DC0170@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdX1jTwehG_XdsnWXz5HhPK4OYtOkb1BNr75yxZn8u6B6w@mail.gmail.com>
 <20180925074751.m2lwlinpebcun4a7@verge.net.au>
 <CAMuHMdVhdHsKDPuQZzwqkEUuPGYriAOgSRcROrC3DVfkmPix6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVhdHsKDPuQZzwqkEUuPGYriAOgSRcROrC3DVfkmPix6Q@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Magnus Damm <magnus.damm@gmail.com>, Linux MMC List <linux-mmc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > Perhaps stating the obvious: this feels a lot like the problem we thought
> > we had with different Gen-3 SoCs/ES versions. And in that case we decided
> > against using compat strings to differentiate. The main difference here
> > seems to be that we need to differentiate between different ports on the
> > same SoC.

Yes, I agree. Our so far agreed solution didn't take into account that
there are different SDHI versions on the same SoC. Adding a compatible
might be the easiest solution, but then we have a mix of compatibles,
soc_device_match, and even version register (deeper in the driver). My
gut feeling is we should take the time to rethink all this?

> So either
>   a) SDHI0/2 vs. SDHI1 are different, deserving different compatible values, or
>   b) SDHI0/1/2 are identical, but SDHI1 is wired different, deserving the same
>      compatible value, but one or more additional properties describing the
>      different wiring.

Actually, SDHI2 seems different, too. It doesn't support SDR104. I don't
have the SDHI specific docs, but from the main docs, all SDHI instances
are different.


--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlup8DQACgkQFA3kzBSg
KbZrXA//Yk4UJBnJZGIYX1fBNzijp+Wg8/mcnJMuLYrkOg76FfNPI4B3BzYGm8m0
WLGsm2544okqeQscfYzumacXGQSjR9SSQeTaqcqL0vh54MRUnGp70o+GjJQrUxb/
mUL/cEBT+y3NDj3s28YpQNGccnuAMdrDfizKgXtwrLrf4yMafHB/1hQPKmlvhd3X
rEkpm3ZqCNaKhvGIqgPjBHZ9YovAtnJWGHU9+yToQdvximkMlOhGTAKdaFqxiECk
HojngqBV8PLxaPxX+j9JJGtDBBhW4HrZgY5TfsYh9+f5+frklX8Am+WA1XpfrQYW
jDea3BevNy7U+Fr1w7PKU3lKQ3r1vPrX86F/fLFLixHOY50EQT2YwjPmKmT+GjvR
q5OLTzyNTKqW6fjT/BqymnzqPy0rwuh7Aqt2mvJ0jqYsi1Y1OVRd2bz41P6IfxGo
EEZWAxPka4nNnMT9adWwDpRDYa9k4KCdHZdJA2FPDBxPWDmUT6vylB7RBC27yMGp
xcrFPXiyMk4mtXKDIj4XF9drQyFKUz5bMHFYybvn+HBJtV6+rPBZSdW8/28lpWu+
gpfIRvCzyedfTf620YVQu7h9ASvl2AnMwy00DQ1ir6T0CFbMdE5/Oczu56CdGZk5
mow4czXOfR9e6ZgBhtQBvEgHEzpvYVzJJi5beCjyJyKrvYBdQQU=
=TPNO
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
