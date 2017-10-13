From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] arm64: dts: mt2712: Add auxadc device node.
Date: Fri, 13 Oct 2017 17:11:32 +0200
Message-ID: <0e1bac27-18ca-121c-f1d7-8063af177a8b@gmail.com>
References: <1505957212-13402-1-git-send-email-zhiyong.tao@mediatek.com>
 <1505957212-13402-4-git-send-email-zhiyong.tao@mediatek.com>
 <20170924164705.78cbb856@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170924164705.78cbb856@archlinux>
Content-Language: en-US
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, liguo.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 09/24/2017 05:47 PM, Jonathan Cameron wrote:
> On Thu, 21 Sep 2017 09:26:52 +0800
> Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> 
>> Add auxadc device node for MT2712.
>>
>> Signed-off-by: Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> I've applied the IIO patches to make this work, so assume this will get
> picked up in due course.
> 

pushed now to v4.14-next/dts64
Thanks.

> Jonathan
> 
>> ---
>> This patch dependents on "Mediatek MT2712 clock and scpsys support"[1].
>> Please accept this patch together with [1].
>> [1]http://lists.infradead.org/pipermail/linux-mediatek/2017-September/010461.html
>> ---
>>   arch/arm64/boot/dts/mediatek/mt2712-evb.dts |    4 ++++
>>   arch/arm64/boot/dts/mediatek/mt2712e.dtsi   |    9 +++++++++
>>   2 files changed, 13 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
>> index 14163b9..76cbf4a 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
>> @@ -28,6 +28,10 @@
>>   	};
>>   };
>>   
>> +&auxadc {
>> +	status = "okay";
>> +};
>> +
>>   &uart0 {
>>   	status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
>> index 3232e4e..bf65c92 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
>> @@ -225,6 +225,15 @@
>>   			 (GIC_CPU_MASK_RAW(0x13) | IRQ_TYPE_LEVEL_HIGH)>;
>>   	};
>>   
>> +	auxadc: adc@11001000 {
>> +		compatible = "mediatek,mt2712-auxadc";
>> +		reg = <0 0x11001000 0 0x1000>;
>> +		clocks = <&pericfg CLK_PERI_AUXADC>;
>> +		clock-names = "main";
>> +		#io-channel-cells = <1>;
>> +		status = "disabled";
>> +	};
>> +
>>   	uart0: serial@11002000 {
>>   		compatible = "mediatek,mt2712-uart",
>>   			     "mediatek,mt6577-uart";
> 
