From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sunxi: Update simplfb nodes so
 that u-boot can find them
Date: Wed, 19 Nov 2014 09:34:06 +0100
Message-ID: <20141119083406.GM6414@lukather>
References: <1416308833-26739-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MhZKc0eW5aU1X1vX"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBN5MWGRQKGQEOCHZHUI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1416308833-26739-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--MhZKc0eW5aU1X1vX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2014 at 12:07:13PM +0100, Hans de Goede wrote:
> Review of the u-boot sunxi simplefb patches has led to the decision that
> u-boot should not use a specific path to find the nodes as this goes cont=
rary
> to how devicetree usually works.
>=20
> Instead a platform specific compatible + properties should be used for th=
is.
>=20
> The simplefb bindings have already been updated to reflect this, this pat=
ch
> brings the sunxi devicetree files in line with the new binding, and the
> actual u-boot implementation as it is going upstream.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--MhZKc0eW5aU1X1vX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUbFX9AAoJEBx+YmzsjxAgiU4QAKF+0gkVTcHnhNlwfdJWm2Zy
G3yQiT7UBDFIKlUQqAsnhx/RWqm6rgVkfhke2rOpnVdGt0HtrJBok+34tYLf1pM9
UAfDag4yRDPTN/nduUMTVWouYXs+cRYz71iaNpXzx3MA1GcuC7UzyK9vAymAvFZr
fw09vaHbFzvGgPsXmNTzmgP3UDXXYlRMQmp92Vh9aw64Jx6vNeJXmJIHlOj7FS43
HOFOZBfo5nvy0J+CKnpJMzNynBU6JD09v8Iylrt04HVtua/SpUnRVKTdylj8cyPu
y/36hpkYGKwo72AM9psOOYlHQxLBEqoqoLdp0n1snRo+f5qMkl1x/bR1/sItDks2
6AJX0eLkAyRdyVRJGctOEWYXIIYDIoihYbZRPFcYaPx8uzNelQyekVMxU3dTHvxy
Rxlu5KwYjdFSPWPo2FBtbjXE1LAO40F22adIypDihDaMQU7hs7jCsEQlecUVd0NE
o9dc3nmj6A6/wEyo83zC9SF9Igh3LcgAl7Eut3znqRUmOXz0SDvVefFj1njE8sWT
uo6KwupGpYKiIDcGHSE1XN7h8uU8G00VTToidlj37r9aJvtFm/DVLOgGyChWQEex
Chn/ujQbf6GAtT2jaGUUaWmgKDE/Lrxx2yd8CjTxZ5/YejSw/bUJmbr/YfSTundh
keeqG6P/XZEN8rNvSuGb
=tmNG
-----END PGP SIGNATURE-----

--MhZKc0eW5aU1X1vX--
