From: Robin Gong <b38343@freescale.com>
Subject: Re: [PATCH v8 2/5] ARM: imx6: gpc: Add PU power domain for GPU/VPU
Date: Wed, 10 Sep 2014 18:13:02 +0800
Message-ID: <20140910101301.GA30706@Robin-OptiPlex-780>
References: <1410267915-18126-1-git-send-email-p.zabel@pengutronix.de>
 <1410267915-18126-3-git-send-email-p.zabel@pengutronix.de>
 <20140910034918.GA28759@Robin-OptiPlex-780>
 <1410340023.4508.4.camel@paszta.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1410340023.4508.4.camel@paszta.hi.pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, kernel@pengutronix.de, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 10, 2014 at 11:07:03AM +0200, Philipp Zabel wrote:
> Hi Robin,
> 
> Am Mittwoch, den 10.09.2014, 11:49 +0800 schrieb Robin Gong:
> > Hi Philipp,
> >   Thanks for your great job, power domain make things clear. But looks your
> > patch depend on 'PU regulator', if there is no PU regulator passed down from
> > dts, we'll never implement your way for PGC. On i.mx6sx, there is no internal
> > PU regulator, so I suggest you consider this case. 
> 
> thank you for the hint. Would making the PU regulator optional be enough
> to make this work on i.MX6SX?
> 
> regards
> Philipp
> 
Yes, that's enough. Whether PU regulator exist or not, PGC power off flow should
be walked through.
> ---8<---
> From: Philipp Zabel <p.zabel@pengutronix.de>
> Subject: [PATCH] ARM: imx6: gpc: Make PU regulator optional
> 
> On i.MX6SX there is no internal PU regulator, make it optional.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  arch/arm/mach-imx/gpc.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-imx/gpc.c b/arch/arm/mach-imx/gpc.c
> index cdf8a06..b36703d 100644
> --- a/arch/arm/mach-imx/gpc.c
> +++ b/arch/arm/mach-imx/gpc.c
> @@ -186,7 +186,8 @@ static int imx6q_pm_pu_power_off(struct generic_pm_domain *genpd)
>  	/* Wait ISO + ISO2SW IPG clock cycles */
>  	ndelay((iso + iso2sw) * 1000 / 66);
>  
> -	regulator_disable(pu->reg);
> +	if (pu->reg)
> +		regulator_disable(pu->reg);
>  
>  	return 0;
>  }
> @@ -197,8 +198,9 @@ static int imx6q_pm_pu_power_on(struct generic_pm_domain *genpd)
>  	int i, ret, sw, sw2iso;
>  	u32 val;
>  
> -	ret = regulator_enable(pu->reg);
> -	if (ret) {
> +	if (pu->reg)
> +		ret = regulator_enable(pu->reg);
> +	if (pu->reg && ret) {
>  		pr_err("%s: failed to enable regulator: %d\n", __func__, ret);
>  		return ret;
>  	}
> @@ -309,7 +311,9 @@ static int imx_gpc_probe(struct platform_device *pdev)
>  	struct regulator *pu_reg;
>  	int ret;
>  
> -	pu_reg = devm_regulator_get(&pdev->dev, "pu");
> +	pu_reg = devm_regulator_get_optional(&pdev->dev, "pu");
> +	if (PTR_ERR(pu_reg) == -ENODEV)
> +		pu_reg = NULL;
>  	if (IS_ERR(pu_reg)) {
>  		ret = PTR_ERR(pu_reg);
>  		dev_err(&pdev->dev, "failed to get pu regulator: %d\n", ret);
> @@ -317,8 +321,9 @@ static int imx_gpc_probe(struct platform_device *pdev)
>  	}
>  
>  	/* The regulator is initially enabled */
> -	ret = regulator_enable(pu_reg);
> -	if (ret < 0) {
> +	if (pu_reg)
> +		ret = regulator_enable(pu_reg);
> +	if (pu_reg && ret < 0) {
>  		dev_err(&pdev->dev, "failed to enable pu regulator: %d\n", ret);
>  		return ret;
>  	}
> -- 
> 2.1.0
> 
