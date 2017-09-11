From: Alexander Aring <aring-jkUAjuhPggJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] linux-wpan: Add an IEEE 802.15.4 over LoRa Semtech
 SX1276/77/78/79 device driver
Date: Mon, 11 Sep 2017 08:47:17 -0400
Message-ID: <CAOHTApj2tkJ7Xju0LSYrgz_uDsR2L35j+QvXswXgnCRkdqHMKA@mail.gmail.com>
References: <20170910093026.4386-1-starnight@g.ncu.edu.tw> <CAJuUDwtyf_TdGR34oKmLRgRU_jy+JtUSmSt1v_j20e+BwrfA7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJuUDwtyf_TdGR34oKmLRgRU_jy+JtUSmSt1v_j20e+BwrfA7A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xue Liu <liuxuenetmail-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jian-Hong Pan <starnight@g.ncu.edu.tw>, Alexander Aring <alex.aring-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Schmidt <stefan-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-wpan - ML <linux-wpan-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Sep 11, 2017 at 3:50 AM, Xue Liu <liuxuenetmail-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello Pan,
>
> From my point of view, it is not a good idea to write sx127x driver
> for IEEE 802154. Because LoRa is not compatible with IEEE 802.15.4 in
> PHY and MAC layer.
>

This isn't true. The security layer is exactly the same and copied
from IEEE 802.15.4.
The rest of the mac layer is pretty simple. Simpler than IEEE
802.15.4... for now.

> I think it is better to make individual Phy and MAC layers for LoRa in
> Linux kernel, where a sx127x driver will make sense.

What about to introduce a new interface type? Then you can do a
complete different parsing on this interface type and share the code
what you need from 802.15.4

- Alex
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
