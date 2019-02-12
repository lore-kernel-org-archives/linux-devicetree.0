From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 05/11] mfd: pm8xxx: disassociate old virq if hwirq
 mapping already exists
Date: Tue, 12 Feb 2019 08:39:16 +0000
Message-ID: <20190212083916.GV20638@dell>
References: <20190208021631.30252-1-masneyb@onstation.org>
 <20190208021631.30252-6-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190208021631.30252-6-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, marc.zyngier@arm.com, tglx@linutronix.de, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 07 Feb 2019, Brian Masney wrote:

> Check to see if the hwirq is already associated with another virq on
> this IRQ domain. If so, then disassociate it before associating the
> hwirq with the new virq.
> 
> This is a temporary hack that is needed in order to not break git
> bisect for existing boards. The next patch in this series converts
> ssbi-gpio to be a hierarchical IRQ chip, then there are several patches
> to update all of the device tree files, and finally this patch will be
> reverted within the same patch series.
> 
> IRQs for ssbi-gpio are all initially setup without an IRQ hierarchy
> this driver is probed due to the interrupts property in device tree.
> Once ssbi-gpio is converted to be a hierarchical IRQ chip in the next
> patch, existing users of gpio[d]_to_irq() will call pmic_gpio_to_irq(),
> and that will use the new IRQ chip code in ssbi-gpio that sets up the
> IRQ in an IRQ hierarchy. The hwirq is now associated with two Linux
> virqs and interrupts will not work as expected. This patch corrects
> that issue.
> 
> This change was tested on an APQ8060 DragonBoard.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Tested-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes since v1:
> - None
> 
>  drivers/mfd/qcom-pm8xxx.c | 6 ++++++
>  1 file changed, 6 insertions(+)

For Linus:
  
  Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
