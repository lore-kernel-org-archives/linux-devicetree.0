From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: sun8i: v3s: fix build of Lichee Pi Zero Dock dtb
Date: Thu, 18 May 2017 09:43:48 +0200
Message-ID: <20170518074348.qa74i5nn6olszptx@flea.home>
References: <20170518025332.55769-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="kdlgnhj2yclqu2vd"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170518025332.55769-1-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--kdlgnhj2yclqu2vd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2017 at 10:53:32AM +0800, Icenowy Zheng wrote:
> The Lichee Pi Zero Dock dtb file is not added to the Makefile, so that
> it won't be built; and the file contains a problem that prevents it
> from being correctly built.
>=20
> Fix these issues.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

I squashed it into the previous patch, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kdlgnhj2yclqu2vd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZHVC0AAoJEBx+YmzsjxAgPusP/2sWJ2q3Vi3GKZ93Bhs9bdY7
h7449bJlL5guOC6aXwnoePapQwkYZQHVKSCX8MxKPGWVan3gG3XQtihvoelvz17w
cVZJ+pGJ3JMA0kTGGq5SRwE56MRu01OGuE7oQgJP3aR6X79CEzH+lZqncduy35p7
QXyl3vjTYQuKl1ehGDd+bsaaCQOD3xMBYNyE+NG76lhtOVnl8vUA3LuSjV034RXs
NNvV/8C8KxWMPe2be+AGBAKigpJ9gITp8aONCaPFNy6wa3QvVrCuyOCgK/69tRl+
iMAE9PkTfSWQWnkW5WSky1BbUnYBpSl+W/FOkV1Da59CGU+XsDFAmrUIPp5BbGuJ
RQhqDls9n3to616e0tdEU74lWARMeVjTi3w9hZ4EmH22+J2xwloWLhWEFMQUM06V
UPJ2YcsA4Wo29KdQ/Jg9K8XAnXdNkI2adewZqtVQB5ZBzPhBSvmLhESHHss8hWYa
INq/JjQY13scZq8oITqrq5x+/fb/Vkz5jhvNgdarKd52Fd6tzUkqEwL6LWWX/8gm
efeCv2RJNWA3DkpiZL+fCbiCk7eVy9htUQt6HmlUlpeEEdVMnX3Cp+9XPztvHOGo
Gsw4RoQZkKaAZqVlKtbMSWtLJpASmDD0TBFRzftzKwfk9FHjQWPgt3hHEHBPMHAN
WcVbfM+uiSbTHMmZ4WV0
=zjiC
-----END PGP SIGNATURE-----

--kdlgnhj2yclqu2vd--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
