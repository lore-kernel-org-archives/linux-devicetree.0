Return-Path: <SRS0=Z3/K=JB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:40394 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756235AbeFOVvU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 Jun 2018 17:51:20 -0400
Subject: Re: USB role switches, usb-connector, typec and device trees
References: <6c379a23-5c63-9b49-9444-e16d6a8082a6@gmail.com>
 <84f5cbcf-41c5-de01-9191-deae0a53bc96@redhat.com>
 <20180607120150.GC17155@kuha.fi.intel.com>
 <dc7949d9-af0a-aab8-6011-33df32c05dd3@gmail.com>
 <20180613135126.GC2847@kuha.fi.intel.com>
From: Mats Karrman <mats.dev.list@gmail.com>
Message-ID: <fbf681c1-da6b-943c-ddee-48f95861a363@gmail.com>
Date: Fri, 15 Jun 2018 23:51:17 +0200
MIME-Version: 1.0
In-Reply-To: <20180613135126.GC2847@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: devicetree-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Andrzej Hajda <a.hajda@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 2018-06-13 15:51, Heikki Krogerus wrote:

> On Tue, Jun 12, 2018 at 07:16:03PM +0200, Mats Karrman wrote:
>> On 2018-06-07 14:01, Heikki Krogerus wrote:
>>
>>> On Thu, Jun 07, 2018 at 09:22:56AM +0200, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 06-06-18 23:36, Mats Karrman wrote:
>>>>> Hello Gentlemen,
>>>>>
>>>>> I'm trying to get my head around USB role switches in connection with Type-C ports
>>>>> and device-trees. So far I have not found much documentation, e.g. there are no
>>>>> device-tree bindings documented and really no good examples in existing device
>>>>> trees, although there has been some attempts, e.g. [1] and [2]. Anyway, so I send
>>>>> you a couple of questions instead:
>>>>>
>>>>> 1) tcpm uses the port device struct to find a single usb_role_switch but there is
>>>>> room for three USB busses in the Type-C connector; one high speed and two (?) super-
>>>>> speed. These would not all come from the same controller (there might even be
>>>>> separate controllers for host and device mode for each bus).
>>> I believe USB 3.2 spec in practice says that the two superspeed
>>> "lanes" must to go to the same controller. Only one will be used for
>>> link training etc. The second one is pulled in after certain state of
>>> enumeration has been passed.
>>>
>>> So we may theoretically have two controllers to deal with, one for
>>> USB2 and another for USB3, but not three.
>>>
>>> But in any case, let's not try to fix theoretical problems that may
>>> never exist.
>>>
>>>> AFAIK the 2nd superspeed USB bus is never used as such. There really is only 1
>>>> USB bus on the Type-C connector, the combined USB-2 + the 1st superspeed bus,
>>>> physically these are 2 separate busses but that is purely for compatibility
>>>> reasons, logically there really only is 1 bus, just like a superspeed Type-A
>>>> connector has both busses physically but logically represents a single bus/port.
>>>>
>>>>> The case I am working on now only have a single USB2 otg controller so it should
>>>>> be possible to make that driver register a role switch but for other cases?
>>>> I guess theoretically a device could use separate role switches / muxes for
>>>> the USB-2 and USB-3 busses, but that would be weird. So lets cross that bridge
>>>> when we reach it.
>>>>
>>>>> I imagine it would be possible to create a composite driver as a proxy for all role
>>>>> switches but that would probably be different for every platform/product - not
>>>>> very elegant. Could the role switch infrastructure be extended to handle arbitrary
>>>>> sets of coordinated switches?
>>>> As said lets cross that bridge when we reach it.
>>> Agreed.
>> OK, I'm buying what you're saying. After reading some manuals for USB3 controllers
>> and USB3 equipped SoC's I realize that most USB3 controllers seem to also support
>> USB2. Makes things easier, although not as flexible as I imagined.
>> One thing that led me astray was the comment for usb_role_switch_register() and the
>> separate device struct pointers for usb2/usb3/udc in the usb_role_switch_desc struct.
>> Still not totally clear to me what they are for?
> They are not really used for anything. Well, not yet at least.
>
> Even if there is only a single physical controller, in case of host,
> there will be separate logical devices representing the USB2 bus the
> USB3 bus. UDC is just UDC, the device is the physical controller.
>
> I added those usb2/usb3/udc handles to the structure because a long
> time a go somebody requested that we should have a way in user space
> to see the USB buses we are dealing with somehow. So the idea was
> never to actually use those in the code. That's why I'm talking about
> symlinks in the TODO comment.

