From: xuejiancheng <xuejiancheng@huawei.com>
Subject: Re: [PATCH v2 1/9] clk: hi3519: add dt-binding document and header
 file
Date: Mon, 7 Dec 2015 16:01:03 +0800
Message-ID: <56653CBF.30801@huawei.com>
References: <1449110364-23464-1-git-send-email-xuejiancheng@huawei.com>
 <1615805.jmP28L2rmX@wuerfel> <566106B8.7080205@huawei.com>
 <21651844.ONg7WdRZpk@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <21651844.ONg7WdRZpk@wuerfel>
Sender: linux-clk-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@baylibre.com, sboyd@codeaurora.org, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 2015/12/4 18:56, Arnd Bergmann wrote:
> On Friday 04 December 2015 11:21:28 xuejiancheng wrote:
>> Hi Arnd,
>>
>> On 2015/12/3 17:44, Arnd Bergmann wrote:
>>> On Thursday 03 December 2015 10:39:24 Jiancheng Xue wrote:
>>>> +#ifndef __DTS_HI3519_CLOCK_H
>>>> +#define __DTS_HI3519_CLOCK_H
>>>
>>> Please try to avoid adding headers like this if you can at all.
>>>
>>> I might ask you to merge the header file in one merge window
>>> otherwise and submit the platform code one kernel later, as they
>>> tendn to cause us needless dependencies otherwise.
>>>
>>
>> Sorry. In v1, Rob suggested putting binding doc and header files in
>> a separate patch. The clock driver indeed depends on the header.
>>
>> I will put the header and the clock driver in a patch, and keep the
>> binding doc in another patch.
> 
> Having split patches is better, I was really commenting on the fact
> that ideally you would not have a header file at all. If we merge
> the header through arm-soc, then you won't be able to merge the
> clk driver easily, and if you merge the header through the clk
> maintainer, I'm can't take your dts files.

Thank you for your comments. Because the clocks in the crg module have
different types and random layouts. If this header file is removed,
the clock driver and the dts files will get very complicated.

Could you help me acknowledge it if I put the header file and clock driver
in a patch?

Could you give me some suggestions If I want to keep this header file?

> 
>>>> +/* fixed rate */
>>>> +#define HI3519_FIXED_400M              1
>>>> +#define HI3519_FIXED_200M              2
>>>> +#define HI3519_FIXED_125M              3
>>>> +#define HI3519_FIXED_150M              4
>>>> +#define HI3519_FIXED_75M               5
>>>> +#define HI3519_FIXED_300M              6
>>>> +#define HI3519_FIXED_50M               7
>>>> +#define HI3519_FIXED_24M               8
>>>> +#define HI3519_FIXED_3M                        9
>>>> +
>>>> +/* mux clocks */
>>>> +#define HI3519_FMC_MUX                 32
>>>> +#define HI3519_I2C_MUX                 33
>>>> +#define HI3519_UART_MUX                        34
>>>> +#define HI3519_SYSAXI_MUX              35
>>>> +
>>>> +/*fixed factor clocks*/
>>>> +#define HI3519_SYSAPB_CLK              64
>>>> +
>>>> +/* gate clocks */
>>>> +#define HI3519_FMC_CLK                 129
>>>> +#define HI3519_UART0_CLK               153
>>>> +#define HI3519_UART1_CLK               154
>>>> +#define HI3519_UART2_CLK               155
>>>> +#define HI3519_UART3_CLK               156
>>>> +#define HI3519_UART4_CLK               157
>>>
>>> Where do those numbers come from? They are not consecutive, so it sounds
>>> like they are directly from the data sheet and won't be needed in the driver.
>>> If that's true, just use the numbers directly, as you do for everything
>>> else.
>>
>> The numbers are defined by myself, not directly from the data sheet. Some numbers
>> are reserved for device nodes which will be added later. So they are not consecutive now.
> 
> I don't understand. How do you decide which numbers to reserve? If the
> numbers are completely arbitrary and you have no idea what other clocks
> there are, you can simply have consecutive numbers here and do the driver
> accordingly.

The clocks are divided into several groups according to their types. The clocks in
a group are expected to have consecutive numbers. So some numbers are reserved for
every group in this file, just like in some existing headers. Other clocks will be
added when other peripherals drivers are submitted. They will use the reserve numbers
and be inserted into existing groups.

Of course it is not required to reserve numbers for later added clocks.

> 
> If the numbers actually have a real meaning, then you either don't need them
> at all, or you could just put all numbers in there that you would eventually need.

The numbers have no hardware meaning actually.

> 
>>>> +#define HI3519_NR_CLKS                 256
>>>> +#define HI3519_NR_RSTS                 256
>>>>
>>> These seem to not be needed at all.
>>
>> These are used in drivers/clk/hisilicon/clk-hi3519.c.
> 
> Then move them there. Anything that is not needed by *both* the driver and 
> the dts files doesn't belong in here.


OK. I will move them into the driver code.

> 
> 	Arnd
> 
> .
> 

Many thanks.

Jiancheng

.


