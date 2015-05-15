From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/5] Marvell PXA1928 USB support
Date: Fri, 15 May 2015 11:04:23 -0500
Message-ID: <CAL_Jsq+Yu1cTUDyCt41Apf-VOgxme7D78L2FdPeCzqSTp+Dcig@mail.gmail.com>
References: <1431557340-5421-1-git-send-email-robh@kernel.org>
 <5555C2A5.8010509@gmail.com> <CAL_Jsq+1JXJGVAA42iw7haSMkWEpV0KOo0h3AVhO5-DQ-GfRcg@mail.gmail.com>
 <2878212.YRcsYyF5mD@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2878212.YRcsYyF5mD@wuerfel>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 15, 2015 at 9:11 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 15 May 2015 07:48:24 Rob Herring wrote:
>>
>> > Anyway, if you are introducing new PHY drivers with _that_ generic
>> > names, it will either clash with every other Marvell USB PHYs -
>> > or we'll have to add the PHY code into the drivers above.
>>
>> How about phy-pxa-28nm-{usb2,hsic}?
>>
>
> Seems ok to me, but please verify that these are actually usb2 and hsic
> specific devices. There are a lot of PHY implementations that share the
> basic layout between devices for different purposes, e.g. USB3 and PCIe
> and they should have a name that is not too specific for one connection
> when the same driver gets reused by another part.

Yes, I'm aware of that as Calxeda "comboPHYs" did 10G XAUI, PCIe and
SATA. Those are cases are supporting similar electrical specs. USB3 is
similar to those. I've not seen USB 2.0 PHYs shared with anything
else, and HSIC is also very unique.

Rob

>
>         Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
