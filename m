From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 04/11] mfd: pm8xxx: convert to v2 irq interfaces to
 support hierarchical IRQ chips
Date: Tue, 12 Feb 2019 08:38:54 +0000
Message-ID: <20190212083854.GU20638@dell>
References: <20190208021631.30252-1-masneyb@onstation.org>
 <20190208021631.30252-5-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190208021631.30252-5-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, marc.zyngier@arm.com, tglx@linutronix.de, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 07 Feb 2019, Brian Masney wrote:

> Convert the PM8XXX IRQ code to use the version 2 IRQ interface in order
> to support hierarchical IRQ chips. This is necessary so that ssbi-gpio
> can be setup as a hierarchical IRQ chip with PM8xxx as the parent. IRQ
> chips in device tree should be usable from the start without having to
> make an additional call to gpio[d]_to_irq() to get the proper IRQ on the
> parent.
> 
> pm8821_irq_domain_ops and pm8821_irq_domain_map are removed by this
> patch since the irq_chip is now contained in the pm_irq_data struct, and
> that allows us to use a common IRQ mapping function.
> 
> This change was tested on an APQ8060 DragonBoard.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Tested-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes since v1:
> - Put u8 config[0] at end along with a comment
> - Hardcode the IRQ flow handler as handle_level_irq like the original
>   code.
> - Don't set IRQ handler in pm8xxx_irq_set_type() since this is already
>   done in pm8xxx_irq_domain_map(). Linus: This is different than what
>   you tested but this *should* be fine.
> 
>  drivers/mfd/qcom-pm8xxx.c | 75 ++++++++++++++++++++-------------------
>  1 file changed, 38 insertions(+), 37 deletions(-)

For Linus:
  
  Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
