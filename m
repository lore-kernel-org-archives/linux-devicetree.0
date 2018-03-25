From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next RFC V1 5/5] net: mdio: Add a driver for InES
 time stamping IP core.
Date: Mon, 26 Mar 2018 01:06:18 +0200
Message-ID: <20180325230618.GC19365@lunn.ch>
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

> > in the future some devices will be MDIO, or I2C, or SPI. Just call it
> > ptpdev. This ptpdev needs to be control bus agnostic. You need a
> > ptpdev core API exposing functions like ptpdev_hwtstamp,
> > ptpdev_rxtstamp, ptpdev_txtstamp, ptpdev_link_change, which take a
> > ptpdev.
> 
> Well, this name is not ideal, since time stamping devices in general
> can time stamp any frame, not just PTP frames.

Hi Richard

I don't really care about the name. I care about the semantics of the
API. How about ieee1588_rxtstamp, ieee1588_txtstamp, etc.

      Andrew
