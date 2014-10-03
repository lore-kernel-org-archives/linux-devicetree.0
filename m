From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 3/4] pmbus: add regulator support
Date: Fri, 3 Oct 2014 15:27:46 +0100
Message-ID: <20141003142746.GA24441@sirena.org.uk>
References: <1412275071-6417-1-git-send-email-atull@opensource.altera.com>
 <1412275071-6417-4-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1412275071-6417-4-git-send-email-atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
Cc: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, jdelvare-l3A5Bk7waGM@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org
List-Id: devicetree@vger.kernel.org


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 02, 2014 at 01:37:50PM -0500, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
> From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
>=20
> Add support for simple on/off control of each channel.
>=20
> To add regulator support, the pmbus part driver needs to add
> regulator_desc information and number of regulators to its
> pmbus_driver_info struct.

Reviewed-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJULrJeAAoJECTWi3JdVIfQx5YH/2Or3CYT25D8ArNXkmGEnXvN
PPXAbRTmKOGRdX3gH5p7Vbijw0n2YonPF4s4lFNr3OPwPBXic8AHlB6nBOFQkho/
4MD196tDboRfOFbAuEtZxHU2BREBEPo1JK10Q5EO/knRnTow7ub5GrOSDs0ToKdw
ieI8fG4GYxcUAoIeUnelt9TQmjqtxlOTaAmPEQ00RzL0zLQxt4AlLxFgQywQrrps
9AjY3mLzF/isYGVfGFOYzmu0Ny9iCKLBuffu8i/pdBZaU6BtUsPBkeqZszjR+PeJ
fbsARKC/o8Tryp9ttaWsA4jnoSAeNKKyc0IoJPkXjqbcmt1Sn3Px4hB3hgUFCMc=
=J0bv
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
