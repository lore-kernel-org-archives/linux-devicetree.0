From: xuejiancheng <xuejiancheng@huawei.com>
Subject: Re: [PATCH v2 1/9] clk: hi3519: add dt-binding document and header
 file
Date: Fri, 4 Dec 2015 11:21:28 +0800
Message-ID: <566106B8.7080205@huawei.com>
References: <1449110364-23464-1-git-send-email-xuejiancheng@huawei.com>
 <1615805.jmP28L2rmX@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1615805.jmP28L2rmX@wuerfel>
Sender: linux-clk-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@baylibre.com, sboyd@codeaurora.org, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On 2015/12/3 17:44, Arnd Bergmann wrote:
> On Thursday 03 December 2015 10:39:24 Jiancheng Xue wrote:
>> +#ifndef __DTS_HI3519_CLOCK_H
>> +#define __DTS_HI3519_CLOCK_H
> 
> Please try to avoid adding headers like this if you can at all.
> 
> I might ask you to merge the header file in one merge window
> otherwise and submit the platform code one kernel later, as they
> tendn to cause us needless dependencies otherwise.
> 

Sorry. In v1, Rob suggested putting binding doc and header files in
a separate patch. The clock driver indeed depends on the header.

I will put the header and the clock driver in a patch, and keep the
binding doc in another patch.

> 
>> +/* fixed rate */
>> +#define HI3519_FIXED_400M              1
>> +#define HI3519_FIXED_200M              2
>> +#define HI3519_FIXED_125M              3
>> +#define HI3519_FIXED_150M              4
>> +#define HI3519_FIXED_75M               5
>> +#define HI3519_FIXED_300M              6
>> +#define HI3519_FIXED_50M               7
>> +#define HI3519_FIXED_24M               8
>> +#define HI3519_FIXED_3M                        9
>> +
>> +/* mux clocks */
>> +#define HI3519_FMC_MUX                 32
>> +#define HI3519_I2C_MUX                 33
>> +#define HI3519_UART_MUX                        34
>> +#define HI3519_SYSAXI_MUX              35
>> +
>> +/*fixed factor clocks*/
>> +#define HI3519_SYSAPB_CLK              64
>> +
>> +/* gate clocks */
>> +#define HI3519_FMC_CLK                 129
>> +#define HI3519_UART0_CLK               153
>> +#define HI3519_UART1_CLK               154
>> +#define HI3519_UART2_CLK               155
>> +#define HI3519_UART3_CLK               156
>> +#define HI3519_UART4_CLK               157
> 
> Where do those numbers come from? They are not consecutive, so it sounds
> like they are directly from the data sheet and won't be needed in the driver.
> If that's true, just use the numbers directly, as you do for everything
> else.

The numbers are defined by myself, not directly from the data sheet. Some numbers
are reserved for device nodes which will be added later. So they are not consecutive now.

> 
>> +#define HI3519_NR_CLKS                 256
>> +#define HI3519_NR_RSTS                 256
>>
> These seem to not be needed at all.

These are used in drivers/clk/hisilicon/clk-hi3519.c.

> 
> 	Arnd
> 
> .
> 

