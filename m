From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next RFC V1 5/5] net: mdio: Add a driver for InES
 time stamping IP core.
Date: Mon, 2 Apr 2018 20:55:27 -0700
Message-ID: <20180403035527.lgcm6gql3qx4rpuv@localhost>
References: <20180321215729.engnoxpaympvvdc5@localhost>
 <20180321221652.GZ24516@lunn.ch>
 <20180321224702.cbcq3wckmojsrgjf@localhost>
 <20180321235007.GA28402@lunn.ch>
 <20180324171219.vh6wcxbem3hyhkuu@localhost>
 <20180324184858.GF31941@lunn.ch>
 <20180325045151.kq7mjopjwzo6w2vw@localhost>
 <20180325155937.GA12820@lunn.ch>
 <20180325221004.6svjbx54yghwuk7w@localhost>
 <4c3c939f-4cbe-51db-c141-950b85a5b4de@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4c3c939f-4cbe-51db-c141-950b85a5b4de@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Sun, Mar 25, 2018 at 04:01:49PM -0700, Florian Fainelli wrote:
> The best that I can think about and it still is a hack in some way, is
> to you have your time stamping driver create a proxy mii_bus whose
> purpose is just to hook to mdio/phy_device events (such as link changes)
> in order to do what is necessary, or at least, this would indicate its
> transparent nature towards the MDIO/MDC lines...

That won't work at all, AFAICT.  There is only one mii_bus per netdev,
that is one that is attached to the phydev.
 
> Tangential: the existing PHY time stamping logic should probably be
> generalized to a mdio_device (which the phy_device is a specialized
> superset of) instead of to the phy_device. This would still allow
> existing use cases but it would also allow us to support possible "pure
> MDIO" devices would that become some thing in the future.

So this is exactly what I did.  The time stamping methods were pushed
down into the mdio_device.  The active device (mdiots pointer) points
either to a non-PHY mdio_device or to the mdio_device embedded in the
phydev.

Thanks,
Richard
