From: James Liao <jamesjj.liao@mediatek.com>
Subject: Re: [PATCH v4 6/7] clk: mediatek: Add USB clock support in MT8173
 APMIXEDSYS
Date: Tue, 28 Jul 2015 12:05:55 +0800
Message-ID: <1438056355.17770.9.camel@mtksdaap41>
References: <1437706925-3222-1-git-send-email-jamesjj.liao@mediatek.com>
	 <1437706925-3222-7-git-send-email-jamesjj.liao@mediatek.com>
	 <CAGS+omA0PPThRKEV=Xy3VkS+ifg55oy+gi_d5Sr+TQJorh8a0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGS+omA0PPThRKEV=Xy3VkS+ifg55oy+gi_d5Sr+TQJorh8a0g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Heiko Stubner <heiko@sntech.de>, srv_heupstream <srv_heupstream@mediatek.com>, Ricky Liang <jcliang@chromium.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Fri, 2015-07-24 at 19:28 +0800, Daniel Kurtz wrote:
> On Fri, Jul 24, 2015 at 11:02 AM, James Liao <jamesjj.liao@mediatek.com> wrote:
> > +struct clk *mtk_clk_register_ref2usb_tx(const char *name,
> > +                       const char *parent_name, void __iomem *reg)
> 
> struct clk * __init mtk_clk_register_ref2usb_tx(

It will be added in next patch.

> >
> >  #include <linux/of.h>
> >  #include <linux/of_address.h>
> > -#include <linux/slab.h>
> > -#include <linux/mfd/syscon.h>
> 
> nit: this looks like an unrelated change that can be in its own patch.

It will be in a separated patch.

> >
> > +typedef struct clk *(*mtk_clk_register_ex)(const char *, const char *,
> > +                                       void __iomem *);
> > +
> > +struct mtk_clk_ex {
> > +       int id;
> > +       const char *name;
> > +       const char *parent;
> > +       u32 reg_ofs;
> > +       mtk_clk_register_ex reg_clk_ex;
> 
> 
> This "mtk_clk_ex" abstraction seems unnecessarily complicated for a
> one-off USB clock.
> Just call mtk_clk_register_ref2usb_tx() directly from mtk_apmixedsys_init().

Use a table to associate related constants and names is more readable,
such as:

  APMIXED_EX(CLK_APMIXED_REF2USB_TX, "ref2usb_tx", ... 

If we call mtk_clk_register_ref2usb_tx() directly, it will be:

  clk = mtk_clk_register_ref2usb_tx("ref2usb_tx", ...);
  clk_data-clks[CLK_APMIXED_REF2USB_TX] = clk;

Do you prefer the last one?


Best regards,

James
