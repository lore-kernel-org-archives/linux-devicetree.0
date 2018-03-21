Return-Path: <SRS0=ljBG=GL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:38441 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753732AbeCUXuM (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 21 Mar 2018 19:50:12 -0400
Date: Thu, 22 Mar 2018 00:50:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next RFC V1 5/5] net: mdio: Add a driver for InES
 time stamping IP core.
Message-ID: <20180321235007.GA28402@lunn.ch>
References: <cover.1521656774.git.richardcochran@gmail.com>
 <e9def53dd0f751d7f5e3df47e604d7ccb6020159.1521656774.git.richardcochran@gmail.com>
 <20180321193315.GR24516@lunn.ch>
 <20180321213636.2mmfveu2vg5qbwpp@localhost>
 <20180321214436.GX24516@lunn.ch>
 <20180321215729.engnoxpaympvvdc5@localhost>
 <20180321221652.GZ24516@lunn.ch>
 <20180321224702.cbcq3wckmojsrgjf@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180321224702.cbcq3wckmojsrgjf@localhost>
Sender: devicetree-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 21, 2018 at 03:47:02PM -0700, Richard Cochran wrote:
> On Wed, Mar 21, 2018 at 11:16:52PM +0100, Andrew Lunn wrote:
> > The MAC drivers are clients of this device. They then use a phandle
> > and specifier:
> > 
> > 	eth0: ethernet-controller@72000 {
> > 		compatible = "marvell,kirkwood-eth";
> > 		#address-cells = <1>;
> > 		#size-cells = <0>;
> > 		reg = <0x72000 0x4000>;
> > 
> > 		timerstamper = <&timestamper 2>
> > 	}
> > 
> > The 2 indicates this MAC is using port 2.
> > 
> > The MAC driver can then do the standard device tree things to follow
> > the phandle to get access to the device and use the API it exports.
> 
> But that would require hacking every last MAC driver.
> 
> I happy to improve the modeling, but the solution should be generic
> and work for every MAC driver.

Well, the solution is generic, in that the phandle can point to a
device anywhere. It could be MMIO, it could be on an MDIO bus,
etc. You just need to make sure you API makes no assumption about how
the device driver talks to the hardware.

How clever is this device? Can it tell the difference between
1000Base-X and SGMII? Can it figure out that the MAC is repeating
every bit 100 times and so has dropped to 10Mbits? Does it understand
EEE? Does it need to know if RGMII or RGMII-ID is being used?

Can such a device really operation without the MAC being involved?  My
feeling is it needs to understand how the MII bus is being used. It
might also be that the device is less capable than the MAC, so you
need to turn off some of the MAC features. I think you are going to
need the MAC actively involved in this.

    Andrew
