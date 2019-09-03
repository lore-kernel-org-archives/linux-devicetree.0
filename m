From: Artur Rojek <contact@artur-rojek.eu>
Subject: Re: [PATCH v2 1/3] dt-bindings: iio/adc: Add a compatible string for
 JZ4770 SoC ADC
Date: Tue, 03 Sep 2019 21:09:24 +0200
Message-ID: <5dd8172ff664fa1795a10ef40960ba54@artur-rojek.eu>
References: <20190727195940.14010-1-contact@artur-rojek.eu>
 <20190728094523.2a161231@archlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190728094523.2a161231@archlinux>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Cercueil <paul@crapouillou.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Jonathan,

Just reminding you of this patch set.

Artur

On 2019-07-28 10:45, Jonathan Cameron wrote:
> On Sat, 27 Jul 2019 21:59:38 +0200
> Artur Rojek <contact@artur-rojek.eu> wrote:
> 
>> Add a compatible string for the ADC controller present on
>> Ingenic JZ4770 SoC.
>> 
>> Signed-off-by: Artur Rojek <contact@artur-rojek.eu>
>> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> Hi Artur,
> 
> I'll have to hold this series for a few weeks as the fix for the
> clock rate divider isn't in my upstream for the togreg branch yet
> (as I haven't sent a pull request since the merge window).
> 
> Give me a poke if I seem to have forgotten these in a few weeks
> time.
> 
> Thanks,
> 
> Jonathan
> 
>> ---
>> 
>> Changes:
>> 
>> v2: no change
>> 
>>  Documentation/devicetree/bindings/iio/adc/ingenic,adc.txt | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/iio/adc/ingenic,adc.txt 
>> b/Documentation/devicetree/bindings/iio/adc/ingenic,adc.txt
>> index f01159f20d87..cd9048cf9dcf 100644
>> --- a/Documentation/devicetree/bindings/iio/adc/ingenic,adc.txt
>> +++ b/Documentation/devicetree/bindings/iio/adc/ingenic,adc.txt
>> @@ -5,6 +5,7 @@ Required properties:
>>  - compatible: Should be one of:
>>    * ingenic,jz4725b-adc
>>    * ingenic,jz4740-adc
>> +  * ingenic,jz4770-adc
>>  - reg: ADC controller registers location and length.
>>  - clocks: phandle to the SoC's ADC clock.
>>  - clock-names: Must be set to "adc".
