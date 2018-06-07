Return-Path: <SRS0=13PW=IZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:33433 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753326AbeFGHXA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Jun 2018 03:23:00 -0400
Received: by mail-wm0-f49.google.com with SMTP id z6-v6so1877708wma.0
        for <devicetree@vger.kernel.org>; Thu, 07 Jun 2018 00:22:59 -0700 (PDT)
Subject: Re: USB role switches, usb-connector, typec and device trees
References: <6c379a23-5c63-9b49-9444-e16d6a8082a6@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <84f5cbcf-41c5-de01-9191-deae0a53bc96@redhat.com>
Date: Thu, 7 Jun 2018 09:22:56 +0200
MIME-Version: 1.0
In-Reply-To: <6c379a23-5c63-9b49-9444-e16d6a8082a6@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Mats Karrman <mats.dev.list@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi,

On 06-06-18 23:36, Mats Karrman wrote:
> Hello Gentlemen,
> 
> I'm trying to get my head around USB role switches in connection with Type-C ports
> and device-trees. So far I have not found much documentation, e.g. there are no
> device-tree bindings documented and really no good examples in existing device
> trees, although there has been some attempts, e.g. [1] and [2]. Anyway, so I send
> you a couple of questions instead:
> 
> 1) tcpm uses the port device struct to find a single usb_role_switch but there is
> room for three USB busses in the Type-C connector; one high speed and two (?) super-
> speed. These would not all come from the same controller (there might even be
> separate controllers for host and device mode for each bus).

AFAIK the 2nd superspeed USB bus is never used as such. There really is only 1
USB bus on the Type-C connector, the combined USB-2 + the 1st superspeed bus,
physically these are 2 separate busses but that is purely for compatibility
reasons, logically there really only is 1 bus, just like a superspeed Type-A
connector has both busses physically but logically represents a single bus/port.

> The case I am working on now only have a single USB2 otg controller so it should
> be possible to make that driver register a role switch but for other cases?

I guess theoretically a device could use separate role switches / muxes for
the USB-2 and USB-3 busses, but that would be weird. So lets cross that bridge
when we reach it.

> I imagine it would be possible to create a composite driver as a proxy for all role
> switches but that would probably be different for every platform/product - not
> very elegant. Could the role switch infrastructure be extended to handle arbitrary
> sets of coordinated switches?

As said lets cross that bridge when we reach it.

> 2) How should the connection between the Type-C port and the switches best be
> expressed in a device tree? Using graph I presume, but should it be mixed into the
> existing "usb-connector" or should this be a separate block?
> I think it is unfortunate that the graph use numeric addresses that need to be
> fixed by documentation and already I see problems with the current assignment
> (0=HS, 1=SS, 2=SBU), e.g. if the host and device mode are handled by different
> controllers. Graph do support multiple endpoints for one port but then we have
> another level of magic numbers which does not exactly make things easier
> (e.g. 0=dual or host controller, 1=device controller, 2=mode switch).

The graph stuff is more Heikki's specialty so I will let Heikki answer this.

Regards,

Hans

