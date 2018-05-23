Return-Path: <SRS0=wWZA=IK=zonque.org=daniel@kernel.org>
Subject: Re: [PATCH] clk: Add driver for MAX9485
References: <20180521085848.17192-1-daniel@zonque.org>
 <20180523183320.GA15306@rob-hp-laptop>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <7ba472cb-114d-8412-16ea-12e7e29e8267@zonque.org>
Date: Wed, 23 May 2018 21:48:59 +0200
MIME-Version: 1.0
In-Reply-To: <20180523183320.GA15306@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

Thanks for the review!

On Wednesday, May 23, 2018 08:33 PM, Rob Herring wrote:
> On Mon, May 21, 2018 at 10:58:48AM +0200, Daniel Mack wrote:
>> From: Daniel Mack <zonque@gmail.com>
>>
>> This patch adds a driver for MAX9485, a programmable audio clock generator.
>>
>> The device requires a 27.000 MHz clock input. It can provide a gated
>> buffered output of its input clock and two gated outputs of a PLL that can
>> generate one out of 16 discrete frequencies. There is only one PLL however,
>> so the two gated outputs will always have the same frequency but they can
>> be switched individually.
>>
>> The driver for this device exposes 4 clocks in total:
>>
>> - MAX9485_MCLKOUT:      A gated, buffered output of the input clock
>> - MAX9485_CLKOUT:       A PLL that can be configured to 16 different
>> 			discrete frequencies
>> - MAX9485_CLKOUT[1,2]:  Two gated outputs for MAX9485_CLKOUT
>>
>> Some PLL output frequencies can be achieved with different register
>> settings. The driver will select the one with lowest jitter in such cases.
>>
>> Signed-off-by: Daniel Mack <daniel@zonque.org>
>> ---
>>   .../devicetree/bindings/clock/maxim,max9485.txt    |  59 ++++
>>   drivers/clk/Kconfig                                |   8 +
>>   drivers/clk/Makefile                               |   1 +
>>   drivers/clk/clk-max9485.c                          | 379 +++++++++++++++++++++
>>   include/dt-bindings/clock/maxim,max9485.h          |  19 ++
> 
> The 2 DT files should be a separate patch.

Sure, I can do that. In order to keep the series bisectable however, 
that would mean that the bindings come in first, and then the actual 
implementation because that also depends on maxim,max9485.h. Is that okay?

I agree with the rest of your comments.


Thanks,
Daniel
