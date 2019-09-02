From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] iommu: dma: Use of_iommu_get_resv_regions()
Date: Mon, 2 Sep 2019 16:52:45 +0200
Message-ID: <20190902145245.GC1445@ulmo>
References: <20190829111407.17191-1-thierry.reding@gmail.com>
 <20190829111407.17191-3-thierry.reding@gmail.com>
 <1caeaaa0-c5aa-b630-6d42-055b26764f40@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8NvZYKFJsRX2Djef"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1caeaaa0-c5aa-b630-6d42-055b26764f40@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--8NvZYKFJsRX2Djef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2019 at 03:22:35PM +0100, Robin Murphy wrote:
> On 29/08/2019 12:14, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > For device tree nodes, use the standard of_iommu_get_resv_regions()
> > implementation to obtain the reserved memory regions associated with a
> > device.
>=20
> This covers the window between iommu_probe_device() setting up a default
> domain and the device's driver finally probing and taking control, but
> iommu_probe_device() represents the point that the IOMMU driver first kno=
ws
> about this device - there's still a window from whenever the IOMMU driver
> itself probed up to here where the "unidentified" traffic may have already
> been disrupted. Some IOMMU drivers have no option but to make the necessa=
ry
> configuration during their own probe routine, at which point a struct dev=
ice
> for the display/etc. endpoint may not even exist yet.

Yeah, I think I'm actually running into this issue with the ARM SMMU
driver. The above works fine with the Tegra SMMU driver, though, because
it doesn't touch the SMMU configuration until a device is attached to a
domain.

For anything earlier than iommu_probe_device(), I don't see a way of
doing this generically. I've been working on a prototype to make these
reserved memory regions early on for ARM SMMU but I've been failing so
far. I think it would possibly work if we just switched the default for
stream IDs to be "bypass" if they have any devices that have reserved
memory regions, but again, this isn't quite working (yet).

Thierry

> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   drivers/iommu/dma-iommu.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >=20
> > diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> > index de68b4a02aea..31d48e55ab55 100644
> > --- a/drivers/iommu/dma-iommu.c
> > +++ b/drivers/iommu/dma-iommu.c
> > @@ -19,6 +19,7 @@
> >   #include <linux/iova.h>
> >   #include <linux/irq.h>
> >   #include <linux/mm.h>
> > +#include <linux/of_iommu.h>
> >   #include <linux/pci.h>
> >   #include <linux/scatterlist.h>
> >   #include <linux/vmalloc.h>
> > @@ -164,6 +165,8 @@ void iommu_dma_get_resv_regions(struct device *dev,=
 struct list_head *list)
> >   	if (!is_of_node(dev_iommu_fwspec_get(dev)->iommu_fwnode))
> >   		iort_iommu_msi_get_resv_regions(dev, list);
> > +	if (dev->of_node)
> > +		of_iommu_get_resv_regions(dev, list);
> >   }
> >   EXPORT_SYMBOL(iommu_dma_get_resv_regions);
> >=20

--8NvZYKFJsRX2Djef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1tLLoACgkQ3SOs138+
s6HlcQ/9Fygivox982dpWeIcABcFv3w+hcjZPGp/Gbb/waKwE6F8y+M83AaxL2Zb
1QMp/wSZ438o+nMgXmqw8nFeC1HHCbGGRrtQz7Nl8jYiGt86J6WNGcG0pmzKcuCP
y0OiRm5yOhIVWqQDzaeNQ8OWS0b2Pgbrw0PRCu/k6zis9WeAQw9MJig24ljtdojF
U81u8/jOYn4oa+VpBfD3gsI9lenkZn/aBrW40m8M2b9P2/NtdV5XHrbq6ec+q2/I
UWC6UlLQ2F+iMUmFsXP1ol1h6E7ioVWRAH91hsAEAOGkQ0GZbOdlBHdPKJBJ15Hg
TwPxh5xzlZWDUWH5/EMIB4GDhhwuh11wUv4ZowHv2s1zVClHPUCNGeaJyXOZhYM6
i7pfw2UiVVSzAOJRaifnVNeyvOFAGad1X4WP5U+Bzz5nSGlKD/H8Pr6OkIF6ibnU
JUMMFE8VANLT64TWv+bfIkN30Pw08tdfFJIb7LZWqjDhuTra+1+UJL2mAdzJSjml
U4oYvsiegSbe93lJCsmuF0M8Lgi4FtKYDJuPQk2/uEZW3EVJauyUzcwnmAlx8m2O
X9xfkY6/fZYJghXZ1Sary0csp8HaILgDDCHDDFTkxXQXVWvKWT5AT6eWP/bnQC5Q
L5w7pjU2sWYURUEk04JjVotFO680raUhaZrwG2dooJMHvV1K0Ho=
=YWPY
-----END PGP SIGNATURE-----

--8NvZYKFJsRX2Djef--
