From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 0/3] ARM: dts: sun6i: tablet dts changes
Date: Mon, 22 Aug 2016 21:01:18 +0200
Message-ID: <20160822190118.GD7104@lukather>
References: <1471543337-6938-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vr1sEM+RgL05fCrX"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1471543337-6938-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--vr1sEM+RgL05fCrX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2016 at 08:02:14PM +0200, Hans de Goede wrote:
> Hi Maxime and Chen-Yu,
>=20
> Here is a v2 of the series I sent earlier today, changes:
>=20
> -Add a 3th patch (patch 1/3) which I forgot in v1, the other
>  2 patches actually depend on this one to apply without conflicts
> -Name the added dtsi file sun6i-reference-design-tablet.dtsi instead
>  of sun6i-a31-reference-design-tablet.dtsi, to be consistent with
>  what we've done for sun5i / sun8i (and because it is valid for
>  both A31 and A31s based tablets).

Applied all three, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vr1sEM+RgL05fCrX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXu0v+AAoJEBx+YmzsjxAgWnUP/2S0uj/at+m/ZW9hChyJ0PKi
c761WIgA8udeElNBCb4WmWmsm6xopO9vxgg8ybPRg+xkbjKje2SQquG+cmpamacf
8rG33b/rBEvs5um8WgSwkOC2KWMOXpcYr06DqR8fldlYDRLgSiamluUSJlgEhfka
kDjb0o1btF8k98zUKs9bgoi6Cix6506yf8LClJkQFOfd+QtEVkPDmHhGvL1v9OoG
dJBz3WqVbKkIPZTLLxuG8+EiXEV46biymYr7hv4Mw8DPjU7k+ryOC9MGOa990Eb4
o0twvz90fOaBQzX6FCvzyCHLqCDsa4Xt43g09fumKpWDh8LoqKAy7LLfz6h3e3kc
21bkgpDuRMwh3sUB+8foKFBGOLeNeFEgz9q0TEtp8tngmf0eQgjMCPSnIUmAXoCS
/u7k3s854JNekQUdM+IJX9a4dNy3u8X8qOz+JJmFvVq3WDfIVRLxgPQfEXGhAEFY
VhnTpuYw3U248QeDeiSEQI/EY5M6soZ3uD0lHMMXBiVZ2LKAK6rr1zT6T+GlZHLq
27oEyKp7XU9yLr9tC0q2S2brAAG7JQKQYihJqw5islF6wFYmRKi15BCBoczp0jpp
kghDlLKzl7o8vsXj6DHBKKfUnQVdmBrvrV4wGN7l8flyfcaM0/Bt0b+M31s+L6ND
A9CYPXJ3nmg6YsMWXlfu
=eOuK
-----END PGP SIGNATURE-----

--vr1sEM+RgL05fCrX--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
