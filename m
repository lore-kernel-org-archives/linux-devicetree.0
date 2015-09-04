From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH] ARM: ux500: fix typo in regulator names
Date: Fri, 4 Sep 2015 14:15:36 +0200
Message-ID: <CAAObsKBK-EFCxufr3C=bLRd6G=U9OUwigXYZ=roD8YG=jK7Aug@mail.gmail.com>
References: <1438777340-27511-1-git-send-email-tomeu.vizoso@collabora.com> <CAPDyKFqRz1QyfWXzcDde0J9Fc7gTZWQOFGNzU=2cg1JnMyrL+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPDyKFqRz1QyfWXzcDde0J9Fc7gTZWQOFGNzU=2cg1JnMyrL+g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 4 September 2015 at 13:48, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 5 August 2015 at 14:22, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
>> Apparently an extra _reg suffix was appended to the end of the names of
>> regulators ab8500_ext2_reg and ab8500_ext3_reg.
>>
>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>
> You should probably include Linus Walleij as he is the maintainer of ux500.

Thanks, maybe the file should be added to MAINTAINERS?

Regards,

Tomeu

> Acked-by: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
>> ---
>>  arch/arm/boot/dts/ste-snowball.dts | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/ste-snowball.dts b/arch/arm/boot/dts/ste-snowball.dts
>> index 32a5ccb14e7e..07c0e346942c 100644
>> --- a/arch/arm/boot/dts/ste-snowball.dts
>> +++ b/arch/arm/boot/dts/ste-snowball.dts
>> @@ -360,11 +360,11 @@
>>                                                 regulator-name = "ab8500-ext-supply1";
>>                                         };
>>
>> -                                       ab8500_ext2_reg_reg: ab8500_ext2 {
>> +                                       ab8500_ext2_reg: ab8500_ext2 {
>>                                                 regulator-name = "ab8500-ext-supply2";
>>                                         };
>>
>> -                                       ab8500_ext3_reg_reg: ab8500_ext3 {
>> +                                       ab8500_ext3_reg: ab8500_ext3 {
>>                                                 regulator-name = "ab8500-ext-supply3";
>>                                         };
>>                                 };
>> --
>> 2.4.3
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> Please read the FAQ at  http://www.tux.org/lkml/
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
