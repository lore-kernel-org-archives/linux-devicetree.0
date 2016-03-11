From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: sun5i-a13-inet98v-rev2: Remove mmc2 node
Date: Fri, 11 Mar 2016 11:09:36 +0100
Message-ID: <20160311100936.GW8418@lukather>
References: <1457645884-10282-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2LWaEC9akcLlisSC"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457645884-10282-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--2LWaEC9akcLlisSC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2016 at 10:38:02PM +0100, Hans de Goede wrote:
> The sun5i-a13-inet98v-rev2 does not have an emmc, it uses nand, the
> mmc2 node in the dts comes from a copy and paste error from the
> utoo-p66 dts, remove it.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Queued for 4.7, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--2LWaEC9akcLlisSC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW4plgAAoJEBx+YmzsjxAgK50QAL7mlnJWW89lQsxUrY7Snv3H
NUYjssbLwJr29ElziPfeoEJWuTWHSityN1FIPTLAO/V7mAHUxwhprngezqUx05gC
25sQ69dC/tHUSG1b1iG7T3bx5iSRlyW+z29aEB2YAm8+2uzfktN7ax+XsL/Kq6eD
9VXlQl2z2ZsTCNU/0L39YYd5Qz+xuFIDTFlXresnn3oBIfZQd23Y0aqACYHOYdDW
OD/0655Mjkf/sM1Toc8azF9Q6Y6/Ehy4+mcNegBtgQoVOKPMkMfPGJudsF8vtgC+
y1dnF3XozH0xPZmEp0ZsuX5shrIwM9VhHRfLbFAvqH3rNN91f6u4/mFGuaSeiFKK
DC9qj9uM+fSTWzOGkI3fptIp+5Joi/pJ+XpIUWediAC167G3+E9wVeopN6slo8sA
bWkMmtAO4a8uMaNhy7C3DBOtE7Asjq/u26RD1ERsbfbuDxcDojv/Z2Rmt3FFn7XC
BpREJ6KNrXSHTSCsBM+b3NGsIn6iGU3dkvoONkcOj68cAhlLSfCsEc56tjoF+abO
Oqe4LQU15JK2iBbU0k1YDsi7EGSP7U+uz6cL8uI24fgPjIMOUwG34DLn8+XVbzpx
OBOZTfC4u7WMEZY/8qruebywxOhPYrotsNEDuB7Tbfm+jjzhTjUQuAd3S1U1gAth
QNF7FnAJMyg8Ra2ll2M7
=cXSB
-----END PGP SIGNATURE-----

--2LWaEC9akcLlisSC--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
