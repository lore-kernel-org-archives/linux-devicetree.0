From: Min Guo <min.guo@mediatek.com>
Subject: Re: [PATCH v2 4/4] usb: musb: Add support for MediaTek musb
 controller
Date: Thu, 17 Jan 2019 11:34:16 +0800
Message-ID: <1547696056.4433.233.camel@mhfsdcap03>
References: <1547516626-5084-1-git-send-email-min.guo@mediatek.com>
         <1547516626-5084-5-git-send-email-min.guo@mediatek.com>
         <20190115203815.GD18026@uda0271908> <1547631542.4433.232.camel@mhfsdcap03>
         <20190116135914.GF18026@uda0271908>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116135914.GF18026@uda0271908>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Liu <b-liu@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Yonglong Wu <yonglong.wu@mediatek.com>
List-Id: devicetree@vger.kernel.org

On Wed, 2019-01-16 at 07:59 -0600, Bin Liu wrote:
> On Wed, Jan 16, 2019 at 05:39:02PM +0800, Min Guo wrote:
> > Hi Bin,
> > 
> > On Tue, 2019-01-15 at 14:38 -0600, Bin Liu wrote:
> > > Hi Min,
> > > 
> > > very close, thanks.
> > > Below I tried to explain a further cleanup in musb_clearb/w() and
> > > musb_get/set_toggle() implementation. Please let me know if it is not
> > > clear.
> > > 
> > > Basically, we don't need musb_default_clearb/w(), just assign the
> > > musb_io function pointers to musb_readb/w().
> > > 
> > > Then the mtk platform musb_clearb/w() calls musb_readb/w() and
> > > musb_writeb/w() to handle W1C.
> > 
> > Sorry to bother you again, I encounter a problem when prepare the patch.
> 
> no problem at all.

Thanks.

> > The define of musb_clearb/w and musb_readb/w are difference as follow,
> > and cannot be directly assigned:
> > u8/u16 (*readb/w)(const void __iomem *addr, unsigned offset)
> > void (*clearb/w)(void __iomem *addr, unsigned int offset)) 
> > 
> > if modify clearb/w as:
> > u8/u16 (*clearb/w)(const void __iomem *addr, unsigned int offset)) 
> > then musb_clear needs writeb/w the const addr.
> > Can I delete const in (*readb/w)?
> 
> yes, please create a separate patch for it, and for readl() as well,
> and stating it is for implementing clearing W1C registers.

Okay.

> Regards,
> -Bin.
