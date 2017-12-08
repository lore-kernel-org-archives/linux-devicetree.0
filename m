From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4.1] phylib: Add device reset GPIO support
Date: Fri, 8 Dec 2017 10:53:26 +0100
Message-ID: <CAMuHMdWv6CiCihjFHn-k2=3PC+-bRQaKMsZcsx51MYpynTLO4A@mail.gmail.com>
References: <1512383692-14009-2-git-send-email-geert+renesas@glider.be>
 <1512390905-28094-1-git-send-email-geert+renesas@glider.be> <69fe9a6d-4039-6f80-b80d-7dc0de31e5bf@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <69fe9a6d-4039-6f80-b80d-7dc0de31e5bf@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, "David S . Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Richard Leitner <richard.leitner@skidata.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Thu, Dec 7, 2017 at 6:20 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 12/04/2017 03:35 PM, Geert Uytterhoeven wrote:
>> From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> The PHY devices sometimes do have their reset signal (maybe even power
>> supply?) tied to some GPIO and sometimes it also does happen that a boot
>> loader does not leave it deasserted. So far this issue has been attacked
>> from (as I believe) a wrong angle: by teaching the MAC driver to
>> manipulate
>> the GPIO in question; that solution, when applied to the device trees, led
>> to adding the PHY reset GPIO properties to the MAC device node, with one
>> exception: Cadence MACB driver which could handle the "reset-gpios" prop
>> in a PHY device subnode. I believe that the correct approach is to teach
>> the 'phylib' to get the MDIO device reset GPIO from the device tree node
>> corresponding to this device -- which this patch is doing...
>>
>> Note that I had to modify the AT803x PHY driver as it would stop working
>> otherwise -- it made use of the reset GPIO for its own purposes...
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> [geert: Propagate actual errors from fwnode_get_named_gpiod()]
>> [geert: Avoid destroying initial setup]
>> [geert: Consolidate GPIO descriptor acquiring code]
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> [...]
>>
>> diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
>> index 2df7b62c1a36811e..8f8b7747c54bc478 100644
>> --- a/drivers/net/phy/mdio_bus.c
>> +++ b/drivers/net/phy/mdio_bus.c
>
> [...]
>>
>> @@ -48,9 +49,26 @@
>>     int mdiobus_register_device(struct mdio_device *mdiodev)
>>   {
>> +       struct gpio_desc *gpiod = NULL;
>> +
>>         if (mdiodev->bus->mdio_map[mdiodev->addr])
>>                 return -EBUSY;
>>   +     /* Deassert the optional reset signal */
>
>
>    Umm, but why deassert it here for such a short time?

That's a consequence of moving it from drivers/of/of_mdio.c to here.
Not that it was deasserted that much longer in drivers/of/of_mdio.c, though...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
