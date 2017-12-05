From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: dts: orange-pi-zero-plus2: fix sdcard detect
Date: Tue, 5 Dec 2017 10:15:08 +0100
Message-ID: <20171205091508.cx2bqfuuclgyce7l@flea.lan>
References: <20171103195855.15283-1-geomatsi@gmail.com>
 <20171103195855.15283-2-geomatsi@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a62wr66jvdseqznt"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171103195855.15283-2-geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--a62wr66jvdseqznt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 03, 2017 at 10:58:54PM +0300, Sergey Matyukevich wrote:
> The sdcard detect pin on orange-pi-zero-plus2 is pulled up.
> Fix cd-gpio description to enable sdcard detect.
>=20
> Signed-off-by: Sergey Matyukevich <geomatsi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--a62wr66jvdseqznt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlomY5gACgkQ0rTAlCFN
r3S2Eg//e73c06F9NWk5gKnZiEaCxsoYmziQjO3zjvFOI9hMBY6G7QPcijCUe7Lq
U1xY2HcF0E3Yfnyvwc+2II0mOpUoZMW8eGbLwRoyjz6CycPmdKxLz4DeE/aGUIuT
XtBmfoVYpaeinN4pW+Pc8mJ8TXenmzuzWT7QCqg94PVopTT9jOsQFk9l/H5+25KI
RQL3J5GnGR2H1xOfGq8AWv6ZoeVs3syxVeGJp3f4jSQ1lP+JnL8zEnaoezO3lpVU
aHQr/jlQFP0pvBgHEzQB6UGr+sscpd7dRUSI9GymaFpZMEhWvjd2XVD06kTOdEQh
ofcxakWejAztTLiw/XZi4N/Hc9U0fROoZSLkuCmkUp8IX+NTgX5XQBtZpZAQ0V+x
xmilEWJqu+4VkApJ12bnep9ufELxXIj2HGY0VMUZ3vCL+X8YgTapyNK3BWzxvKq0
REf5o7Q7pT9CdrvqMtljF7QyiA/V6xBn5hh+1MxINxpAe+F4NHEpnqMfSBnkRlrY
oCCtLw297uQaX6OHNpoPnqIdjb6QbkFv52Ez0NRFJNsFz+P6dmn8OWiRIkpziHpx
E9jWvS3H/L4+S4+Jpfj4VpHH1h2iOdlLw0sniMZEmrlibZUssSpU/MIXLp0Z03Sl
PdLpV555c9qeGLbBFV6LGx3xi9W4ZtsSuvjXUGkzMVM5VXI5SrU=
=f3k4
-----END PGP SIGNATURE-----

--a62wr66jvdseqznt--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
