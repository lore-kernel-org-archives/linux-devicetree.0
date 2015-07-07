From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] clk: mediatek: Add MT8173 MMPLL change rate support
Date: Tue, 7 Jul 2015 17:28:38 +0800
Message-ID: <1436261318.3526.96.camel@mtksdaap41>
References: <1433222760-5924-1-git-send-email-jamesjj.liao@mediatek.com>
	 <57452978.oOaMP89yJM@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57452978.oOaMP89yJM@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On Tue, 2015-07-07 at 10:58 +0200, Heiko St=FCbner wrote:
> > +#define PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbits=
,	\
> > +			_pd_reg, _pd_shift, _tuner_reg, _pcw_reg,	\
> > +			_pcw_shift)					\
> > +		PLL_B(_id, _name, _reg, _pwr_reg, _en_mask, _flags, _pcwbits, \
> > +			_pd_reg, _pd_shift, _tuner_reg, _pcw_reg, _pcw_shift, \
> > +			NULL)
> > +
> > +const unsigned long mmpll_div_rate[] =3D {
>=20
> static?

OK. I'll add it.

>=20
> > +	MT8173_PLL_FMAX,
> > +	1000000000,
> > +	702000000,
> > +	253500000,
> > +	126750000,
> > +	0,
>=20
> it's more common to label sentinel entries (the 0 marking the end) wi=
th
> 	/* sentinel */
> instead of value 0.

OK. I'll add it.

>=20
> If I'm reading the code correctly, this is a mapping divider -> frequ=
ency,=20
> right? So it may be nice to make this a bit more explicit, like:
>=20
> struct mtk_pll_div_table {
> 	unsigned int    freq;
> 	unsigned int    div;
> };
>=20
> static const struct mtk_pll_div_table mmpll_div_rate[] =3D {
> 	{ .freq =3D MT8173_PLL_FMAX, .div =3D 0 },
> 	{ .freq =3D 1000000000, .div =3D 1 },
> 	{ .freq =3D 702000000, .div =3D 2 },
> 	{ .freq =3D 253500000, .div =3D 3 },
> 	{ .freq =3D 126750000, .div =3D 4 },
> 	{ /* sentinel */ },
> };

Hmm.. OK. I'll try to use a more readable way to implement it.

> -------------
>=20
> > -	u32 con1, pd, val;
> > +	u32 con1, val;
> >  	int pll_en;
> >=20
> > -	/* set postdiv */
> > -	pd =3D readl(pll->pd_addr);
> > -	pd &=3D ~(POSTDIV_MASK << pll->data->pd_shift);
> > -	pd |=3D (ffs(postdiv) - 1) << pll->data->pd_shift;
> > -	writel(pd, pll->pd_addr);
> > -
> >  	pll_en =3D readl(pll->base_addr + REG_CON0) & CON0_BASE_EN;
> >=20
> > -	/* set pcw */
> > -	val =3D readl(pll->pcw_addr);
> > +	/* set postdiv */
> > +	val =3D readl(pll->pd_addr);
> > +	val &=3D ~(POSTDIV_MASK << pll->data->pd_shift);
> > +	val |=3D (ffs(postdiv) - 1) << pll->data->pd_shift;
> > +
> > +	/* postdiv and pcw need to set at the same time if on same regist=
er */
> > +	if (pll->pd_addr !=3D pll->pcw_addr) {
> > +		writel(val, pll->pd_addr);
> > +		val =3D readl(pll->pcw_addr);
> > +	}
> >=20
> > +	/* set pcw */
> >  	val &=3D ~GENMASK(pll->data->pcw_shift + pll->data->pcwbits - 1,
> >  			pll->data->pcw_shift);
> >  	val |=3D pcw << pll->data->pcw_shift;
>=20
> This whole block probably wants to be a separate patch ;-) .
>=20
> While it may not affect previous pll implementations, it changes how =
register=20
> accesses are handled and should not hide in another patch.

OK, I'll separate it.

> > @@ -135,16 +138,26 @@ static void mtk_pll_calc_values(struct mtk_cl=
k_pll
> > *pll, u32 *pcw, u32 *postdiv, u32 freq, u32 fin)
> >  {
> >  	unsigned long fmin =3D 1000 * MHZ;
> > +	const unsigned long *div_rate =3D pll->data->div_rate;
> >  	u64 _pcw;
> >  	u32 val;
> >=20
> >  	if (freq > pll->data->fmax)
> >  		freq =3D pll->data->fmax;
> >=20
> > -	for (val =3D 0; val < 4; val++) {
> > +	if (div_rate) {
> > +		for (val =3D 1; div_rate[val] !=3D 0; val++) {
> > +			if (freq > div_rate[val])
> > +				break;
> > +		}
> > +		val--;
>=20
> if you're changing the table struct, this of course also would need t=
o be=20
> adapted.
>=20
>=20
> Hmm, what I don't understand is, what does MT8173_PLL_FMAX in the tab=
le, if=20
> you ignore it here all the time?
>=20
> So the table should probably look more like [when using the concept f=
rom=20
> above]
>=20
> static const struct mtk_pll_div_table mmpll_div_rate[] =3D {
> 	{ .freq =3D 1000000000, .div =3D 0 },
> 	{ .freq =3D 702000000, .div =3D 1 },
> 	{ .freq =3D 253500000, .div =3D 2 },
> 	{ .freq =3D 126750000, .div =3D 3 },
> 	{ /* sentinel */ },
> };

The freq-div table describes the maximum frequency of each divider
setting. Although the first element doesn't used in current
implementation, I think it's better to keep freq-div table's
completeness.


Best regards,

James


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
