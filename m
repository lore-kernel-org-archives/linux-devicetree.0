From: Gabriel Fernandez <gabriel.fernandez@st.com>
Subject: Re: [PATCH 1/6] clk: stm32f4: Add PLL_I2S & PLL_SAI for STM32F429/469
 boards
Date: Tue, 8 Nov 2016 17:19:13 +0100
Message-ID: <0368d067-461d-2edb-5561-9717934e0dde@st.com>
References: <1478523943-23142-1-git-send-email-gabriel.fernandez@st.com>
 <1478523943-23142-2-git-send-email-gabriel.fernandez@st.com>
 <CAFvLkMQxvo=2Ak033n2XkPgdDfU5DLCMF7dj487QFB0e7WceCQ@mail.gmail.com>
 <ebadfacf-73fb-01a6-791a-324daad5e695@st.com>
 <CAFvLkMSwwyoi8Vb_-+6dViB8PaBRUoCZYBcrzDjgX9EJnv_mvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFvLkMSwwyoi8Vb_-+6dViB8PaBRUoCZYBcrzDjgX9EJnv_mvQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Rados=c5=82aw_Pietrzyk?= <radoslaw.pietrzyk@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Daniel Thompson <daniel.thompson@linaro.org>, Andrea Merello <andrea.merello@gmail.com>, devicetree@vger.kernel.org, amelie.delaunay@st.com, kernel@stlinux.com, olivier.bideau@st.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, ludovic.barre@st.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/08/2016 09:52 AM, Radosław Pietrzyk wrote:
> 2016-11-08 9:35 GMT+01:00 Gabriel Fernandez <gabriel.fernandez@st.com>:
>> Hi Radosław
>>
>> Many thanks for reviewing.
>>
>> On 11/07/2016 03:57 PM, Radosław Pietrzyk wrote:
>>>> +static struct clk_hw *clk_register_pll_div(const char *name,
>>>> +               const char *parent_name, unsigned long flags,
>>>> +               void __iomem *reg, u8 shift, u8 width,
>>>> +               u8 clk_divider_flags, const struct clk_div_table *table,
>>>> +               struct clk_hw *pll_hw, spinlock_t *lock)
>>>> +{
>>>> +       struct stm32f4_pll_div *pll_div;
>>>> +       struct clk_hw *hw;
>>>> +       struct clk_init_data init;
>>>> +       int ret;
>>>> +
>>>> +       /* allocate the divider */
>>>> +       pll_div = kzalloc(sizeof(*pll_div), GFP_KERNEL);
>>>> +       if (!pll_div)
>>>> +               return ERR_PTR(-ENOMEM);
>>>> +
>>>> +       init.name = name;
>>>> +       init.ops = &stm32f4_pll_div_ops;
>>>> +       init.flags = flags;
>>> Maybe it's worth to have CLK_SET_RATE_PARENT here and the VCO clock
>>> should have CLK_SET_RATE_GATE flag and we can get rid of custom
>>> divider ops.
>> I don't want to offer the possibility to change the vco clock through the
>> divisor of the pll (only by a boot-loader or by DT).
>>
>> e.g. if i make a set rate on lcd-tft clock, i don't want to change the SAI
>> frequencies.
>>
>> I used same structure for internal divisors of the pll (p, q, r) and for
>> post divisors (plli2s-q-div, pllsai-q-div & pllsai-r-div).
>> That why the CLK_SET_RATE_PARENT flag is transmit by parameter.
>>
>> These divisors are similar because we have to switch off the pll before
>> changing the rate.
>>
> But changing pll and lcd dividers only may not be enough for getting
> very specific pixelclocks and that might require changing the VCO
> frequency itself. The rest of the SAI tree should be recalculated
> then.
I agree but it seems to be too much complicated to recalculate all PLL 
divisors if we change the vco clock.
You mean to use Clock notifier callback ?
