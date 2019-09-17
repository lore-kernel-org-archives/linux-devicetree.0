From: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 2/2] iommu: dma: Use of_iommu_get_resv_regions()
Date: Tue, 17 Sep 2019 18:59:50 +0100
Message-ID: <20190917175950.wrwiqnh5bp62uy3c@willie-the-truck>
References: <20190829111407.17191-1-thierry.reding@gmail.com>
 <20190829111407.17191-3-thierry.reding@gmail.com>
 <1caeaaa0-c5aa-b630-6d42-055b26764f40@arm.com>
 <20190902145245.GC1445@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190902145245.GC1445@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, iommu@lists.linux-foundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 02, 2019 at 04:52:45PM +0200, Thierry Reding wrote:
> On Mon, Sep 02, 2019 at 03:22:35PM +0100, Robin Murphy wrote:
> > On 29/08/2019 12:14, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > For device tree nodes, use the standard of_iommu_get_resv_regions()
> > > implementation to obtain the reserved memory regions associated with a
> > > device.
> > 
> > This covers the window between iommu_probe_device() setting up a default
> > domain and the device's driver finally probing and taking control, but
> > iommu_probe_device() represents the point that the IOMMU driver first knows
> > about this device - there's still a window from whenever the IOMMU driver
> > itself probed up to here where the "unidentified" traffic may have already
> > been disrupted. Some IOMMU drivers have no option but to make the necessary
> > configuration during their own probe routine, at which point a struct device
> > for the display/etc. endpoint may not even exist yet.
> 
> Yeah, I think I'm actually running into this issue with the ARM SMMU
> driver. The above works fine with the Tegra SMMU driver, though, because
> it doesn't touch the SMMU configuration until a device is attached to a
> domain.
> 
> For anything earlier than iommu_probe_device(), I don't see a way of
> doing this generically. I've been working on a prototype to make these
> reserved memory regions early on for ARM SMMU but I've been failing so
> far. I think it would possibly work if we just switched the default for
> stream IDs to be "bypass" if they have any devices that have reserved
> memory regions, but again, this isn't quite working (yet).

I think we should avoid the use of "bypass" outside of the IOMMU probe()
routine if at all possible, since it leaves the thing wide open if we don't
subsequently probe the master.

Why can't we initialise a page-table early for StreamIDs with these
reserved regions, and then join that up later on if we see a device with
one of those StreamIDs attaching to a DMA domain? I suppose the nasty
case would be attaching to a domain that already has other masters
attached to it. Can we forbid that somehow for these devices? Otherwise,
I think we'd have to transiently switch to bypass whilst switching page
table.

What problems did you run into trying to implement this?

Will
