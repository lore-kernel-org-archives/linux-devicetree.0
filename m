From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/2] ARM: sunxi: dt: Add missing DRAM gate clock for
 simplefb TV output
Date: Thu, 24 Mar 2016 19:45:28 +0100
Message-ID: <20160324184528.GZ30977@lukather>
References: <1458842920-30854-1-git-send-email-Priit.Laes@icefire.ee>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opGwb9ZbHW/MEJRX"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458842920-30854-1-git-send-email-Priit.Laes-FvMSrs6xSY+ptlylMvRsHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Priit Laes <Priit.Laes-FvMSrs6xSY+ptlylMvRsHA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--opGwb9ZbHW/MEJRX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 24, 2016 at 08:08:38PM +0200, Priit Laes wrote:
> From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
>=20
> DRAM gating driver commit for sun[47]i seems to be missing DRAM gate bit =
5 for
> simplefb TV output node. Add it.

Thanks, could you please add the Fixes tag and Cc stable ?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--opGwb9ZbHW/MEJRX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW9DXIAAoJEBx+YmzsjxAg86YP/1bd/9x54K/nj+FxYn1kyNFZ
cS5im0hRTRHxjrfdRgMXiCXJqqmIKONHlyhkup1c970XXUtGdkXMb1fUiRSORDWv
CIdusBOIbJKJ9Sw3UGpxem9wm1Umz0AubqecyI++BOmNfx50ciVGsXQQNDhfda8q
oHY9QDA5A1tFGiFSXh1DXqwQm/lo5RE66kSY7xZNm2gC3fGA3LC0sYSM7ZvnxqFQ
LtSXGUZ+/d8KMZNKn1i8pVShsuAmP/QWO4P0sGMhHqU6izVxFU/3hZlSm3BpRXye
fTZKzrzYtlK84ggQNiVfj3tTP4YkZLrcooxZAYeoOUPM1vOSFtt0xQtnoNJOKduT
VhycoA+Ag4c0fQdeDi9O2n2o0MJFJftmQU+eyT5A+3VI2hGcT04AxrhOMC5wNPx2
P4HEcnmj3Wf/JfliDnhA+XFEMLpEz77KXVVRUErdVrEnyB3GBgz4fXzpwm2YY6bb
4/YTtv/FhEmj07JtONYnE+CGfawyz5rdKr+qhvXZurtrhyBaU2Mg1PNWij7hU8YE
z8ALXTEW1nZ/1jJEFs3wlPA7OHs8akXc7QA3+TChSLWTw4MCrCtD5rETiUNhKPD3
90mbWP3I3LnRpe4GKTjPQbBCeyDV+i/t2qJ6+YH2Pg5oWnGWCGSp/VyGijm+pcDy
tUpa37ksQHbW1D6miCKQ
=zedT
-----END PGP SIGNATURE-----

--opGwb9ZbHW/MEJRX--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
