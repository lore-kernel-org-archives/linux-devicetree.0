From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 5/9] mtd: nand: atmel: fix OF child-node lookup
Date: Mon, 27 Aug 2018 10:44:14 +0200
Message-ID: <20180827084414.GZ14967@localhost>
References: <20180827082153.22537-1-johan@kernel.org>
 <20180827082153.22537-6-johan@kernel.org>
 <20180827102820.3abf7291@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180827102820.3abf7291@bbrezillon>
Sender: stable-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Josh Wu <rainyfeeling@outlook.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 27, 2018 at 10:28:20AM +0200, Boris Brezillon wrote:
> Hi Johan
> 
> On Mon, 27 Aug 2018 10:21:49 +0200
> Johan Hovold <johan@kernel.org> wrote:
> 
> > Use the new of_get_compatible_child() helper to lookup the nfc child
> > node instead of using of_find_compatible_node(), which searches the
> > entire tree from a given start node and thus can return an unrelated
> > (i.e. non-child) node.
> > 
> > This also addresses a potential use-after-free (e.g. after probe
> > deferral) as the tree-wide helper drops a reference to its first
> > argument (i.e. the node of the device being probed).
> > 
> > While at it, also fix a related nfc-node reference leak.
> > 
> > Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> > Cc: stable <stable@vger.kernel.org>     # 4.11
> > Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> > Cc: Josh Wu <rainyfeeling@outlook.com>
> > Cc: Boris Brezillon <boris.brezillon@bootlin.com>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> 
> Acked-by: Boris Brezillon <boris.brezillon@bootlin.com>

Thanks for the ack.

> I'll let Miquel queue this patch to the nand/next branch, unless you
> want it to be merged in 4.19, in which case I'll queue it to the
> mtd/fixes branch.

Note that there's a dependency on the first patch of the series which
adds the new helper. Rob can pick up the entire series if the various
maintainers agree, otherwise I'll try to get at the least the helper
into -rc2.

I'd prefer getting the use-after-frees fixed in 4.19, but queuing for
4.20 should be fine too.

Thanks,
Johan
