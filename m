From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3] arm: dts: sun7i-a20-bananapi: name the GPIO lines
Date: Wed, 10 May 2017 14:47:41 +0200
Message-ID: <20170510124741.GI5465@flea.lan>
References: <1494048638-24365-1-git-send-email-linux@rempel-privat.de>
 <20170509202725.e2tkry7dmsgx7se5@lukather>
 <17553199-cc74-96ae-bc75-5e91b866ccd1@rempel-privat.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="u3bvv0EcKsvvYeex"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <17553199-cc74-96ae-bc75-5e91b866ccd1-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Cc: ore-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--u3bvv0EcKsvvYeex
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2017 at 06:47:58AM +0200, Oleksij Rempel wrote:
> >> +		"", "", "", "", "SCL", "SDA", "", "",
> >=20
> > I'm not sure how it's called in the schematics / documentation, but
> > having a way to get which bus it's from would be helpful (like you did
> > for the PMIC I2C bus).
>=20
> I use only names provided by schematics. Using something different IMO
> makes no sense and confusing.

Indeed.

> >> +		"", "", "", "", "", "", "", "",
> >> +		/* PC */
> >> +		"", "", "", "", "", "", "", "",
> >> +		"", "", "", "", "", "", "", "",
> >> +		"", "", "", "", "", "", "", "",
> >> +		"", "", "", "", "", "", "", "",
> >> +		/* PD */
> >> +		"", "", "", "", "", "", "", "",
> >> +		"", "", "", "", "", "", "", "",
> >> +		"", "", "", "", "", "", "", "",
> >> +		"", "", "", "", "", "", "", "",
> >> +		/* PE */
> >> +		"", "", "", "", "", "", "", "",
> >> +		"", "", "", "", "", "", "", "",
> >> +		"", "", "", "", "", "", "", "",
> >> +		"", "", "", "", "", "", "", "",
> >> +		/* PF */
> >> +		"SD0-D1", "SD0-D0", "SD0-CLK", "SD0-CMD", "SD0-D3",
> >> +			"SD0-D2", "", "",
> >=20
> > Why did you change the wrapping and indentation on those two lines?
>=20
> i use 8 entry per line to keep counting easier. If line is too wide, i
> wrap it with changed indentation.

Ack.

> >> +		"", "", "", "", "", "", "", "",
> >> +		"", "", "", "", "", "", "", "",
> >> +		"", "", "", "", "", "", "", "",
> >> +		/* PG */
> >> +		"", "", "", "", "", "", "", "",
> >> +		"", "", "", "", "", "", "", "",
> >> +		"", "", "", "", "", "", "", "",
> >> +		"", "", "", "", "", "", "", "",
> >> +		/* PH */
> >> +		"TXD0", "RXD0", "IO-1", "PH3", "USB0-IDDET", "PH5", "", "",
> >=20
> > What are PH3 and PH5 used for on the board? Can't we provide a more
> > explicit name?
>=20
> Only names used by schematic :) If we will use something different users
> will hate us even more.

Those schematics suck then :)

> I can image to use some kind of combination of connector name and pin
> name. For example: "JP1-RXD0", or some thing like this.

There's no mark on the PCB either? RXD0 and the other are fine, the
only ones that concern me are PH3 and PH5, which are basically only
the SoC pin name, and nothing else.

I guess we don't really have the choice if the schematic uses that,
and there's nothing on the PCB..

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--u3bvv0EcKsvvYeex
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZEwvtAAoJEBx+YmzsjxAgA8sP/iQ6jH5grh7al1+C7AGS8CXF
OO2WYKTa+w4i7EC2ZmEol7Pq39fXxiCpRxjL0lxR+jcPZEl18cCbac5sKTu0gGfO
f5F1M204bEcVUBR0GmVm+dUlB/8NoSoam4ykyMWXSEZ7y4bRLTJ/6QtdFXgfWgEK
e1kHJu32pns94FzPqXm5E5XIhMyr+Bs9EpLuTRJD2sM6VoQqwxcZzWPXFIrPGJf8
dGPz2qRKfxIzysYiURX4lqpIY55FaaAeIxQMt+mAZ0L/dMgPZkQBI9uRgU/dlkcv
1OWlXYZPv2qWTP6pguMFdi3pWKWzZgqqV6swDwSd9W96ApK5ArBbhBm5i+88Qqo3
v+nbQAtlnzqRE5IvuCojHu627MZwH2wRGL+R9E3oJbkWvBHY+dUdbZNStkTTscrS
y4EEg6FJtBaH+AkTRg0aavXl9vuCKZ8Vf6OfklB/T5zwFXIv334Zc7ZAC6hhOUaW
ltqxHpxpK9/WuYLCcA0srMnspJKgdyNaOlz3pCqT3J7I+LCjdHk31HagUvYZSEpQ
a8p1R9DWWDuAskVxHWvcN2psNJK+vYFkPRW4IEP1A2rhFKTc+1afxIotweFJ49RT
kcxijS+DhJKYs0qt6jGSQDiYgEvg25iyh20KNtlo/G8UHekMmvpO6Ab/Mm5hYY+T
8fLk28LRM+LHV6RL5lFj
=KA+8
-----END PGP SIGNATURE-----

--u3bvv0EcKsvvYeex--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
