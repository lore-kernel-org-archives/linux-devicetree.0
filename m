From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 24/32] pci: PCIe driver for Marvell Armada 370/XP systems
Date: Wed, 13 Mar 2013 20:26:28 +0100
Message-ID: <20130313192628.GA28714@avionic-0098.mockup.avionic-design.de>
References: <20130311232516.GA13873@obsidianresearch.com>
 <513E6AFE.3090304@firmworks.com>
 <20130312070852.GA6727@avionic-0098.mockup.avionic-design.de>
 <20130312155749.GA1820@obsidianresearch.com>
 <20130312203819.GA23221@avionic-0098.mockup.avionic-design.de>
 <20130312210328.GA22702@obsidianresearch.com>
 <20130312213006.GA23717@avionic-0098.mockup.avionic-design.de>
 <20130312220854.GA23112@obsidianresearch.com>
 <20130313081815.GD25940@avionic-0098.mockup.avionic-design.de>
 <20130313170205.GB24042@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0971903466568534528=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130313170205.GB24042-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============0971903466568534528==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2013 at 11:02:05AM -0600, Jason Gunthorpe wrote:
> On Wed, Mar 13, 2013 at 09:18:15AM +0100, Thierry Reding wrote:
>=20
> > Mitch already answered this. The specification is now almost 15 years
> > old and it couldn't possibly have foreseen all of the future use-cases.
> > If the specification is too restrictive and Mitch gives his blessing to
> > remove some of the restrictions, I don't see any reason why we shouldn't
> > do so if it lets us represent the reality of hardware more accurately in
> > DT.
>=20
> I understand the spec is old, and I have no problem with making a
> Linux specific revision, but do *that* - don't bury some random
> deviation inside the bindings for a driver. I even suggested some
> language, but I feel more thought is needed to consider how to model
> the standardized ECAM mechanism..

As Mitch already said there's very little chance that the specification
update will be ratified through IEEE, so I think that we might just as
well put a corresponding text somewhere below Documentation/devicetree.

Also note that this has absolutely nothing to do with ECAM. All I'm
proposing is to allow the reg property of a root port to be translated
into a CPU addressable memory region through the ranges property. This
turns out to actually work properly with the current OF core in Linux.

> > Furthermore we're not discussing radical changes. None of the changes
> > will be backwards-incompatible, but they will allow recent hardware to
> > be represented more correctly or conveniently.
>=20
> Sure, but it is still inconsistent, one MMIO config mechansim is in
> ranges, one is in regs. Plus I don't think tegra's case is a great
> starting point to design a spec update, it's config access mechanism
> is especially strange...

Again, it is still the most accurate way to describe the hardware. I
know it's not terribly beautiful and doesn't match with what you'd
expect from PC hardware. However it is still a reality and something the
kernel will have to deal with. Marvell hardware isn't very pretty either
but that shouldn't exclude it from being supported by Linux.

> Anyhow, I think this has been hashed to death, as long as your final
> binding has the 'device_type =3D pci' on the pcie-controller node I
> think it will be fine.

No. The pcie-controller is *not* a PCI device. It is a PCI host bridge.
It is the instance that translates from the platform to the PCI bus. Why
should it be device_type =3D "pci"? And we've also been over this before,
making that change stops the proposed binding from working properly
because the entry in the reg property can't be translated into a CPU
addressable memory region.

Thierry

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRQNLkAAoJEN0jrNd/PrOhI5IQAIpVbC1PXTHSEI9EsWPqjipg
YjT1vdmGU5Cmf9lI1Vx0Q+2v5QDbjHjES2v1KiuTNpGzyRlVh1jHAIOaOQnCKI60
fTfKbcZnC+TBUT4XEVrs17SNM5pySo2csE0DdIyCO2rkAzyuo4JvGC4y1RRBwgdD
ex/ErucbGjSNfb5WYS6R4zscwl/6hxuF72/WP68+L8bVc9Pdxx4wJdoqFgQo9wzV
rLuApPtw9jvoLrC4wyXTFXHZYTkFx2/ImyjiN5CyZ8Ke+zNR7ooBv3K2Uq1lR2fh
uX6qZhriPUznN30D2pXMWhk7AyhJuqpgHoS1ZgXlGEWY7RMru8bPJQpr/81dMo2G
oNic/RzFTjzI64CjuInc0msDdZO3kAer7yoCUf6+sdjWAdJ2QiCzOmKWMHGcAO/s
J6cDCnptyg+Yelw77yVwiSK3RcKovy6FUccLeTY/J3ShZscVdVA5Sdw7Yy9x0hHl
P5/ofB5f3jSzzvnkOSud5R/kVch43R/E7bo1m3j3Moox1NnZ+06NrUY61N7xrY7t
esswra0wKI63ogTiqFomkkjLlxoiRO6mxb1YGjSzIfxdvfs7aw09y/zGajfu3Wb+
xlORJf5+oz6UodI4xagCVIMAGRm4ft19FVDnRtrxJjfO1RepOwpjpZAm29oJsZ3t
ubUoEinJ1QRmzQiGAHD7
=oIup
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--

--===============0971903466568534528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0971903466568534528==--
