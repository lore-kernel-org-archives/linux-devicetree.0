From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH v6 9/9] arm64: allwinner: a64: enable Wi-Fi for Pine64
Date: Fri, 19 May 2017 11:03:33 +0800
Message-ID: <79B00D42-3F95-4D5E-9A23-8E893CCF2462@aosc.io>
References: <20170518071653.36561-1-icenowy@aosc.io> <20170518071653.36561-10-icenowy@aosc.io> <CAGb2v66mqMveibKKU9LiBm8jzAOj46hFCK6HvJx0k6077fqLZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGb2v66mqMveibKKU9LiBm8jzAOj46hFCK6HvJx0k6077fqLZw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



于 2017年5月19日 GMT+08:00 上午11:01:39, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> 写到:
>Hi,
>
>On Thu, May 18, 2017 at 3:16 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>> The Wi-Fi module of Pine64 is powered via DLDO4 and ELDO1 (the latter
>> one provides I/O voltage).
>>
>> Add device node for it.
>>
>> Although the Wi-Fi module is an external module which should be
>inserted
>> to a header, according to my personal talk with TL Lim, he does not
>want
>> this header to be used as GPIO (so it's with 2.0mm pitch, not 2.54mm
>as
>> other GPIO headers).
>
>The patch looks OK, but given the module is removable, I think it
>should be
>an overlay. The overlay would enable WiFi + Bluetooth, and all the
>peripherals needed to connect them.
>
>That way, if the module is not installed, we avoid confusing the user
>with
>unused peripherals, and avoid having live voltage on an unoccupied
>header.

But as this header have specific usage, we will also confuse user
if it's not enabled as its target usage.

>
>ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
