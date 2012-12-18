From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 02/10] SH: intc: Add support OF of IRQ
Date: Tue, 18 Dec 2012 09:31:50 +0900
Message-ID: <20121218003150.GH7146@verge.net.au>
References: <1355562224-29448-1-git-send-email-horms+renesas@verge.net.au>
 <1355562224-29448-3-git-send-email-horms+renesas@verge.net.au>
 <2838757.yMqfipzqR7@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2838757.yMqfipzqR7@avalon>
Sender: linux-sh-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Simon Horman <horms+renesas@verge.net.au>, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Paul Mundt <lethal@linux-sh.org>, Magnus Damm <magnus.damm@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Bastian Hecht <hechtb@gmail.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>, Magnus Damm <damm@opensource.se>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 17, 2012 at 09:29:44AM +0100, Laurent Pinchart wrote:
> Hi Iwamatsu-san,
> 
> Thank your for the patch.
> 
> On Saturday 15 December 2012 18:03:36 Simon Horman wrote:
> > From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
> > 
> > Add information of device node to struct intc_desc.
> > 
> > Cc: Magnus Damm <damm@opensource.se>
> > Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > 
> > ---
> > 
> > v7
> > * Delete "renesas,sh_intcs" and "renesas,sh_intca_irq_pins" as compatible.
> >   Update their documentation.
> > * Remove of_sh_intc_get_meminfo() and of_sh_intc_get_pint and
> >   of_sh_intc_get_intc(). They are not used.
> > 
> > v2 - v6
> > * No change
> > ---
> >  Documentation/devicetree/bindings/sh/intc.txt |   15 +----
> >  drivers/sh/intc/core.c                        |    2 +-
> >  drivers/sh/intc/internals.h                   |    3 +-
> >  drivers/sh/intc/irqdomain.c                   |    6 +-
> >  drivers/sh/intc/of_intc.c                     |   76 ----------------------
> >  include/linux/sh_intc.h                       |   29 +---------
> >  6 files changed, 9 insertions(+), 122 deletions(-)
> 
> Shouldn't this be squashed into patch 01/10 ? 01/10 adds DT bindings support, 
> and you already modify them in this patch.

Good point. Yes, I think so.
I'll probably be the one doing the squashing and if so I'll do so for the
next spin.
