From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] ARM: dts: blanche: add support for general purpose LEDs
Date: Wed, 24 Aug 2016 01:23:00 +0300
Message-ID: <72751b42-8385-6138-548a-744c39567cf8@cogentembedded.com>
References: <5383928.8UnDsUpmkz@wasted.cogentembedded.com>
 <1529754.UBcqZ7GKj7@wasted.cogentembedded.com>
 <20160823073920.GI14998@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160823073920.GI14998@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 08/23/2016 10:39 AM, Simon Horman wrote:

>> Add support for the general purpose LEDs on the Blanche board.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> This patch is against the 'renesas-devel-20160822-v4.8-rc3' of Simon Horman's
>> 'renesas.git' repo plus the SDHI0/DU patches posted earlier.
>>
>>  arch/arm/boot/dts/r8a7792-blanche.dts |   21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> Index: renesas/arch/arm/boot/dts/r8a7792-blanche.dts
>> ===================================================================
>> --- renesas.orig/arch/arm/boot/dts/r8a7792-blanche.dts
>> +++ renesas/arch/arm/boot/dts/r8a7792-blanche.dts
>> @@ -159,6 +159,27 @@
>>  		};
>>  	};
>>
>> +	leds {
>> +		compatible = "gpio-leds";
>> +
>> +		led17 {
>> +			gpios = <&gpio10 10 GPIO_ACTIVE_HIGH>;
>> +			label = "LED17";
>
> I am unclear of the motivation for using the label property when
> its value is so similar to the name of the node.
>
> The reason I noticed this is that it appears to differ from led nodes
> for other Renesas ARM SoCs.

     I was looking at the Koelsch's DT as an example (and Gose's DT also had 
labels).

> I'm not opposed to using the label property
> if there is some value to it. But I would prefer to use it consistently.
> And I'd prefer not to add it to all the other SoCs unless there is a reason
> to.

    Looks like the driver can infer the LED names from the device node names. 
I'll recast.

[...]

MBR, Sergei
