From: Brian Kim <brian.kim-vC+yAUbXFBlQ0OI7PeSoCw@public.gmane.org>
Subject: Re: [PATCH] ARM64: dts: meson-gxbb-odroidc2: Enable USB Nodes
Date: Tue, 4 Oct 2016 11:00:55 +0900
Message-ID: <491f3dd3-e489-1e94-fe08-40a1d9188dec@hardkernel.com>
References: <1475227059-17462-1-git-send-email-brian.kim@hardkernel.com>
 <7h7f9tgzg8.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7h7f9tgzg8.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, moon.linux-vC+yAUbXFBlQ0OI7PeSoCw@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 2016년 10월 01일 00:49, Kevin Hilman wrote:
> Brian Kim <brian.kim-vC+yAUbXFBlQ0OI7PeSoCw@public.gmane.org> writes:
>
>> Enable both gxbb USB controller and add a 5V regulator for the OTG port
>> VBUS
>>
>> Signed-off-by: Brian Kim <brian.kim-vC+yAUbXFBlQ0OI7PeSoCw@public.gmane.org>
> Thanks for the patch.
>
> In the future, please state what branch the patch should apply to when
> not using mainline.  Because of the sd_emmc nodes in your patch, I could
> tell that it was based on my integ branch so was able to figure it out,
> but it's very helpful to maintainers if you state the branch and/or any
> dependencies explicity.
Okay, I will do next time.
I guessed the branch is your latest working branch by the commit logs.

>
>> ---
>>  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 29 ++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
>> index 8d89edc..997c671 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
>> @@ -64,6 +64,18 @@
>>  		reg = <0x0 0x0 0x0 0x80000000>;
>>  	};
>>  
>> +	usb_pwr: regulator-usb-pwrs {
> minor nit: since this is specific to the OTG part, can you call this
> usb_otg_pwr? ...
Sure.

>
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "USB_PWR";
> ... and rename this also?
Yes, I will change the name to "USB_OTG_PWR".

>
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +
>> +		gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +	};
>> +
> Thanks
>
> Kevin
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
