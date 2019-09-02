From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] iommu: Implement of_iommu_get_resv_regions()
Date: Mon, 2 Sep 2019 17:00:56 +0200
Message-ID: <20190902150056.GD1445@ulmo>
References: <20190829111407.17191-1-thierry.reding@gmail.com>
	<20190829111407.17191-2-thierry.reding@gmail.com>
	<0b7e050a-cec6-6ce7-9ed6-2146eabb2fe8@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9060706149407059433=="
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <0b7e050a-cec6-6ce7-9ed6-2146eabb2fe8-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============9060706149407059433==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cQXOx3fnlpmgJsTP"
Content-Disposition: inline


--cQXOx3fnlpmgJsTP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2019 at 02:54:23PM +0100, Robin Murphy wrote:
> On 29/08/2019 12:14, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > This is an implementation that IOMMU drivers can use to obtain reserved
> > memory regions from a device tree node. It uses the reserved-memory DT
> > bindings to find the regions associated with a given device. These
> > regions will be used to create 1:1 mappings in the IOMMU domain that
> > the devices will be attached to.
> >=20
> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >   drivers/iommu/of_iommu.c | 39 +++++++++++++++++++++++++++++++++++++++
> >   include/linux/of_iommu.h |  8 ++++++++
> >   2 files changed, 47 insertions(+)
> >=20
> > diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> > index 614a93aa5305..0d47f626b854 100644
> > --- a/drivers/iommu/of_iommu.c
> > +++ b/drivers/iommu/of_iommu.c
> > @@ -9,6 +9,7 @@
> >   #include <linux/iommu.h>
> >   #include <linux/limits.h>
> >   #include <linux/of.h>
> > +#include <linux/of_address.h>
> >   #include <linux/of_iommu.h>
> >   #include <linux/of_pci.h>
> >   #include <linux/slab.h>
> > @@ -225,3 +226,41 @@ const struct iommu_ops *of_iommu_configure(struct =
device *dev,
> >   	return ops;
> >   }
> > +
> > +/**
> > + * of_iommu_get_resv_regions - reserved region driver helper for devic=
e tree
> > + * @dev: device for which to get reserved regions
> > + * @list: reserved region list
> > + *
> > + * IOMMU drivers can use this to implement their .get_resv_regions() c=
allback
> > + * for memory regions attached to a device tree node. See the reserved=
-memory
> > + * device tree bindings on how to use these:
> > + *
> > + *   Documentation/devicetree/bindings/reserved-memory/reserved-memory=
=2Etxt
> > + */
> > +void of_iommu_get_resv_regions(struct device *dev, struct list_head *l=
ist)
> > +{
> > +	struct of_phandle_iterator it;
> > +	int err;
> > +
> > +	of_for_each_phandle(&it, err, dev->of_node, "memory-region", NULL, 0)=
 {
> > +		struct iommu_resv_region *region;
> > +		struct resource res;
> > +
> > +		err =3D of_address_to_resource(it.node, 0, &res);
> > +		if (err < 0) {
> > +			dev_err(dev, "failed to parse memory region %pOF: %d\n",
> > +				it.node, err);
> > +			continue;
> > +		}
>=20
> What if the device node has memory regions for other purposes, like priva=
te
> CMA carveouts? We wouldn't want to force mappings of those (and in the ve=
ry
> worst case doing so could even render them unusable).

I suppose we could come up with additional properties to mark such
memory regions and skip them here.

One other alternative might be to make sure that the driver claims
the memory regions that have been mapped and then tells the IOMMU to
undo the mappings for them. That way the driver could set up the new
mappings, reprogram the hardware and then have the old mappings torn
down. I'm not sure that could always be done in a race-free way. For
example, what if the new mappings need to be in a region, such as a
private CMA carveout, that's already mapped. Can we temporarily map
one physical address to two DMA addresses?

The details here probably depend on the IOMMU hardware.

Thierry

--cQXOx3fnlpmgJsTP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1tLqgACgkQ3SOs138+
s6HrGw/+MSAvdUmu9+GY2m0d4voTxSMsfPtF3Wj0kOWgJ+chMsV5ieVkcpgA5DVN
/AIhBL+4qhbv9bSNa4RNNYQVte3ivzADhYNjB/O9Nl8Lx6m51bOPeIZtN+nMFVox
fGkrcuk+lwm6BFx9WT+Z/8g5QL8k0XwD9BRmgYiDV/VhDA+CbhNkJDs2jP9xV4od
ZV6X0sZtp+9+l+gRCfVDZyWRCmhNMGB0XKfdFHn5jLWo8VYcRNtjFuDxYv7IanKK
FJeBTNRWZeQHO34Ckj35orvVpUUPyvvtbEd8+VUCGLbVINU2UljMUTEnnTAg6uRi
H4PRRxzf+7CqpOd6+RDUg+yf3DGB+snbC0rcsfsrDYOASHJZkRFpDSwqeOM1D5Cr
JbHkcrnpbha0S8RyX51okkkz7wmQhWbmzYT0NDO/xG617XN3aOTvB0YfU05Hz7aV
t5KZMjuq92pncfpx5Ekf9vWEcVklTHrHjrg7lGV7EueHTp+wcz7SSn/2Tbl/MSeo
sXUxNAFr88le8plm1rqn+CY6C6Ha/RsHirrFahNiZKs8QmQvIRjEK8cVv/667cBl
7/F1o4sAYEdAT8tzeDaEAGqHIx+H9Q1cWXi692FEx47N3dYwPHfzFyUkPpIrde/r
YeJgtGzAq/AFyINhLoAQrGgOZC4lR7I6bdcuRiwiSSX5bNBX80s=
=v6VM
-----END PGP SIGNATURE-----

--cQXOx3fnlpmgJsTP--

--===============9060706149407059433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============9060706149407059433==--
