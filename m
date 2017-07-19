From: Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH v6 2/3] clk: gate: expose clk_gate_ops::is_enabled
Date: Wed, 19 Jul 2017 03:25:44 +0300
Message-ID: <1ed5052f-7d42-b57f-d12f-5ea003a2c5a9@mleia.com>
References: <1500364414-10021-1-git-send-email-gabriel.fernandez@st.com>
 <1500364414-10021-3-git-send-email-gabriel.fernandez@st.com>
 <55bc0f3f-67ed-a15f-5b71-d87044fd5237@mleia.com>
 <20170718225203.GD18179@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170718225203.GD18179@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: gabriel.fernandez@st.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org, andrea.merello@gmail.com, radoslaw.pietrzyk@gmail.com, Lee Jones <lee.jones@linaro.org>, Sylvain Lemieux <slemieux.tyco@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com, gabriel.fernandez.st@gmail.com, Arvind Yadav <arvind.yadav.cs@gmail.com>
List-Id: devicetree@vger.kernel.org

On 07/19/2017 01:52 AM, Stephen Boyd wrote:
> On 07/18, Vladimir Zapolskiy wrote:
>> On 07/18/2017 10:53 AM, gabriel.fernandez@st.com wrote:
>>> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>>>  }
>>> +EXPORT_SYMBOL_GPL(clk_gate_is_enabled);
>>>  
>>>  const struct clk_ops clk_gate_ops = {
>>>  	.enable = clk_gate_enable,
>>> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
>>> index c59c625..e9587ab 100644
>>> --- a/include/linux/clk-provider.h
>>> +++ b/include/linux/clk-provider.h
>>> @@ -343,6 +343,7 @@ struct clk_hw *clk_hw_register_gate(struct device *dev, const char *name,
>>>  		u8 clk_gate_flags, spinlock_t *lock);
>>>  void clk_unregister_gate(struct clk *clk);
>>>  void clk_hw_unregister_gate(struct clk_hw *hw);
>>> +int clk_gate_is_enabled(struct clk_hw *hw);
>>
>> Here the prefix does not reflect the type of its argument, it might be
>> acceptable for a veiled function, but it is not wanted for the exported
>> function. Something like clk_hw_gate_is_enabled() is expected here, but
>> again, let's firstly come to an agreement, that the export is needed.
>>
> 
> I'd prefer clk_gate_is_enabled() as it's not a struct clk_hw_gate,
> it's a struct clk_gate

Formally it's a 'struct clk_hw', and 'struct clk_hw_gate' does not exist.

> and there isn't any requirement for function names to reflect the type
> of the argument. That's what we have type analysis for.

Sure, a function name can be selected arbitrary, however because in this
particular case type analysis operates on 'struct clk_hw', it would fail
to separate 'struct clk_gate' from 'struct clk_divider', a little hint
in the naming may be helpful.

I don't insist on my preference, of course your acceptance is sufficient.

--
With best wishes,
Vladimir
