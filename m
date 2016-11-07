From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH 4/9] arm64: dts: m3ulcb: enable GPIO leds
Date: Mon, 7 Nov 2016 16:02:05 +0300
Message-ID: <7749722a-93d5-0d8b-a18c-8858e448f216@cogentembedded.com>
References: <1478196375-1131-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1478196451-1298-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <20161107125737.GF12319@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20161107125737.GF12319@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Simon,

On 07.11.2016 15:57, Simon Horman wrote:
> On Thu, Nov 03, 2016 at 09:07:31PM +0300, Vladimir Barinov wrote:
>> This supports GPIO leds on M3ULCB board
> Are GPIO leds and keys also present on the H3ULCB.
Yes.
> If so could you consider sending patches to enable them?
H3ULCB already includes GPIO leds and keys support in upstream kernel.

Regards,
Vladimir
>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> ---
>>   arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
>> index fb694b8..3329f78 100644
>> --- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
>> +++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
>> @@ -31,6 +31,17 @@
>>   		/* first 128MB is reserved for secure area. */
>>   		reg = <0x0 0x48000000 0x0 0x38000000>;
>>   	};
>> +
>> +	leds {
>> +		compatible = "gpio-leds";
>> +
>> +		led5 {
>> +			gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
>> +		};
>> +		led6 {
>> +			gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
>> +		};
>> +	};
>>   };
>>   
>>   &extal_clk {
>> -- 
>> 1.9.1
>>
