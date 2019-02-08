From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v2 02/11] genirq: introduce irq_domain_translate_twocell
Date: Fri, 8 Feb 2019 13:25:10 +0000
Message-ID: <9ac5e0d4-d1fb-963c-4952-391f558710e4@arm.com>
References: <20190208021631.30252-1-masneyb@onstation.org>
 <20190208021631.30252-3-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208021631.30252-3-masneyb@onstation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>, linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, lee.jones@linaro.org
Cc: tglx@linutronix.de, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/02/2019 02:16, Brian Masney wrote:
> Add a new function irq_domain_translate_twocell() that is to be used as
> the translate function in struct irq_domain_ops for the v2 IRQ API.
> 
> This patch also changes irq_domain_xlate_twocell() from the v1 IRQ API
> to call irq_domain_translate_twocell() in the v2 IRQ API. This required
> changes to of_phandle_args_to_fwspec()'s arguments so that it can be
> called from multiple places.
> 
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Changes since v1:
> - Included Marc Zyngier's changes to irq_domain_xlate_twocell() and
>   of_phandle_args_to_fwspec().

Thanks for having folded this in.

Reviewed-by: Marc Zyngier <marc.zyngier@arm.com>

	M.
-- 
Jazz is not dead. It just smells funny...
