From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/9] drm/panel: simple: make it possible to override LCD
 bus format
Date: Tue, 17 Oct 2017 14:12:40 +0200
Message-ID: <20171017121240.GD684@ulmo>
References: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
 <1507721021-28174-4-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xB0nW4MQa6jZONgY"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1507721021-28174-4-git-send-email-LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?utf-8?Q?Wa=C3=9Fmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--xB0nW4MQa6jZONgY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2017 at 01:23:35PM +0200, Lothar Wa=C3=9Fmann wrote:
> The baseboards for the Ka-Ro electronics series of i.MX modules
> use a 24bit LCD interface, no matter what LCD bus width the SoC on the
> module provides and what the LCD panel expects. LCDs with 6bit per color
> will ignore the 2 LSBs of each color lane, and modules using a SoC
> that provides only 6bit per color, drive the display information on the
> 6 MSBs of each color lane and tie the 2 LSBs of each color lane to GND.
>=20
> Thus, no matter what combination of LCD and SoC is used, the LCD port
> can be used without shuffling bit lanes by always configuring the LCD
> output to 24bit mode.
>=20
> Add a function to handle certain quirks of the LCD interface to the
> panel driver to be able to override the bus format specified in a
> panel's display_mode.

I think the above paragraph clearly indicates that this is the wrong
place to workaround this. You say yourself that the LCD interface has
quirks that need to be handled, so why do you want to force this
handling into the panel driver?

The panel remains the same, no matter what interface you connect it to.

Thierry

--xB0nW4MQa6jZONgY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnl87gACgkQ3SOs138+
s6FfXw/7BpdyFThdoJ6X5unkmsX1vvAKSgh0Gc96rJA51SqtD2EfH6c0u+eYUXWW
W/wH8IqgU03NwU4gM5x92aV29GDAV71nXnbtBccugxK49wE/Y9M96ZwoM+/MI0rC
7pRJt7CsiEINHUqTsisZqhfEKr6l9vb1UCR4l1WyjrORDF6oFLivFKjM6B4YAdEZ
dFfx4k9TqnCFcSIOKTBK2s7H26nYf63ZHZYbQDb5c8J9dkDXpxESFGsofTjdxOPK
GJqFDAxukBGoaeYLje04CIww4a89wMqwzWNlX39nWs2qwXykTN3RVoK1MEMEBFFd
3oVLWi9DtCNEt7qpxoV3aH1SRWLQDSQUDzbj3xb74Ba9cLI2Pb6IiYcLVIW+DMGK
zbNyqtoD7tBuaJK+k/W6V0etq8DTWwN4daS4KleN+YsZAZTpzhbfr90CCRgSGNEx
KIN3iaxeRAohoZFqo36cDefW+gQJJFFira/xXZd38CrpPfPrNLZmiCfFt98fy97z
gU99zUBb2auaRKQ9AX2/v7MWqNCBmEx3VjU9FlL/U7DttW0YQSK7E8AyuOA/DG5B
9Sfa4LIc6S/z53rjKxvScx6Viyg9/nbS3Yi47jjKMHo1p99TZH1YBdQ0tZd7of6z
UlK/0ngY3qDHLvg9ASm+iA7/XZk1MvBfkaU1ZeDoABA9RpjegWY=
=C+Ul
-----END PGP SIGNATURE-----

--xB0nW4MQa6jZONgY--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
