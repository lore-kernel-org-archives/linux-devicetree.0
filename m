From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Fix pll3x2 and pll7x2 not having a
 parent clock
Date: Wed, 29 Jun 2016 09:03:33 +0200
Message-ID: <20160629070333.GA6095@lukather>
References: <1467144674-21322-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467144674-21322-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2016 at 10:11:14PM +0200, Hans de Goede wrote:
> Fix pll3x2 and pll7x2 not having a parent clock, specifically this
> fixes the kernel turning of pll3 while simplefb is using it when
> uboot has configured things to use pll3x2 as lcd ch clk parent.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXc3LFAAoJEBx+YmzsjxAg3/8QALZYcXsuNBh8VjSPBB5WI+58
gLcKM1jikfT+BZoe88JMMZqm0dwF23NrfM7aK1/psTzXg57Ayd38jdY4eLt2Evd4
fR3KtRXUnwnlp5TEV7brpkBMUvISLF2Thnh68q7H5gjdmdNYUq3poN8bK1Pd3faO
/uwXjxY0imLK2hu5HmiGL6p96Id7SPpRTIeeoga+27NJlymFeBzR+ENq8LjudGDL
tAMU8bOa8Q/qldrTa47rYcXUamhswYGVVRDCzqwbgSs5xXsBl8mu4X3kPcTeYIXb
dvlqg6olHu063/IAzQrJNbUSthk13Fxef2Trx8aMTHe6Fr2BZznQsR0tZ360fvB+
ltjgvf0y5HGUxG9EH1XEyvU9+Fs5GS8EwrR+QqNb74dYVtaAHEGjKfsNiDEESdWd
ztTnVDAnIZm1Y+7Gu2FDzlm5BFYbilyDDloA8wPTz6kRTExqVTxqocJHDER+A9HY
UwfADJ2vZvVdlXcQgM0cl6IJAC6X+n8IBGv+KuVlYYm/ikJtfEyBxSghpjRLTSA8
W9avBthUE/uWfPpoqo3q6dFGms6GreQZJR5scV2DugO1uKR96WWM6fD+Q87E/b54
IZrC5dz9+5809ihBTsc/JeLBnSBkb7Mk9G3GcIr3Bbkmfe0NCyJ1pxP33NL3a/Br
dilYDjSn9uvMs20XXcoX
=PD4W
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