OK, thanks

> But if those are not useful, or confusing, I'm happy to drop them.
>
>>>>> 2) How should the connection between the Type-C port and the switches best be
>>>>> expressed in a device tree? Using graph I presume, but should it be mixed into the
>>>>> existing "usb-connector" or should this be a separate block?
>>> I don't know?
>>>
>>> I'm not super comfortable proposing things for these bindings because
>>> my knowledge of DT is a bit limited. I mostly work with ACPI based
>>> platforms.
>>>
>>> I'm not even completely sure device graph is usable in our case,
>>> though I pretty sure it is.
>>>
>>>>> I think it is unfortunate that the graph use numeric addresses that need to be
>>>>> fixed by documentation and already I see problems with the current assignment
>>>>> (0=HS, 1=SS, 2=SBU), e.g. if the host and device mode are handled by different
>>>>> controllers. Graph do support multiple endpoints for one port but then we have
>>>>> another level of magic numbers which does not exactly make things easier
>>>>> (e.g. 0=dual or host controller, 1=device controller, 2=mode switch).
>>>> The graph stuff is more Heikki's specialty so I will let Heikki answer this.
>>> I'm not really a graph expert. It is just the only tool in kernel I
>>> can see that allows us to link together all these different components
>>> in HW description, and which has support for both DT and ACPI in Linux
>>> kernel. That is the only reason I've talked about it.
>>>
>>> One of the motivations for the device connection API was that it hides
>>> the actual method these components are linked together in HW
>>> description. What ever the method is, device graph or something else
>>> (we can support different ways), the drivers don't need to know about
>>> it.
>> Ahh, this is complicated and the lack of examples makes it a bit hard to
>> digest. Is it your expectation that the OF graph parsing code will be calling
>> device_connection_add() for every graph connection found in the device
>> tree or maybe for every connection with an "id" property?
> No, the idea is that we parse the graph in
> device_connection_find_match().

I hacked away to see if I could make some sense of this but I didn't get far.
Do you mean that the device_connection_find_match() function should be
extended with code for finding matches in devicetrees as well?

I tried and ended up creating temporary device_connection instances just
to try to satisfy the match function you supply from usb_role_switch_get(),
only the OF graph connection does not have a name to compare with.

>> (Ugh, just realized that the "reg" numeric value of the endpoint node is
>> put in the "id" field of the endpoint struct, bad luck...).
> Isn't the "compatible" property the one that should be used in this
> case? The remote endpoint just has to have compatible property
> matching the con_id, no?

By endpoint you mean the OF node named "endpoint" as described by graph
documentation or something else?
I have not seen or heard of any "endpoint" nodes having "compatible" properties,
only the nodes containing the "port(s)" nodes. The USB controller node
won't have compatible set to "usb-role-switch" so which node do you mean?

> My worry is that currently there is no function to convert a fwnode
> to device. With ACPI it is possible already, but only to the first
> device bind to the node (ACPI device node can be bind to multiple
> devices). I don't think there is a function to convert OF node to
> device.
>
> We could of course workaround this problem and add fwnode member(s) to
> the device_lookup structure. The callers would then have to check is
> fwnode or the endpoint (device) name being used, which is not ideal
> IMO.

"device_connection" structure?

BR // Mats

