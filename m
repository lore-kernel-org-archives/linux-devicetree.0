From: Alban <albeu@free.fr>
Subject: Re: [PATCH v2 1/2] doc: bindings: Add bindings documentation for
 mtd nvmem
Date: Sun, 19 Mar 2017 12:16:10 +0100
Message-ID: <20170319121610.200a1553@tock>
References: <1488875164-30440-1-git-send-email-albeu@free.fr>
 <1488875164-30440-2-git-send-email-albeu@free.fr>
 <20170315172401.35b5owbme4scqfgn@rob-hp-laptop>
 <20170315204141.1381cd01@tock>
 <CAL_JsqJ=P++NeNCzikBfLy3R_XSX1wzbuuSVinYuD3QkW_Vjqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4817134296866619175=="
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqJ=P++NeNCzikBfLy3R_XSX1wzbuuSVinYuD3QkW_Vjqg@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Moritz Fischer <moritz.fischer@ettus.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Richard Weinberger <richard@nod.at>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Aban Bedel <albeu@free.fr>, Maxime Ripard <maxime.ripard@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
List-Id: devicetree@vger.kernel.org

--===============4817134296866619175==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//G1k5AbOpLYYRSjGsPw0gLE"; protocol="application/pgp-signature"

--Sig_//G1k5AbOpLYYRSjGsPw0gLE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 18 Mar 2017 15:58:11 -0500
Rob Herring <robh@kernel.org> wrote:

> On Wed, Mar 15, 2017 at 2:41 PM, Alban <albeu@free.fr> wrote:
> > On Wed, 15 Mar 2017 12:24:01 -0500
> > Rob Herring <robh@kernel.org> wrote:
> > =20
> >> On Tue, Mar 07, 2017 at 09:26:03AM +0100, Alban wrote: =20
> >> > Config data for drivers, like MAC addresses, is often stored in MTD.
> >> > Add a binding that define how such data storage can be represented in
> >> > device tree.
> >> >
> >> > Signed-off-by: Alban <albeu@free.fr>
> >> > ---
> >> > Changelog:
> >> > v2: * Added a "Required properties" section with the nvmem-provider
> >> >       property
> >> > ---
> >> >  .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 33 +++++++++++=
+++++++++++
> >> >  1 file changed, 33 insertions(+)
> >> >  create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvme=
m.txt
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b=
/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> >> > new file mode 100644
> >> > index 0000000..8ed25e6
> >> > --- /dev/null
> >> > +++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> >> > @@ -0,0 +1,33 @@
> >> > +=3D NVMEM in MTD =3D
> >> > +
> >> > +Config data for drivers, like MAC addresses, is often stored in MTD.
> >> > +This binding define how such data storage can be represented in dev=
ice tree.
> >> > +
> >> > +An MTD can be defined as an NVMEM provider by adding the `nvmem-pro=
vider`
> >> > +property to their node. Data cells can then be defined as child nod=
es
> >> > +of the partition as defined in nvmem.txt.
> >> > +
> >> > +Required properties:
> >> > +nvmem-provider:    Indicate that the device should be registered as
> >> > +           NVMEM provider =20
> >>
> >> I think we should use a compatible string here (perhaps with a
> >> generic fallback), and that can imply it is an nvmem provider. The
> >> reason is then the compatible can also imply other information that
> >> isn't defined in DT. =20
> >
> > That would work for partitions but not for unpartitioned MTD as these
> > will already have a compatible string for the MTD hardware. I was also
> > under the impression that capabilities/services provided by devices
> > were represented with such properties, like interrupt-controller or
> > gpio-controller, and not with compatible strings.
> >
> > There is also another problem with unpartitioned MTD, earlier MTD
> > partitions binding allowed to have partitions as direct child nodes
> > without any compatible strings. The current nvmem binding do the same
> > for the nvmem cells, so it wouldn't be clear if a child node of the MTD
> > is a partition using the old binding or an nvmem cell. =20
>=20
> Perhaps a sign we should not repeat that.

Yes, that's why I think we should "upgrade" the nvmem binding as a whole
and not just limit this to the MTD case.

> > As I think this problem could happen with some other device types I
> > suggested to re-work the nvmem binding to be more like the current MTD
> > partitions. See these threads[1][2], but a short example would look like
> > this:
> >
> > flash {
> >         compatible =3D "vendor,flash-device-model";
> >         ...
> >         nvmem-provider;
> >         nvmem-cells {
> >                 compatible =3D "nvmem-cells"; =20
>=20
> Isn't the node name or compatible here enough to imply this is a nvmem pr=
ovider?

If there are cells defined yes, but nvmem also allow referencing the
provider as a whole, so cells are optional. But yes it could be
removed, in the case of MTD it is only used to filter the relevant
devices to avoid having too many "useless" nvmem device registered.

> >                 #address-cells =3D <1>;
> >                 #size-cells =3D <1>;
> >
> >                 cell@100 {
> >                         label =3D "mac-address";
> >                         reg =3D <0x100 0x6>;
> >                 };
> >         };
> > }; =20


--Sig_//G1k5AbOpLYYRSjGsPw0gLE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYzmh6AAoJEHSUmkuduC28g6oP/RVLo2JzDTcJut24LEDt7Amt
gtlRedoI4ZxC/u6P7+x8521mxCII8O5MpKT60b6WepT5eV3+M18MkYS3sjuBxxwd
UsTj7Ejp4PDTNpgs9cdyCjbtVXkZmjYD9R07sljmt7dqcUcXwkdCdVIVj4zpGg/X
5BD1L+wQFxi0q2KKyzR2i58Ar5PzGFynS4YBeUu28+vGfCCK6wobQdJsdbeVnfBe
rH96jcNyy89lPAq83Jt62Gv+CMgZhILv5pYQuz112l1hbSWOYAjbhKvSGm1tZaPf
jRSg6wqoSlFfCbNFLZSVueCbjzwS1PBuO1O2/Ui2DtM+EB2JKSmPqxrF9hlOChdh
0q2b9MGvcj2jxQ9tr/dnXS9xEXZyCK58NcsVwHmRgANM8X1RjfntZFEmEV6RHBEE
JXzt+ogd5Cg5dASkN0Os5bXVxRuxaeOLbrZjIDnxd5dQETztezWl4INBOpQpksnI
elh3WTTBEonU2GOH5iu+q7R3BD9vnJoiMQYSXJPbynt/EIMR2EvLdwCNYakOAITH
vAJcYGZwdh9SVJyfZVpeTP0xcyf19vDdq0rBRjtCvCxUIWqgTIJT9uE9sS/iEYMo
CzpIs1ja2vSiMlXHAtOptGvmDJBXDjxP1k/GRSIrZw4lsmQqyTwuv4WOmXRjAVMA
9bjk000cXJucHjwVTx28
=5HjI
-----END PGP SIGNATURE-----

--Sig_//G1k5AbOpLYYRSjGsPw0gLE--


--===============4817134296866619175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4817134296866619175==--
