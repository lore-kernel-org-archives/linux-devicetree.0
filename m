From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v5 1/4] mfd: bd71837: mfd driver for ROHM BD71837 PMIC
Date: Tue, 5 Jun 2018 10:57:29 +0300
Message-ID: <20180605075729.GA20078@localhost.localdomain>
References: <cover.1528117485.git.matti.vaittinen@fi.rohmeurope.com>
 <985ac760de3be503f9196eb6353a57eeb92c6dc0.1528117485.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <985ac760de3be503f9196eb6353a57eeb92c6dc0.1528117485.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, mazziesaccount@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mikko.mutanen@fi.rohmeurope.com, heikki.haikola@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

On Mon, Jun 04, 2018 at 04:18:07PM +0300, Matti Vaittinen wrote:
> +static struct regmap_irq_chip bd71837_irq_chip = {
> +	.name = "bd71837-irq",
> +	.irqs = bd71837_irqs,
> +	.num_irqs = ARRAY_SIZE(bd71837_irqs),
> +	.num_regs = 1,
> +	.irq_reg_stride = 1,
> +	.status_base = BD71837_REG_IRQ,
> +	.mask_base = BD71837_REG_MIRQ,
> +	.init_ack_masked = true,
> +	.mask_invert = false,
> +};

.ack_base = BD71837_REG_IRQ, is missing. I'll send yet another version
with this fixed - unless Rob tells me to drop the whole irq handling
from the patch series.

Br,
	Matti Vaittinen
