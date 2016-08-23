From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i: Add extra UART pinmux settings for
 A23/33
Date: Tue, 23 Aug 2016 13:42:51 +0200
Message-ID: <20160823114251.GL2598@lukather>
References: <20160823055826.20591-1-icenowy@aosc.xyz>
 <20160823055826.20591-2-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4271476954058811775=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160823055826.20591-2-icenowy@aosc.xyz>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============4271476954058811775==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FxavXfDenm+F7xE/"
Content-Disposition: inline


--FxavXfDenm+F7xE/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 23, 2016 at 01:58:26PM +0800, Icenowy Zheng wrote:
> A23/33 have 4 UART controllers outside PRCM. However, the devicetree used
> to mentioned only UART0's pinmux settings. Some extra UART controllers ha=
ve
> RTS/CTS, and is suitable for using as bluetooth UART controller.
>=20
> Add the pinmux settings for the UART controller, to make use of the
> bluetooth function of some tablets.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Our policy is that we avoid adding unused pinctrl nodes to not cripple
the DT for no particular reason.

So please add only the nodes you'll need in your tablet.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--FxavXfDenm+F7xE/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXvDa7AAoJEBx+YmzsjxAgjXYP/3O/JXDm1N9boh97caSQMlLb
nmrUq/sj4yb1p3j7y0VeoIG+RvXxuRZWWWniFDx5oRzMTx0K0QtnoQ8XzrLL+9Em
0EBeZOjzg0iSUhqgIq/518VBYYVos5aDsWGME1iROnSd6IXYgbwpONP6TGQEtebl
oEVpPYUK1E1DlroQYkrhRiOsbcBuNSJJrTAWRuzZNxG+QGmHkaYBEUIi02qfoRqm
L3X+J2BzGHpWp3vUI3sKkmlWx32C7k8qmTv52lB8KeJnW2/7SNLByftjmt+0Byn+
B8KyG9LijNpqMIyv6it0deHdayY4reo85JTrNREU9AU3AHmHsNJIPkVu8+sruAb/
JWPfwISLQ9X5klNMtt8ykhi+XqEFkpIuML5u3VwrLbXlOCsDw9/wLuJf8CWG4rPP
Thi0zPZ+V8yQolhuoBj2M39Y7LU5/k8ajuuo+e9yFn6Kp5415bNc4DaGt7hFu0ar
N5bCQAGTqNt+qabLXt12l3D5pdaFOa6i1cn2Np2Ql4SHgE9u3fLb97sB78dQ8I7W
bsUVVbdComS/gadL29sL/bqFK4caVVekD0xgLDmus6w6rmz8uCHRoXZINwOJLm4x
sbnrgzYZcmaXMgcUyhSC07/bDO+XRCIM3tSPXcY9JvcsY2PJ/2Ry2xkCX2mF/CHm
t771Je7VPzXdFaf5/qod
=T0J+
-----END PGP SIGNATURE-----

--FxavXfDenm+F7xE/--


--===============4271476954058811775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4271476954058811775==--
