Return-Path: <SRS0=LvYT=TQ=ti.com=j-keerthy@kernel.org>
Subject: Re: [PATCH 2/2] arm: dts: dra76-evm: Disable rtc target module
References: <20190516090657.25211-1-j-keerthy@ti.com>
 <20190516090657.25211-2-j-keerthy@ti.com> <20190516161256.GB5447@atomide.com>
From: keerthy <j-keerthy@ti.com>
Message-ID: <f3c2a6cd-b478-cec4-cde6-3eb5b6a11392@ti.com>
Date: Thu, 16 May 2019 22:01:01 +0530
MIME-Version: 1.0
In-Reply-To: <20190516161256.GB5447@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Tony Lindgren <tony@atomide.com>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-omap@vger.kernel.org, t-kristo@ti.com
List-ID: <devicetree@vger.kernel.org>



On 5/16/2019 9:42 PM, Tony Lindgren wrote:
> Hi,
> 
> * Keerthy <j-keerthy@ti.com> [190516 09:06]:
>> rtc is fused out on dra76 and accessing target module
>> register is causing a boot crash hence disable it.
> 
> So for a fix, can we have a separate dra7 something dtsi file
> to disable these instead?
> 
> Or are there already multiple SoC revisions for the same EVM?

dra76 & dra71 have rtc fused out. So i did not introduce a new dtsi file
to disable.

> 
> Then in the long run, if there are the same EVMs with multiple
> SoC options, the best thing to do is to would be to detect the
> SoC type and update the property dynamically to set the features
> not available on the booted SoC to status = "disabled". Seems
> like that could be done in the ti-sysc driver probe unless needed
> earlier.

For now rtc is disabled only in dra71/dra76. So best disable it in the 
evm.dts? Not sure if we need dynamic disabling as we know at DT level 
that it is to be disabled.


> 
> Regards,
> 
> Tony
> 
