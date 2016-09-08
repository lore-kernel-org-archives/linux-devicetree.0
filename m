From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 0/8] clk: sunxi-ng: Introduce support for A23 and A33
 CCUs
Date: Thu, 8 Sep 2016 22:09:08 +0200
Message-ID: <20160908200908.GS8913@lukather>
References: <20160908094843.14710-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="z4IKABJTiQIqPwmW"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160908094843.14710-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mylene Josserand <mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--z4IKABJTiQIqPwmW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 08, 2016 at 11:48:35AM +0200, Maxime Ripard wrote:
> Hi everyone,
>=20
> Here is the migration for the A23 and A33 clocks to the sunxi-ng
> framework.
>=20
> It has been tested on SinA33 board, and I made sure that everything
> was reported at the exact same rate, that the MMC was still working in
> DDR, etc.
>=20
> This has also been tested to implement the DRM driver, so I'm
> confident things will work just fine.
>=20
> Let me know what you think,
> Maxime

Applied.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--z4IKABJTiQIqPwmW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX0cVkAAoJEBx+YmzsjxAgTMoQAJAqpIOZBDxMxxQyPUUoaChK
bmNDKSAymHqX2NgrEgLkVPS0pKrRFGDL3Bz3JOn1CUDKXdJRTegrDj89IbhW3mnB
Uz9fCHGvnLJF2Dh+lB/TsKQBN3lMymX1AGVdKnG6TuJ/qJwUJIynZKLgJ0gef5IH
wjQEDUqEtLLzD3CEp+7MxhVaVLmqqPbzrWmo6AVPjy0G+O22/9yR7iEefoTnY5me
cI4b/t+Ff75JfclTDvy1N5Ve8VEMctBtnWAzlSKwGly1piKgewGAewKxK/hemmNe
JFU2+frLkJY84z85FtwVez+yhJrmc+A61kFDFRaAT3guUE1W9WzXQCHqPz9gh0yN
qzSOpGSvLImk3/lPo7uwEJtJYU7MpFhoyl5BqthTjeIcY8BgKQ/UfLzBvUEAMhHB
hV8C5Ikw+4G2oukFoJHBd0O/Q1REnqaGGPsRfXK4BA1qQFtGGlRWLVlN2XzMXxX3
i50EvIPZitAA+YQoCvkoTqVyXWVvhlo5iRyDgL2I1PZd+Wj4/QUddaTZBxendEtl
gwd8JwnY9j1XT1xAidrSG0/FGzKfHhcLiFGmCf3604B9mFcHlgPUCB31lgS5MGv3
1l1t9q+Jmea2WeVciHrwTzCvYEhVbyF1eREdRUnaUY2z4cGJYGobaKuUDhiIYPU0
CWkKODAhnQukGJgQ+LjP
=g9je
-----END PGP SIGNATURE-----

--z4IKABJTiQIqPwmW--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
