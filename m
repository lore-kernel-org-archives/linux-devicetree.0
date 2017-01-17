From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: Add Mali Utgard bindings
Date: Tue, 17 Jan 2017 10:38:13 +0100
Message-ID: <20170117093813.mxp2hgoxbgske6ru@lukather>
References: <20170116132424.7038-1-maxime.ripard@free-electrons.com>
 <20170116184906.r62di7xiil5lae33@kozik-lap>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0246541141000833915=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170116184906.r62di7xiil5lae33@kozik-lap>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kukjin Kim <kgene@kernel.org>, Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>, Carlo Caione <carlo@caione.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0246541141000833915==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b63koylry6bsxrbr"
Content-Disposition: inline


--b63koylry6bsxrbr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 16, 2017 at 08:49:06PM +0200, Krzysztof Kozlowski wrote:
> On Mon, Jan 16, 2017 at 02:24:23PM +0100, Maxime Ripard wrote:
> > The ARM Mali Utgard GPU family is embedded into a number of SoCs from
> > Allwinner, Amlogic, Mediatek or Rockchip.
> >=20
> > Add a binding for the GPU of that family.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  .../devicetree/bindings/gpu/arm,mali-utgard.txt    | 76 ++++++++++++++=
++++++++
> >  1 file changed, 76 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-utga=
rd.txt
>=20
> Do you have a driver in kernel which will implement these bindings?

No, but we have bindings for out-of-tree drivers already.

> Defining them for out-of-tree driver does not bring any benefits
> (3rd party driver will not respect them anyway).

You could see it the other way around too. The out-of-tree drivers
don't respect it at the moment because there's no binding to respect.

And at least for us, we definitely plan on doing that.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--b63koylry6bsxrbr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYfeYBAAoJEBx+YmzsjxAgAX4P/i5oPEn98eoiVsJlLfEc/HDL
aNN/zrSKBBtD1gzJhara2NsgEfSkWP5opyi1rYrZEjcdIA/tP9AVz8hUVEMQrN+c
Fzo2v+CtL0KhNx5PGXxrgiSHNcYriLfzofM6gdWLvxbn5owlx2PqZq8pn8hcXbMQ
4HX8lwSS2GKrjDELJP7Lk8sc/S86znk/64t7IrSnOONpwp2oUTN4TWPaGRIAbk1W
GUfhydniJX8Eg0JmWJL1XiA4QFFZBDW8ltjDq4t8hZMJPG402ubRY4kEbOFgQNiy
gJhtUPh4DVov/W5jAMfq7HbM8xUFuc6m15Fv4ofztK3cnestEDgpVBI3hEdHfryA
bu6BTetoIF+/xm8Meg9G89HLvXiS8FcpCd0kLJfImKJXqlGcUM25rGLOTYMxHqB+
6Hsh2TrjAtsZ7gwVT30hqVHT6WNR4m+7wkz8r2QSDh8aBbdfN+HFPSpuWC6TsXqW
tNHxbML7YJzOip25GM8EPmslMvSF9DBK7v3qvtYRq+NjKVO8IA0YijllllemAcrC
hkAJgbgC3HgCsCqtj+FyJLTOIucrmPtsKbF85Gqz8GFkySYJ1WOxtVZk7D2slS8D
p6kYmXGcRcxXcQV9U4LDhN345wV25/RZ8IZ+qeTzP/ah5eaSBzEAF7f3GEJHCtQM
UPCLwnEG1HEbeE0xJhHm
=SUPt
-----END PGP SIGNATURE-----

--b63koylry6bsxrbr--


--===============0246541141000833915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0246541141000833915==--
