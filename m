Return-Path: <SRS0=ljBG=GL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:38345 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753704AbeCUVol (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 21 Mar 2018 17:44:41 -0400
Date: Wed, 21 Mar 2018 22:44:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next RFC V1 5/5] net: mdio: Add a driver for InES
 time stamping IP core.
Message-ID: <20180321214436.GX24516@lunn.ch>
References: <cover.1521656774.git.richardcochran@gmail.com>
 <e9def53dd0f751d7f5e3df47e604d7ccb6020159.1521656774.git.richardcochran@gmail.com>
 <20180321193315.GR24516@lunn.ch>
 <20180321213636.2mmfveu2vg5qbwpp@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180321213636.2mmfveu2vg5qbwpp@localhost>
Sender: devicetree-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

Hi Richard

> The only other docs that I have is a PDF of the register layout, but I
> don't think I can redistribute that.  Actually, there really isn't any
> detail in that doc at all.

O.K, so lets do the 20 questions approach.

As far as i can see, this is not an MDIO device. It is not connected
to the MDIO bus, it has no MDIO registers, you don't even pass a valid
MDIO address in device tree.

It it actually an MII bus snooper? Does it snoop, or is it actually in
the MII bus, and can modify packets, i.e. insert time stamps as frames
pass over the MII bus?

When the driver talks about having three ports, does that mean it can
be on three different MII busses?

Thanks
   Andrew
