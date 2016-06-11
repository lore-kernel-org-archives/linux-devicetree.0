From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/6] ARM: dts: sunxi: Enable otg support on a23/a33 boards
Date: Sat, 11 Jun 2016 16:29:50 +0200
Message-ID: <20160611142950.GB19854@lukather>
References: <1465653186-953-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465653186-953-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 11, 2016 at 03:53:00PM +0200, Hans de Goede wrote:
> Hi All,
>=20
> All the necessary bits for this have been merged in the various foo-next
> tree-s, so lets merge the dts bits and enable full otg support on these
> boards.
>=20
> Note that we cannot yet do this for a31 based boards as the axp221 pmic
> has a quirk where it will not generate interrupts for vbus state changes
> when it itself is driving vbus. I've a patch to work around this, but
> this patch is part of a larger set which still needs to be merged.

Applied all of them, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXXCBeAAoJEBx+YmzsjxAgkusQAKUbVSgV4f+7f06wAUMqIKOo
D2m0Pm7UHFK+Y6QA9+RgKFeUw9cvDL63KBL4XweY/hRQ9/PJZDM2+JGjRtVuJniy
Ft6lSDXvMzoUX4xp0Qh1yXcSk+DGlkRYYDltdv05XAXvJNyRctY5C4O+TN1pEJvR
KERikXmyHg6B1v0EYhxfyYGz136sbb+4dI8WSUrCspZZAZ0dRFvW9K+Iz5+rRodE
HJ9Z7aiXgUcj0bKQn1swhR0fP87LsosAV8yWSKy72HqSkSNEM/uY8RMNCir+ZjyZ
l/kNxfe4iFyGKJiRx61Sxigh/7n3h0wLoMcIHqOGROdLdGQTlr2sP/cZEfWwPTjh
lpKc86Kjr5AHnZP5gx1RpLOxoN+0WWRu+HUnMFwESV5W1jjjnEZ3SS0iTY6oe4Oh
JOUWeTl36xpwRTJvIy8VYKPyOmpAMLKo12VaJztEonSHyZAtvJo8Tm6SMJ1pOAiI
3y1HNh3hVne7CbP1bxMIfUq4kTKO3WNby7L6X9NsFUz5zC6PJkIYUwPPM410I4u7
lAY1LAR3N6kPgOp0jE9QqYBYfMwudOnK4BaBe0zhP7MPhGi/IkAAz1lJccsIc64R
YztkKECD6bUjDO58150PV3oghVJU1yhWfbMp3AawNHwYqZtR3EndnyjWBop6HzXc
sp+XnSqFHns2AOZtwrzE
=TZcS
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
