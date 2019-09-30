From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 03/11] of: address: Report of_dma_get_range() errors
 meaningfully
Date: Mon, 30 Sep 2019 05:54:14 -0700
Message-ID: <20190930125414.GC12051@infradead.org>
References: <20190927002455.13169-1-robh@kernel.org>
 <20190927002455.13169-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190927002455.13169-4-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Frank Rowand <frowand.list@gmail.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Oza Pawandeep <oza.oza@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 26, 2019 at 07:24:47PM -0500, Rob Herring wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> If we failed to translate a DMA address, at least show the offending
> address rather than the uninitialised contents of the destination
> argument.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
