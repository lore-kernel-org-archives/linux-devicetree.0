Return-Path: <SRS0=ljBG=GL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:38395 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753744AbeCUWQ4 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 21 Mar 2018 18:16:56 -0400
Date: Wed, 21 Mar 2018 23:16:52 +0100
From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next RFC V1 5/5] net: mdio: Add a driver for InES
 time stamping IP core.
Message-ID: <20180321221652.GZ24516@lunn.ch>
References: <cover.1521656774.git.richardcochran@gmail.com>
 <e9def53dd0f751d7f5e3df47e604d7ccb6020159.1521656774.git.richardcochran@gmail.com>
 <20180321193315.GR24516@lunn.ch>
 <20180321213636.2mmfveu2vg5qbwpp@localhost>
 <20180321214436.GX24516@lunn.ch>
 <20180321215729.engnoxpaympvvdc5@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180321215729.engnoxpaympvvdc5@localhost>
Sender: devicetree-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 21, 2018 at 02:57:29PM -0700, Richard Cochran wrote:
> On Wed, Mar 21, 2018 at 10:44:36PM +0100, Andrew Lunn wrote:
> > O.K, so lets do the 20 questions approach.
> 
> :)
> 
> > As far as i can see, this is not an MDIO device. It is not connected
> > to the MDIO bus, it has no MDIO registers, you don't even pass a valid
> > MDIO address in device tree.
> 
> Right.

O.K, so i suggest we stop trying to model this thing as an MDIO
device. It is really an MMIO device.

> There might very well be other products out there that *do*
> use MDIO commands.  I know that there are MII time stamping asics and
> ip cores on the market, but I don't know all of their creative design
> details.

So i suggest we leave the design for those until we actual see one.
  
> > It it actually an MII bus snooper? Does it snoop, or is it actually in
> > the MII bus, and can modify packets, i.e. insert time stamps as frames
> > pass over the MII bus?
> 
> It acts like a "snooper" to provide out of band time stamps, but it
> also can modify packets when for the one-step functionality.
>  
> > When the driver talks about having three ports, does that mean it can
> > be on three different MII busses?

O.K, so here is how i think it should be done. It is a device which
offers services to other devices. It is not that different to an
interrupt controller, a GPIO controller, etc. Lets follow how they
work in device tree....

The device itself is just another MMIO mapped device in the SoC:

    	timestamper@60000000 {
		compatible = "ines,ptp-ctrl";
                reg = <0x60000000 0x80>;
		#address-cells = <1>;
		#size-cells = <0>;
	};

The MAC drivers are clients of this device. They then use a phandle
and specifier:

	eth0: ethernet-controller@72000 {
		compatible = "marvell,kirkwood-eth";
		#address-cells = <1>;
		#size-cells = <0>;
		reg = <0x72000 0x4000>;

		timerstamper = <&timestamper 2>
	}

The 2 indicates this MAC is using port 2.

The MAC driver can then do the standard device tree things to follow
the phandle to get access to the device and use the API it exports.

    Andrew
