From: Alban <albeu-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v2 1/2] doc: bindings: Add bindings documentation for
 mtd nvmem
Date: Wed, 15 Mar 2017 20:41:41 +0100
Message-ID: <20170315204141.1381cd01@tock>
References: <1488875164-30440-1-git-send-email-albeu@free.fr>
        <1488875164-30440-2-git-send-email-albeu@free.fr>
        <20170315172401.35b5owbme4scqfgn@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Z25TaLC=JLMo=r8vcDko7/I"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170315172401.35b5owbme4scqfgn@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Aban Bedel <albeu-GANU6spQydw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--Sig_/Z25TaLC=JLMo=r8vcDko7/I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 15 Mar 2017 12:24:01 -0500
Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On Tue, Mar 07, 2017 at 09:26:03AM +0100, Alban wrote:
> > Config data for drivers, like MAC addresses, is often stored in MTD.
> > Add a binding that define how such data storage can be represented in
> > device tree.
> >=20
> > Signed-off-by: Alban <albeu-GANU6spQydw@public.gmane.org>
> > ---
> > Changelog:
> > v2: * Added a "Required properties" section with the nvmem-provider
> >       property
> > ---
> >  .../devicetree/bindings/nvmem/mtd-nvmem.txt        | 33 ++++++++++++++=
++++++++
> >  1 file changed, 33 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/nvmem/mtd-nvmem.t=
xt
> >=20
> > diff --git a/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt b/Do=
cumentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> > new file mode 100644
> > index 0000000..8ed25e6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/nvmem/mtd-nvmem.txt
> > @@ -0,0 +1,33 @@
> > +=3D NVMEM in MTD =3D
> > +
> > +Config data for drivers, like MAC addresses, is often stored in MTD.
> > +This binding define how such data storage can be represented in device=
 tree.
> > +
> > +An MTD can be defined as an NVMEM provider by adding the `nvmem-provid=
er`
> > +property to their node. Data cells can then be defined as child nodes
> > +of the partition as defined in nvmem.txt.
> > +
> > +Required properties:
> > +nvmem-provider:	Indicate that the device should be registered as
> > +		NVMEM provider =20
>=20
> I think we should use a compatible string here (perhaps with a=20
> generic fallback), and that can imply it is an nvmem provider. The=20
> reason is then the compatible can also imply other information that=20
> isn't defined in DT.

That would work for partitions but not for unpartitioned MTD as these
will already have a compatible string for the MTD hardware. I was also
under the impression that capabilities/services provided by devices
were represented with such properties, like interrupt-controller or
gpio-controller, and not with compatible strings.

There is also another problem with unpartitioned MTD, earlier MTD
partitions binding allowed to have partitions as direct child nodes
without any compatible strings. The current nvmem binding do the same
for the nvmem cells, so it wouldn't be clear if a child node of the MTD
is a partition using the old binding or an nvmem cell.

As I think this problem could happen with some other device types I
suggested to re-work the nvmem binding to be more like the current MTD
partitions. See these threads[1][2], but a short example would look like
this:

flash {
	compatible =3D "vendor,flash-device-model";
	...
	nvmem-provider;
	nvmem-cells {
		compatible =3D "nvmem-cells";
		#address-cells =3D <1>;
		#size-cells =3D <1>;

		cell@100 {
			label =3D "mac-address";
			reg =3D <0x100 0x6>;
		};
	};
};

or like this if the device is partitioned:

flash {
	compatible =3D "vendor,flash-device-model";
	...
	partitions {
		compatible =3D "fixed-partitions"
		...
		partition@1000 {
			...
			nvmem-provider;
			nvmem-cells {
				compatible =3D "nvmem-cells";
				#address-cells =3D <1>;
				#size-cells =3D <1>;

				cell@100 {
					label =3D "mac-address";
					reg =3D <0x100 0x6>;
				};
			};
		};
	};
};

Alban

[1]:https://www.mail-archive.com/linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg1344899.ht=
ml
[2]:https://www.mail-archive.com/linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg1348295.ht=
ml

--Sig_/Z25TaLC=JLMo=r8vcDko7/I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYyZj1AAoJEHSUmkuduC28e4IP/3ROERFGJPK4upWA2IOb/AoJ
LriOFJhwiPJsIIk7Xoo6gEuYVFt0hBcX/WvvfAM4JCAIQFYOx8Ngb1aDVXMJQds9
41THgobfsjnlK7xrUWHzy4DEA8vLJpY0Ay4yAzSaULXpP5Fh8+pcbDTtgLHNeljs
8LeVYe5z6PmT8y+cFEOF6KPijw8HI1KWRV0ShnFoQg4XJ8XWzTOI4jEdHOOX2xx3
IRX6gbwiF+klP8NMg0Hs0/QAx50Ldltbb24GhxXhdNBnTZrv/zdzAObOD/5plMJq
mqriz6QJCRKgwrLAj9Iv1AXhznexQmsT6rVtCVDZpOG76FH/HVr0JzoseXw1I1eQ
gixdrhTOv2NQ2v3S/G0Axb52kNfkbydBZQhgtTZ9N2Z6uOvnpEIsivQ56C7vyBPu
9uiRON1QGk1s3EqB8oRvyCBnGPC8OWu1lMwHhL3rQrQXxLI/Csssi5KgHn8AQVOL
gnmTKEYcqFqMJqPqStGgVxMBOvrM7e28SPUKE4ngyiczTc01OD9WxlMGay3PZnKI
K+EfvKICVS7tTVvK3uWRR983KYiLxFFEYht5YqmHfWJqm/sv11yWWcjAC1zippwY
np4cLGDiQoc7IRvPp3II/XXUcaaKGJEZWcQg+4qQwmNWjEKyEjZ+Zc+xyuKrCM24
YkGi2SyasL7A7p4U/Z7H
=LtXj
-----END PGP SIGNATURE-----

--Sig_/Z25TaLC=JLMo=r8vcDko7/I--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
