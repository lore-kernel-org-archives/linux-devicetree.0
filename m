From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: bcm2835: Add Raspberry Pi Zero W
Date: Thu, 27 Jul 2017 13:35:18 +0200
Message-ID: <1bc16f65-7872-d554-d29b-d9cd746c28bd@i2se.com>
References: <1500579429-9101-1-git-send-email-stefan.wahren@i2se.com>
 <1500579429-9101-4-git-send-email-stefan.wahren@i2se.com>
 <87vamfx8nx.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87vamfx8nx.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Content-Language: de-DE
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 26.07.2017 um 22:09 schrieb Eric Anholt:
> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:
>
>> The Raspberry Pi Zero W has the same components like the Zero plus
>> a Cypress CYW43438 wireless chip (wifi + bl).
> I sent out v2 of the arm64 patch so that hopefully we can get started
> merging this.  Couple of comments on a re-read.
>
>> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
>> Reviewed-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/Makefile               |  3 +-
>>  arch/arm/boot/dts/bcm2835-rpi-zero-w.dts | 73 ++++++++++++++++++++++++++++++++
>>  2 files changed, 75 insertions(+), 1 deletion(-)
>>  create mode 100644 arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index ec60f4f..f3bf9397 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -74,7 +74,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
>>  	bcm2835-rpi-a-plus.dtb \
>>  	bcm2836-rpi-2-b.dtb \
>>  	bcm2837-rpi-3-b.dtb \
>> -	bcm2835-rpi-zero.dtb
>> +	bcm2835-rpi-zero.dtb \
>> +	bcm2835-rpi-zero-w.dtb
>>  dtb-$(CONFIG_ARCH_BCM_5301X) += \
>>  	bcm4708-asus-rt-ac56u.dtb \
>>  	bcm4708-asus-rt-ac68u.dtb \
>> diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts b/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
>> new file mode 100644
>> index 0000000..9c6d714
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/bcm2835-rpi-zero-w.dts
>> @@ -0,0 +1,73 @@
>> +/*
>> + * Copyright (C) 2017 Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
>> + *
>> + * The code contained herein is licensed under the GNU General Public
>> + * License. You may obtain a copy of the GNU General Public License
>> + * Version 2 or later at the following locations:
>> + *
>> + * http://www.opensource.org/licenses/gpl-license.html
>> + * http://www.gnu.org/copyleft/gpl.html
>> + */
>> +
>> +/dts-v1/;
>> +#include "bcm2835.dtsi"
>> +#include "bcm2835-rpi.dtsi"
>> +#include "bcm283x-rpi-usb-host.dtsi"
>> +
>> +/ {
>> +	compatible = "raspberrypi,model-zero-w", "brcm,bcm2835";
>> +	model = "Raspberry Pi Zero W";
>> +
>> +	aliases {
>> +		uart0 = "/soc/serial@7e201000";
>> +		uart1 = "/soc/serial@7e215040";
>> +		serial0 = "/soc/serial@7e201000";
>> +		serial1 = "/soc/serial@7e215040";
>> +	};
> Should we have this in the other board DTs?  What does it do?

This was the hardest part to make the Zero W useable. I took it from
downstream [1], because without it i don't see anything on debug UART
(config.txt already has enable_uart=1).

I could add a helpful comment, but i can't explain why it's necessary
for RPI Zero W and not for the older RPI Zero.

Maybe the foundation guys have an alternative solution or at least
explanation.

[1] -
https://github.com/raspberrypi/linux/blob/rpi-4.9.y/arch/arm/boot/dts/bcm2708-rpi.dtsi
[2] -
https://github.com/raspberrypi/linux/blob/rpi-4.9.y/arch/arm/boot/dts/overlays/pi3-disable-bt-overlay.dts

>
>> +
>> +	leds {
>> +		act {
>> +			gpios = <&gpio 47 GPIO_ACTIVE_HIGH>;
>> +		};
>> +	};
>> +
>> +	wifi_pwrseq: wifi-pwrseq {
>> +		compatible = "mmc-pwrseq-simple";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&wl_on>;
>> +		reset-gpios = <&gpio 41 GPIO_ACTIVE_LOW>;
>> +	};
>> +};
>> +
>> +&gpio {
>> +	pinctrl-0 = <&gpioout &alt0>;
>> +
>> +	wl_on: wl-on {
>> +		brcm,pins = <41>;
>> +		brcm,function = <BCM2835_FSEL_GPIO_OUT>;
>> +	};
>> +};
> Would you be up for adding gpio-line-names based on the dt-blob.dts?

Sure

>
>> +
>> +&hdmi {
>> +	hpd-gpios = <&gpio 46 GPIO_ACTIVE_LOW>;
>> +};
>> +
>> +&sdhci {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	pinctrl-0 = <&emmc_gpio34 &gpclk2_gpio43>;
>> +	mmc-pwrseq = <&wifi_pwrseq>;
>> +	non-removable;
>> +	status = "okay";
>> +
>> +	brcmf: wifi@1 {
>> +		reg = <1>;
>> +		compatible = "brcm,bcm4329-fmac";
>> +	};
>> +};
>> +
>> +&uart0 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&uart0_gpio14>;
>> +	status = "okay";
>> +};
>> -- 
>> 2.7.4
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
