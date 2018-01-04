From: <ilialin@codeaurora.org>
Subject: RE: [PATCH 02/10] clk: qcom: Fix .set_rate to handle alpha PLLs w/wo dynamic update
Date: Thu, 4 Jan 2018 13:14:50 +0200
Message-ID: <027d01d3854d$3f94aac0$bebe0040$@codeaurora.org>
References: <1513081897-31612-1-git-send-email-ilialin@codeaurora.org> <1513081897-31612-3-git-send-email-ilialin@codeaurora.org> <ee78b47f-4fdb-01eb-ba04-c1172b7b7b00@arm.com>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <ee78b47f-4fdb-01eb-ba04-c1172b7b7b00@arm.com>
Content-Language: en-us
Sender: linux-arm-msm-owner@vger.kernel.org
To: 'Julien Thierry' <julien.thierry@arm.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, rnayak@codeaurora.org, will.deacon@arm.com, tfinkel@codeaurora.org, qualcomm-lt@lists.linaro.org, celster@codeaurora.org, 'Taniya Das' <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

This is address in the V2: https://patchwork.kernel.org/patch/10144477/

> -----Original Message-----
> From: Julien Thierry [mailto:julien.thierry@arm.com]
> Sent: Tuesday, December 12, 2017 5:06 PM
> To: Ilia Lin <ilialin@codeaurora.org>; linux-clk@vger.kernel.org; =
linux-arm-
> kernel@lists.infradead.org; linux-arm-msm@vger.kernel.org;
> sboyd@codeaurora.org
> Cc: mark.rutland@arm.com; devicetree@vger.kernel.org;
> rnayak@codeaurora.org; will.deacon@arm.com; tfinkel@codeaurora.org;
> qualcomm-lt@lists.linaro.org; celster@codeaurora.org; Taniya Das
> <tdas@codeaurora.org>
> Subject: Re: [PATCH 02/10] clk: qcom: Fix .set_rate to handle alpha =
PLLs
> w/wo dynamic update
>=20
> Hi,
>=20
> On 12/12/17 12:31, Ilia Lin wrote:
> > From: Taniya Das <tdas@codeaurora.org>
> >
> > From: Taniya Das <tdas@codeaurora.org>
> >
> > Alpha PLLs which do not support dynamic update feature need to be
> > explicitly disabled before a rate change.
> > The ones which do support dynamic update do so within a single vco
> > range, so add a min/max freq check for such PLLs so they fall in the
> > vco range.
> >
> > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> > Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> > ---
> >   drivers/clk/qcom/clk-alpha-pll.c | 71
> +++++++++++++++++++++++++++++++++-------
> >   drivers/clk/qcom/clk-alpha-pll.h |  5 +++
> >   2 files changed, 65 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/clk-alpha-pll.c
> > b/drivers/clk/qcom/clk-alpha-pll.c
> > index 47a1da3..ecb9e7f 100644
> > --- a/drivers/clk/qcom/clk-alpha-pll.c
> > +++ b/drivers/clk/qcom/clk-alpha-pll.c
> > @@ -376,19 +376,46 @@ static unsigned long alpha_pll_calc_rate(u64
> prate, u32 l, u32 a)
> >   	return alpha_pll_calc_rate(prate, l, a);
> >   }
> >
> > -static int clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long =
rate,
> > -				  unsigned long prate)
> > +static int alpha_pll_set_rate(struct clk_hw *hw, unsigned long =
rate,
> > +			      unsigned long prate,
> > +			      int (*enable)(struct clk_hw *hw),
> > +			      void (*disable)(struct clk_hw *hw))
> >   {
> > +	bool enabled;
>=20
> Some remarks about this.
>=20
> >   	struct clk_alpha_pll *pll =3D to_clk_alpha_pll(hw);
> >   	const struct pll_vco *vco;
> >   	u32 l, off =3D pll->offset;
> >   	u64 a;
> >
> >   	rate =3D alpha_pll_round_rate(rate, prate, &l, &a);
> > -	vco =3D alpha_pll_find_vco(pll, rate);
> > -	if (!vco) {
> > -		pr_err("alpha pll not in a valid vco range\n");
> > -		return -EINVAL;
> > +	enabled =3D clk_hw_is_enabled(hw);
>=20
> This is not needed unless we go through the 'else' branch.
>=20
> > +
> > +	if (pll->flags & SUPPORTS_DYNAMIC_UPDATE) {
> > +		/*
> > +		 * PLLs which support dynamic updates support one single
> > +		 * vco range, between min_rate and max_rate supported
> > +		 */
> > +		if (rate < pll->min_rate || rate > pll->max_rate) {
> > +			pr_err("alpha pll rate outside supported min/max
> range\n");
> > +			return -EINVAL;
> > +		}
> > +	} else {
> > +		/*
> > +		 * All alpha PLLs which do not support dynamic update,
> > +		 * should be disabled before a vco update.
> > +		 */
> > +		if (enabled)
> > +			disable(hw);
> > +
> > +		vco =3D alpha_pll_find_vco(pll, rate);
> > +		if (!vco) {
> > +			pr_err("alpha pll not in a valid vco range\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		regmap_update_bits(pll->clkr.regmap, off + PLL_USER_CTL,
> > +				   PLL_VCO_MASK << PLL_VCO_SHIFT,
> > +				   vco->val << PLL_VCO_SHIFT);
> >   	}
> >
> >   	regmap_write(pll->clkr.regmap, off + PLL_L_VAL, l); @@ -401,16
> > +428,29 @@ static int clk_alpha_pll_set_rate(struct clk_hw *hw, =
unsigned
> long rate,
> >   		regmap_write(pll->clkr.regmap, off + PLL_ALPHA_VAL_U, a
> >> 32);
> >   	}
> >
> > -	regmap_update_bits(pll->clkr.regmap, off + PLL_USER_CTL,
> > -			   PLL_VCO_MASK << PLL_VCO_SHIFT,
> > -			   vco->val << PLL_VCO_SHIFT);
> > -
> >   	regmap_update_bits(pll->clkr.regmap, off + PLL_USER_CTL,
> PLL_ALPHA_EN,
> >   			   PLL_ALPHA_EN);
> >
> > +	if (!(pll->flags & SUPPORTS_DYNAMIC_UPDATE) && enabled)
> > +		enable(hw);
> > +
>=20
> This condition is only "did we disable the clock and need to reenable =
it?".
>=20
> To make it clearer, I'd suggest renaming 'enabled' to something like
> 'need_reenabling' and the code look like this:
>=20
> static int alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> 			      unsigned long prate,
> 			      int (*enable)(struct clk_hw *hw),
> 			      void (*disable)(struct clk_hw *hw)) {
> 	bool need_reenabling =3D false;
>=20
> 	[...]
>=20
> 	if(pll->flags & SUPPORTS_DYNAMIC_UPDATE) {
> 		[...]
> 	} else {
> 		if (clk_hw_is_enabled(hw)) {
> 			disable(hw);
> 			need_reenabling =3D true;
> 		}
> 		[...]
> 	}
>=20
> 	[...]
>=20
> 	if (need_reenabling)
> 		enable(hw);
>=20
> }
>=20
>=20
> Cheers,
>=20
> --
> Julien Thierry
