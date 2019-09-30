From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 00/11] of: dma-ranges fixes and improvements
Date: Mon, 30 Sep 2019 01:20:55 -0700
Message-ID: <20190930082055.GA21971@infradead.org>
References: <20190927002455.13169-1-robh@kernel.org>
 <CAK8P3a0oct0EOMi5t4BmpgdkiBM+LjC+2pTST4hcvNCa3MGLmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a0oct0EOMi5t4BmpgdkiBM+LjC+2pTST4hcvNCa3MGLmw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Robin Murphy <robin.murphy@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Frank Rowand <frowand.list@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Oza Pawandeep <oza.oza@broadcom.com>, Christoph Hellwig <hch@infradead.org>, Thierry Reding <thierry.reding@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sun, Sep 29, 2019 at 01:16:20PM +0200, Arnd Bergmann wrote:
> On a semi-related note, Thierry asked about one aspect of the dma-ranges
> property recently, which is the behavior of dma_set_mask() and related
> functions when a driver sets a mask that is larger than the memory
> area in the bus-ranges but smaller than the available physical RAM.
> As I understood Thierry's problem and the current code, the generic
> dma_set_mask() will either reject the new mask entirely or override
> the mask set by of_dma_configure, but it fails to set a correct mask
> within the limitations of the parent bus in this case.

There days dma_set_mask will only reject a mask if it is too small
to be supported by the hardware.  Larger than required masks are now
always accepted.
