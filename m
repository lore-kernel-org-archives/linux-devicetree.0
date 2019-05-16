Return-Path: <SRS0=LvYT=TQ=ti.com=j-keerthy@kernel.org>
Subject: Re: [PATCH 2/2] arm: dts: dra76-evm: Disable rtc target module
References: <20190516090657.25211-1-j-keerthy@ti.com>
 <20190516090657.25211-2-j-keerthy@ti.com> <20190516161256.GB5447@atomide.com>
 <f3c2a6cd-b478-cec4-cde6-3eb5b6a11392@ti.com>
 <20190516164729.GC5447@atomide.com>
From: keerthy <j-keerthy@ti.com>
Message-ID: <f2470149-0a17-cd1a-30d3-288fe2b821e3@ti.com>
Date: Thu, 16 May 2019 22:24:14 +0530
MIME-Version: 1.0
In-Reply-To: <20190516164729.GC5447@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Tony Lindgren <tony@atomide.com>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-omap@vger.kernel.org, t-kristo@ti.com
List-ID: <devicetree@vger.kernel.org>



On 5/16/2019 10:17 PM, Tony Lindgren wrote:
> * keerthy <j-keerthy@ti.com> [190516 16:31]:
>>
>>
>> On 5/16/2019 9:42 PM, Tony Lindgren wrote:
>>> Hi,
>>>
>>> * Keerthy <j-keerthy@ti.com> [190516 09:06]:
>>>> rtc is fused out on dra76 and accessing target module
>>>> register is causing a boot crash hence disable it.
>>>
>>> So for a fix, can we have a separate dra7 something dtsi file
>>> to disable these instead?
>>>
>>> Or are there already multiple SoC revisions for the same EVM?
>>
>> dra76 & dra71 have rtc fused out. So i did not introduce a new dtsi file
>> to disable.
> 
> But then any new board with dra76 or dra71 will need to debug
> the same issue again. Sure we can get away for now tweaking the
> board file, but to me it sounds like it's going to be more
> devices that will be affected too?

Okay. This is a SoC related issue so yes any new board will have to 
again implement disabling.

> 
> Is there some feature matrix available somewhere online?

Not that i know of. I will try finding something.

> 
>>> Then in the long run, if there are the same EVMs with multiple
>>> SoC options, the best thing to do is to would be to detect the
>>> SoC type and update the property dynamically to set the features
>>> not available on the booted SoC to status = "disabled". Seems
>>> like that could be done in the ti-sysc driver probe unless needed
>>> earlier.
>>
>> For now rtc is disabled only in dra71/dra76. So best disable it in the
>> evm.dts? Not sure if we need dynamic disabling as we know at DT level that
>> it is to be disabled.
> 
> Well the thing is we should make introducing new board dts files
> as easy as including the SoC dtsi file and with that it should
> boot with no extra debugging.
> 
> How about add minimal dra76 and dra71 dtsi files in addition to
> the board specific fix(es)? Then for v5.3, we can deal adding more
> dra7 specifc evm files using these dtsi files or dynamically start
> disabling modules.

You mean having a dra76/dra71.dtsi with rtc/usb4_tm disabled and that 
gets included in dra76/dra71-evm.dts?

> 
> Regards,
> 
> Tony
> 
