From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v4 4/4] [media] exynos-gsc: Add hardware rotation limits
Date: Wed, 13 Sep 2017 14:13:45 +0200
Message-ID: <509750b5-22d0-77ee-8295-0e52679e0d1e@samsung.com>
References: <1505302915-15699-1-git-send-email-hoegeun.kwon@samsung.com>
        <CGME20170913114215epcas2p346dd3987cf25481bc780e0eef8b91ed8@epcas2p3.samsung.com>
        <1505302915-15699-5-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1505302915-15699-5-git-send-email-hoegeun.kwon@samsung.com>
Content-language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: inki.dae@samsung.com, airlied@linux.ie, kgene@kernel.org, krzk@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, mchehab@kernel.org, m.szyprowski@samsung.com, robin.murphy@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/13/2017 01:41 PM, Hoegeun Kwon wrote:
> @@ -1004,11 +1088,33 @@ static irqreturn_t gsc_irq_handler(int irq, void *priv)
>   	.num_clocks = 1,
>   };
>   
> +static struct gsc_driverdata gsc_v_5250_drvdata = {
> +	.variant = {
> +		[0] = &gsc_v_5250_variant,
> +		[1] = &gsc_v_5250_variant,
> +		[2] = &gsc_v_5250_variant,
> +		[3] = &gsc_v_5250_variant,
> +	},
> +	.num_entities = 4,
> +	.clk_names = { "gscl" },
> +	.num_clocks = 1,
> +};
> +
> +static struct gsc_driverdata gsc_v_5420_drvdata = {
> +	.variant = {
> +		[0] = &gsc_v_5420_variant,
> +		[1] = &gsc_v_5420_variant,
> +	},
> +	.num_entities = 4,

Shouldn't num_enities be 2 here? You don't need to resend, I can
amend that when applying.

> +	.clk_names = { "gscl" },
> +	.num_clocks = 1,
> +};
> +

--
Regards,
Sylwester
