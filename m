From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 2/4] ARM: aspeed: g5: Add USB functions to pinctrl
 bindings
Date: Fri, 30 Jun 2017 10:44:56 +0930
Message-ID: <1498785296.5203.10.camel@aj.id.au>
References: <20170627021214.23323-1-andrew@aj.id.au>
         <20170627021214.23323-3-andrew@aj.id.au>
         <20170629201324.c4t7bcrhsdoftkd3@rob-hp-laptop>
         <20170629203222.xwxzlawckxlpw6u5@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-Cakq2GeHo/+tFsF+grjt"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170629203222.xwxzlawckxlpw6u5@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, joel@jms.id.au, benh@kernel.crashing.org, ryan_chen@aspeedtech.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org


--=-Cakq2GeHo/+tFsF+grjt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-06-29 at 15:32 -0500, Rob Herring wrote:
> On Thu, Jun 29, 2017 at 03:13:24PM -0500, Rob Herring wrote:
> > On Tue, Jun 27, 2017 at 11:42:12AM +0930, Andrew Jeffery wrote:
> > > The Aspeed AST2500 SoC contains a number of USB controllers:
> > >=20
> > > * USB 1.1 Host Controller
> > > * USB 2.0 Host Controller (x2)
> > > * Combined USB 2.0 Virtual Hub and USB 1.1 HID Controller
> > >=20
> > > The controllers are exposed via two USB ports with functionality muxe=
d
> > > as required. The following table illustrates the relationships betwee=
n
> > > the ports and the controllers via the mux function names:
> > >=20
> > > Port=C2=A0=C2=A0| USB Version=C2=A0=C2=A0| USB Mode=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0| Mux Function
> > > ------|--------------|--------------|-------------
> > > A=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 2.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0| Virtual Hub=C2=A0=C2=A0| USB2AD
> > > A=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 2.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0| Host=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0| USB2AH
> > > B=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0| HID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0| USB11BHID
> > > B=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 2.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0| Device=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0| USB2BD
> > > B=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 2.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0| Host=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0| USB2BH
> > >=20
> > > > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > ---
> > > =C2=A0Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt | =
3 ++-
> > > =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > Acked-by: Rob Herring <robh@kernel.org>
>=20
> Also, when you resend, use "dt-bindings: pinctrl: ..." for the subjects=
=C2=A0
> of binding patches in this series.

Will do.

Cheers,

Andrew

>=20
> Rob
--=-Cakq2GeHo/+tFsF+grjt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZVaYQAAoJEJ0dnzgO5LT58MgQAJ6eFlkSf/Thd9C9WNBo0l9y
cIpneKeg8tuHyW7OansKn/Mzb0E51+ZlZlJDm8vemtDgFJx7dhPkazDW0orz+al4
WsiB9IRmjhqZKTT7xxOx1Du5uKekMRKdaKj5GhvIzdeYoFXHZo7NPlKj9L9SWMWf
C8K98GKG75j9kDccLK8eWYxrzKbm4ldmRIMxuR8bGudUlI5ZpnSV8u0xXnMPjBoK
xAMpAYN6UAlSQ+lfhsFy818HwQwYVqXO9UuJ8YrXhQnFYHoOAJLEdzkZkqv/HEr1
YEx4b9Wx1Lf9NIZiQYsmaSFSjBLLucuFLHCI0eLRHdKpeBk3B7iMPHd1K3Cyd1Tp
z96448aSzFmclVNIOAW90BH8+fKezR9YIQ9tp3FOFV6cBAPvXcUj+1Lh9gT0C5DZ
gG9T6jxES/NjxDqLH6NuPO3GhbiBdeV2w73+K2VUwz0JAYxTWkYzz/HVEslbPXYm
anJORhkkIWwCrvMHMo3eJAJKgPAlGbbOnioJl54o7TWiUMaMY6EkkA0h4/gATDZz
fOauOpwZptQ82ZexxpJQ8jg7cJl7BLcAub56mAYw12c9CI0lhNVuHCGMPV6xjlCZ
/xC4UK0jNiEjlmM/jfVBG9JHUyORR7OfOki1N5ghDhCSCCkeievfsk7XgfXxQq2s
c0n4SeV+RfU4SgmLf6S4
=y/4F
-----END PGP SIGNATURE-----

--=-Cakq2GeHo/+tFsF+grjt--

