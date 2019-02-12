From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 11/11] mfd: pm8xxx: revert "disassociate old virq if
 hwirq mapping already exists"
Date: Tue, 12 Feb 2019 08:20:35 +0000
Message-ID: <20190212082035.GQ20638@dell>
References: <20190208021631.30252-1-masneyb@onstation.org>
 <20190208021631.30252-12-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190208021631.30252-12-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, marc.zyngier@arm.com, tglx@linutronix.de, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 07 Feb 2019, Brian Masney wrote:

> Now that ssbi-gpio is a proper hierarchical IRQ chip, and all in-tree
> users of device tree have been updated, we can now drop the hack that
> was introduced to disassociate the old Linux virq if a hwirq mapping
> already exists. That patch was introduced to not break git bisect for
> any existing boards.
> 
> This change was tested on an APQ8060 DragonBoard.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Tested-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes since v1:
> - None
> 
>  drivers/mfd/qcom-pm8xxx.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
> index 2f99a98ccee5..8eb2528793f9 100644
> --- a/drivers/mfd/qcom-pm8xxx.c
> +++ b/drivers/mfd/qcom-pm8xxx.c
> @@ -380,12 +380,6 @@ static void pm8xxx_irq_domain_map(struct pm_irq_chip *chip,
>  				  struct irq_domain *domain, unsigned int irq,
>  				  irq_hw_number_t hwirq, unsigned int type)
>  {
> -	unsigned int old_virq;
> -
> -	old_virq = irq_find_mapping(domain, hwirq);
> -	if (old_virq)
> -		irq_domain_disassociate(domain, old_virq);
> -

For Linus:
  
  Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
