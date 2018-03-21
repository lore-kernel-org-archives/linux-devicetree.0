Return-Path: <SRS0=W1u3=GL=gmail.com=richardcochran@kernel.org>
Date: Wed, 21 Mar 2018 14:57:29 -0700
From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next RFC V1 5/5] net: mdio: Add a driver for InES
 time stamping IP core.
Message-ID: <20180321215729.engnoxpaympvvdc5@localhost>
References: <cover.1521656774.git.richardcochran@gmail.com>
 <e9def53dd0f751d7f5e3df47e604d7ccb6020159.1521656774.git.richardcochran@gmail.com>
 <20180321193315.GR24516@lunn.ch>
 <20180321213636.2mmfveu2vg5qbwpp@localhost>
 <20180321214436.GX24516@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180321214436.GX24516@lunn.ch>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, David Miller <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Miroslav Lichvar <mlichvar@redhat.com>, Rob Herring <robh+dt@kernel.org>, Willem de Bruijn <willemb@google.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 21, 2018 at 10:44:36PM +0100, Andrew Lunn wrote:
> O.K, so lets do the 20 questions approach.

:)

> As far as i can see, this is not an MDIO device. It is not connected
> to the MDIO bus, it has no MDIO registers, you don't even pass a valid
> MDIO address in device tree.

Right.  There might very well be other products out there that *do*
use MDIO commands.  I know that there are MII time stamping asics and
ip cores on the market, but I don't know all of their creative design
details.
 
> It it actually an MII bus snooper? Does it snoop, or is it actually in
> the MII bus, and can modify packets, i.e. insert time stamps as frames
> pass over the MII bus?

It acts like a "snooper" to provide out of band time stamps, but it
also can modify packets when for the one-step functionality.
 
> When the driver talks about having three ports, does that mean it can
> be on three different MII busses?

Yes.

HTH,
Richard
