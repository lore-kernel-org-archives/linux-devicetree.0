From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] clk: mediatek: Add MT8173 MMPLL change rate support
Date: Tue, 07 Jul 2015 11:34:17 +0200
Message-ID: <1618189.7QkIIkOn1c@diego>
References: <1433222760-5924-1-git-send-email-jamesjj.liao@mediatek.com> <57452978.oOaMP89yJM@diego> <1436261318.3526.96.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436261318.3526.96.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: James Liao <jamesjj.liao@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, Ricky Liang <jcliang@chromium.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi James,

Am Dienstag, 7. Juli 2015, 17:28:38 schrieb James Liao:
> On Tue, 2015-07-07 at 10:58 +0200, Heiko St=FCbner wrote:
> > > +#define PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbi=
ts,	\
> > > +			_pd_reg, _pd_shift, _tuner_reg, _pcw_reg,	\
> > > +			_pcw_shift)					\
> > > +		PLL_B(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbits, =
\
> > > +			_pd_reg, _pd_shift, _tuner_reg, _pcw_reg, _pcw_shift, \
> > > +			NULL)
> > > +
> > > +const unsigned long mmpll_div_rate[] =3D {
> >=20
> > static?
>=20
> OK. I'll add it.
>=20
> > > +	MT8173_PLL_FMAX,
> > > +	1000000000,
> > > +	702000000,
> > > +	253500000,
> > > +	126750000,
> > > +	0,
> >=20
> > it's more common to label sentinel entries (the 0 marking the end) =
with
> >=20
> > 	/* sentinel */
> >=20
> > instead of value 0.
>=20
> OK. I'll add it.
>=20
> > If I'm reading the code correctly, this is a mapping divider -> fre=
quency,
> > right? So it may be nice to make this a bit more explicit, like:
> >=20
> > struct mtk_pll_div_table {
> >=20
> > 	unsigned int    freq;
> > 	unsigned int    div;
> >=20
> > };
> >=20
> > static const struct mtk_pll_div_table mmpll_div_rate[] =3D {
> >=20
> > 	{ .freq =3D MT8173_PLL_FMAX, .div =3D 0 },
> > 	{ .freq =3D 1000000000, .div =3D 1 },
> > 	{ .freq =3D 702000000, .div =3D 2 },
> > 	{ .freq =3D 253500000, .div =3D 3 },
> > 	{ .freq =3D 126750000, .div =3D 4 },
> > 	{ /* sentinel */ },
> >=20
> > };
>=20
> Hmm.. OK. I'll try to use a more readable way to implement it.
>=20
> > -------------
> >=20
> > > -	u32 con1, pd, val;
> > > +	u32 con1, val;
> > >=20
> > >  	int pll_en;
> > >=20
> > > -	/* set postdiv */
> > > -	pd =3D readl(pll->pd_addr);
> > > -	pd &=3D ~(POSTDIV_MASK << pll->data->pd_shift);
> > > -	pd |=3D (ffs(postdiv) - 1) << pll->data->pd_shift;
> > > -	writel(pd, pll->pd_addr);
> > > -
> > >=20
> > >  	pll_en =3D readl(pll->base_addr + REG_CON0) & CON0_BASE_EN;
> > >=20
> > > -	/* set pcw */
> > > -	val =3D readl(pll->pcw_addr);
> > > +	/* set postdiv */
> > > +	val =3D readl(pll->pd_addr);
> > > +	val &=3D ~(POSTDIV_MASK << pll->data->pd_shift);
> > > +	val |=3D (ffs(postdiv) - 1) << pll->data->pd_shift;
> > > +
> > > +	/* postdiv and pcw need to set at the same time if on same regi=
ster=20
*/
> > > +	if (pll->pd_addr !=3D pll->pcw_addr) {
> > > +		writel(val, pll->pd_addr);
> > > +		val =3D readl(pll->pcw_addr);
> > > +	}
> > >=20
> > > +	/* set pcw */
> > >=20
> > >  	val &=3D ~GENMASK(pll->data->pcw_shift + pll->data->pcwbits - 1=
,
> > >  =09
> > >  			pll->data->pcw_shift);
> > >  =09
> > >  	val |=3D pcw << pll->data->pcw_shift;
> >=20
> > This whole block probably wants to be a separate patch ;-) .
> >=20
> > While it may not affect previous pll implementations, it changes ho=
w
> > register accesses are handled and should not hide in another patch.
>=20
> OK, I'll separate it.
>=20
> > > @@ -135,16 +138,26 @@ static void mtk_pll_calc_values(struct mtk_=
clk_pll
> > > *pll, u32 *pcw, u32 *postdiv, u32 freq, u32 fin)
> > >=20
> > >  {
> > > =20
> > >  	unsigned long fmin =3D 1000 * MHZ;
> > >=20
> > > +	const unsigned long *div_rate =3D pll->data->div_rate;
> > >=20
> > >  	u64 _pcw;
> > >  	u32 val;
> > >  =09
> > >  	if (freq > pll->data->fmax)
> > >  =09
> > >  		freq =3D pll->data->fmax;
> > >=20
> > > -	for (val =3D 0; val < 4; val++) {
> > > +	if (div_rate) {
> > > +		for (val =3D 1; div_rate[val] !=3D 0; val++) {
> > > +			if (freq > div_rate[val])
> > > +				break;
> > > +		}
> > > +		val--;
> >=20
> > if you're changing the table struct, this of course also would need=
 to be
> > adapted.
> >=20
> >=20
> > Hmm, what I don't understand is, what does MT8173_PLL_FMAX in the t=
able,
> > if
> > you ignore it here all the time?
> >=20
> > So the table should probably look more like [when using the concept=
 from
> > above]
> >=20
> > static const struct mtk_pll_div_table mmpll_div_rate[] =3D {
> >=20
> > 	{ .freq =3D 1000000000, .div =3D 0 },
> > 	{ .freq =3D 702000000, .div =3D 1 },
> > 	{ .freq =3D 253500000, .div =3D 2 },
> > 	{ .freq =3D 126750000, .div =3D 3 },
> > 	{ /* sentinel */ },
> >=20
> > };
>=20
> The freq-div table describes the maximum frequency of each divider
> setting. Although the first element doesn't used in current
> implementation, I think it's better to keep freq-div table's
> completeness.

the issue I see is, that its value is currently 0 and the code substrac=
ts 1.=20
So if anything would (accidentially) select MT8173_PLL_FMAX, the u32 va=
l would=20
wrap around, as you're subtracting 1 from 0 .


Heiko
