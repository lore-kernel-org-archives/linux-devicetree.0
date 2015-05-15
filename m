From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/5] Marvell PXA1928 USB support
Date: Fri, 15 May 2015 07:48:24 -0500
Message-ID: <CAL_Jsq+1JXJGVAA42iw7haSMkWEpV0KOo0h3AVhO5-DQ-GfRcg@mail.gmail.com>
References: <1431557340-5421-1-git-send-email-robh@kernel.org> <5555C2A5.8010509@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5555C2A5.8010509-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 15, 2015 at 4:55 AM, Sebastian Hesselbarth
<sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 14.05.2015 00:48, Rob Herring wrote:
>>
>> This series adds USB PHYs and EHCI host drivers for the Marvell PXA1928
>> SOC.
>>
>> The OTG block is based on ChipIdea and works with "chipidea,usb2"
>> compatible driver as is just by adding the PHY driver. Yay!
>>
>> Rob
>>
>> Rob Herring (5):
>>    dt-bindings: Add Marvell PXA1928 USB and HSIC PHY bindings
>>    dt-bindings: Add Marvell PXA1928 USB EHCI controller binding
>>    phy: Add Marvell USB 2.0 OTG 28nm PHY
>>    phy: add Marvell HSIC 28nm PHY
>>    usb: add pxa1928 ehci support
>>
>>   .../devicetree/bindings/phy/pxa1928-usb-phy.txt    |  18 ++
>>   .../devicetree/bindings/usb/ehci-pxa1928.txt       |  19 ++
>>   drivers/phy/Kconfig                                |  20 ++
>>   drivers/phy/Makefile                               |   2 +
>>   drivers/phy/phy-mv-hsic.c                          | 208 +++++++++++++
>>   drivers/phy/phy-mv-usb2.c                          | 329
>> +++++++++++++++++++++
>
>
> [Adding some MVEBU guys]
>
> Rob,
>
> I had a look at the USB PHYs of some of the other Marvell SoCs a while
> ago for the barebox bootloader [1]. Marvell seems to distinguish the
> USB PHY type by technology node, e.g. 28nm like the one above. For the
> most used Marvell SoCs, i.e. Kirkwood, Dove, and Armada 370/XP, they all
> use a different technology node and we could either use the SoC name
> or the technology node as compatible.

It also seems to be by business unit. The registers in the 40nm
version I have look nothing like what are in Armada. It could be the
same IP, but PHY IP tends to just be signals and they leave the
register interface up the to licensee's imagination. Any idea if there
are 28nm Armada parts which have the same phy?

It's a good idea to always include the SOC name in the compatible.
Every new chip is an opportunity for changes or bugs.

> Anyway, if you are introducing new PHY drivers with _that_ generic
> names, it will either clash with every other Marvell USB PHYs -
> or we'll have to add the PHY code into the drivers above.

How about phy-pxa-28nm-{usb2,hsic}?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
