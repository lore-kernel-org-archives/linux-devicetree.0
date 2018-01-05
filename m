From: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM64: dts: meson-axg: uart: fix address space range
Date: Fri, 5 Jan 2018 21:43:41 +0800
Message-ID: <45074e93-c8ec-d0d1-13d9-fbd2fab07a7a@amlogic.com>
References: <20180105095621.196472-1-yixun.lan@amlogic.com>
 <20180105095621.196472-3-yixun.lan@amlogic.com>
 <1515148207.5048.24.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515148207.5048.24.camel-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/05/2018 06:30 PM, Jerome Brunet wrote:
> On Fri, 2018-01-05 at 17:56 +0800, Yixun Lan wrote:
>> The address space range is actually 0x18, fixed here.
> 
> Isn't it the same for other meson SoC ? If they are compatible, it should.
> Could you please re-submit this change addressing all the required platforms ?
> 

sure

sorry, I was in hurry to send the patch set without do a full tree check..

you right, the fix should also apply to other SoCs, I will fold them
into this patch together, thanks for raising the idea.



>>
>> Signed-off-by: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> index 1c6002b3fe34..9636a7c5f6ed 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> @@ -143,14 +143,14 @@
>>  
>>  			uart_A: serial@24000 {
>>  				compatible = "amlogic,meson-gx-uart";
>> -				reg = <0x0 0x24000 0x0 0x14>;
>> +				reg = <0x0 0x24000 0x0 0x18>;
>>  				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
>>  				status = "disabled";
>>  			};
>>  
>>  			uart_B: serial@23000 {
>>  				compatible = "amlogic,meson-gx-uart";
>> -				reg = <0x0 0x23000 0x0 0x14>;
>> +				reg = <0x0 0x23000 0x0 0x18>;
>>  				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
>>  				status = "disabled";
>>  			};
> 
> .
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
