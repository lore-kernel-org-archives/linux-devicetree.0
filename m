From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: sunxi: Add address- and size-cells
 properties to the mmc ctrl nodes
Date: Tue, 10 Mar 2015 22:34:13 +0100
Message-ID: <20150310213413.GI5085@lukather>
References: <1426001230-15906-1-git-send-email-hdegoede@redhat.com>
 <1426001230-15906-2-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9wgEzdE/cOoYWTWe"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426001230-15906-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--9wgEzdE/cOoYWTWe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2015 at 04:27:09PM +0100, Hans de Goede wrote:
> Sometimes we need to specify non-probably information for sdio devices in=
 the
> devicetree, this is done through child nodes addressed by the reg propert=
y,
> whereby the reg property refers to the sdio function number, see;
> Documentation/devicetree/bindings/mmc/mmc.txt
>=20
> This commit adds the necessary address- and size-cells properties to the =
mmc
> controller nodes in the dtsi files, so that dts files needing such a child
> node do not need to specify these themselves.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--9wgEzdE/cOoYWTWe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU/2NVAAoJEBx+YmzsjxAgwQAP/RlIgEtr+52bR7LUxcFag/7J
GGgm1t2N1OliwitmtfepBI2IyIhHiDH03jOzTTvra9Gt4qlfWvMAuBKCZQbqVtZU
nN2ASFRrn2ZV3UGWD6Wh8X7PVtWsvS5grYdaUG+1KRtV8bxbXq57TR4ZrfL/tzqi
zuZtLWqZAJq9S/cnhKEF/HYhWKX0wrZygorz7TQOLQreubjvJUScieKGiFF+U6bX
OR19P//oZieHgUbGI1332ojGOvcwXC2xTz17AEngrrVyVgkzdzwGwR4IUuTAUcEH
OvusNHI6B4zAoh3AsXYG1K7LmhnVBFgRLUW3BTUMff2buUMJPMU6uBnsedxIXpdE
P5tee7iQV4Bkk7V63R7eHWvhLPde26piLjGawVHfYcrQ77nfkblpxWjXDf1kKVxM
lv2pJhV9uMFRdGbVo2R8R4B++CeAgx4yjoy230I7CeZ0rRlAVzhgw76/lnZvfFNt
8A65LLQ5N/60BbR2qEVxLC5/c3yMMfrQ367AAoFszNV4tPDYQ6X4Tl+7uQX2AqN2
WuZBuLje/Vi8klQC4ATc8Fj02h1e1xnZSSw5i7FbLPxEQ8H6SDGg2nc68D3GKwjI
w37It65A4ONBfrj/+OUgSx2H1Fj4vaUjCqbOhEqeRp2efANcux6ImMXtdvxxQRfs
nDIRXEceRiCbhk/Rur53
=9R+9
-----END PGP SIGNATURE-----

--9wgEzdE/cOoYWTWe--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
