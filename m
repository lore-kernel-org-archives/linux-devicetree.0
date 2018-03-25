From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next RFC V1 5/5] net: mdio: Add a driver for InES
 time stamping IP core.
Date: Mon, 26 Mar 2018 01:01:58 +0200
Message-ID: <20180325230158.GB19365@lunn.ch>
References: <20180321214436.GX24516@lunn.ch>
 <20180321215729.engnoxpaympvvdc5@localhost>
 <20180321221652.GZ24516@lunn.ch>
 <20180321224702.cbcq3wckmojsrgjf@localhost>
 <20180321235007.GA28402@lunn.ch>
 <20180324171219.vh6wcxbem3hyhkuu@localhost>
 <20180324184858.GF31941@lunn.ch>
 <20180325045151.kq7mjopjwzo6w2vw@localhost>
 <20180325155937.GA12820@lunn.ch>
 <20180325221004.6svjbx54yghwuk7w@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180325221004.6svjbx54yghwuk7w@localhost>
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

> > You can then clean up the code in timestamping.c. Code like:
> > 
> >         phydev = skb->dev->phydev;
> >         if (likely(phydev->drv->txtstamp)) {
> >                 clone = skb_clone_sk(skb);
> >                 if (!clone)
> >                         return;
> >                 phydev->drv->txtstamp(phydev, clone, type);
> >         }
> > 
> > violates the layering, and the locking looks broken.
> 
> Are you sure the locking is broken?  If so, how?

As a general rule of thumb, locking is performed in the core when
possible. Experience has shown that device driver writers get locking
wrong more often than core code writers. So doing it once in the core
results in less bugs.

The phylib core code will take the phydev lock before calling into the
driver. By violating the layering, we are missing on this lock.

Maybe the one driver which currently implements these calls does not
need locking. But after the Marvell DSA work, we have most of the code
needed to implement support for the Marvell PHY PTP. It has pretty
similar registers. That would need the phydev lock to be held, because
we need to swap to different pages, so any other calls happening in
parallel are going to see registers from the wrong page. I don't want
to have to put these locks in the driver, that leads to bugs. The core
should do it.

       Andrew
