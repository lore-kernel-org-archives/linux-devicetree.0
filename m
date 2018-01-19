From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: nomadik: add interrupt-parent for clcd
Date: Fri, 19 Jan 2018 16:22:08 +0100
Message-ID: <CAK8P3a0TJ0dLruRexUQ9N6A0Yrqw2Lk403uBnSjHh0M2L3oj_g@mail.gmail.com>
References: <20180115163719.1736753-1-arnd@arndb.de> <CACRpkdYCu57Y0KZGt9c7iM6nwe7qCxK+PcPC5God-rnOoHFt4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYCu57Y0KZGt9c7iM6nwe7qCxK+PcPC5God-rnOoHFt4Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 16, 2018 at 8:29 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Mon, Jan 15, 2018 at 5:37 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>
>> The clcd device is lacking an interrupt-parent property, which makes
>> the interrupt unusable and shows up as a warning with the latest
>> dtc version:
>>
>> arch/arm/boot/dts/ste-nomadik-s8815.dtb: Warning (interrupts_property): Missing interrupt-parent for /amba/clcd@10120000
>> arch/arm/boot/dts/ste-nomadik-nhk15.dtb: Warning (interrupts_property): Missing interrupt-parent for /amba/clcd@10120000
>>
>> I looked up the old board files and found that this interrupt has
>> the same irqchip as all the other on-chip device, it just needs one
>> extra line.
>>
>> Fixes: 17470b7da11c ("ARM: dts: add the CLCD LCD display to the NHK15")
>> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>
> Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Sorry for not getting to fixing this myself quickly enough.

Applied to next/dt, thanks!

      Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
