From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v5 2/2] ARM: dts: add support for Turris Omnia
Date: Sun, 27 Nov 2016 17:00:33 +0100
Message-ID: <a7f47999-ec83-6cc8-8119-0087dee17bac@suse.de>
References: <20161125142658.21690-1-uwe@kleine-koenig.org>
 <20161125142658.21690-3-uwe@kleine-koenig.org>
 <87lgw7ilg9.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87lgw7ilg9.fsf-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomas Hlavacek <tomas.hlavacek-x+rMaJPWets@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?QmVkxZlpY2hhIEtvxaFhdHU=?= <bedrich.kosata-x+rMaJPWets@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Hrusecky <Michal.Hrusecky-x+rMaJPWets@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 25.11.2016 um 17:16 schrieb Gregory CLEMENT:
> On ven., nov. 25 2016, Uwe Kleine-König <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org> wrote:
>> This machine is an open hardware router by cz.nic driven by a
>> Marvell Armada 385.
>>
>> Signed-off-by: Uwe Kleine-König <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
> 
> Applied on mvebu/dt with few changes:
[...]
>> +&spi0 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&spi0_pins &spi0cs0_pins>;
>> +	status = "okay";
>> +
>> +	spi-nor@0 {
>> +		compatible = "spansion,s25fl164k", "jedec,spi-nor";
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		reg = <0>;
>> +		spi-max-frequency = <40000000>;
>> +
> 
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> it is mandatory since v4.4 to use this pattern for partitions.
> 
> 
>> +		partition@0 {
>> +			reg = <0x0 0x00100000>;
>> +			label = "U-Boot";
>> +		};
>> +
>> +		partition@1 {
>                          @0x100000
> We should use the reg value here ^

The unit name should be without 0x though. In your tree you seem to have
it correctly.

@Uwe: Note that I had already told CZ.NIC's Michal ~two weeks ago that I
have a WIP .dts for the Omnia - looks like no one knows what the other
is doing. :( My branch includes cleanups for 385 .dtsi and bug fixes for
the switch that I am not seeing in your series:

https://github.com/afaerber/linux/commits/omnia-next

I am still looking into phy backtraces when the network interfaces go down.

@Gregory: Can we please follow up with cleaning up these ugly
internal-regs and pcie-controller nodes for consistency?

Regards,
Andreas

>> +			reg = <0x00100000 0x00700000>;
>> +			label = "Rescue system";
>> +		};
> 
> + };

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
