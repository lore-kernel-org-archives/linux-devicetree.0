From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] arm: dts: phy3250: add SD fixed regulator
Date: Mon, 21 Dec 2015 18:58:50 +0200
Message-ID: <56782FCA.2050504@mleia.com>
References: <1450567932-22994-1-git-send-email-vz@mleia.com> <1450567932-22994-3-git-send-email-vz@mleia.com> <5677F3DC.6070402@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5677F3DC.6070402-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hell Sergei,

On 21.12.2015 14:43, Sergei Shtylyov wrote:
> Hello.
> 
> On 12/20/2015 2:32 AM, Vladimir Zapolskiy wrote:
> 
>> The change adds fixed voltage regulator for SD controller, ARM MMCI
>> controller driver uses it to control card power management.
>>
>> Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/phy3250.dts | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/phy3250.dts b/arch/arm/boot/dts/phy3250.dts
>> index 34e15fd..5465b9e 100644
>> --- a/arch/arm/boot/dts/phy3250.dts
>> +++ b/arch/arm/boot/dts/phy3250.dts
>> @@ -45,6 +45,15 @@
>>   			enable-active-high;
>>   			regulator-boot-on;
>>   		};
>> +
>> +		sd_reg: fixed-regulator@2 {
> 
>     Please just "regulator@2", to comply with the ePAPR standard.

thanks for review, just for my information, do I understand correctly
that you reference to "Generic Names Recommendation" ?

I have no objection to generalize device tree node name as you
suggested, will do it.

With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
