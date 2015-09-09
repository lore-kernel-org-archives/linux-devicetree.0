From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: sun5i: Add sun5i-q8-common.dtsi
Date: Wed, 9 Sep 2015 16:01:56 +0200
Message-ID: <20150909140156.GC9885@lukather>
References: <1441464953-26351-1-git-send-email-hdegoede@redhat.com>
 <1441464953-26351-2-git-send-email-hdegoede@redhat.com>
 <20150908143320.GB31584@lukather>
 <55EF529B.80401@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tqI+Z3u+9OQ7kwn0"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55EF529B.80401-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--tqI+Z3u+9OQ7kwn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2015 at 11:26:51PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 09/08/2015 04:33 PM, Maxime Ripard wrote:
> >On Sat, Sep 05, 2015 at 04:55:52PM +0200, Hans de Goede wrote:
> >>This is the sun5i / a13 version of sun8i-q8-common.dtsi for use in dts
> >>files for a13 q8 based tablets. Compared to sun8i this uses uart1 for t=
he
> >>serial console, and PG0 for card-detect for mmc0.
> >>
> >>This also adds pmic and otg support, which both use the same config on
> >>all known q8 a13 devices. This is not present in sun5i-q8-common.dtsi
> >>because pmic / otg support for sun8i has not yet been merged.
> >>
> >>Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >
> >Are we going to have any user but the one you posted in the patch 3
> >planned?
>=20
> Depends on what I can get my hands on / what is in the post atm.
>=20
> One difference in fex files of different 18 variants is how the usb wifi =
is
> powered, either via a gpio or via ldo3. Also there are differences in whi=
ch
> accelerometer is used, so eventually I expect there to be several users
> of this dtsi.

But no difference in the SoC used (A13 vs A10s)?

I'm not sure having 18 DTs for a single board name is going to be
really helpful. It would be something to be supported by some quirks
mechanism, instead of having to require the user to pick the right one.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--tqI+Z3u+9OQ7kwn0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV8DvUAAoJEBx+YmzsjxAg5fYQAKxF1lh7RA3i0TazHcfsIHaI
IGKCl8tB2Q3joDlHjlwHAOq1ud7wN31AZuUicclS1eYksaGV8ebM7Mrhyx6NSV5f
WxQNIxkfMWQcP7L86ZMzl0bFvgHhzLmA6fV6tPt85M9NkWI0RVOigHYlsa1pD2mK
U2LqbXhCsIC5hfqMAg+lPI1dEf6xTQmkRaTS9p80IcD681d58XditXYuX7xTuJkV
N8INyryKFaIR7YdWapJhxz+92BPSHHts1Vd/FPrXlWxSazOMCb7noagrncejIQUw
kneY+wpOUidMuFG+Wcu23I3nRGApQD/H2Qb2dzP+DGw0VZ3tkDbVZd67qI3bWo3Q
+G+WO27aXBf6vU3jTOw4gWFcQAtHRsZuspmqQAvYkGKM3H2JFhw2RrQr0HRSRQW8
RkR8/ufTV4VFtg8ElzShWGDTSNSlknAWxC9Kr9Cn2vVBTHBZU018Ruwh+dNipNrf
uh7GDzrfQD8zlz2Cu6PfmTYXFp+zzt0zatVvQRLQuUbA1aIoSvG/rJ4dsCfS/fqR
mxnkrsIIfN5PRSip2+YVUkW7K6yv7r9GYGFauSGByERoPNxPMI9mZSu4zM5+oOXt
1hNaliDGZm/D2XfllH2pBWFkxnkkPAtIEUAjhP8wgIRJTBwmFEgQkbI+l8wnBqjw
+x6/OmPCFwVzzFhqMQkL
=MPEL
-----END PGP SIGNATURE-----

--tqI+Z3u+9OQ7kwn0--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
