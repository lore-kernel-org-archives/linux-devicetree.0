From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 05/11] of: Ratify of_dma_configure() interface
Date: Mon, 30 Sep 2019 05:57:52 -0700
Message-ID: <20190930125752.GD12051@infradead.org>
References: <20190927002455.13169-1-robh@kernel.org>
 <20190927002455.13169-6-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190927002455.13169-6-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Frank Rowand <frowand.list@gmail.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Oza Pawandeep <oza.oza@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 26, 2019 at 07:24:49PM -0500, Rob Herring wrote:
> -int of_dma_configure(struct device *dev, struct device_node *np, bool force_dma)
> +int of_dma_configure(struct device *dev, struct device_node *parent, bool force_dma)

This creates a > 80 char line.

>  {
>  	u64 dma_addr, paddr, size = 0;
>  	int ret;
>  	bool coherent;
>  	unsigned long offset;
>  	const struct iommu_ops *iommu;
> +	struct device_node *np;
>  	u64 mask;
>  
> +	np = dev->of_node;
> +	if (!np)
> +		np = parent;
> +	if (!np)
> +		return -ENODEV;

I have to say I find the older calling convention simpler to understand.
If we want to enforce the invariant I'd rather do that explicitly:

	if (dev->of_node && np != dev->of_node)
		return -EINVAL;
