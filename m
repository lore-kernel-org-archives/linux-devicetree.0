From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: sun8i: v3s: enable SPI
Date: Wed, 17 May 2017 19:33:32 +0200
Message-ID: <20170517173332.hzw7xh74hxzmbphs@flea.home>
References: <20170517135257.1674-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ypsrtz2uxo6rtu74"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170517135257.1674-1-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ypsrtz2uxo6rtu74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 17, 2017 at 09:52:57PM +0800, Icenowy Zheng wrote:
> Allwinner V3s SoC has a SPI controller, muxed with the MMC2 controller
> at PC bank. The controller itself is identical to the one in H3 SoC.
>=20
> Add device tree node and the only pinmux node for it.
>=20
> Tested with a Winbond W25Q128FV SPI NOR soldered on the Lichee Pi
> early sample.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ypsrtz2uxo6rtu74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZHIlsAAoJEBx+YmzsjxAgIuEP+weOQ0k1kNpIM69uerlaD3+t
VlWuG8qrx2XbxAQy0zeWYvn7eBz5uCCtmICswkvY6qT9xRLL9OGHz7iM82bhXMWo
rm2uRXaG9JW6OMpjKePzFup1/YFr6uPpainK3Mdf4qt6LCVoVkNA8qjmmRFNkIHv
AKlvsQqHwx4t7k6uoSSfd4N+rgzmjjtQjd7EaONb12G0a/J9YYRROKsLam7SHe/A
+AHNdIbeZRbdIROuQrjRXOmSjwVu7LMXRu2gM5xgWvuR4Soi1ESIZbX9bhcEYGX0
njU3bc3vmWWiWKhCDS+kbvvU/AXUzozAFrGxonGT+60gvXZ0+llqejhOE+toMqEu
vuXxxCLU1k0nmaRgH5qwbW2bjI8hAWP4dRms+2GxoDsAxQmws8bKIkaZOg5dgzbU
rviazE2KIa/HKKdKmqEKo5tV3O+DOy9Y+FnronEjKMef9jBUWicCHxUqSwEIfG8W
C743RgBHO9tcJqwyyWllp++JV9YuV/AJHblR+PwH+FXOfjH0ycMGBMUOtgDVmbuf
BeJK1wGVjBvCMWpJXe6Yfwg3t0VLdIWejerRXQ0tGAo1F6x94WsINzpJWL8+2aX9
OjoCBO+rbVItoXWeSYa9dLbt6BIaAV6Xuyxto/ByZsRBro/HP2EzmNkuQ9xP03Wv
o54mqEAB1Iac97o8CxTG
=2GeT
-----END PGP SIGNATURE-----

--ypsrtz2uxo6rtu74--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
