From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] of: restore old handling of cells_name=NULL in
 of_*_phandle_with_args()
Date: Wed, 18 Sep 2019 22:19:54 +0200
Message-ID: <20190918201954.2phyqxqhoj5jwklt@pengutronix.de>
References: <20190918063837.8196-1-u.kleine-koenig@pengutronix.de>
 <b00ca30f-2c06-7722-96b2-123d15751cb6@axentia.se>
 <20190918084748.hnjkiq7wc5b35wjh@pengutronix.de>
 <CAL_JsqJuJrOj+D4xkGACC1=zaB5OUkt=SNzCOiOiTVtM9E9z+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJuJrOj+D4xkGACC1=zaB5OUkt=SNzCOiOiTVtM9E9z+A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Frank Rowand <frowand.list@gmail.com>, Peter Rosin <peda@axentia.se>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 18, 2019 at 03:09:06PM -0500, Rob Herring wrote:
> On Wed, Sep 18, 2019 at 3:47 AM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > Before commit e42ee61017f5 ("of: Let of_for_each_phandle fallback to
> > non-negative cell_count") the iterator functions calling
> > of_for_each_phandle assumed a cell count of 0 if cells_name was NULL.
> > This corner case was missed when implementing the fallback logic in
> > e42ee61017f5 and resulted in an endless loop.
> >
> > Restore the old behaviour of of_count_phandle_with_args() and
> > of_parse_phandle_with_args() and add a check to
> > of_phandle_iterator_init() to prevent a similar failure as a safety
> > precaution. of_parse_phandle_with_args_map() doesn't need a similar fix
> > as cells_name isn't NULL there.
> >
> > Affected drivers are:
> >  - drivers/base/power/domain.c
> >  - drivers/base/power/domain.c
> >  - drivers/clk/ti/clk-dra7-atl.c
> >  - drivers/hwmon/ibmpowernv.c
> >  - drivers/i2c/muxes/i2c-demux-pinctrl.c
> >  - drivers/iommu/mtk_iommu.c
> >  - drivers/net/ethernet/freescale/fman/mac.c
> >  - drivers/opp/of.c
> >  - drivers/perf/arm_dsu_pmu.c
> >  - drivers/regulator/of_regulator.c
> >  - drivers/remoteproc/imx_rproc.c
> >  - drivers/soc/rockchip/pm_domains.c
> >  - sound/soc/fsl/imx-audmix.c
> >  - sound/soc/fsl/imx-audmix.c
> >  - sound/soc/meson/axg-card.c
> >  - sound/soc/samsung/tm2_wm5110.c
> >  - sound/soc/samsung/tm2_wm5110.c
> >
> > Thanks to Geert Uytterhoeven for reporting the issue, Peter Rosin for
> > helping pinpoint the actual problem and the testers for confirming this
> > fix.
> >
> > Fixes: e42ee61017f5 ("of: Let of_for_each_phandle fallback to non-negative cell_count")
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > ---
> >
> > On Wed, Sep 18, 2019 at 08:01:05AM +0000, Peter Rosin wrote:
> > > On 2019-09-18 08:38, Uwe Kleine-König wrote:
> > > >  EXPORT_SYMBOL(of_parse_phandle_with_args);
> > > >
> > > > @@ -1765,6 +1779,18 @@ int of_count_phandle_with_args(const struct device_node *np, const char *list_na
> > > >     struct of_phandle_iterator it;
> > > >     int rc, cur_index = 0;
> > > >
> > > > +   /* If cells_name is NULL we assume a cell count of 0 */
> > > > +   if (cells_name == NULL) {
> > >
> > > A couple of nits.
> > >
> > > I don't know if there are other considerations, but in the previous two
> > > hunks you use !cells_name instead of comparing explicitly with NULL.
> > > Personally, I find the shorter form more readable, and in the name of
> > > consistency bla bla...
> >
> > Ack, changed to !cells_name here, too.
> >
> > >
> > > Also, the comment explaining this NULL-check didn't really make sense
> > > to me until I realized that knowing the cell count to be zero makes
> > > counting trivial. Something along those lines should perhaps be in the
> > > comment?
> >
> > You're right, I extended the comment a bit.
> >
> > > But as I said, these are nits. Feel free to ignore.
> >
> > I considered resending already anyhow as I fatfingerd my email address.
> > this is fixed now, too. Additionally I fixed a typo in one of the
> > comments.
> >
> > Thanks for your feedback.
> >
> > Best regards
> > Uwe
> >
> >  drivers/of/base.c | 35 +++++++++++++++++++++++++++++++++--
> >  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> Can I get a proper patch please.

I don't understand what is wrong with my patch. Can you please expand
what you are missing? I just tried to git-am it and the result looks
fine.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
