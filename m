From: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx6q: extend support for the cm-fx6
Date: Thu, 26 May 2016 11:50:12 +0300
Message-ID: <5746B8C4.6020406@compulab.co.il>
References: <709d6b3d522f4fcb8112830e0426dbb3@rwthex-s1-b.rwth-ad.de>
 <1463994191.2370.3.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463994191.2370.3.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lucas,

Thanks for reviewing the patch(es).

On 05/23/2016 12:03 PM, Lucas Stach wrote:
> Am Montag, den 23.05.2016, 00:47 +0200 schrieb
> christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org:
>> From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>

[...]

>> +&ecspi1 {
>> +	fsl,spi-num-chipselects = <2>;
>> +	cs-gpios = <&gpio2 30 0>, <&gpio3 19 0>;
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_ecspi1>;
>> +	status = "okay";
>> +
>> +	flash: m25p80@0 {
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		compatible = "st,m25p", "jedec,spi-nor";
>> +		spi-max-frequency = <20000000>;
>> +		reg = <0>;
>> +
>> +		partition@0 {
>> +			label = "uboot";
>> +			reg = <0x0 0xc0000>;
>> +		};
>> +
>> +		partition@c0000 {
>> +			label = "uboot environment";
>> +			reg = <0xc0000 0x40000>;
>> +		};
>> +
>> +		partition@100000 {
>> +			label = "reserved";
>> +			reg = <0x100000 0x100000>;
>> +		};
> 
> Partition layouts don't belong in the upstream DT, as it a device
> configuration thing. Please kep them in the bootloader/firmware and make
> this one pass the partition layout to the kernel.

I don't completely agree with this.
We have lots of partition layouts in the upstream DT.
Moreover, this is the default layout and changing it, will
result in incompatibilities and also might result in device "bricking".
Those can be changed from the boot loader in case you need those
the other way around.
Another question of mine is, why should you?


-- 
Regards,
Igor.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
