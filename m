From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 3/4] ARM: dts: sunxi: add usb_otg and usbphy node for V3s
 SoC
Date: Fri, 6 Jan 2017 15:19:11 +0100
Message-ID: <20170106141911.r4ehba64y4atys74@lukather>
References: <20170103152534.20118-1-icenowy@aosc.xyz>
 <20170103152534.20118-4-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8027258569616791313=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170103152534.20118-4-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, Chen-Yu Tsai <wens@csie.org>, Bin Liu <b-liu@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============8027258569616791313==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kvo7n7heevrvo4dn"
Content-Disposition: inline


--kvo7n7heevrvo4dn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 03, 2017 at 11:25:33PM +0800, Icenowy Zheng wrote:
> V3s SoC features a USB PHY controller and a MUSB OTG controller.
>=20
> Add device nodes for them.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

This can be merged in your other DTSI patch.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kvo7n7heevrvo4dn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYb6dbAAoJEBx+YmzsjxAgHX0P/0NTb9jQb8+fytr/yQyiJTKD
1zDMrBB8AUByBCkrmEzMhHbSzbH+3Z3i5pduXKvRwgEbimlJ6NMm2tcGX9aJzDgt
Ocfm0wuiYeUzhVEQyemwQM0svvychXObJnFRrjzp9+e6DOyPpnbUBdZ/q57AvB7b
ZLpvsK+MHR4gesWndIdoszFc4ZbWRDzWRzniXztsD1Zw02kHc3O0omO3ww3Q4oiM
+QQgyX+KnGIDjsHP4NDoJSbC79XNgkeAahsvINK3q4q0eVwFYMyWtZFYw4zQ9RjV
liN5XsV7C65umdaFyVM6ppCETKC9zPPXHuxqkbx18Sx6+EIgy+cKJnubLXtTpCDR
gLFrw08AdHxHl7eQRsLE9z0HW5N3Ud66DOCSvUn4eJmyzZ1OP3rr83wxWMt1qD80
OSEx9uDldE2n0YSVWvSl6JWj0hregH890TNLHlWHc0trDC7aUAjeLXFtUiLsFtsg
GziW7+6DzFaOAMDNyIJ+TNm7XcOgVAALDEKmJBy+Qw9iuXcLfRtTjt2z2iVgKgAJ
AEavZo294Gejm2xMoWQXarrA+GhT3RlfUSPBC+UEXKeSSU44CRVyhA88xU9xTU5e
PDF1IRxIZtIaT7jw3EFkjjvxrAwRLbO9cwm0N9Q/dqkFxJdPI7psvdOn0bCsyZ46
1LLERZgTKcRdG5POvwJ2
=gqHI
-----END PGP SIGNATURE-----

--kvo7n7heevrvo4dn--


--===============8027258569616791313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8027258569616791313==--
