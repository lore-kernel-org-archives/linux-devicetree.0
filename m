Return-Path: <SRS0=0VYT=I7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57852 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933685AbeFMHGq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 Jun 2018 03:06:46 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20180613070644euoutp026c384f820e0d1750e73dafdf013992aa~3pnFVhnO52841028410euoutp020
        for <devicetree@vger.kernel.org>; Wed, 13 Jun 2018 07:06:44 +0000 (GMT)
Subject: Re: USB role switches, usb-connector, typec and device trees
From: Andrzej Hajda <a.hajda@samsung.com>
Date: Wed, 13 Jun 2018 09:06:40 +0200
MIME-Version: 1.0
In-Reply-To: <9b7265bb-b050-3336-7b31-5e9768f5fc77@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Message-Id: <20180613070642eucas1p1d3be7d7e157163eaaadc7c49c2b9719e~3pnDwWpr51307613076eucas1p1f@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
References: <CGME20180606213655epcas1p3e3f704633baa3100e28ff7e02ed85eab@epcas1p3.samsung.com>
        <6c379a23-5c63-9b49-9444-e16d6a8082a6@gmail.com>
        <20180607114039eucas1p1b0d8f54e90605cd10797598b2cc624c3~13eibLw1C2733027330eucas1p1q@eucas1p1.samsung.com>
        <9b7265bb-b050-3336-7b31-5e9768f5fc77@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Mats Karrman <mats.dev.list@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 12.06.2018 19:33, Mats Karrman wrote:
> Hi Andrzej,
>
> On 2018-06-07 13:40, Andrzej Hajda wrote:
>
>> On 06.06.2018 23:36, Mats Karrman wrote:
>>> Hello Gentlemen,
>>>
>>> I'm trying to get my head around USB role switches in connection with Type-C ports
>>> and device-trees. So far I have not found much documentation, e.g. there are no
>>> device-tree bindings documented and really no good examples in existing device
>>> trees, although there has been some attempts, e.g. [1] and [2]. Anyway, so I send
>>> you a couple of questions instead:
>>>
>>> 1) tcpm uses the port device struct to find a single usb_role_switch but there is
>>> room for three USB busses in the Type-C connector; one high speed and two (?) super-
>>> speed. These would not all come from the same controller (there might even be
>>> separate controllers for host and device mode for each bus).
>>> The case I am working on now only have a single USB2 otg controller so it should
>>> be possible to make that driver register a role switch but for other cases?
>>> I imagine it would be possible to create a composite driver as a proxy for all role
>>> switches but that would probably be different for every platform/product - not
>>> very elegant. Could the role switch infrastructure be extended to handle arbitrary
>>> sets of coordinated switches?
>>>
>>> 2) How should the connection between the Type-C port and the switches best be
>>> expressed in a device tree? Using graph I presume, but should it be mixed into the
>>> existing "usb-connector" or should this be a separate block?
>>> I think it is unfortunate that the graph use numeric addresses that need to be
>>> fixed by documentation
>> I also do not like port numbers, I even have argued for using names
>> during multiple discussions, but the discussion ended as is :(
>>
>>> and already I see problems with the current assignment
>>> (0=HS, 1=SS, 2=SBU), e.g. if the host and device mode are handled by different
>>> controllers. Graph do support multiple endpoints for one port but then we have
>>> another level of magic numbers which does not exactly make things easier
>>> (e.g. 0=dual or host controller, 1=device controller, 2=mode switch).
>> Where do you want to use these magic numbers? To describe endpoints? I
> For some hypothetic worst case scenario where a switch needs to handle
> different USB controllers for port host and device mode. However I think
> Heikki and Hans are correct in saying we should wait to worry about that
> until we have an actual use-case.
>
>> guess there should be controllable mux/switch behind the port, it could
>> be standalone, or a part of bigger IP.
>> Anyway it should be described by device node, probably parent of USB-C
> child?
>
>> device-node, in such case only links from USB connector going to
>> different IPs should be described using OF graphs.
>> And in such case drivers of these devices should
>> ask/determine/change/communicate their role using in-kernel frameworks
>> (for example extcon).
>>
>> There are many different configurations of USB-C ports
>> InterfaceControllers, Muxes/Switches, USB related devices, Alternate
>> Mode devices, PMICs, USB-PDs, ....
>> Could you describe particular one you have problem with, to make the
>> discussion more specific.
> My use-case now is simple. I have a typec port that I need to connect to
> a dual-role USB controller, probably extended with a usb-role-switch
> device and I want to express that connection in the device-tree. I was looking
> for a documented description or example of how to do this but I realize that
> that is not yet available.

USB connector bindings [1] are not enough? Did you look at the example?
I do not know what is exactly your usb-role-switch. Can you provide some
schematics? Or describe which physical lines of USB-C connector are
connected to which chips (including muxes/switches).
Two rules of thumb, I think quite simple:
1. Do you have USB interface controller? Ie chip which is connected to
CC lines of USB-C and performs cable detection, maybe PD negotiations,
etc. This device should be the parent of USB connector node.
2. Connections between connector and other chips should be described
using OF graph.

[1]:
https://www.kernel.org/doc/Documentation/devicetree/bindings/connector/usb-connector.txt

Regards
Andrzej

>
> // Mats
>
>
>
>

