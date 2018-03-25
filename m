From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next RFC V1 5/5] net: mdio: Add a driver for InES
 time stamping IP core.
Date: Sun, 25 Mar 2018 17:59:37 +0200
Message-ID: <20180325155937.GA12820@lunn.ch>
References: <20180321193315.GR24516@lunn.ch>
 <20180321213636.2mmfveu2vg5qbwpp@localhost>
 <20180321214436.GX24516@lunn.ch>
 <20180321215729.engnoxpaympvvdc5@localhost>
 <20180321221652.GZ24516@lunn.ch>
 <20180321224702.cbcq3wckmojsrgjf@localhost>
 <20180321235007.GA28402@lunn.ch>
 <20180324171219.vh6wcxbem3hyhkuu@localhost>
 <20180324184858.GF31941@lunn.ch>
 <20180325045151.kq7mjopjwzo6w2vw@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180325045151.kq7mjopjwzo6w2vw@localhost>
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 24, 2018 at 09:51:52PM -0700, Richard Cochran wrote:
> On Sat, Mar 24, 2018 at 07:48:58PM +0100, Andrew Lunn wrote:
> > As far as i can see, you have three basic problems:
> > 
> > 1) How do you associate the PTP device to the netdev?
> > 2) How do you get the information you need to configure the PTP device
> 
> Yes, yes.
> 
> > 3) How do you limit the MAC/PHY to what the PTP device can do.
> 
> Hm, I don't think this is important.

So you are happy that the PTP device will cause the MC/PHY link to
break down when it is asked to do something it cannot do? Take for
example a Marvell MAC connected to a Marvell PHY doing 2.5Gbps SGMII
because it can. But say the PTP device cannot be clocked that fast,
and the MII links break.... You as a PTP maintainer might be happy
with that, but as a PHY maintainer, i'm not too happy with this.

> Right, so phylib can operate on phydev->attached_dev->mdiots;

So first off, it is not an MDIO device. You current code is a horrible
hack which gets a NACK. Use a phandle, and have
of_mdiobus_register_phy() follow the phandle to get the device.

To keep lifecycle issues simple, i would also keep it in phydev, not
netdev.

mdiots as a name is completely wrong. It is not an MDIO device.  Maybe
in the future some devices will be MDIO, or I2C, or SPI. Just call it
ptpdev. This ptpdev needs to be control bus agnostic. You need a
ptpdev core API exposing functions like ptpdev_hwtstamp,
ptpdev_rxtstamp, ptpdev_txtstamp, ptpdev_link_change, which take a
ptpdev. Have phy_link_change call ptpdev_link_change. You have the
flexibility in that if in the future you do care that your ptpdev
breaks the MAC-PHY link, you can add a ptpdev_validate_advertise,
which allows the ptpdev to mask out link modes it does not support.

Your ptp device, when probing needs to register with the ptpdev core,
passing a generic ptpdev_ops for the operations its support. How it
talks to the device, MMIO, SPI, I2C is hidden within the device
driver.

You can then clean up the code in timestamping.c. Code like:

        phydev = skb->dev->phydev;
        if (likely(phydev->drv->txtstamp)) {
                clone = skb_clone_sk(skb);
                if (!clone)
                        return;
                phydev->drv->txtstamp(phydev, clone, type);
        }

violates the layering, and the locking looks broken. Add a
phy_txtstamp() call to phylib. It can then either call into the PHY
driver, or use the call the ptpdev API, or -EOPNOTSUP.

	Andrew
