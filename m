From: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 5/7] clk: sunxi: add PRCM (Power/Reset/Clock Management)
 clks support
Date: Wed, 07 May 2014 19:12:30 +0200
Message-ID: <536A697E.5000107@free-electrons.com>
References: <1398697130-8338-1-git-send-email-boris.brezillon@free-electrons.com> <1398697130-8338-6-git-send-email-boris.brezillon@free-electrons.com> <20140428234039.GT3134@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140428234039.GT3134@lukather>
Sender: linux-doc-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio@elopez.com.ar>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>, Shuge <shuge@allwinnertech.com>, kevin@allwinnertech.com, Hans de Goede <hdegoede@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dev@linux-sunxi.org
List-Id: devicetree@vger.kernel.org


On 29/04/2014 01:40, Maxime Ripard wrote:
> On Mon, Apr 28, 2014 at 04:58:48PM +0200, Boris BREZILLON wrote:
>> The PRCM (Power/Reset/Clock Management) unit provides several clock
>> devices:
>> - AR100 clk: used to clock the Power Management co-processor
>> - AHB0 clk: used to clock the AHB0 bus
>> - APB0 clk and gates: used to clk
> Used to clk?
"Used to clk peripherals connected on the APB0 bus"

I'll add the missing words in the next version :-).

>
[...]
> Ditto.
>
> And you'll probably want to use devm_ioremap_resource when you'll have
> a single clock for the AR100.

Absolutely.

>
>> +
>> +	clk_parent = of_clk_get_parent_name(np, 0);
>> +	if (!clk_parent)
>> +		return -EINVAL;
[...]
>> +
>> +static struct platform_driver sun6i_a31_prcm_clk_driver = {
>> +	.driver = {
>> +		.name = "sun6i-a31-prcm-clk",
>> +		.owner = THIS_MODULE,
>> +		.of_match_table = sun6i_a31_prcm_clk_dt_ids,
>> +	},
>> +	.probe = sun6i_a31_prcm_clk_probe,
> You're not calling the of_clk_del_provider, and you should probably
> unregister your clocks too.

This driver cannot be compiled as a module, and as a result the probed
clks will never be removed.

Do you really want to support clk removal for this HW block ?

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

