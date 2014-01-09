From: Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH] ARM: dts: bcm28155-ap: Fix Card Detection GPIO
Date: Wed, 8 Jan 2014 16:28:04 -0800
Message-ID: <CAAYSxhpgJwnq63fUdYBtmneRads_69c2mik8upofvAS1Y25fOA@mail.gmail.com>
References: <1389120821-12007-1-git-send-email-tim.kryger@linaro.org>
	<CAEPRUYo0r5YcRTYdgSNLqedVV4D0bsor7USBoxRRpBXRs7wpbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEPRUYo0r5YcRTYdgSNLqedVV4D0bsor7USBoxRRpBXRs7wpbw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Broadcom Kernel Feedback List <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Device Tree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Arm Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 8, 2014 at 3:38 PM, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org> wrote:
> On Tue, Jan 7, 2014 at 10:53 AM, Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> The board schematic states that the "SD_CARD_DET_N gets pulled to GND
>> when card is inserted" so the polarity has been updated to active low.
>>
>> Polarity is now specified with a GPIO define instead of a magic number.
>>
>> Signed-off-by: Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Reviewed-by: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/bcm28155-ap.dts | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/bcm28155-ap.dts b/arch/arm/boot/dts/bcm28155-ap.dts
>> index 08e47c2..27dd110 100644
>> --- a/arch/arm/boot/dts/bcm28155-ap.dts
>> +++ b/arch/arm/boot/dts/bcm28155-ap.dts
>> @@ -13,6 +13,8 @@
>>
>>  /dts-v1/;
>>
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>>  #include "bcm11351.dtsi"
>>
>>  / {
>> @@ -40,7 +42,7 @@
>>
>>         sdio4: sdio@3f1b0000 {
>>                 max-frequency = <48000000>;
>> -               cd-gpios = <&gpio 14 0>;
>> +               cd-gpios = <&gpio 14 GPIO_ACTIVE_LOW>;
>>                 status = "okay";
>>         };
>>  };
>> --
>> 1.8.0.1
>>
> Tim,
>  Does bcm11351-brt not also suffer from the same bug? If it does can
> you pls update the patch to also fix it?
>
>  Thanks,
>    csd

The BRT and AP boards are similar so it may have the same problem but
I don't have a BRT and wouldn't be able to test any changes to its DTS
file.

-Tim
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
