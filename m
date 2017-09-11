From: StarNight <starnight@g.ncu.edu.tw>
Subject: Re: [PATCH] linux-wpan: Add an IEEE 802.15.4 over LoRa Semtech
 SX1276/77/78/79 device driver
Date: Mon, 11 Sep 2017 23:17:14 +0800
Message-ID: <CAC=mGziO09oiNcYpYO6kHOcH_D0sypx8RvAML3OvnMUu9af+aQ@mail.gmail.com>
References: <20170910093026.4386-1-starnight@g.ncu.edu.tw> <CAJuUDwtyf_TdGR34oKmLRgRU_jy+JtUSmSt1v_j20e+BwrfA7A@mail.gmail.com>
 <CAOHTApj2tkJ7Xju0LSYrgz_uDsR2L35j+QvXswXgnCRkdqHMKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOHTApj2tkJ7Xju0LSYrgz_uDsR2L35j+QvXswXgnCRkdqHMKA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Aring <aring-jkUAjuhPggJWk0Htik3J/w@public.gmane.org>
Cc: Xue Liu <liuxuenetmail-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexander Aring <alex.aring-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Schmidt <stefan-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-wpan - ML <linux-wpan-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

2017-09-11 20:47 GMT+08:00 Alexander Aring <aring-jkUAjuhPggJWk0Htik3J/w@public.gmane.org>:
> Hi,
>
> On Mon, Sep 11, 2017 at 3:50 AM, Xue Liu <liuxuenetmail-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hello Pan,
>>
>> From my point of view, it is not a good idea to write sx127x driver
>> for IEEE 802154. Because LoRa is not compatible with IEEE 802.15.4 in
>> PHY and MAC layer.
>>
>
> This isn't true. The security layer is exactly the same and copied
> from IEEE 802.15.4.
> The rest of the mac layer is pretty simple. Simpler than IEEE
> 802.15.4... for now.

That is the first reason why I write this driver.

I also found "Transmission of IPv6 Packets over LoRaWAN" on IETF website
https://datatracker.ietf.org/doc/draft-vilajosana-lpwan-lora-hc/
However, it has been expired since 2017-01-09.
It is the second reason why I write this driver.

>> I think it is better to make individual Phy and MAC layers for LoRa in
>> Linux kernel, where a sx127x driver will make sense.
>
> What about to introduce a new interface type? Then you can do a
> complete different parsing on this interface type and share the code
> what you need from 802.15.4

So, will the suggestion be a new interface like "6LoWPAN over LoRaWAN"?

Thanks,

Jian-Hong Pan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
