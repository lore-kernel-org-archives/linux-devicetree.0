From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2] ARM: dts: sun8i: Add dts file for inet-d978_rev2
 tablets
Date: Sat, 27 Aug 2016 14:04:09 +0200
Message-ID: <20160827120409.GR3165@lukather>
References: <20160826102356.9524-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3337548603872183527=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160826102356.9524-1-icenowy@aosc.xyz>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============3337548603872183527==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+bDoS+V4AJZnUgoC"
Content-Disposition: inline


--+bDoS+V4AJZnUgoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2016 at 06:23:56PM +0800, Icenowy Zheng wrote:
> The inet-d978_rev2 is a pcb used in generic A33 based tablets. It features
> volume buttons, micro-usb otg, headphone connector and a power button.
>=20
> On the board a Realtek RTL8723BS SDIO Wi-Fi module are soldered, and there
> is also a accompanied board which has a Goodix GT9271 soldered.
>=20
> As this board is desired to create tablets with a Home key dealed by
> GT9271, a LED is present at the front panel at the position of the
> Home key.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--+bDoS+V4AJZnUgoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXwYG5AAoJEBx+YmzsjxAgk8AP/R0ddbcfLHQBD2OjiWyvi1i1
89zQzR4QEbkJkYecSKsVMHjPJfk7sJpzgjPTCTO7uRM92ydwixPof3kKt4KRMtqN
gmH+WsqyLGTmZ6rq+7I/z4ZeVrkaxwG+M96LSMlgzKm9oA8OzycSkS4Y+CJgHuKL
1GTPDZ6opqgr/hovek4SmldP9PbiQK4i/qlzRv1gTnAkVRX+t4FIITTF24qd4gst
ggJ4zRjN8wQvhkVA6ToIGZeLBbaFryGUzY+LQkbZJ3HMwJS0yc8eiacgqui07/qB
I4nMz8qZVz9jyUHZO1SJf7r8UMKZB5Mt9DLTtSTgOoET0tJwi8pe1ynCIieJ6XY2
xgwMjUbVHYotoAjn6pWTEsa+AvFUTnkl9Yj+Kc3CZssi6FeX9ji6TWQ+JfRCqUSf
oklqPoD/BBU8EnWJu4YpqLGqx6e7cxiYgoUNYBOQJsNzBQE3GeJKHK0aOp6cBh6Q
JTN4od8UhgUGaZ9xEcaKi+Q3FTub4Zx1nwpp6FqPLShH1OPzS0b9ja/JZD8e3Kre
f6ro1qf7mus2AfqWN1kt6su306Us2KzEIoa5usrv5Gz/rSQ460y8FrJwzWOqw7kl
bzygr+9QTUJ2GxbaknZ4vSEtMJtR4YenFOJpg+Wt/Svx7LEQm6CZ1JM/p4aTt4+2
gp2QKKn50AllNGTtX/jJ
=O1+2
-----END PGP SIGNATURE-----

--+bDoS+V4AJZnUgoC--


--===============3337548603872183527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3337548603872183527==--
