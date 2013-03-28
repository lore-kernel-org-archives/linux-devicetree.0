From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 01/11] staging: drm/imx: Add LDB support
Date: Thu, 28 Mar 2013 11:06:13 +0100
Message-ID: <1364465173.4018.35.camel@pizza.hi.pengutronix.de>
References: <1364405445-5271-1-git-send-email-p.zabel@pengutronix.de>
 <1364405445-5271-2-git-send-email-p.zabel@pengutronix.de>
 <51533D33.8060305@parkeon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51533D33.8060305-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Martin,

Am Mittwoch, den 27.03.2013, 19:40 +0100 schrieb Martin Fuzzey:
> Hi Philipp,
> 
> On 27/03/13 18:30, Philipp Zabel wrote:
> > +static bool imx_ldb_encoder_mode_fixup(struct drm_encoder *encoder,
> > +			   const struct drm_display_mode *mode,
> > +			   struct drm_display_mode *adjusted_mode)
> > +{
> > +/*
> > +	struct imx_ldb_channel *imx_ldb_ch = enc_to_imx_ldb_ch(encoder);
> > +
> > +	adjusted_mode->clock = clk_round_rate(imx_ldb_ch->ldb->clk_pll[imx_ldb_ch->chno],
> > +			adjusted_mode->clock * 1000) / 1000;
> > +*/
> This should probably be removed :)

Right.

> > +static void imx_ldb_set_clock(struct imx_ldb *ldb, int mux, int chno,
> > +		unsigned long serial_clk, unsigned long di_clk)
> > +{
> > +	int ret;
> > +
> > +	dev_dbg(ldb->dev, "%s: now: %ld want: %ld\n", __func__,
> > +			clk_get_rate(ldb->clk_pll[chno]), serial_clk);
> > +	clk_set_rate(ldb->clk_pll[chno], serial_clk);
> > +
> > +	dev_dbg(ldb->dev, "%s after: %ld\n", __func__,
> > +			clk_get_rate(ldb->clk_pll[chno]));
> > +
> > +	dev_dbg(ldb->dev, "%s: now: %ld want: %ld\n", __func__,
> > +			clk_get_rate(ldb->clk[chno]),
> > +			(long int)di_clk);
> > +	clk_set_rate(ldb->clk[chno], di_clk);
> > +
> > +	dev_dbg(ldb->dev, "%s after: %ld\n", __func__,
> > +			clk_get_rate(ldb->clk[chno]));
> > +
> Are all these debug statements still useful?

The clocking is a hairy, especially if the board code decided to use an
unexpected PLL as source for the LVDS serial clock. But I agree this
could be condensed a bit.

> > +static void imx_ldb_encoder_commit(struct drm_encoder *encoder)
> > +{
> > +	if (imx_ldb_ch == &ldb->channel[0] || dual) {
> > +		ldb->ldb_ctrl &= ~0x3;
> > +		if (mux == 0 || ldb->lvds_mux)
> > +			ldb->ldb_ctrl |= LDB_CH0_MODE_EN_TO_DI0;
> > +		else if (mux == 1)
> > +			ldb->ldb_ctrl |= LDB_CH0_MODE_EN_TO_DI1;
> > +	}
> > +	if (imx_ldb_ch == &ldb->channel[1] || dual) {
> > +		ldb->ldb_ctrl &= ~0xc;
> > +		if (mux == 1 || ldb->lvds_mux)
> > +			ldb->ldb_ctrl |= LDB_CH1_MODE_EN_TO_DI1;
> > +		else if (mux == 0)
> > +			ldb->ldb_ctrl |= LDB_CH1_MODE_EN_TO_DI0;
> > +	}
> Maybe avoid the magic 0x3 and 0x0c by building from LDB_CHx_MODE_EN_TO_DIx?

Ok, I'll prune the magic constants.

> > +
> > +static void imx_ldb_encoder_disable(struct drm_encoder *encoder)
> > +{
> > +	struct imx_ldb_channel *imx_ldb_ch = enc_to_imx_ldb_ch(encoder);
> > +	struct imx_ldb *ldb = imx_ldb_ch->ldb;
> > +
> > +	/*
> > +	 * imx_ldb_encoder_disable is called by
> > +	 * drm_helper_disable_unused_functions without
> > +	 * the encoder being enabled before.
> > +	 */
> > +	if (imx_ldb_ch == &ldb->channel[0] && (ldb->ldb_ctrl & 0x3) == 0)
> > +		return;
> > +	else if (imx_ldb_ch == &ldb->channel[1] && (ldb->ldb_ctrl & 0xc) == 0)
> > +		return;
> > +
> > +	if (imx_ldb_ch == &ldb->channel[0])
> > +		ldb->ldb_ctrl &= ~0x3;
> > +	else if (imx_ldb_ch == &ldb->channel[1])
> > +		ldb->ldb_ctrl &= ~0xc;
> > +
> Idem magic numbers

thanks
Philipp
