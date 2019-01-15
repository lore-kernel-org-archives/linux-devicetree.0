From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 06/14] spmi: pmic-arb: disassociate old virq if hwirq
 mapping already exists
Date: Mon, 14 Jan 2019 16:42:03 -0800
Message-ID: <20190115004203.GK9278@minitux>
References: <20190113154716.5145-1-masneyb@onstation.org>
 <20190113154716.5145-7-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190113154716.5145-7-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: linus.walleij@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun 13 Jan 07:47 PST 2019, Brian Masney wrote:

> Check to see if the hwirq is already associated with another virq on
> this IRQ domain. If so, then disassociate it before associating the
> hwirq with the new virq.
> 
> This is a temporary hack that is needed in order to not break git
> bisect for existing boards. The next patch in this series converts
> spmi-gpio to be a hierarchical IRQ chip, then there are several patches
> to update all of the device tree files, and finally this patch will be
> reverted within the same patch series.
> 

You must maintain compatibility with existing DTB files (at least for
some time), so I don't think we can revert this patch at the end of the
series. 

But the patch itself looks reasonable,

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> IRQs for spmi-gpio are all initially setup without an IRQ hierarchy
> on pmic-arb when mfd/qcom-spmi-pmic.c is probed (via the
> devm_of_platform_populate call) due to the interrupts property in
> device tree. Once spmi-gpio is converted to be a hierarchical IRQ chip
> in the next patch, existing users of gpio[d]_to_irq() will call
> pmic_gpio_to_irq(), and that will use the new IRQ chip code in
> spmi-gpio that sets up the IRQ in an IRQ hierarchy. The hwirq is now
> associated with two Linux virqs and interrupts will not work as
> expected. This patch corrects that issue.
> 
> Driver was tested using gpio-keys and iadc/vadc on the LG Nexus 5
> (hammerhead) phone.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> This is a new patch introduced in V4, but this logic was present in V1.
> 
>  drivers/spmi/spmi-pmic-arb.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> index 356bc3f66e22..b7cfee831417 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c
> @@ -744,8 +744,14 @@ static void qpnpint_irq_domain_map(struct spmi_pmic_arb *pmic_arb,
>  				   struct irq_domain *domain, unsigned int virq,
>  				   irq_hw_number_t hwirq)
>  {
> +	unsigned int old_virq;
> +
>  	dev_dbg(&pmic_arb->spmic->dev, "virq = %u, hwirq = %lu\n", virq, hwirq);
>  
> +	old_virq = irq_find_mapping(domain, hwirq);
> +	if (old_virq)
> +		irq_domain_disassociate(domain, old_virq);
> +
>  	irq_domain_set_info(domain, virq, hwirq, &pmic_arb_irqchip, pmic_arb,
>  			    handle_level_irq, NULL, NULL);
>  }
> -- 
> 2.17.2
> 
