From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 05/11] mfd: pm8xxx: disassociate old virq if hwirq mapping already exists
Date: Thu, 14 Feb 2019 21:51:26 -0800
Message-ID: <155020988635.115909.8353948296231202388@swboyd.mtv.corp.google.com>
References: <20190208021631.30252-1-masneyb@onstation.org> <20190208021631.30252-6-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208021631.30252-6-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, andy.gross@linaro.org, bjorn.andersson@linaro.org, lee.jones@linaro.org, linus.walleij@linaro.org, marc.zyngier@arm.com
Cc: tglx@linutronix.de, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Brian Masney (2019-02-07 18:16:25)
> Check to see if the hwirq is already associated with another virq on
> this IRQ domain. If so, then disassociate it before associating the
> hwirq with the new virq.
>=20
> This is a temporary hack that is needed in order to not break git
> bisect for existing boards. The next patch in this series converts
> ssbi-gpio to be a hierarchical IRQ chip, then there are several patches
> to update all of the device tree files, and finally this patch will be
> reverted within the same patch series.
>=20
> IRQs for ssbi-gpio are all initially setup without an IRQ hierarchy
> this driver is probed due to the interrupts property in device tree.
> Once ssbi-gpio is converted to be a hierarchical IRQ chip in the next
> patch, existing users of gpio[d]_to_irq() will call pmic_gpio_to_irq(),
> and that will use the new IRQ chip code in ssbi-gpio that sets up the
> IRQ in an IRQ hierarchy. The hwirq is now associated with two Linux
> virqs and interrupts will not work as expected. This patch corrects
> that issue.
>=20
> This change was tested on an APQ8060 DragonBoard.
>=20
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Tested-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes since v1:
> - None
>=20
>  drivers/mfd/qcom-pm8xxx.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
> index 8eb2528793f9..2f99a98ccee5 100644
> --- a/drivers/mfd/qcom-pm8xxx.c
> +++ b/drivers/mfd/qcom-pm8xxx.c
> @@ -380,6 +380,12 @@ static void pm8xxx_irq_domain_map(struct pm_irq_chip=
 *chip,
>                                   struct irq_domain *domain, unsigned int=
 irq,
>                                   irq_hw_number_t hwirq, unsigned int typ=
e)
>  {
> +       unsigned int old_virq;
> +
> +       old_virq =3D irq_find_mapping(domain, hwirq);
> +       if (old_virq)
> +               irq_domain_disassociate(domain, old_virq);

Is it possible to pass 'true' for the 'realloc' argument to
__irq_domain_alloc_irqs() and then this disassociate change isn't
needed?

> +
>         irq_domain_set_info(domain, irq, hwirq, chip->pm_irq_data->irq_ch=
ip,
>                             chip, handle_level_irq, NULL, NULL);
>         irq_set_noprobe(irq);
