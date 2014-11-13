From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 3/4] simplefb: Change simplefb_init from
 module_init to fs_initcall
Date: Thu, 13 Nov 2014 16:32:42 +0200
Message-ID: <5464C10A.30709@ti.com>
References: <1415885645-24613-1-git-send-email-hdegoede@redhat.com> <1415885645-24613-3-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="X5cDwmfxVRJcMdFWpC3O1ukfMVERPKKrs"
Return-path: <linux-sunxi+bncBCGMHFOOT4LBBFECSORQKGQEF3BCDRA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1415885645-24613-3-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--X5cDwmfxVRJcMdFWpC3O1ukfMVERPKKrs
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 13/11/14 15:34, Hans de Goede wrote:
> One of the reasons for having the simplefb nodes in /chosen, and doing
> explicit enumeration of the nodes there, is too allow enumerating them =
sooner,
> so that we get a console earlier on.
>=20
> Doing this earlier then fs_initcall is not useful, since the fb only tu=
rns into
> a console when fbcon intializes, which is a fs_initcall too.

The above text is slightly confusing, as fbcon initializes at
module_init time. You only change it in the next patch. I can move the
fbcon change to be the first patch when applying, if there are no more
versions sent.

 Tomi



--X5cDwmfxVRJcMdFWpC3O1ukfMVERPKKrs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUZMEKAAoJEPo9qoy8lh71EasP/RnIkMEyA0Tb+NwySPLenV8D
klNNgaGLU45zB9zd8om0KA+nSTkTNz+WLA65Io5tWFdc4TSABIq1bmM8+Hlds00I
IFR/ZBduxwaM7xbiXhG4KY+jtThtE8R34EgMYEJuF7YuiQ6Jrx5S+aNRgYFbB9KF
jPM2XTh/ILbkZB7mlXwdUHbm3gwynYCpBy2aazgZ6C367LkK2IJJvsrGJ3GdD0z9
msJAcC6bOgAT0TPn4UMpwPPobWZeq1/Docvfry3mQx+MuhXjbv4DAFWVlm9uvv9D
JuSjgQIvUe7nI5ZdlU3FbGF/jINLZOlqxn3emnA1fgofMmkz1MPQyq78aHXthq30
Jmz09za+UjYCMF20xpx3mQWG8vaD1GzuxCRR/s9SfmkkepqWiBvLNa2nTtuZO4JS
8qIP2eDC10MHsDvFJYM459z6UtuWdNesPsihlHqLeiw47AdgXCn/6YkwJBx5aG4E
EZCivyiqZMKDBPNeoWhFCJwyRQcU0tt02WeRbUK+zXtaGl64owGCwn9msCVCcPFb
R79nwKA7CMq0HT9JMhRq8sk04m+TBiX61J6gBZg8ThCPfj2eZhDnKHJsoLkIGQT9
XGquXIxO76MQSOFHSiD4o/Z1Fl0yIB+ZG2yfXykzeTS3R6bVAXwhetdULRsDK8Nj
ofWPpR0iumAn4FL2OMcY
=ZuuF
-----END PGP SIGNATURE-----

--X5cDwmfxVRJcMdFWpC3O1ukfMVERPKKrs--
