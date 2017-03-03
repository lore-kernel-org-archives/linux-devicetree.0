From: Alban <albeu@free.fr>
Subject: Re: [PATCH 1/3] doc: bindings: Add bindings documentation for mtd
 nvmem
Date: Fri, 3 Mar 2017 13:22:13 +0100
Message-ID: <20170303132213.513d82dc@tock>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
 <1488484223-844-2-git-send-email-albeu@free.fr>
 <6d5ef869-a1d5-c8d2-847d-1c7aaafa74cf@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1196639776237707916=="
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <6d5ef869-a1d5-c8d2-847d-1c7aaafa74cf@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, Aban Bedel <albeu@free.fr>, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

--===============1196639776237707916==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Dsu8oNDvmlFF/G2vmn/oyDo"; protocol="application/pgp-signature"

--Sig_/Dsu8oNDvmlFF/G2vmn/oyDo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 3 Mar 2017 11:27:34 +0000
Srinivas Kandagatla <srinivas.kandagatla@linaro.org> wrote:

> On 02/03/17 19:50, Alban wrote:
> > Add the binding to expose MTD partitions as nvmem providers. =20
>=20
> It would be nice to see more description of this patch, explaining the=20
> real use case.

I'll try, writing good documentation is not my strong point :/

> >
> > Signed-off-by: Alban <albeu@free.fr>
> > ---
> >  .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 29 ++++++++++++++=
++++++++
> >  1 file changed, 29 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.t=
xt
> >
> > diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b/Do=
cumentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> > new file mode 100644
> > index 0000000..47602f7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> > @@ -0,0 +1,29 @@
> > +=3D NVMEM in MTD =3D
> > +
> > +Config data for drivers is often stored in MTD devices. This binding
> > +define how such data can be represented in device tree.
> > +
> > +An MTD can be defined as an NVMEM provider by adding the `nvmem-provid=
er` =20
> We should prefix this property with "mtd" to make it more explicit that=20
> this is specific to mtd devices.
>=20
> May be we should put this under "Required Properties" section, marking=20
> it as mandatory for mtd nvmem providers.

I agree it should be required, but I would not make it MTD specific. In
fact I would suggest making it mandatory for all nvmem providers. That
would be inline with 'interrupt-controller' and all the other properties
used to indicate the capabilities of devices.

Alban

--Sig_/Dsu8oNDvmlFF/G2vmn/oyDo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYuV/2AAoJEHSUmkuduC28EPUQAO5BD7oWB3B9CdZokOQg8cht
Ogn5Xxug5hjH8OWE+RS9mModToal8Yu32/AdkV/Yz6MMloycQdT8735UwEIeD3Kk
hKT4hgWdrxYtRvZDem5KaLjxdFAJUbexoJu0rhzmd3jU4jYryiYTs6nAAM3wuHVp
4qfcTub85HerboO0MviktsxS1Pq4b9P930f5fgTPZdC5/98Rpx/f+BECgtSyoktl
qYqNXboz1r3jB7twKsZI3GMZazugueBFF59xNgSVc+vUtGAGqVm1wZhZvRi+44pA
YkhQV+sGIVCrrmweN0O+q4+cETmMQKxZKgNbExm4PhjAMDCS4rdNf4IcNEICUS/d
BlT+Sj7hYrGLbh9qDrKtvmH/tE1fjsPXO4VhbHAayY2GF4Zlmw3RcnV3naB3D4gT
yMbzMHKQY8ge5QUGMDMgCBcJMnPR0zn59L7b+7J6GWielH5PGug/RGr7HDrOyvSw
GgSrEet00wx0rKjn9pVoU0fX47sAEW9SQLnDu99ZX0X+XDzNb8yN4oy9yomT5+G2
lBIBkjELmrmNkxTsnhGqiCiOqx/MsuCLAHUU/gx/l4hpUsUimo5O2LDk69JF7Sd7
MHj9sDL4y27kZ7Eh9IW7uSSTsPwlgpR7130J4HoCrRl5thnt/hCAMfuZM3ZOfiT4
cOHtSGam4mOtBq9P50Tx
=+0QG
-----END PGP SIGNATURE-----

--Sig_/Dsu8oNDvmlFF/G2vmn/oyDo--


--===============1196639776237707916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1196639776237707916==--
