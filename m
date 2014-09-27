From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] bcma: use device from DT (brcm,bus-gpio) for SoC GPIO chip
Date: Sat, 27 Sep 2014 10:05:44 +0200
Message-ID: <CACna6rwwfJOdnxhmnW7MUuUC1YBPx8bmDbiaSy1+G39hF4p7OA@mail.gmail.com>
References: <1411741733-13888-1-git-send-email-zajec5@gmail.com>
	<2539898.4te2VKk57a@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2539898.4te2VKk57a@wuerfel>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 27 September 2014 00:03, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 26 September 2014 16:28:53 Rafa=C5=82 Mi=C5=82ecki wrote:
>> +The top-level axi bus may contain following children:
>> +
>> +- gpio: GPIO chip on the SoC
>> +
>> +  Required properties:
>> +  - compatible: "brcm,bus-gpio"
>> +  - gpio-controller : makes the node a GPIO controller
>> +  - #gpio-cells : size of the GPIO specifier, must be 2
>> +
>>
>
> I wonder if it would be better to avoid the subnode here and just
> make the parent itself the gpio controller.
>
> Is the gpio controller part of the bus itself in reality, or is it
> a device that gets probed on the bus?

I'm not sure how to treat this chip.
We control GPIOs using ChipCommon regs (and ChipCommon is one of
cores/devices on the bus), so you could also consider GPIO chip a
sub-device of ChipCommon.
I believe every Broadcom bus has a GPIO chip. In the ancient (MIPS)
times, even if we didn't have ChipCommon, there was an EXTIF core that
used to provide access to the GPIO chip.

What do you think? Should I make it separated device, even it if
depends on the SoC and its ChipCommon core (device)?

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
