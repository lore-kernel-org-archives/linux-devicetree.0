From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 5/6] ARM64: meson-gxbb-p20x: Enable USB Nodes
Date: Thu, 15 Sep 2016 15:09:46 -0700
Message-ID: <7hmvj8ke6t.fsf@baylibre.com>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
        <20160911134111.31141-1-martin.blumenstingl@googlemail.com>
        <20160911134111.31141-6-martin.blumenstingl@googlemail.com>
        <7h37l2mk6a.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7h37l2mk6a.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Kevin Hilman's message of "Wed, 14
        Sep 2016 11:05:17 -0700")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>
>> From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>
>> Enable both gxbb USB controller and add a 5V regulator for the OTG port
>> VBUS
>>
>> Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>
> nit: subject should have "ARM64: dts:" prefix.
>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi | 29 ++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
>> index ce105fe..4493bce 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
>> @@ -93,6 +93,18 @@
>>  		compatible = "mmc-pwrseq-emmc";
>>  		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
>>  	};
>> +
>> +	usb_vbus: regulator-usb0-vbus {
>
> nit: I like to use the signal name from the schematics for the node name
> (and for regulator-name below).  In the schematics, that signal is named
> USB_PWR.
>
>
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "USB0_VBUS";
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +
>> +		gpio = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
>
> Please add a comment above this line with the schematic signal name: USB_PWR_EN.
>

For the record... after a chat with Martin on IRC, I just fixed these up
myself locally, so...

Applied,

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
