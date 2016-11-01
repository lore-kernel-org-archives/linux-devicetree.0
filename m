From: James Liao <jamesjj.liao@mediatek.com>
Subject: Re: [PATCH v14 1/4] clk: mediatek: Add MT2701 clock support
Date: Tue, 1 Nov 2016 17:23:54 +0800
Message-ID: <1477992234.8785.9.camel@mtksdaap41>
References: <1477020742-13889-1-git-send-email-erin.lo@mediatek.com>
         <1477020742-13889-2-git-send-email-erin.lo@mediatek.com>
         <20161028011753.GS26139@codeaurora.org>
         <1477896558.5376.13.camel@mtksdaap41>
         <20161031180647.GR16026@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20161031180647.GR16026@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Erin Lo <erin.lo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <kernel@pengutronix.de>, Daniel Kurtz <djkurtz@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, srv_heupstream@mediatek.com, ms.chen@mediatek.com, robert.chou@mediatek.com, Shunli Wang <shunli.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Mon, 2016-10-31 at 11:06 -0700, Stephen Boyd wrote:
> On 10/31, James Liao wrote:
> > On Thu, 2016-10-27 at 18:17 -0700, Stephen Boyd wrote:
> > > On 10/21, Erin Lo wrote:
> > > > @@ -244,3 +256,31 @@ void mtk_clk_register_composites(const struct mtk_composite *mcs,
> > > >  			clk_data->clks[mc->id] = clk;
> > > >  	}
> > > >  }
> > > > +
> > > > +void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
> > > > +			int num, void __iomem *base, spinlock_t *lock,
> > > > +				struct clk_onecell_data *clk_data)
> > > > +{
> > > > +	struct clk *clk;
> > > > +	int i;
> > > > +
> > > > +	for (i = 0; i <  num; i++) {
> > > > +		const struct mtk_clk_divider *mcd = &mcds[i];
> > > > +
> > > > +		if (clk_data && !IS_ERR_OR_NULL(clk_data->clks[mcd->id]))
> > > 
> > > NULL is a valid clk. IS_ERR_OR_NULL is usually wrong.
> > 
> > Why NULL is a valid clk?
> 
> Perhaps at some point we'll want to return a NULL pointer to
> clk_get() callers so that they can handle things like optional
> clocks easily without having any storage requirements. I don't
> know if we'll ever do that, but that's just a possibility.
> 
> > 
> > clk_data is designed for multiple initialization from different clock
> > types, such as infra_clk_data in clk-mt2701.c. So it will ignore valid
> > clocks to avoid duplicated clock registration. Here I assume a clock
> > pointer with error code or NULL to be an invalid (not initialized)
> > clock.
> > 
> 
> Ok. Would it be possible to initialize the array with all error
> pointers? That would make things less error prone, but it

Yes. Current mtk_alloc_clk_data() implementation init all elements with
ERR_PTR(-ENOENT). 

> probably doesn't matter at all anyway because this is done during
> registration time. IS_ERR_OR_NULL makes me take a second look
> each time, because it's usually wrong.

I see. Although currently all Mediatek clk drivers use
mtk_alloc_clk_data() to allocate clk_data, I would like to keep the
flexibility to support zero-initialized clk_data such as a static
structure. So I prefer to treat a NULL pointer as an uninitialized
clock.


Best regards,

James

