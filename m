From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 1/3] input: sun4i-a10-lradc-keys: Add support for A83T
Date: Mon, 26 Jun 2017 19:13:42 +0200
Message-ID: <20170626171342.pdr7xdiaki4i5bdt@flea.lan>
References: <20170624024515.4669-1-techping.chan@gmail.com>
 <20170624024515.4669-2-techping.chan@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ru5yr2c4dqsm7ci7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170624024515.4669-2-techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ru5yr2c4dqsm7ci7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 24, 2017 at 10:45:13AM +0800, Ziping Chen wrote:
> From: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> Allwinner A83T SoC has a low res adc like the one
> in Allwinner A10 SoC, however, the A10 SoC's vref
> of lradc internally is divided by 2/3 and the A83T
> SoC's vref of lradc internally is divided by 3/4,
> thus add a hardware variant for it to be compatible
> with various devices.
>=20
> Signed-off-by: Ziping Chen <techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ru5yr2c4dqsm7ci7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZUUDGAAoJEBx+YmzsjxAg0tsP/09BldPOXo09X+5UwUFPkJHF
szHs12T/cS21V4Wxl5O0QMthXEjiRZPLit6y8m6vKDC1jhWHSdKFqUtGCMZpS7Sm
3BEPTkQhovrgdkObJMxI962UaOef6eSWnAIae5ybc5Pvj/q8hKanphhIyELFn5RN
R1MSunxA/MdSdLRxoo21Y6xIBzNiz8xYjvu2k9vGleWZVfRvZO3Res0QFNJaYvjc
WakzKbVmRKOn6eUbs8+vQmJHa8OUOURsM+vqsmBci2x96Q9ZvXC7XqCziOh7n8mU
5/QXyN2Ysfs2U1C0cJA5r1nTmZzgUiqvlGDdj/JzCYX5JBgOZksOL9cQdt7hcNV7
4fjG+FOc5fPAb/rBUMdNN7yrH+Rgbzy53FvRw7MbwihafzRh95DHYCSK6ie8uI55
WExpPl16z4nJx55fdUYj8aSN6jBCNDr7zHH9tb5hGqaHrUs9R17dD69ihQUa5nX3
QkLqvUqe4uylqi97zO0oXIuk3S6xaSv3F7KA8b2bN8zVhZv0mz3Dps7tFDi2k+4d
aBT2Uw23lD7UTWTF/CrBPplytD0Hm2byS+MVpQzJ+ayouHLSx4xbd+F9Xz48nj/N
Ssv0OrVrrSA6W2VSjqMHEbu9zfEliJGaOzmKAjsVCNojTdNa/CI8lRe/wgwQrT2m
XrsrVAHZVKvaprURCwe1
=EdxR
-----END PGP SIGNATURE-----

--ru5yr2c4dqsm7ci7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
