From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next RFC V1 5/5] net: mdio: Add a driver for InES
 time stamping IP core.
Date: Sun, 25 Mar 2018 15:14:45 -0700
Message-ID: <20180325221445.bmz7jg44fpg6clbp@localhost>
References: <20180321213636.2mmfveu2vg5qbwpp@localhost>
 <20180321214436.GX24516@lunn.ch>
 <20180321215729.engnoxpaympvvdc5@localhost>
 <20180321221652.GZ24516@lunn.ch>
 <20180321224702.cbcq3wckmojsrgjf@localhost>
 <20180321235007.GA28402@lunn.ch>
 <20180324171219.vh6wcxbem3hyhkuu@localhost>
 <20180324184858.GF31941@lunn.ch>
 <20180325045151.kq7mjopjwzo6w2vw@localhost>
 <20180325155937.GA12820@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180325155937.GA12820@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-Id: devicetree@vger.kernel.org

On Sun, Mar 25, 2018 at 05:59:37PM +0200, Andrew Lunn wrote:
> To keep lifecycle issues simple, i would also keep it in phydev, not
> netdev.

Okay.

Since we don't have any representation for MII anyhow, it seems equally
fitting to attach this to the PHY's data structure as to the MAC's.

Thanks,
Richard
