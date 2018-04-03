From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next RFC V1 5/5] net: mdio: Add a driver for InES
 time stamping IP core.
Date: Mon, 2 Apr 2018 21:27:17 -0700
Message-ID: <20180403042717.746strvy4a6s7kk5@localhost>
References: <20180321215729.engnoxpaympvvdc5@localhost>
 <20180321221652.GZ24516@lunn.ch>
 <20180321224702.cbcq3wckmojsrgjf@localhost>
 <20180321235007.GA28402@lunn.ch>
 <20180324171219.vh6wcxbem3hyhkuu@localhost>
 <20180324184858.GF31941@lunn.ch>
 <20180325045151.kq7mjopjwzo6w2vw@localhost>
 <20180325155937.GA12820@lunn.ch>
 <20180325221004.6svjbx54yghwuk7w@localhost>
 <20180325230158.GB19365@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180325230158.GB19365@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 26, 2018 at 01:01:58AM +0200, Andrew Lunn wrote:
> The phylib core code will take the phydev lock before calling into the
> driver. By violating the layering, we are missing on this lock.

That lock protects the fields within the struct phy_device, like the
state field.  None of the time stamping methods need to read or write
any part of that data structure.

Actually it is not true that the core always takes the lock before
calling the driver methods.  See .ack_interrupt for example.

> Maybe the one driver which currently implements these calls does not
> need locking.

It has locking.  If a specific device needs locking to protect the
integrity of its registers or other internal data structures, then it
can and should implement those locks.

Thanks,
Richard
