From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next RFC V1 5/5] net: mdio: Add a driver for InES time
 stamping IP core.
Date: Sun, 25 Mar 2018 16:01:49 -0700
Message-ID: <4c3c939f-4cbe-51db-c141-950b85a5b4de@gmail.com>
References: <20180321213636.2mmfveu2vg5qbwpp@localhost>
 <20180321214436.GX24516@lunn.ch> <20180321215729.engnoxpaympvvdc5@localhost>
 <20180321221652.GZ24516@lunn.ch> <20180321224702.cbcq3wckmojsrgjf@localhost>
 <20180321235007.GA28402@lunn.ch> <20180324171219.vh6wcxbem3hyhkuu@localhost>
 <20180324184858.GF31941@lunn.ch> <20180325045151.kq7mjopjwzo6w2vw@localhost>
 <20180325155937.GA12820@lunn.ch> <20180325221004.6svjbx54yghwuk7w@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180325221004.6svjbx54yghwuk7w@localhost>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org



On 03/25/2018 03:10 PM, Richard Cochran wrote:
> On Sun, Mar 25, 2018 at 05:59:37PM +0200, Andrew Lunn wrote:
>>>> 3) How do you limit the MAC/PHY to what the PTP device can do.
>>>
>>> Hm, I don't think this is important.
>>
>> So you are happy that the PTP device will cause the MC/PHY link to
>> break down when it is asked to do something it cannot do?
> 
> No, but I do expect the system designer to use common sense.  No need
> to over engineer this now just to catch hypothetical future problems.
> 
>>> Right, so phylib can operate on phydev->attached_dev->mdiots;
>>
>> So first off, it is not an MDIO device.
> 
> ...
> 
>> To keep lifecycle issues simple, i would also keep it in phydev, not
>> netdev.
>>
>> mdiots as a name is completely wrong. It is not an MDIO device.
> 
> I am well aware of what terms MDIO and MII represent, but our current
> code is hopelessly confused.  Case in point:
> 
> 	static inline struct mii_bus *mdiobus_alloc(void);
> 
> The kernel's 'struct mii_bus' is really only about MDIO and not about
> the rest of MII.  Clearly MII time stamping devices belong on the MII
> bus, so that is where I put them.

They do, if and only if their control path goes through the MDIO bus,
this one does not, see below.

> 
> Or maybe mii_bus should first be renamed to mdio_bus?  That you pave
> the way for introducing a representation of the MII bus.

It would have been ideal to name this structure mdio_bus, because that
is what it indeed is. An argument could be made this is true about a lot
of devices though, e.g: PCIe end point drivers do register a
pci_driver/device, not a pcie_driver/device...

Andrew still has a valid point though that devices are child of their
control bus, not data bus. The data bus here is MII, but the control bus
is here through MMIO register, therefore platform device in Linux's
device driver model so we would expect the

The best that I can think about and it still is a hack in some way, is
to you have your time stamping driver create a proxy mii_bus whose
purpose is just to hook to mdio/phy_device events (such as link changes)
in order to do what is necessary, or at least, this would indicate its
transparent nature towards the MDIO/MDC lines...

What is not great in your current binding is that you created a notion
of "port" which is tied to the timestamper device, whereas it really
seems to be a property of the Ethernet controller, where the datapath
being timestamped resides.

Tangential: the existing PHY time stamping logic should probably be
generalized to a mdio_device (which the phy_device is a specialized
superset of) instead of to the phy_device. This would still allow
existing use cases but it would also allow us to support possible "pure
MDIO" devices would that become some thing in the future.

> 
>> in the future some devices will be MDIO, or I2C, or SPI. Just call it
>> ptpdev. This ptpdev needs to be control bus agnostic. You need a
>> ptpdev core API exposing functions like ptpdev_hwtstamp,
>> ptpdev_rxtstamp, ptpdev_txtstamp, ptpdev_link_change, which take a
>> ptpdev.
> 
> Well, this name is not ideal, since time stamping devices in general
> can time stamp any frame, not just PTP frames.
> 
>> You can then clean up the code in timestamping.c. Code like:
>>
>>         phydev = skb->dev->phydev;
>>         if (likely(phydev->drv->txtstamp)) {
>>                 clone = skb_clone_sk(skb);
>>                 if (!clone)
>>                         return;
>>                 phydev->drv->txtstamp(phydev, clone, type);
>>         }
>>
>> violates the layering, and the locking looks broken.
> 
> Are you sure the locking is broken?  If so, how?
> 
> (This code path has been reviewed more than once.)
> 
> Can you please explain the layering and how this code breaks it?

I see it both ways, you either invoke an operation to timestamp which
goes into an abstract "timestamping device" which invokes a driver to
determine the actual operation, or you can do what you did which was to
augment struct net_device with a phy_device, under the premise this will
be the only type of timestamping capable device we will ever see.

This is no longer holding true, your patches are a testament to that, so
now you need another member: mdiots, as you can see, there is now
overlap between the two, because a phy_device should arguably be
encapsulating a mdiots device object...

> 
> (This code goes back to 2.6.36 and perhaps predates the layers that
> were added later on.)
> 
> Thanks,
> Richard
> 

-- 
Florian
