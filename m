From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH net-next v3 1/4] phylib: Add device reset delay support
Date: Tue, 5 Dec 2017 15:56:55 +0100
Message-ID: <35a63da6-93e1-b2f0-a3cc-ad079b2ffb28@skidata.com>
References: <20171205132600.13796-1-dev@g0hl1n.net>
 <20171205132600.13796-2-dev@g0hl1n.net>
 <CAMuHMdX70yuEfoDL+Y4TZ-6zjyW9BqvKOU6UxbHTKGNcgfGrow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdX70yuEfoDL+Y4TZ-6zjyW9BqvKOU6UxbHTKGNcgfGrow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Richard Leitner <dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Fugang Duan <fugang.duan-3arQi8VN3Tc@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, lukma-ynQEQJNshbs@public.gmane.org, "netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On 12/05/2017 02:54 PM, Geert Uytterhoeven wrote:
> Hi Richard,
> 
> On Tue, Dec 5, 2017 at 2:25 PM, Richard Leitner <dev-M/VWbR8SM2SsTnJN9+BGXg@public.gmane.org> wrote:
>> From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
>>
>> Some PHYs need a minimum time after the reset gpio was asserted and/or
>> deasserted. To ensure we meet these timing requirements add two new
>> optional devicetree parameters for the phy: reset-delay-us and
>> reset-post-delay-us.
> 
> Thanks for your patch!
> 
>> This patch depends on the "phylib: Add device reset GPIO support" patch
>> submitted by Geert Uytterhoeven/Sergei Shtylyov, see:
>>         https://patchwork.kernel.org/patch/10090149/
> 
> The above paragraph belongs under the "---" line below, as it is not intended
> to be preserved in the eternal git history.

Ok. Thanks. That makes sense. I'll take it into account for v4.

> 
>> Signed-off-by: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> 
> Although I have a few suggestions below:

Thank you for your review and suggestions (they make the code look way
more neater). I'll adapt v4 accordingly.

> 
>> --- a/drivers/net/phy/mdio_device.c
>> +++ b/drivers/net/phy/mdio_device.c
>> @@ -118,8 +119,16 @@ EXPORT_SYMBOL(mdio_device_remove);
>>
>>  void mdio_device_reset(struct mdio_device *mdiodev, int value)
>>  {
>> -       if (mdiodev->reset)
>> -               gpiod_set_value(mdiodev->reset, value);
>> +       if (!mdiodev->reset)
>> +               return;
>> +
>> +       gpiod_set_value(mdiodev->reset, value);
>> +
>> +       if (value && mdiodev->reset_delay)
>> +               usleep_range(mdiodev->reset_delay, mdiodev->reset_delay + 100);
>> +       else if (!value && mdiodev->reset_post_delay)
>> +               usleep_range(mdiodev->reset_post_delay,
>> +                            mdiodev->reset_post_delay + 100);
> 
> I think this can be written simpler using e.g.:
> 
>         unsigned int delay;
> 
>         ...
>         delay = value ? mdiodev->reset_delay : mdiodev->reset_post_delay;
>         if (delay)
>                 usleep_range(delay, delay + 100);
> 
> Perhaps the range extension should be relative, e.g.
> "delay + min(delay / 10, 100)"?
> 
>> --- a/drivers/of/of_mdio.c
>> +++ b/drivers/of/of_mdio.c
>> @@ -77,6 +77,14 @@ static int of_mdiobus_register_phy(struct mii_bus *mdio,
>>         if (of_property_read_bool(child, "broken-turn-around"))
>>                 mdio->phy_ignore_ta_mask |= 1 << addr;
>>
>> +       if (of_property_read_u32(child, "reset-delay-us",
>> +                                &phy->mdio.reset_delay))
>> +               phy->mdio.reset_delay = 0;
>> +
>> +       if (of_property_read_u32(child, "reset-post-delay-us",
>> +                                &phy->mdio.reset_post_delay))
>> +               phy->mdio.reset_post_delay = 0;
> 
> If of_property_read_u32() fails, it doesn't write to its output parameter.
> As the structure should be zeroed during allocation, you can just write:
> 
>         of_property_read_u32(child, "reset-delay-us", &phy->mdio.reset_delay);
>         of_property_read_u32(child, "reset-post-delay-us",
>                              &phy->mdio.reset_post_delay);
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
