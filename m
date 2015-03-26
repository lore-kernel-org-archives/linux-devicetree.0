From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/5] ARM: dts: sun4i: Add A10 SRAM and SRAM controller
Date: Thu, 26 Mar 2015 15:42:31 +0100
Message-ID: <55141AD7.1040701@redhat.com>
References: <1426877569-11493-1-git-send-email-hdegoede@redhat.com> <1426877569-11493-3-git-send-email-hdegoede@redhat.com> <20150324152034.GB4951@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150324152034.GB4951@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 24-03-15 16:20, Maxime Ripard wrote:
> On Fri, Mar 20, 2015 at 07:52:46PM +0100, Hans de Goede wrote:
>> The A10 has a few SRAM that can be mapped either to a device or to the CPU,
>> with the mapping being controlled by a SRAM controller.
>>
>> Since most of the time these SRAM won't be accessible by the CPU,
>> we can't use the mmio-sram driver and compatible.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/sun4i-a10.dtsi | 34 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
>> index b66ebb3..88f57b4 100644
>> --- a/arch/arm/boot/dts/sun4i-a10.dtsi
>> +++ b/arch/arm/boot/dts/sun4i-a10.dtsi
>> @@ -451,12 +451,46 @@
>>   		};
>>   	};
>>
>> +	/*
>> +	 * Note we use the address were mmio registers start, not where the
>                                     ^ where
>

Fixed in patches 2 to 4.

Regards,

Hans


>> +	 * SRAM blocks start, this cannot be changed because that would be
>> +	 * a devicetree ABI change.
>> +	 */
>>   	soc@01c00000 {
>>   		compatible = "simple-bus";
>>   		#address-cells = <1>;
>>   		#size-cells = <1>;
>>   		ranges;
>>
>> +		sram@00000000 {
>> +			compatible = "allwinner,sun4i-a10-sram";
>> +			reg = <0x00000000 0x4000>;
>> +			allwinner,sram-name = "A1";
>> +		};
>> +
>> +		sram@00004000 {
>> +			compatible = "allwinner,sun4i-a10-sram";
>> +			reg = <0x00004000 0x4000>;
>> +			allwinner,sram-name = "A2";
>> +		};
>> +
>> +		sram@00008000 {
>> +			compatible = "allwinner,sun4i-a10-sram";
>> +			reg = <0x00008000 0x4000>;
>> +			allwinner,sram-name = "A3-A4";
>> +		};
>> +
>> +		sram@00010000 {
>> +			compatible = "allwinner,sun4i-a10-sram";
>> +			reg = <0x00010000 0x1000>;
>> +			allwinner,sram-name = "D";
>> +		};
>> +
>> +		sram-controller@01c00000 {
>> +			compatible = "allwinner,sun4i-a10-sram-controller";
>> +			reg = <0x01c00000 0x30>;
>> +		};
>> +
>>   		dma: dma-controller@01c02000 {
>>   			compatible = "allwinner,sun4i-a10-dma";
>>   			reg = <0x01c02000 0x1000>;
>> --
>> 2.3.3
>>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
