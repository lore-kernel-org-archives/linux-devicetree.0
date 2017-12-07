From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH net-next v4 1/4] phylib: Add device reset delay support
Date: Thu, 7 Dec 2017 16:01:11 +0100
Message-ID: <5f174dfc-e373-1069-cf22-f25a569030d0@skidata.com>
References: <20171207144358.3351-1-dev@g0hl1n.net>
 <20171207144358.3351-2-dev@g0hl1n.net>
 <CAMuHMdVgWif=1K-S2j1Y39B9yDNvV12sUm7nrFLOP-=ndSYtVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdVgWif=1K-S2j1Y39B9yDNvV12sUm7nrFLOP-=ndSYtVA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Richard Leitner <dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Fugang Duan <fugang.duan-3arQi8VN3Tc@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, lukma-ynQEQJNshbs@public.gmane.org, "netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On 12/07/2017 03:52 PM, Geert Uytterhoeven wrote:
> Hi Richard,
> 
> On Thu, Dec 7, 2017 at 3:43 PM, Richard Leitner <dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org> wrote:
>> --- a/drivers/net/phy/mdio_device.c
>> +++ b/drivers/net/phy/mdio_device.c
>> @@ -24,6 +24,7 @@
>>  #include <linux/slab.h>
>>  #include <linux/string.h>
>>  #include <linux/unistd.h>
>> +#include <linux/delay.h>
>>
>>  void mdio_device_free(struct mdio_device *mdiodev)
>>  {
>> @@ -118,8 +119,16 @@ EXPORT_SYMBOL(mdio_device_remove);
>>
>>  void mdio_device_reset(struct mdio_device *mdiodev, int value)
>>  {
>> -       if (mdiodev->reset)
>> -               gpiod_set_value(mdiodev->reset, value);
>> +       unsigned int d;
>> +
>> +       if (!mdiodev->reset)
>> +               return;
>> +
>> +       gpiod_set_value(mdiodev->reset, value);
>> +
>> +       d = value ? mdiodev->reset_delay : mdiodev->reset_post_delay;
>> +       if (d)
>> +               usleep_range(d, d + min_t(unsigned int, d / 10, 100));
> 
> Oops, I meant "max_t", not "min_t", else the upper limit can be "d + 0",
> which is not what we want.

You're right...

> Sorry, my fault.

I just copied it over from you suggestion without thinking about it...
So it's definitely my fault too ;-)

I'll wait for some more comments and send a new version next week.

regards;Richard.L
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
