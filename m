From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] clk: mediatek: Add MT8173 MMPLL change rate support
Date: Tue, 7 Jul 2015 17:48:45 +0800
Message-ID: <1436262525.3526.103.camel@mtksdaap41>
References: <1433222760-5924-1-git-send-email-jamesjj.liao@mediatek.com>
	 <57452978.oOaMP89yJM@diego> <1436261318.3526.96.camel@mtksdaap41>
	 <1618189.7QkIIkOn1c@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1618189.7QkIIkOn1c@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On Tue, 2015-07-07 at 11:34 +0200, Heiko St=FCbner wrote:
> > > > @@ -135,16 +138,26 @@ static void mtk_pll_calc_values(struct mt=
k_clk_pll
> > > > *pll, u32 *pcw, u32 *postdiv, u32 freq, u32 fin)
> > > >=20
> > > >  {
> > > > =20
> > > >  	unsigned long fmin =3D 1000 * MHZ;
> > > >=20
> > > > +	const unsigned long *div_rate =3D pll->data->div_rate;
> > > >=20
> > > >  	u64 _pcw;
> > > >  	u32 val;
> > > >  =09
> > > >  	if (freq > pll->data->fmax)
> > > >  =09
> > > >  		freq =3D pll->data->fmax;
> > > >=20
> > > > -	for (val =3D 0; val < 4; val++) {
> > > > +	if (div_rate) {
> > > > +		for (val =3D 1; div_rate[val] !=3D 0; val++) {
> > > > +			if (freq > div_rate[val])
> > > > +				break;
> > > > +		}
> > > > +		val--;
> > >=20
> > > if you're changing the table struct, this of course also would ne=
ed to be
> > > adapted.
> > >=20
> > >=20
> > > Hmm, what I don't understand is, what does MT8173_PLL_FMAX in the=
 table,
> > > if
> > > you ignore it here all the time?
> > >=20
> > > So the table should probably look more like [when using the conce=
pt from
> > > above]
> > >=20
> > > static const struct mtk_pll_div_table mmpll_div_rate[] =3D {
> > >=20
> > > 	{ .freq =3D 1000000000, .div =3D 0 },
> > > 	{ .freq =3D 702000000, .div =3D 1 },
> > > 	{ .freq =3D 253500000, .div =3D 2 },
> > > 	{ .freq =3D 126750000, .div =3D 3 },
> > > 	{ /* sentinel */ },
> > >=20
> > > };
> >=20
> > The freq-div table describes the maximum frequency of each divider
> > setting. Although the first element doesn't used in current
> > implementation, I think it's better to keep freq-div table's
> > completeness.
>=20
> the issue I see is, that its value is currently 0 and the code substr=
acts 1.=20
> So if anything would (accidentially) select MT8173_PLL_FMAX, the u32 =
val would=20
> wrap around, as you're subtracting 1 from 0 .

Subtracting 1 from val is safe now because it starts from 1:

  for (val =3D 1; div_rate[val] !=3D 0; val++) {
    ...
  }
  val--;

I can change this implementation to a more readable one such as:

  for (val =3D 0; div_rate[val + 1] !=3D 0; val++) {
    if (freq <=3D div_rate[val] && freq > div_rate[val + 1]) {
      ...

Do you think it is OK?


Best regards,

James

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
