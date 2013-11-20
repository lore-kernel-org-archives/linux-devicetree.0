From: boris brezillon <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/9] ARM: at91/dt: add usb1 vbus and pullup pins
Date: Wed, 20 Nov 2013 16:48:52 +0100
Message-ID: <528CD9E4.7060501@overkiz.com>
References: <1377687640-10529-1-git-send-email-b.brezillon@overkiz.com> <1377687881-10688-1-git-send-email-b.brezillon@overkiz.com> <20131120145730.GD14627@ns203013.ovh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131120145730.GD14627-HVbc7XotTAhnXn40ka+A6Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 20/11/2013 15:57, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 13:04 Wed 28 Aug     , Boris BREZILLON wrote:
>> Add vbus and pullup pinctrl definitions.
>> Request the vbus and pullup pins in usb1 node.
>>
>> Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/at91rm9200ek.dts |   15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/at91rm9200ek.dts b/arch/arm/boot/dts/at91rm9200ek.dts
>> index 37b0880..76f3e87 100644
>> --- a/arch/arm/boot/dts/at91rm9200ek.dts
>> +++ b/arch/arm/boot/dts/at91rm9200ek.dts
>> @@ -29,6 +29,18 @@
>>   
>>   	ahb {
>>   		apb {
>> +			pinctrl@fffff400 {
>> +				usb1 {
>> +					pinctrl_usb1_vbus: usb1_vbus-0 {
>> +						atmel,pins = <AT91_PIOD 4 AT91_PERIPH_GPIO AT91_PINCTRL_NONE>;
>> +					};
> it's a gpio no-need

Okay, noted.

I thought I had to declare gpio configured pins in order to detect pin 
conflicts.
But after taking a closer look at the pinctrl core and at91 pinctrl 
driver, it seems this is automatically done
by means of the pinctrl_request_gpio function.


>> +
>> +					pinctrl_usb1_pullup: usb1_pullup-0 {
>> +						atmel,pins = <AT91_PIOD 5 AT91_PERIPH_GPIO AT91_PINCTRL_MULTI_DRIVE>;
>> +					};
> no-need multidrive

Then why is it configured with multi-drive option in the board file
( 
http://lxr.free-electrons.com/source/arch/arm/mach-at91/board-rm9200ek.c#L166) 
?

>> +				};
>> +			};
>> +
>>   			dbgu: serial@fffff200 {
>>   				status = "okay";
>>   			};
>> @@ -56,6 +68,9 @@
>>   
>>   			usb1: gadget@fffb0000 {
>>   				atmel,vbus-gpio = <&pioD 4 GPIO_ACTIVE_HIGH>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&pinctrl_usb1_vbus
>> +					     &pinctrl_usb1_pullup>;
>>   				status = "okay";
>>   			};
>>   
>> -- 
>> 1.7.9.5
>>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
