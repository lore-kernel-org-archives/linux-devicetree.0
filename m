From: Bin Liu <b-liu@ti.com>
Subject: Re: [PATCH v2 4/4] usb: musb: Add support for MediaTek musb controller
Date: Wed, 16 Jan 2019 07:59:14 -0600
Message-ID: <20190116135914.GF18026@uda0271908>
References: <1547516626-5084-1-git-send-email-min.guo@mediatek.com>
 <1547516626-5084-5-git-send-email-min.guo@mediatek.com>
 <20190115203815.GD18026@uda0271908>
 <1547631542.4433.232.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1547631542.4433.232.camel@mhfsdcap03>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Min Guo <min.guo@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Yonglong Wu <yonglong.wu@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 16, 2019 at 05:39:02PM +0800, Min Guo wrote:
> Hi Bin,
> 
> On Tue, 2019-01-15 at 14:38 -0600, Bin Liu wrote:
> > Hi Min,
> > 
> > very close, thanks.
> > Below I tried to explain a further cleanup in musb_clearb/w() and
> > musb_get/set_toggle() implementation. Please let me know if it is not
> > clear.
> > 
> > Basically, we don't need musb_default_clearb/w(), just assign the
> > musb_io function pointers to musb_readb/w().
> > 
> > Then the mtk platform musb_clearb/w() calls musb_readb/w() and
> > musb_writeb/w() to handle W1C.
> 
> Sorry to bother you again, I encounter a problem when prepare the patch.

no problem at all.

> The define of musb_clearb/w and musb_readb/w are difference as follow,
> and cannot be directly assigned:
> u8/u16 (*readb/w)(const void __iomem *addr, unsigned offset)
> void (*clearb/w)(void __iomem *addr, unsigned int offset)) 
> 
> if modify clearb/w as:
> u8/u16 (*clearb/w)(const void __iomem *addr, unsigned int offset)) 
> then musb_clear needs writeb/w the const addr.
> Can I delete const in (*readb/w)?

yes, please create a separate patch for it, and for readl() as well,
and stating it is for implementing clearing W1C registers.

Regards,
-Bin.
