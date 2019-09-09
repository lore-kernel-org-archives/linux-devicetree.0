From: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 1/2] iommu: Implement of_iommu_get_resv_regions()
Date: Mon, 9 Sep 2019 15:04:16 +0100
Message-ID: <20190909140415.axszldhakgqifibg@willie-the-truck>
References: <20190829111407.17191-1-thierry.reding@gmail.com>
 <20190829111407.17191-2-thierry.reding@gmail.com>
 <0b7e050a-cec6-6ce7-9ed6-2146eabb2fe8@arm.com>
 <20190902150056.GD1445@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190902150056.GD1445@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, iommu@lists.linux-foundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 02, 2019 at 05:00:56PM +0200, Thierry Reding wrote:
> On Mon, Sep 02, 2019 at 02:54:23PM +0100, Robin Murphy wrote:
> > On 29/08/2019 12:14, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > This is an implementation that IOMMU drivers can use to obtain reserved
> > > memory regions from a device tree node. It uses the reserved-memory DT
> > > bindings to find the regions associated with a given device. These
> > > regions will be used to create 1:1 mappings in the IOMMU domain that
> > > the devices will be attached to.
> > > 
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Frank Rowand <frowand.list@gmail.com>
> > > Cc: devicetree@vger.kernel.org
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >   drivers/iommu/of_iommu.c | 39 +++++++++++++++++++++++++++++++++++++++
> > >   include/linux/of_iommu.h |  8 ++++++++
> > >   2 files changed, 47 insertions(+)
> > > 
> > > diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> > > index 614a93aa5305..0d47f626b854 100644
> > > --- a/drivers/iommu/of_iommu.c
> > > +++ b/drivers/iommu/of_iommu.c
> > > @@ -9,6 +9,7 @@
> > >   #include <linux/iommu.h>
> > >   #include <linux/limits.h>
> > >   #include <linux/of.h>
> > > +#include <linux/of_address.h>
> > >   #include <linux/of_iommu.h>
> > >   #include <linux/of_pci.h>
> > >   #include <linux/slab.h>
> > > @@ -225,3 +226,41 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
> > >   	return ops;
> > >   }
> > > +
> > > +/**
> > > + * of_iommu_get_resv_regions - reserved region driver helper for device tree
> > > + * @dev: device for which to get reserved regions
> > > + * @list: reserved region list
> > > + *
> > > + * IOMMU drivers can use this to implement their .get_resv_regions() callback
> > > + * for memory regions attached to a device tree node. See the reserved-memory
> > > + * device tree bindings on how to use these:
> > > + *
> > > + *   Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > > + */
> > > +void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
> > > +{
> > > +	struct of_phandle_iterator it;
> > > +	int err;
> > > +
> > > +	of_for_each_phandle(&it, err, dev->of_node, "memory-region", NULL, 0) {
> > > +		struct iommu_resv_region *region;
> > > +		struct resource res;
> > > +
> > > +		err = of_address_to_resource(it.node, 0, &res);
> > > +		if (err < 0) {
> > > +			dev_err(dev, "failed to parse memory region %pOF: %d\n",
> > > +				it.node, err);
> > > +			continue;
> > > +		}
> > 
> > What if the device node has memory regions for other purposes, like private
> > CMA carveouts? We wouldn't want to force mappings of those (and in the very
> > worst case doing so could even render them unusable).
> 
> I suppose we could come up with additional properties to mark such
> memory regions and skip them here.

I think we need /something/ like that, both so that we can identify these
memory regions as requiring an identity mapping in the SMMU but also so
that we can place additional requirements on them, such as being 64k-aligned
and mandating properties of the mapping, such as cacheability based on the
device coherency.

I defer to the devicetree folks as to whether this should be an additional
property, or a phandle or whatever.

Will
