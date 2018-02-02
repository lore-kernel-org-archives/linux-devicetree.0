From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v6 18/41] clk: davinci: New driver for TI DA8XX CFGCHIP
 clocks
Date: Fri, 2 Feb 2018 11:56:08 -0600
Message-ID: <af157fd3-f1da-cf17-8b1a-47223ac3fd39@lechnology.com>
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-19-git-send-email-david@lechnology.com>
 <c2138795-edcd-bb7d-094d-47dc049c33df@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <c2138795-edcd-bb7d-094d-47dc049c33df@ti.com>
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
To: Sekhar Nori <nsekhar@ti.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Adam Ford <aford173@gmail.com>
List-Id: devicetree@vger.kernel.org

On 02/02/2018 07:19 AM, Sekhar Nori wrote:
> On Saturday 20 January 2018 10:43 PM, David Lechner wrote:
>> +static const struct clk_ops da8xx_cfgchip_div4p5_clk_ops = {
>> +	.enable		= da8xx_cfgchip_gate_clk_enable,
>> +	.disable	= da8xx_cfgchip_gate_clk_disable,
>> +	.is_enabled	= da8xx_cfgchip_gate_clk_is_enabled,
> 
> I assume the reason for not using clk-gate.c is lack of regmap support
> there?

Correct.

I couldn't find a way to get a lock from the regmap that could
be passed to clk_register_gate() to prevent non-clock drivers from
trying to use the regmap at the same the the clocks are.

> 
>> +	.recalc_rate	= da8xx_cfgchip_div4p5_recalc_rate,
>> +};
>> +
>> +static struct clk * __init
>> +da8xx_cfgchip_gate_clk_register(const struct da8xx_cfgchip_gate_clk_info *info,
>> +				const char *parent_name,
>> +				struct regmap *regmap)
>> +{
>> +	struct da8xx_cfgchip_gate_clk *gate;
>> +	struct clk_init_data init;
>> +
>> +	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
>> +	if (!gate)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	init.name = info->name;
>> +	if (info->flags & DA8XX_GATE_CLOCK_IS_DIV4P5)
>> +		init.ops = &da8xx_cfgchip_div4p5_clk_ops;
>> +	else
>> +		init.ops = &da8xx_cfgchip_gate_clk_ops;
> 
> This will be easier to read using ternary operator, I think. But you
> will probably have line breaks.

The names are so long that the ternary operator doesn't make it better IMHO.

	init.ops = (info->flags & DA8XX_GATE_CLOCK_IS_DIV4P5) ?
		&da8xx_cfgchip_div4p5_clk_ops :
		&da8xx_cfgchip_gate_clk_ops;
