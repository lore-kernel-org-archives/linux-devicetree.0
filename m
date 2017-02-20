From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: da850-evm: add the UI expander node
Date: Mon, 20 Feb 2017 16:38:09 +0100
Message-ID: <CAMpxmJX3p03YiPL5X9=pKud4A7bXh9bV=qk7qAEAnA3OF3Hgbw@mail.gmail.com>
References: <1487268932-6469-1-git-send-email-bgolaszewski@baylibre.com>
 <1487268932-6469-5-git-send-email-bgolaszewski@baylibre.com> <5f194c6d-0937-bac2-31cd-2f1658f68d0d@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5f194c6d-0937-bac2-31cd-2f1658f68d0d-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Patrick Titiano <ptitiano-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-02-20 10:36 GMT+01:00 Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>:
> On Thursday 16 February 2017 11:45 PM, Bartosz Golaszewski wrote:
>> If we're using the UI board and want vpif capture, we need to select
>> the video capture functionality by driving the sel_c pin low on the
>> tca6416 expander and sel_a & sel_b pins high. Do it statically by
>> hogging relevant GPIOs in the device tree.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>> ---

[snip]

>>
>> +                             sel_a {
>> +                                     gpio-hog;
>> +                                     gpios = <7 GPIO_ACTIVE_HIGH>;
>> +                                     output-high;
>> +                                     line-name = "sel_a";
>> +                             };
>> +
>> +                             sel_b {
>> +                                     gpio-hog;
>> +                                     gpios = <6 GPIO_ACTIVE_HIGH>;
>> +                                     output-high;
>> +                                     line-name = "sel_b";
>> +                             };
>> +
>> +                             sel_c {
>> +                                     gpio-hog;
>> +                                     gpios = <5 GPIO_ACTIVE_HIGH>;
>> +                                     output-low;
>> +                                     line-name = "sel_c";
>
> I think this is better handled by using an enable-gpios property in vpif
> capture device-tree node. So in the vpif capture node you would have:
>
>         enable-gpios =  <&tca6416 7 GPIO_ACTIVE_HIGH
>                          &tca6416 6 GPIO_ACTIVE_HIGH
>                          &tca6416 5 GPIO_ACTIVE_LOW>;
>
> and in the vpif capture driver, you would request each of these gpios
> using: devm_gpiod_get_array_optional(.., .., GPIOD_OUT_HIGH);
>

I'm not sure about this one - the result is the same (function still
defined statically in the DT) while now it requires changes to the
vpif driver too.

Is there any other reason we'd prefer this approach?

Thanks,
Bartosz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
