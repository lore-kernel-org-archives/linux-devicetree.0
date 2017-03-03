From: Alban <albeu@free.fr>
Subject: Re: [PATCH 1/3] doc: bindings: Add bindings documentation for mtd
 nvmem
Date: Fri, 3 Mar 2017 14:12:37 +0100
Message-ID: <20170303141237.0cc2faf0@tock>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
        <1488484223-844-2-git-send-email-albeu@free.fr>
        <20170302212220.4c3c7bef@bbrezillon>
        <20170303131705.119021f4@tock>
        <20170303133744.152cf3ca@bbrezillon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/H3wJg3H6395NTzvKv=aEOgR"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170303133744.152cf3ca@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Aban Bedel <albeu@free.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>
List-Id: devicetree@vger.kernel.org

--Sig_/H3wJg3H6395NTzvKv=aEOgR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 3 Mar 2017 13:37:44 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Fri, 3 Mar 2017 13:17:05 +0100
> Alban <albeu@free.fr> wrote:
>=20
> > On Thu, 2 Mar 2017 21:22:20 +0100
> > Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> >  =20
> > > On Thu,  2 Mar 2017 20:50:21 +0100
> > > Alban <albeu@free.fr> wrote:
> > >    =20
> > > > Add the binding to expose MTD partitions as nvmem providers.     =20
> > >=20
> > > Looks good. Maybe you should take the case you describe in your
> > > cover-letter into account and add an extra layer: add an nvmem sub-no=
de
> > > containing the nvmem cells, so that you can expose nvmem cells direct=
ly
> > > under master MTD devices (and not only partitions).    =20
> >=20
> > I think that would be the better solution. This can be done
> > independently, once we agree on a binding we just have to fix
> > of_nvmem_cell_get(). My suggestion would be to have the new binding
> > looking like this:
> >=20
> > nvmem-device@10 {
> > 	...
> > 	nvmem-provider;
> > 	nvmem-cells {
> > 		compatible =3D "nvmem-cells";
> > 		#address-cells =3D <1>;
> > 		#size-cells =3D <1>;
> >=20
> > 		nvmem-cell@100 {
> > 			label =3D "mac-address";
> > 			reg =3D <0x100 0x200>;
> > 		}
> >=20
> > 		...
> > 	}
> > }
> >=20
> > I would also suggest making the "nvmem-provider" property mandatory
> > to indicate that the device provides this capability. Up to now all
> > nvmem providers only support this API but I think there might be more
> > multi function devices in the future. =20
>=20
> If you enforce the name of the child node (here nvmem-cells), you don't
> need this extra nvmem-provider property. Am I missing something?

That property would define the capability to be used as nvmem-provider,
furthermore it would cover the case where no cell is defined. Also in
the case of MTD devices it would avoid an ambiguity when there is no
'partitions' sub node, as then the nvmem-cells node could be interpreted
as a partition following the old binding.

=46rom what I understand most of such "implicit" binding have sooner or
later proved to be too limited, or worth, clashing with another one.
They then had to be deprecated and replaced by explicit ones. The MTD
partitions binding is a good example of such evolution.

Alban

--Sig_/H3wJg3H6395NTzvKv=aEOgR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYuWvFAAoJEHSUmkuduC28t3IP/0n7qavMxpyo3yo5TqBPnDym
HtgXmsBDigdzfo6be9J4SaFXr5tigqPBYNMLy/c0NgFHqJUO1eB0Jj7Vg10T6Nw7
2KHMxON9LRTULOaKryly+WDocN1Vzdokspjo+Xy8heHhPS/7R4WFifvPSCNTisGX
BXScYgyLyWtvljHpLaI5getaSJUV1fkHo0FFUy0eXEQmwMqwEfav9jhh3olCJFPF
TKfrWtAX1bhz2BC6zLIJfoCs8zIwwxYiLj6H6vzuhyLqRzxR1nlMVfOFUry6C+EA
z2/yZ5Gx3Xq3p/6n7B7ZtPvRJSS2dHihJLYDg9USWDepEhZ6V+d4OcPcaAKHiec6
ukq+fvt5DdSIx607CuMsgAPYgAU3gvm5Xvf6Xoctv5RXmrkpuTKX5akc5p+jlt0D
QtA4f4aYMoSE8PkClnEaYh5m8lwgx1cUADp3qQ8Pi5uDB9/XTUTaGG/DaqWkmx//
4xNG+X3fD1VdGdb1GTkVUNf0Lh7JVXF3WhG5dM66PiRsycL4nS+BHLGDFhrYWCx1
Z7nq3hkoe8Y61vdotRa24VLt4lEA08/yiAEEY3WJnn+8oB8gWLlZdHFoC2agV+w9
XXlD9yQZUX7+ZsiCFWl6fag2nfJmTwZ9Hbl9IWrpcEPwhaHQQkhiY+8LwwmKctEs
IVwg/SJHjn6YFXALuD6g
=him3
-----END PGP SIGNATURE-----

--Sig_/H3wJg3H6395NTzvKv=aEOgR--
