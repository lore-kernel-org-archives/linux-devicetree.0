From: Bintian <bintian.wang@huawei.com>
Subject: Re: [PATCH v2 3/6] clk: hi6220: Document devicetree bindings for
 hi6220 clock
Date: Tue, 14 Apr 2015 20:37:11 +0800
Message-ID: <552D09F7.7080603@huawei.com>
References: <1428916660-25910-1-git-send-email-bintian.wang@huawei.com> <7304398.GVjUsTVoce@wuerfel> <552C8AFE.9040907@huawei.com> <2456827.cDpE8M58pn@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2456827.cDpE8M58pn@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, dan.zhao@hisilicon.com, btw@mail.itp.ac.cn, catalin.marinas@arm.com, wangbinghui@hisilicon.com, will.deacon@arm.com, huxinwei@huawei.com, haojian.zhuang@linaro.org, yanhaifeng@gmail.com, rob.herring@linaro.org, mturquette@linaro.org, victor.lixin@hisilicon.com, xuwei5@hisilicon.com, jh80.chung@samsung.com, sledge.yanwei@huawei.com, kong.kongxinwei@hisilicon.com, heyunlei@huawei.com, puck.chen@hisilicon.com, zhangfei.gao@linaro.org, z.liuxinliang@huawei.com, devicetree@vger.kernel.org, khilman@linaro.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, tyler.baker@linaro.org, olof@lixom.net, robh+dt@kernel.org, linux@arm.linux.org.uk, zhenwei.wang@hisilicon.com, w.f@huawei.com, guodong.xu@linaro.org, tomeu.vizoso@collabora.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Arnd,

On 2015/4/14 18:19, Arnd Bergmann wrote:
> On Tuesday 14 April 2015 11:35:26 Bintian wrote:
>> Hello Arnd,
>>
>> On 2015/4/13 23:32, Arnd Bergmann wrote:
>>> On Monday 13 April 2015 17:17:37 Bintian Wang wrote:
>>>> +- compatible: the compatible should be one of the following strings to
>>>> +       indicate the clock controller functionality.
>>>> +
>>>> +       - "hisilicon,aoctrl"
>>>> +       - "hisilicon,sysctrl"
>>>> +       - "hisilicon,mediactrl"
>>>> +       - "hisilicon,pmctrl"
>>>> +
>>>>
>>>
>>> These ones already have bindings, you can't reuse the strings.
>>> Please work with someone in hisilicon to set up a registry of
>>> device names so you can avoid conflicts in the future.
>> All the clock registers are under above four system controllers,
>> discussed with Mark and Haojian two months ago, I think using above
>> same four binding strings is enough for clk module.
>> On second thoughts, there really some problems for future hisilicon
>> code upstream, how about change back to the first version of this
>> patch set, just like following:
>> +		sys_ctrl: sys_ctrl {
>> +			compatible = "hisilicon,sysctrl", "syscon";
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			reg = <0x0 0xf7030000 0x0 0x2000>;
>> +			ranges = <0 0x0 0xf7030000 0x2000>;
>> +
>> +			clock_sys: clock1@0 {
>> +				compatible = "hisilicon,hi6220-clock-sys";
>> +				reg = <0 0x1000>;
>> +				#clock-cells = <1>;
>> +			};
>> +		};
>
> Sub-nodes are fine, but you also can't have a device node that
> is just 'compatible = "hisilicon,sysctrl", "syscon";' when
> hisilicon,sysctrl can refer to multiple mutually incompatible
> controllers.
>
> The minimum fix would be to mandate the string to be
> compatible = "hisilicon,hi6220-sysctrl", "hisilicon,sysctrl", "syscon";
> for this model, and use respective compatible strings for the other
> chips.
It's really a smart fix!

For the four system controllers, how about change the following strings:
+       - "hisilicon,aoctrl"
+       - "hisilicon,sysctrl"
+       - "hisilicon,mediactrl"
+       - "hisilicon,pmctrl"

to
+       - "hisilicon,hi6220-aoctrl"
+       - "hisilicon,hi6220-sysctrl"
+       - "hisilicon,hi6220-mediactrl"
+       - "hisilicon,hi6220-pmctrl"
?

and I also use "hisilicon,hi6220-xxxx" for hi6220 clk driver directly ?

>
> For the documentation, I think it would make sense to move that
> description to "hisilicon,sysctrl" and list all the variants of that
> component and the respective compatible strings there, rather than
> have one document per chip and list multiple components in it.
Sure,

Thanks,

Bintian
>
> 	Arnd
>
> .
>
