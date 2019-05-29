Return-Path: <SRS0=L0hH=T5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56759 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbfE2NVB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 May 2019 09:21:01 -0400
Message-ID: <1559136052.3651.9.camel@pengutronix.de>
Subject: Re: [PATCH v2 5/9] media: hantro: add support for named register
 ranges
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Wed, 29 May 2019 15:20:52 +0200
In-Reply-To: <20190529134645.65f8feb4@collabora.com>
References: <20190529095424.23614-1-p.zabel@pengutronix.de>
         <20190529095424.23614-6-p.zabel@pengutronix.de>
         <20190529134645.65f8feb4@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Ezequiel Garcia <ezequiel@collabora.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi Boris,

thank you for the review.

On Wed, 2019-05-29 at 13:46 +0200, Boris Brezillon wrote:
> On Wed, 29 May 2019 11:54:20 +0200
> Philipp Zabel <p.zabel@pengutronix.de> wrote:
> 
> > Add support for multiple register ranges with SoC specific names.
> > 
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> >  drivers/staging/media/hantro/hantro.h     |  7 ++++++-
> >  drivers/staging/media/hantro/hantro_drv.c | 25 +++++++++++++++++------
> >  2 files changed, 25 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
> > index 6b90fe48bcdf..b796867808d5 100644
> > --- a/drivers/staging/media/hantro/hantro.h
> > +++ b/drivers/staging/media/hantro/hantro.h
> > @@ -27,6 +27,7 @@
> >  
> >  #define HANTRO_MAX_CLOCKS		4
> >  #define HANTRO_MAX_IRQS			3
> > +#define HANTRO_MAX_REG_RANGES		4
> >  
> >  #define MPEG2_MB_DIM			16
> >  #define MPEG2_MB_WIDTH(w)		DIV_ROUND_UP(w, MPEG2_MB_DIM)
> > @@ -63,6 +64,8 @@ struct hantro_codec_ops;
> >   * @num_irqs:			number of irqs in the arrays
> >   * @clk_names:			array of clock names
> >   * @num_clocks:			number of clocks in the array
> > + * @reg_names:			array of register range names
> > + * @num_regs:			number of register range names in the array
> >   */
> >  struct hantro_variant {
> >  	unsigned int enc_offset;
> > @@ -80,6 +83,8 @@ struct hantro_variant {
> >  	int num_irqs;
> >  	const char *clk_names[HANTRO_MAX_CLOCKS];
> >  	int num_clocks;
> > +	const char *reg_names[HANTRO_MAX_REG_RANGES];
> > +	int num_regs;

Do you suggest
	const char * const *reg_names;
...

> >  };
> >  
> >  /**
> > @@ -170,7 +175,7 @@ struct hantro_dev {
> >  	struct platform_device *pdev;
> >  	struct device *dev;
> >  	struct clk_bulk_data clocks[HANTRO_MAX_CLOCKS];
> > -	void __iomem *base;
> > +	void __iomem *base[HANTRO_MAX_REG_RANGES];
> 
> Same comment as for the irq stuff.

... and
	void __iomem **base;
to get rid of HANTRO_MAX_REG_RANGES?

Would you like to see the same for clk_names?

> >  	void __iomem *enc_base;
> >  	void __iomem *dec_base;
> >  
> > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> > index f677b40bcd2d..bd02b27258e3 100644
> > --- a/drivers/staging/media/hantro/hantro_drv.c
> > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > @@ -692,12 +692,25 @@ static int hantro_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return ret;
> >  
> > -	res = platform_get_resource(vpu->pdev, IORESOURCE_MEM, 0);
> > -	vpu->base = devm_ioremap_resource(vpu->dev, res);
> > -	if (IS_ERR(vpu->base))
> > -		return PTR_ERR(vpu->base);
> > -	vpu->enc_base = vpu->base + vpu->variant->enc_offset;
> > -	vpu->dec_base = vpu->base + vpu->variant->dec_offset;
> > +	if (vpu->variant->num_regs) {
> > +		for (i = 0; i < vpu->variant->num_regs; i++) {
> > +			const char *reg_name = vpu->variant->reg_names[i];
> > +
> > +			res = platform_get_resource_byname(vpu->pdev,
> > +							   IORESOURCE_MEM,
> > +							   reg_name);
> > +			vpu->base[i] = devm_ioremap_resource(vpu->dev, res);
> > +			if (IS_ERR(vpu->base[i]))
> > +				return PTR_ERR(vpu->base[i]);
> > +		}
> > +	} else {
> > +		res = platform_get_resource(vpu->pdev, IORESOURCE_MEM, 0);
> > +		vpu->base[0] = devm_ioremap_resource(vpu->dev, res);
> > +		if (IS_ERR(vpu->base[0]))
> > +			return PTR_ERR(vpu->base[0]);
> > +		vpu->enc_base = vpu->base[0] + vpu->variant->enc_offset;
> > +		vpu->dec_base = vpu->base[0] + vpu->variant->dec_offset;
> 
> I see ->dec_based is assigned in ->hw_init() in patch 8, so maybe it's
> better to have the same workflow for rk variants: assign
> vpu->{dec,enc}_base in ->hw_init() 

I didn't want to change this around too much, as dec_base is just needed
for the vdpu_read/write functions, and I expect we'll have to somehow
replace these anyway when adding G2 support.
Adding yet another set of register accessors for g1_read/write vs
g2_read/write isn't very convenient. Maybe it woudl be better to call
the register accessors with the base as a parameter instead of
hantro_dev.

Also the kerneldoc comment says .init() should "initialize hardware".
Should that be changed to "variant specific initialization" if the
enc/dec_base are set there?

> and set ->num_regs to 1 (plus a
> fallback to platform_get_resource() instead of
> platform_get_resource_byname() when ->reg_names[0] == NULL).

I suppose we could do that, but

	static const char * const rk3288_regs[] = {
		NULL
	}

	const struct hantro_variant rk3288_vpu_variant = {
		.reg_n
ames = rk3288_regs,
		.num_regs = ARRAY_SIZE(rk3288_regs)
	};

would look a bit strange if we were to get rid of
HANTRO_MAX_REG_RANGES...

regards
Philipp
