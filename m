From: xuejiancheng <xuejiancheng@huawei.com>
Subject: Re: [PATCH v2 1/9] clk: hi3519: add dt-binding document and header
 file
Date: Tue, 8 Dec 2015 09:37:56 +0800
Message-ID: <56663474.7040701@huawei.com>
References: <1449110364-23464-1-git-send-email-xuejiancheng@huawei.com>
 <21651844.ONg7WdRZpk@wuerfel> <56653CBF.30801@huawei.com>
 <2735980.8lIUhgbJzL@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <2735980.8lIUhgbJzL@wuerfel>
Sender: linux-clk-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, mturquette@baylibre.com, sboyd@codeaurora.org, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, suwenping@hisilicon.com, ml.yang@hisilicon.com, gaofei@hisilicon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 2015/12/7 17:36, Arnd Bergmann wrote:
> On Monday 07 December 2015 16:01:03 xuejiancheng wrote:
>> On 2015/12/4 18:56, Arnd Bergmann wrote:
>>> On Friday 04 December 2015 11:21:28 xuejiancheng wrote:
>>>> Hi Arnd,
>>>>
>>>> On 2015/12/3 17:44, Arnd Bergmann wrote:
>>>>> On Thursday 03 December 2015 10:39:24 Jiancheng Xue wrote:
>>>>>> +#ifndef __DTS_HI3519_CLOCK_H
>>>>>> +#define __DTS_HI3519_CLOCK_H
>>>>>
>>>>> Please try to avoid adding headers like this if you can at all.
>>>>>
>>>>> I might ask you to merge the header file in one merge window
>>>>> otherwise and submit the platform code one kernel later, as they
>>>>> tendn to cause us needless dependencies otherwise.
>>>>>
>>>>
>>>> Sorry. In v1, Rob suggested putting binding doc and header files in
>>>> a separate patch. The clock driver indeed depends on the header.
>>>>
>>>> I will put the header and the clock driver in a patch, and keep the
>>>> binding doc in another patch.
>>>
>>> Having split patches is better, I was really commenting on the fact
>>> that ideally you would not have a header file at all. If we merge
>>> the header through arm-soc, then you won't be able to merge the
>>> clk driver easily, and if you merge the header through the clk
>>> maintainer, I'm can't take your dts files.
>>
>> Thank you for your comments. Because the clocks in the crg module have
>> different types and random layouts. If this header file is removed,
>> the clock driver and the dts files will get very complicated.
>>
>> Could you help me acknowledge it if I put the header file and clock driver
>> in a patch?
>>
>> Could you give me some suggestions If I want to keep this header file?
> 
> If this is another clock controller that has a random register layout,
> then adding the header file is the least problematic solution indeed.
> 
>>>>> Where do those numbers come from? They are not consecutive, so it sounds
>>>>> like they are directly from the data sheet and won't be needed in the driver.
>>>>> If that's true, just use the numbers directly, as you do for everything
>>>>> else.
>>>>
>>>> The numbers are defined by myself, not directly from the data sheet. Some numbers
>>>> are reserved for device nodes which will be added later. So they are not consecutive now.
>>>
>>> I don't understand. How do you decide which numbers to reserve? If the
>>> numbers are completely arbitrary and you have no idea what other clocks
>>> there are, you can simply have consecutive numbers here and do the driver
>>> accordingly.
>>
>> The clocks are divided into several groups according to their types. The clocks in
>> a group are expected to have consecutive numbers. So some numbers are reserved for
>> every group in this file, just like in some existing headers. Other clocks will be
>> added when other peripherals drivers are submitted. They will use the reserve numbers
>> and be inserted into existing groups.
>>
>> Of course it is not required to reserve numbers for later added clocks.
> 
> Are you able to enumerate all the clocks then? If all clocks that are
> supported by this clock controllers have names in the data sheet, I
> would prefer to just list them all now rather than only enter the ones
> we already need, to avoid having future merge conflicts.
> 
> Then we just need to add code to support those clocks when we need them,
> but that can be done in parallel to adding the DT nodes and the driver,
> rather than strongly serializing the patch flow on the header file patches.

OK. I'll enumerate all the clocks in the data sheet in next version patch.

Thank you.

> 
> 	Arnd
> 
> .
> 

