From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: sun7i: HDMI and the tv-encoder use tcon
 ch1 not ch0
Date: Thu, 9 Jun 2016 18:23:10 +0200
Message-ID: <20160609162310.GD5242@lukather>
References: <1465129368-22335-1-git-send-email-hdegoede@redhat.com>
 <1465129368-22335-2-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yb+qhiCg54lqZFXW"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465129368-22335-2-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Yb+qhiCg54lqZFXW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 05, 2016 at 02:22:48PM +0200, Hans de Goede wrote:
> Update the simplefb nodes for hdmi / tv-encoder out to point to
> tcon0_ch1 instead of tcon0_ch0 as tcon clock.
>=20
> While at it fix the clocks lines being longer then 80 chars.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Fixed the typos (than vs then) and applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Yb+qhiCg54lqZFXW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXWZfuAAoJEBx+YmzsjxAgf4EP/2PGxLzgLvODe7S/wwT0O4bb
5TW3K0JCmKFi680+982GTV2WoYr3z02U7d3wnzLW8tEinWt3icgPzgHNoGkvX1TU
1wGN/OHqTJQ2/x3Lx2u33Ip4L6gmj/SnzUBjSJS/nFsV1Dnfgs0CZFum7uKlBWth
cVH5GaUyYOB1E2wWsoR3u1BWb/07y5xHo1wm1DSrlJXN4qnPUqYaR0SPMikxMd17
Gsu1Z1fIWpuKmUv8p7hkYHINtu3wxhhPfjBcKnHSYU08+G2s2nxv3iojFMo4UCab
zwTpZAzsk/uK2Pcca7iStMsT7GTQl+GAXPr7woRRcTOL1DWbaGR8hGTdKk9hdqpc
LHlefGB5+eno3yXw3TY4qNmQbBRMBeQfLvPUJArY/rLQzg/Vzg4XI9+9tGu+QrZZ
egoAQjvVVEVJzef8HiO6TNSjSxTD0hQ92QkDbDtFkmrErtOxP+GJT1eDLgg2r/MT
DsX5lw/kMWLS5GsL7mUvRg8+3yx9DlW5o36Wcx9dXfbUYGQKBZaw+w0YwaTFZsDP
r0Ry3uGkx6EFb1iqu1fkU9z8KOxmmnXhOq62fp8WzP25w2GfVNowfiX0vncreCOZ
cI0Ramp8ysmNJ3jnSTQlEn5JEbkkezqspfAKrwqgekHgln9CVzRsFJIc775DnuRt
L8jnJbim278p/C7GrcUe
=48UF
-----END PGP SIGNATURE-----

--Yb+qhiCg54lqZFXW--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
