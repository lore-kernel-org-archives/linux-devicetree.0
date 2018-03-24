Return-Path: <SRS0=/B89=GO=gmail.com=richardcochran@kernel.org>
Date: Sat, 24 Mar 2018 10:12:19 -0700
From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next RFC V1 5/5] net: mdio: Add a driver for InES
 time stamping IP core.
Message-ID: <20180324171219.vh6wcxbem3hyhkuu@localhost>
References: <cover.1521656774.git.richardcochran@gmail.com>
 <e9def53dd0f751d7f5e3df47e604d7ccb6020159.1521656774.git.richardcochran@gmail.com>
 <20180321193315.GR24516@lunn.ch>
 <20180321213636.2mmfveu2vg5qbwpp@localhost>
 <20180321214436.GX24516@lunn.ch>
 <20180321215729.engnoxpaympvvdc5@localhost>
 <20180321221652.GZ24516@lunn.ch>
 <20180321224702.cbcq3wckmojsrgjf@localhost>
 <20180321235007.GA28402@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180321235007.GA28402@lunn.ch>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Mar 22, 2018 at 12:50:07AM +0100, Andrew Lunn wrote:
> How clever is this device? Can it tell the difference between
> 1000Base-X and SGMII? Can it figure out that the MAC is repeating
> every bit 100 times and so has dropped to 10Mbits? Does it understand
> EEE? Does it need to know if RGMII or RGMII-ID is being used?

This device isn't configurable at run time for any of those AFAICT.
Those decisions are made when the IP core is synthesized as part of
the HW design.

> Can such a device really operation without the MAC being involved?  My
> feeling is it needs to understand how the MII bus is being used. It
> might also be that the device is less capable than the MAC, so you
> need to turn off some of the MAC features. I think you are going to
> need the MAC actively involved in this.

You are right in that this particular device *does* need to know the
link speed.  I have neglected that part for this RFC.  I'm looking for
a notification based method of informing the device of link speed
changes, but without hacking any MAC driver.

In general, we might see devices one day that care about things like
EEE for example, but let's cross that bridge when we come to it.  In
the case of EEE, when the user enables it via ethtool we can tell the
time stamping device directly without hacking the MAC driver.

Thanks,
Richard
