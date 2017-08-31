From: Stefan Mavrodiev <stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: sun7i: Fix A20-OLinuXino-MICRO dts for
 LAN8710
Date: Thu, 31 Aug 2017 08:20:18 +0300
Message-ID: <e7e61776-b8d7-c42f-4e9e-04da835374a9@gmail.com>
References: <1503901963-9457-1-git-send-email-stefan@olimex.com>
 <1503901963-9457-2-git-send-email-stefan@olimex.com>
 <20170830143728.friajjequvioqjpu@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170830143728.friajjequvioqjpu-ZC1Zs529Oq4@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/30/2017 05:37 PM, Maxime Ripard wrote:
> Hi,
>
> On Mon, Aug 28, 2017 at 09:32:42AM +0300, Stefan Mavrodiev wrote:
>>  From revision J the board uses new phy chip LAN8710. Compared
>> with RTL8201, RA17 pin is TXERR. It has pullup which causes phy
>> not to work. To fix this PA17 is muxed with GMAC function. This
>> makes the pin output-low.
>>
>> This patch is compatible with earlier board revisions, since this
>> pin wasn't connected to phy.
>>
>> Signed-off-by: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
>> index 0b7403e..cb1b081 100644
>> --- a/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
>> +++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-micro.dts
>> @@ -102,7 +102,7 @@
>>   
>>   &gmac {
>>   	pinctrl-names = "default";
>> -	pinctrl-0 = <&gmac_pins_mii_a>;
>> +	pinctrl-0 = <&gmac_pins_mii_a>,<&gmac_txerr>;
>>   	phy = <&phy1>;
>>   	phy-mode = "mii";
>>   	status = "okay";
>> @@ -229,6 +229,11 @@
>>   };
>>   
>>   &pio {
>> +	gmac_txerr: gmac_txerr@0 {
>> +		pins = "PA17";
>> +		function = "gmac";
>> +	};
>> +
> The patch looks fine, I still have one question though.
>
> Can a PHY operate without this signal? My real question is, would it
> make sense to mux that pin for all the users, or is it an optional
> signal that each board designer can choose to use or not?
>
> Thanks!
> Maxime
>
This phy (LAN8710) cannot work without this pin. Part of the problem is in that we've replaced
without paying attention to this signal.

RTL8201 has no TXERR pin. The pin PA17 is used as reset signal and therefore is pulled up with
resistor. However on old revisions this option (there is jumper pad between SOC and PHY).

As I said, LAN8710 cannot work without this signal. In the datasheet is written:
	...
	The controller drives TXER high when a transmit error is detected.
	...

In the current variant of the dts, all data is threated as error.

So to answer you question. This is feature only on our board and highly depends on the chosen PHY.
I don't think this should be muxed for all users.



Best regards,
Stefan Mavrodiev,
Olimex Ltd.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
