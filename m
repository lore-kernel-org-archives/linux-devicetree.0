From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/4] regulator: Add set_voltage_time op
Date: Tue, 6 Sep 2016 23:40:54 +0100
Message-ID: <20160906224054.GX3950@sirena.org.uk>
References: <20160906210125.GE79728@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="i3QSQnH4pbmkdUT9"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160906210125.GE79728-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--i3QSQnH4pbmkdUT9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 06, 2016 at 02:01:25PM -0700, Matthias Kaehlcke wrote:
> The new op is analogous to set_voltage_time_sel. It can be used by
> regulators that don't have a table of discrete voltages. The function

I've only got patch 1 in this series, what's going on here?

--i3QSQnH4pbmkdUT9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBCAAGBQJXz0X0AAoJECTWi3JdVIfQVCIH/0KuP4hsNDM8GSuDRT1KQxyH
BYyBQPLsi1eZbm2R0buGCeU4Tb6g9f7Jo1bK1bpa8aR+OwXSbTB3p9DQZUXvCcqk
+k85kShbMjSptScbxhRmTWaHs5Mos1858ZeAn3UAT0U2GLXnbKNZ8eu7hNbhyz/Z
9fIuucs0cuCIFi+W3+6SbRCC/9uIpCvOp6Y4D/kKLOvBfW2QmmT+MraGCIvijwFK
NByFv1I2LtjNqTdnbabCg2nW58EyA52TLm2POcxmv4sCY1FqJ3zV5DF+ZV8fQ0Q2
pHQ8IolHG4ptGrhdK91EuBP5sh87LDXb2WX0IGrFqqf2dV3Ua2SmUCXr+KKQbaU=
=S+ao
-----END PGP SIGNATURE-----

--i3QSQnH4pbmkdUT9--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
