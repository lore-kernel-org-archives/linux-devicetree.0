From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4.1] phylib: Add device reset GPIO support
Date: Fri, 8 Dec 2017 20:20:09 +0300
Message-ID: <837cb555-f747-e8a8-ac1a-aa25ad213c0a@cogentembedded.com>
References: <1512383692-14009-2-git-send-email-geert+renesas@glider.be>
 <1512390905-28094-1-git-send-email-geert+renesas@glider.be>
 <69fe9a6d-4039-6f80-b80d-7dc0de31e5bf@cogentembedded.com>
 <CAMuHMdWv6CiCihjFHn-k2=3PC+-bRQaKMsZcsx51MYpynTLO4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdWv6CiCihjFHn-k2=3PC+-bRQaKMsZcsx51MYpynTLO4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-MW
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>, "netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello!

On 12/08/2017 12:53 PM, Geert Uytterhoeven wrote:

>> On 12/04/2017 03:35 PM, Geert Uytterhoeven wrote:
>>> From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>>> The PHY devices sometimes do have their reset signal (maybe even power
>>> supply?) tied to some GPIO and sometimes it also does happen that a boot
>>> loader does not leave it deasserted. So far this issue has been attacked
>>> from (as I believe) a wrong angle: by teaching the MAC driver to
>>> manipulate
>>> the GPIO in question; that solution, when applied to the device trees, led
>>> to adding the PHY reset GPIO properties to the MAC device node, with one
>>> exception: Cadence MACB driver which could handle the "reset-gpios" prop
>>> in a PHY device subnode. I believe that the correct approach is to teach
>>> the 'phylib' to get the MDIO device reset GPIO from the device tree node
>>> corresponding to this device -- which this patch is doing...
>>>
>>> Note that I had to modify the AT803x PHY driver as it would stop working
>>> otherwise -- it made use of the reset GPIO for its own purposes...
>>>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> [geert: Propagate actual errors from fwnode_get_named_gpiod()]
>>> [geert: Avoid destroying initial setup]
>>> [geert: Consolidate GPIO descriptor acquiring code]
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>>
>> [...]
>>>
>>> diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
>>> index 2df7b62c1a36811e..8f8b7747c54bc478 100644
>>> --- a/drivers/net/phy/mdio_bus.c
>>> +++ b/drivers/net/phy/mdio_bus.c
>>
>> [...]
>>>
>>> @@ -48,9 +49,26 @@
>>>      int mdiobus_register_device(struct mdio_device *mdiodev)
>>>    {
>>> +       struct gpio_desc *gpiod = NULL;
>>> +
>>>          if (mdiodev->bus->mdio_map[mdiodev->addr])
>>>                  return -EBUSY;
>>>    +     /* Deassert the optional reset signal */
>>
>>
>>     Umm, but why deassert it here for such a short time?
> 
> That's a consequence of moving it from drivers/of/of_mdio.c to here.

    Well, you shouldn't do code moves without some thinking. ;-)

> Not that it was deasserted that much longer in drivers/of/of_mdio.c, though...

    There it had a reason, here I'm not seeing one. Perhaps using GPIOD_ASIS 
(or GPIOD_OUT_HIGH) instead of GPIOD_OUT_LOW and dropping 
mdio_device_reset(mdiodev, 1) afterwards would make more sense here?

> Gr{oetje,eeting}s,
> 
>                          Geert

MBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
