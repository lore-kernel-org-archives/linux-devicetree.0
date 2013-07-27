Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-ve0-f174.google.com ([209.85.128.174]:58760 "EHLO
	mail-ve0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752293Ab3G0Uuo (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Sat, 27 Jul 2013 16:50:44 -0400
Received: by mail-ve0-f174.google.com with SMTP id cy12so2069157veb.5
        for <devicetree@vger.kernel.org>; Sat, 27 Jul 2013 13:50:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130724172804.373309617f46b6e66a1085c0@mail.ru>
References: <1374582499-31823-1-git-send-email-shc_work@mail.ru>
	<CAN8TOE8_K3rT5gLFBGOnghK-ajFcjQK22mm0qYmF+hSvkT27aA@mail.gmail.com>
	<20130724172804.373309617f46b6e66a1085c0@mail.ru>
Date: Sat, 27 Jul 2013 13:50:43 -0700
Message-ID: <CAN8TOE82MqJ0WRtLftbfp0D9d94yXsUH7-vF3M6fooDTFjFvsw@mail.gmail.com>
Subject: Re: [PATCH 1/4] mtd: nand: gpio: Determine bus width automatically
From: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: David Woodhouse <dwmw2@infradead.org>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jul 24, 2013 at 6:28 AM, Alexander Shiyan <shc_work@mail.ru> wrote:
> On Tue, 23 Jul 2013 23:42:08 -0700
> Brian Norris <computersforpeace@gmail.com> wrote:
>
>> On Tue, Jul 23, 2013 at 5:28 AM, Alexander Shiyan <shc_work@mail.ru> wrote:
>> > diff --git a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
>> > index 36ef07d..287b8b8 100644
>> > --- a/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
>> > +++ b/Documentation/devicetree/bindings/mtd/gpio-control-nand.txt
>> > @@ -8,15 +8,14 @@ Required properties:
>> >  - compatible : "gpio-control-nand"
>> >  - reg : should specify localbus chip select and size used for the chip.  The
>> >    resource describes the data bus connected to the NAND flash and all accesses
>> > -  are made in native endianness.
>> > +  are made in native endianness. Bus width of the device is determined
>> > +  automatically if size > 1. If size = 1, 8 bit bus width will be used.
>> >  - #address-cells, #size-cells : Must be present if the device has sub-nodes
>> >    representing partitions.
>> >  - gpios : specifies the gpio pins to control the NAND device.  nwp is an
>> >    optional gpio and may be set to 0 if not present.
>> >
>> >  Optional properties:
>> > -- bank-width : Width (in bytes) of the device.  If not present, the width
>> > -  defaults to 1 byte.
>>
>> Do you really want to remove this property entirely? I'm not sure what
>> the policy is on this. And it may still be useful to leave in the
>> documentation, since older drivers (and potentially non-Linux OS?) may
>> still need the property. Maybe you can mark it as optional, and that
>> it may be ignored entirely.
>
> I redid it, I'll do option "bank-width" optional.
>
> [...]
>> > +       if (of_find_property(dev->of_node, "bank-width", NULL))
>> > +               dev_notice(dev, "Property \"bank-width\" is deprecated");
>>
>> If you don't totally kill this property (per my comments above), then
>> you probably don't want this message either. It's probably safe to
>> just ignore the property, if we can reliably auto-detect it instead.
>
> What do you say about such changes in the patch 4/4?
> Thanks.

I guess you're referring to this hunk from patch 4/4?

-       /* Deprecated since 3.11-rc2 */
+       /* Deprecated since 3.11-rc2, should be removed around 3.17 */

This hunk really seems out of place in patch 4. If you even want this
change, it should go in with patch 1. I don't see how it is related to
patch 4.

But the key point is that I don't think you should try to detect (and
print notices about) the bank-width property at all. As long as the
documentation clearly states that it is optional (and that some
systems may autodetect it), I think that is sufficient not to print
any warnings. You should consider that some user may want to retain
this DT binding for some other non-Linux OS (or for some range of new
and old kernel versions) so that they need this bank-width property.

Another way to look at this is that it doesn't hurt Linux at all for
there to be an extra DT property for a device. But it can hurt the
bootloader if it needs to support other OS's/drivers that don't
autodetect bank-width property.

On the other hand, if you're going to include this kind of
schedule-related comment at all, then it should at least be correct. I
can tell you a few things for sure:
(1) This code is not going into any of the 3.11 release candidates
(2) It doesn't really make sense to a user to see references to "-rc2"
when reading Linux source code. That's very much a process-related
detail that should not go in here.

Brian
