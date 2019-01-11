From: Min Guo <min.guo@mediatek.com>
Subject: Re: [PATCH 4/4] usb: musb: Add support for MediaTek musb controller
Date: Fri, 11 Jan 2019 09:18:10 +0800
Message-ID: <1547169490.4433.147.camel@mhfsdcap03>
References: <1545896066-897-1-git-send-email-min.guo@mediatek.com>
         <1545896066-897-5-git-send-email-min.guo@mediatek.com>
         <20190108154441.GG25910@uda0271908> <1547037068.4433.122.camel@mhfsdcap03>
         <20190109140144.GI25910@uda0271908> <1547105062.4433.144.camel@mhfsdcap03>
         <20190110141840.GA18026@uda0271908>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110141840.GA18026@uda0271908>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Liu <b-liu@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Yonglong Wu <yonglong.wu@mediatek.com>
List-Id: devicetree@vger.kernel.org

Hi Bin,

On Thu, 2019-01-10 at 08:18 -0600, Bin Liu wrote:
> Hi Min,
> 
> Please briefly summarize the controller differences in the commit log,
> such as
> 
> - WIC interrupt registers;
> - data toggle bit;
> - no dedicated DMA interrupt line;
> 
> so that we can quickly understand the core driver is modified
> accordingly to handle the differences.

Okay, tkanks.

> On Thu, Jan 10, 2019 at 03:24:22PM +0800, Min Guo wrote:
> > Hi Bin,
> 
> [snip]
> 
> > > > > > +		musb_writeb(mbase, MUSB_INTRUSB,
> > > > > > +			musb_readb(mbase, MUSB_INTRUSB));
> > > > > 
> > > > > For this clearing register bit operation, please create platform hooks
> > > > > musb_clearb() and musb_clearw() in struct musb_platform_ops instead,
> > > > > then follow how musb_readb() pointer is assigned in
> > > > > musb_init_controller() to use the W1C version for mtk platform.
> > > > 
> > > > I have tried implementing musb_readb(), musb_readw() interface with
> > > > interrupt status W1C function in struct musb_platform_ops. But this
> > > > interface will require a global variable to hold MAC basic address for
> > > > judgment, and then special handling of the interrupt state. A global
> > > > variable will make the driver work with only a single instance, so it
> > > > can't work on some MTK platforms which have two instances.
> > > 
> > > I didn't mean to modify musb_read*(), but
> > > 
> > > > How about creating musb_clearb/w() as following:
> > > > void (*clearb)(void __iomem *addr, unsigned offset, u8 data);
> > > > void (*clearw)(void __iomem *addr, unsigned offset, u16 data);
> > > 
> > > this is what I was asking for, similar to what musb_readb/w() is
> > > implemented.
> > 
> > I will prepare a patch for musb_clearb/w().
> 
> This doesn't have to be a separate patch.

Okay.

> > > > > > +		musb_writew(mbase, MUSB_INTRRX,
> > > > > > +			musb_readw(mbase, MUSB_INTRRX));
> > > > > > +		musb_writew(mbase, MUSB_INTRTX,
> > > > > > +			musb_readw(mbase, MUSB_INTRTX));
> > > > > > +	}
> 
> [snip]
> 
> > > > > > +	/* MediaTek controller has private toggle register */
> > > > > 
> > > > > only one toggle register for all endpoints? how does it handle
> > > > > difference toggle values for different endpoints?
> > > > 
> > > > MediaTek controller has separate registers to describe TX/RX toggle.
> > > 
> > > Is it one register per endpoint?
> > 
> > MUSB_RXTOG/MUSB_TXTOG is common register, each bit reflects the toggle
> > state of an endpoint. bit[0] not used,bit[1~8] corresponds to ep[1~8]
> > 
> > > > 
> > > > > > +	if (musb->ops->quirks & MUSB_MTK_QUIRKS) {
> > > > > > +		u16 toggle;
> > > > > > +		u8 epnum = qh->hw_ep->epnum;
> > > > > > +
> > > > > > +		if (is_in)
> > > > > > +			toggle = musb_readl(musb->mregs, MUSB_RXTOG);
> > > 
> > > this line seems telling there is just *one* register for all endpoints.
> > 
> > Yes, all endpoint share this register, endpoint and bit are one-to-one
> > correspondence.
> 
> Okay, thanks. Sorry I missed the bit operation in the code below.
> 
> > 
> > > > > 
> > > > > should use musb_readw() instead? MUSB_RXTOG seems to be 16bit.
> > > > 
> > > > Ok
> > > > 
> > > > > > +		else
> > > > > > +			toggle = musb_readl(musb->mregs, MUSB_TXTOG);
> > > > > > +
> > > > > > +		csr = toggle & (1 << epnum);
> 
> Regards,
> -Bin.
