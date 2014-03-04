From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 00/19] ARM: sunxi: dt: ahci, ehci and ohci support
Date: Tue, 4 Mar 2014 17:48:14 +0100
Message-ID: <20140304164814.GD607@lukather>
References: <1393701998-3553-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QwEQbjBJrdBSvIbq"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBSUI3CMAKGQEHU5FBDY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1393701998-3553-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--QwEQbjBJrdBSvIbq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Sat, Mar 01, 2014 at 08:26:19PM +0100, Hans de Goede wrote:
> Hi Maxime,
>=20
> With all USB and AHCI bits going upstream for 3.15, here are the matching
> dts bits for AHCI and USB host support.
>=20
> As an added bonus I've also thrown in 2 new boards (already with ahci and
> usb support).
>=20
> Please let me know if these need any fixups, and if not please add them
> to your dt-for-3.15 branch. Note they are based on top of that branch so
> they should apply cleanly.

I just took it, everything applied fine thanks.

Note that I submitted a pull request yesterday, but I plan on
submitting a new one early next week, so this will end up in 3.15.

Thanks for your hard work,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--QwEQbjBJrdBSvIbq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTFgPOAAoJEBx+YmzsjxAggNwP/R5hsXuoDQqZ6Z5+mIDIi0zl
KJxCWMqW3e010+mcgx3VhWmrdSrx8HT1M/w4pi1T+cbMKf1psdcSIDdUFKbdsxWS
xIlDDONsIhRA0OhYt9wHcUVLai7pJHVfL1SHbmG57IT8ZBjMBlbiC+u2hiZjkyVk
qminiU8qSloLkkUN5rzEqLLCTzmMucz/TNZNAUQjqjYOcSwGvYBtLhmLPxBw5c9W
F+u72SbdLmdbtsacD8Vg2lYDxpEvk7x5vd+YGrqs4rhDKkiUwXEGA/OabQ6jshsS
fqGlhnJZcBEAQW4mnCu5AhfToiKf0EirEo0UMKjcy83KtZlNi2L16P2gOUF3rga3
wV/GGV7QNxPOb6rREiuWEAaGdd9e0XuAwwfVnwXt35vfyxH5PPBygFwSbnkIHhZI
WOWMkrQKMDX9dzgo6/KTnlgeB+26lK5V1HhdOQofN6nibVgFOYM3sv3bYteNDCNz
O8X5I2gyzfsoh/MhLAoVJbgK738Oaz1ZwtQAR9Ht4E0BHUbhpmsCGL4ns8dCBEYR
fViWjtpx/vmRkTeTTGJJo5fZC204VojJhkub3dfInLVf/MdSM9cCqTiDcF1cbFSM
W/eu2OvQkxoM4hFO9apRYi0zOk9xb/9GqdMxZN2ih7zYUG3iuk9fHIyxZ91qlm47
PxHGgXOUfYoh35BAhLGD
=Y9XL
-----END PGP SIGNATURE-----

--QwEQbjBJrdBSvIbq--
