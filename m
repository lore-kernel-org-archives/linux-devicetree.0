From: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 0/8] pinctrl: aspeed: Fixes for core and g5, implement
 remaining pins
Date: Tue, 11 Oct 2016 09:57:35 +1030
Message-ID: <1476142055.16733.4.camel@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <CACRpkdZWbx1_SYJMOn40teQaEw1JAq80kDAp7N+OYaMRRO6NBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6780135098504128546=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZWbx1_SYJMOn40teQaEw1JAq80kDAp7N+OYaMRRO6NBg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, openbmc@lists.ozlabs.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============6780135098504128546==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-hVK1QdoxUWFNXarmauyO"


--=-hVK1QdoxUWFNXarmauyO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-10-10 at 09:59 +0200, Linus Walleij wrote:
> On Tue, Sep 27, 2016 at 4:50 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> >=20
> > The initial Aspeed pinctrl patches implemented a subset of pins for eac=
h of the
> > g4 and g5 SoCs. This series provides a number of fixes to the initial p=
atches,
> > mostly for issues identified in the g5 driver. The fixes account for th=
e first
> > half of the series (up to and including "pinctrl: aspeed-g5: Fix pin
> > association of SPI1 function") and should be applied for 4.9.
> Those are applied for fixes.

Thanks!

>=20
> >=20
> > The second half, from "pinctrl: aspeed: Enable capture of off-SCU pinmu=
x
> > state", implements some additional functionality in the core engine for=
 the
> > Aspeed SoCs and follows up with patches implementing mux configuration =
tables
> > for all remaining pins. Given the significant additions in the last few
> > patches, their lateness in the cycle and the light testing they have re=
ceived
> > they are best left for 4.10, but I'm keen to get them out for review.
> I'm holding these back until v4.9-rc1 is out.

No worries; they need some discussion when you have the time.

Cheers,

Andrew
--=-hVK1QdoxUWFNXarmauyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX/CPnAAoJEJ0dnzgO5LT5TsgP/jg5DRyy/3c4awC9o87ZxF4W
pjTa7TZaLrC9K6Y0yKUVkRb4VQST0ho7+XWa1sUU5BqRkYNxaU3+dgfKTLRq7rhl
CFxu/zUAWNxMhWZ6gbeJAkEmUGrvhrV0lVhKg/Ect4uYF8rIVtvDpfM7xrpQF9mM
Ty9PxvtybzI2DqtClNgcCOZYtFNe257zPzFkoYoq4fzPA4f/44SwusWbrAztHISp
CC/diW7YgNo8/8Y/6AniTy86mcSiGdZ5YWC6qGAjEGVi2SqCHZ5ZSEk8yYu6dGX7
i4FpUK7R7fUej2li1Z6qvatR/Id85DsjoTz705ywUHbxkILNfY3mALtMf4exWHug
NXS+TJKy4Gqv4C6kQ429m2ZhrZ0hGheHkQnXh9EBM9+0Cqg40ROdlQkawowSu3yU
DdlgX2HELuO3PtP50r83U+ya+v892KVj2M1wQh1+VwYTPm8fi9rA+OKgPLkAYdpk
v+QuKI/65SaxJpr7BEQeIDdI18CcTTwLBIWnPa4ZN34OX/Z2ErQGXpIX0wDcCTCV
s1dlCe7TPU3UMi7ZElQD+gYNuQ5y2Ac8R67vEY93inhlR6gwdyvA6PsAvolsnf7k
ZfXPjUQdcY6VRujxX1gZTZzkeGW7sQiwiCRT5OITD1Nq6vt/n5kuJ4jtWa597vJd
wZiR4q2ucEOj8XdzvtDb
=Yx7F
-----END PGP SIGNATURE-----

--=-hVK1QdoxUWFNXarmauyO--



--===============6780135098504128546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6780135098504128546==--
