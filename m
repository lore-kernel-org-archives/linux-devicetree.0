From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCHv2 1/5] clk: mvebu: support for 98DX3236 SoC
Date: Thu, 5 Jan 2017 23:05:50 +0000
Message-ID: <b04de1109e7c4c25b4c54aae54f641e2@svr-chch-ex1.atlnz.lc>
References: <20170105033641.6212-1-chris.packham@alliedtelesis.co.nz>
 <20170105033641.6212-2-chris.packham@alliedtelesis.co.nz>
 <20170105135302.GB25333@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
To: Mark Rutland <mark.rutland@arm.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 06/01/17 03:01, Mark Rutland wrote:
> On Thu, Jan 05, 2017 at 04:36:37PM +1300, Chris Packham wrote:
>> The 98DX3236, 98DX3336, 98DX4521 and variants have a different TCLK from
>> the Armada XP (200MHz vs 250MHz). The CPU core clock is fixed at 800MHz.
>>
>> The clock gating options are a subset of those on the Armada XP.
>>
>> The core clock divider is different to the Armada XP also.
>>
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> ---
>> Changes in v2:
>> - Update devicetree binding documentation for new compatible string
>>
>>  .../devicetree/bindings/clock/mvebu-cpu-clock.txt  |   1 +
>>  drivers/clk/mvebu/Makefile                         |   2 +-
>>  drivers/clk/mvebu/armada-xp.c                      |  42 +++++
>>  drivers/clk/mvebu/clk-cpu.c                        |  33 +++-
>>  drivers/clk/mvebu/mv98dx3236-corediv.c             | 207 +++++++++++++++++++++
>>  5 files changed, 281 insertions(+), 4 deletions(-)
>>  create mode 100644 drivers/clk/mvebu/mv98dx3236-corediv.c
>
>
> It looks like you also need to update
> Documentation/devicetree/bindings/clock/mvebu-corediv-clock.txt for the
> addition of "marvell,mv98dx3236-corediv-clock".

Will do.

>
>>
>> diff --git a/Documentation/devicetree/bindings/clock/mvebu-cpu-clock.txt b/Documentation/devicetree/bindings/clock/mvebu-cpu-clock.txt
>> index 99c214660bdc..7f28506eaee7 100644
>> --- a/Documentation/devicetree/bindings/clock/mvebu-cpu-clock.txt
>> +++ b/Documentation/devicetree/bindings/clock/mvebu-cpu-clock.txt
>> @@ -3,6 +3,7 @@ Device Tree Clock bindings for cpu clock of Marvell EBU platforms
>>  Required properties:
>>  - compatible : shall be one of the following:
>>  	"marvell,armada-xp-cpu-clock" - cpu clocks for Armada XP
>> +	"marvell,mv98dx3236-cpu-clock" - cpu clocks for 98DX3236 SoC
>>  - reg : Address and length of the clock complex register set, followed
>>          by address and length of the PMU DFS registers
>>  - #clock-cells : should be set to 1.
>
> [...]
>
>> +static void __init mv98dx3236_corediv_clk_init(struct device_node *node)
>> +{
>> +	struct clk_init_data init;
>> +	struct clk_corediv *corediv;
>> +	struct clk **clks;
>> +	void __iomem *base;
>> +	const __be32 *off;
>> +	const char *parent_name;
>> +	const char *clk_name;
>> +	int len;
>> +	struct device_node *dfx_node;
>> +
>> +	dfx_node = of_parse_phandle(node, "base", 0);
>> +	if (WARN_ON(!dfx_node))
>
> What's going on here? The existing bingings don't mention a "base"
> phandle, and nothing was added to describe it.
>
>> +		return;
>> +
>> +	off = of_get_property(node, "reg", &len);
>> +	if (WARN_ON(!off))
>> +		return;
>
> Please don't use of_get_property directly; generally you should use the
> existing higher-level helpers like of_proeprty_read_u32().
>
>> +
>> +	base = of_iomap(dfx_node, 0);
>> +	if (WARN_ON(!base))
>> +		return;
>> +
>> +	of_node_put(dfx_node);
>> +
>> +	parent_name = of_clk_get_parent_name(node, 0);
>> +
>> +	clk_data.clk_num = 1;
>> +
>> +	/* clks holds the clock array */
>> +	clks = kcalloc(clk_data.clk_num, sizeof(struct clk *),
>> +				GFP_KERNEL);
>> +	if (WARN_ON(!clks))
>> +		goto err_unmap;
>> +	/* corediv holds the clock specific array */
>> +	corediv = kcalloc(clk_data.clk_num, sizeof(struct clk_corediv),
>> +				GFP_KERNEL);
>> +	if (WARN_ON(!corediv))
>> +		goto err_free_clks;
>> +
>> +	spin_lock_init(&corediv->lock);
>> +
>> +	of_property_read_string_index(node, "clock-output-names",
>> +					  0, &clk_name);
>> +
>> +	init.num_parents = 1;
>> +	init.parent_names = &parent_name;
>> +	init.name = clk_name;
>> +	init.ops = &ops;
>> +	init.flags = 0;
>> +
>> +	corediv[0].reg = (void *)((int)base + be32_to_cpu(*off));
>
> I don't understand this, but I guess this has something to do with that
> base phandle. Is the corediv clock a sub-component of some "base" clock?
> I don't think this binding is the best way of describing that.

Actually once I've got things setup correctly via the dts I only need 
some minor modification to mvebu/clk-corediv.c to handle the differences 
in the bit fields used.

>
> Thanks,
> Mark.
>
