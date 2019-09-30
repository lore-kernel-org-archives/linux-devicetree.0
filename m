From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 02/11] of: Make of_dma_get_range() private
Date: Mon, 30 Sep 2019 05:53:43 -0700
Message-ID: <20190930125343.GB12051@infradead.org>
References: <20190927002455.13169-1-robh@kernel.org>
 <20190927002455.13169-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190927002455.13169-3-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Frank Rowand <frowand.list@gmail.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Oza Pawandeep <oza.oza@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
List-Id: devicetree@vger.kernel.org

> +#ifdef CONFIG_OF_ADDRESS
> +extern int of_dma_get_range(struct device_node *np, u64 *dma_addr,
> +			    u64 *paddr, u64 *size);

No need for the extern here.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
