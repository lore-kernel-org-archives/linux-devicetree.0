From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v9 09/27] ARM: davinci: dm644x: add new clock init using
 common clock framework
Date: Thu, 3 May 2018 18:48:20 +0530
Message-ID: <cfce1685-296a-a669-bb7d-bf14d43004ed@ti.com>
References: <20180427001745.4116-1-david@lechnology.com>
 <20180427001745.4116-10-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180427001745.4116-10-david@lechnology.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Lechner <david@lechnology.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Adam Ford <aford173@gmail.com>
List-Id: devicetree@vger.kernel.org

On Friday 27 April 2018 05:47 AM, David Lechner wrote:
>  void __init dm644x_init_time(void)
>  {
> +#ifdef CONFIG_COMMON_CLK
> +	void __iomem *pll1, *psc;
> +	struct clk *clk;
> +
> +	clk_register_fixed_rate(NULL, "ref_clk", NULL, 0, DM644X_REF_FREQ);
> +
> +	pll1 = ioremap(DAVINCI_PLL1_BASE, SZ_1K);
> +	dm355_pll1_init(NULL, pll1, NULL);

This should be dm644x_*()

> +
> +	psc = ioremap(DAVINCI_PWR_SLEEP_CNTRL_BASE, SZ_4K);
> +	dm355_psc_init(NULL, psc);

This one should be dm644x_*()

With those fixes, I was able to bootup on DM644x EVM and a visual
inspection of clock debug dump shows it remains same before and after
the conversion.

Thanks,
Sekhar
