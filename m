From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: fsl-quadspi: add big-endian support
Date: Wed, 11 Nov 2015 11:10:23 -0800
Message-ID: <20151111191023.GF12143@google.com>
References: <1445586797-38383-1-git-send-email-yao.yuan@freescale.com>
 <CAOMZO5AAr30RM7dE-0BEZGH3Nw1j-QpM+qv2WCyyfK4ATrh=VA@mail.gmail.com>
 <BLUPR03MB134C1F7A783914F4F1ACCDF832F0@BLUPR03MB134.namprd03.prod.outlook.com>
 <20151111175112.GA30612@chopperman.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151111175112.GA30612@chopperman.am.freescale.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Han Xu <han.xu@freescale.com>
Cc: Yuan Yao-B46683 <yao.yuan@freescale.com>, Fabio Estevam <festevam@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Li Yang-Leo-R58472 <LeoLi@freescale.com>, Wood Scott-B07421 <scottwood@freescale.com>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

+ devicetree

On Wed, Nov 11, 2015 at 11:51:13AM -0600, Han Xu wrote:
> On Fri, Oct 30, 2015 at 04:49:41AM -0500, Yuan Yao-B46683 wrote:

(BTW Yuan, replying on top doesn't make the conversation as easy to
follow)

> > Although it is possible to add the endianness support in the
> > regmap_mmio driver, we don't see too much value in using it
> > especially 
> > 
> > So we think:
> > static void qspi_writel(struct fsl_qspi *q, u32 val, void __iomem
> > *addr) {
> >       if (q->big_endian)
> >               iowrite32be(val, addr);
> >       else
> >               iowrite32(val, addr);
> > }
> > This way is an easier, more effective solution to do the endian issue.
> > 
> > How about your think?
> 
> I think the implement is fine, but I prefer to use quirk rather than
> read from dts? Please also rebase the patch to latest l2-mtd code.

If it really is just a endianness difference, then I think it makes
sense to use the existing DT bindings for it, rather than relying on a
new compatible string / quirk option. That doesn't mean you can't have a
new SoC-inspired compatible property in addition...

> > Best Regards,
> > Yuan Yao
> > 
> > On Sat, Oct 24, 2015 at 11:47 PM, Fabio Estevam <festevam@gmail.com> wrote:
> > > I suggest you to implement regmap support for this driver instead.
> > > 
> > > Take a look at drivers/watchdog/imx2_wdt.c for a reference.
> > > 
> > > Then you only need to pass 'big-endian' as a property for the qspi in the .dtsi
> > > file and regmap core will take care of endianness.

To use the standard binding also means that whether or not you choose to
use regmap right now, it's an easy option in the future, and the core
code will already handle it for you. That's really one of the main
reasons for using standardized bindings in the first place.

Brian
