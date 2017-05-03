From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v4 2/3] drm/vc4: Don't try to initialize FBDEV if we're only bound to V3D.
Date: Wed, 03 May 2017 12:06:54 -0700
Message-ID: <87r30569pt.fsf@eliezer.anholt.net>
References: <20170428224223.21904-1-eric@anholt.net> <20170428224223.21904-2-eric@anholt.net> <20170502092400.35owmdw2fgf4uquu@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170502092400.35owmdw2fgf4uquu-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org> writes:

> On Fri, Apr 28, 2017 at 03:42:22PM -0700, Eric Anholt wrote:
>> The FBDEV initialization would throw an error in dmesg, when we just
>> want to silently not initialize fbdev on a V3D-only VC4 instance.
>>=20
>> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
>
> With the commit message updated that passing num_connector is the bug that
> throws the error (and not that we set up a no-op fbdev):
>
> Reviewed-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
>
> Still kinda hoping for a follow-up to entirely get rid fo num_connector in
> the fbdev init funcs.

New commit message:

    drm/vc4: Don't try to initialize FBDEV if we're only bound to V3D.
=20=20=20=20
    There's no sense in having an fbdev if there's no display, since
    connectors don't get hotplugged to this hardware.  On Cygnus we were
    getting a dmesg error from passing in num_connectors (0), when that
    argument is supposed to be the maximum number of cloned connectors per
    CRTC (1).

Still no drm-misc acks on the other two patches, so I don't think I can
merge them.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkKKk8ACgkQtdYpNtH8
nugayxAAh2cvr9jXTM/Yj+PyEQ1X00vGp9mR7mQg2z9wSKzie1Tl5ZBkOc0P7PTh
FKmOIm5RWPdtjfsz0weo7ESO02ze5GOzPgisHlqxFNX4z416cl6pC3wtuYdfgg+H
roK4T9w7zbcrxKo7tt6D6iYiND/lA/tZdaKQsTwqrzsP4zdkcemlFfDAsep6GVXW
2IRCe4t9F72zZH6v9hcUkx3VeIsmRQxiG8pgCwpt+ObGGq7Og4QfcJ3MGnx2HhMm
ZU7E8C+HpfkZsQAFQpfcmJ2P2DvUS5qnoC2SQEUXmhGOkfRs5vD9bcokQCd5vztZ
bes2Qx6GoiH6YnVF0UWq2O2MdBu8wC0DOK8kfF/yI79yOBDYo5YWTVce10Ilqash
YQTuWd/ELtCbd7eGSyKRtCZM3mNfiAj4cgbpKWhcIDWDhfucAazkkxi/l339yejW
/CPNdvAEVd0t0gKVf7D0ON5j6z/3kktp94w3zzD2tF+R3JTqR88EaC7P1+hmlJun
JH/G1YWqo6Pc+Oa5E3IQRjaDdLYxC3qpco9gbSTRQfc3QKoHXOsYLBKVmycbmch0
29yRCzic8G8Tl6/pgj+VBPQ5PfIKn5YCyxwiRlKqRxjeha3cuRo2aIEHA9YD+KrB
f6hPOVg2xnWgONFMekcbjS1XrSoP3nKZUfPOE89Fb0Bt7esYHn4=
=Et6M
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
