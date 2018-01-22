From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v3 6/9] irqchip: Add the ingenic-tcu-intc driver
Date: Mon, 22 Jan 2018 09:55:34 +0000
Message-ID: <bdae1be4-0ed2-1b7d-8b08-7439ce06e762@arm.com>
References: <20180101143344.2099-1-paul@crapouillou.net>
 <20180110224838.16711-1-paul@crapouillou.net>
 <20180110224838.16711-6-paul@crapouillou.net>
 <58349291-93cd-f803-52a9-f88120ace4dc@arm.com>
 <1515687945.2170.1@smtp.crapouillou.net>
 <20180120130649.7f326f75@why.wild-wind.fr.eu.org>
 <20180122092617.36ggqqike4gwwgrd@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180122092617.36ggqqike4gwwgrd@dell>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Paul Cercueil <paul@crapouillou.net>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 22/01/18 09:26, Lee Jones wrote:
> On Sat, 20 Jan 2018, Marc Zyngier wrote:
> 
>> On Thu, 11 Jan 2018 17:25:45 +0100
>> Paul Cercueil <paul@crapouillou.net> wrote:
>>
>>> Hi Marc,
>>>
>>>>>  +static int __init ingenic_tcu_intc_of_init(struct device_node 
>>>>> *node,
>>>>>  +	struct device_node *parent)
>>>>>  +{
>>>>>  +	struct irq_domain *domain;
>>>>>  +	struct irq_chip_generic *gc;
>>>>>  +	struct irq_chip_type *ct;
>>>>>  +	int err, i, num_parent_irqs;
>>>>>  +	unsigned int parent_irqs[3];  
>>>>
>>>> 3 parent interrupts? Really? How do you pick one? Also, given the 
>>>> useage
>>>> model below, "int" is the wrong type. Probably should be u32.  
>>>
>>> See below.
>>>
>>>>>  +	struct regmap *map;
>>>>>  +
>>>>>  +	num_parent_irqs = of_property_count_elems_of_size(
>>>>>  +			node, "interrupts", 4);  
>>>>
>>>> Nit: on a single line, as here is nothing that hurts my eyes more than
>>>> reading something like(
>>>> this). Also, 4 is better expressed as sizeof(u32).  
>>>
>>> That will make checkpatch.pl unhappy :(
>>
>> And I don't care about checkpatch. I maintain the irqchip stuff, while
>> checkpatch doesn't. Hence, I win.
> 
> 	num_parent_irqs =
> 		of_property_count_elems_of_size(node, "interrupts", 4);  
> 
> Everybody wins!

<old_git_rant>

As I said before, I've stopped using a physical DEC VT100 around 1990,
and gained the ability to extend my terminal to a bit more that 80
columns. And even the VT100 could be coerced into using a 132 column mode...

</old_git_rant>

Adhering to a convention can be good, but common sense must apply first.
Splitting an assignment is visually annoying and in that case, it
doesn't make much sense. I'll happily take a line that goes beyond 80
cols, and if you really wanted to stay within boundaries, how about
turning "num_parent_irqs" something shorter?

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
