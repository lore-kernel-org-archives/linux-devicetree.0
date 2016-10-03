From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 net-next] net: phy: Add Edge-rate driver for Microsemi
 PHYs.
Date: Mon, 3 Oct 2016 09:56:56 +0200
Message-ID: <20161003075656.GC18219@lunn.ch>
References: <1475062449-22168-1-git-send-email-Raju.Lakkaraju@microsemi.com>
 <20160928161653.GA25553@lunn.ch>
 <20161003072043.GA24259@microsemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161003072043.GA24259@microsemi.com>
Sender: netdev-owner@vger.kernel.org
To: Raju Lakkaraju <Raju.Lakkaraju@microsemi.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, Allan.Nielsen@microsemi.com
List-Id: devicetree@vger.kernel.org

> > > +        vsc8531_0: ethernet-phy@0 {
> > > +                compatible = "ethernet-phy-id0007.0570";
> > > +                vsc8531,vddmac               = /bits/ 16 <MSCC_VDDMAC_3300>;
> > > +                vsc8531,edge-slowdown        = /bits/ 8  <17>;
> > 
> > No, real values please:
> > 
> >                 vsc8531,vddmac          = <2000>;
> >                 vsc8531,edge-slowdown   = <21>;
> > 
> > The driver should then do the maths to figure out the nearest magic
> > value to write to the register, or complain the settings are out of
> > range with an -EINVAL.

I think you missed my point. Notice my example does not use values
from the table. Is there a reason not to use the PHY with 2000mv? Or
does it break when you don't use one of the 4 listed voltages?

I was wanting you to implement some formula, which given the voltage
and percentage slowdown, returns the magic number. Hence the comment:

> > FYI: No floating point maths are allowed in the kernel.

You need to do integer arithmetic, which is why i suggested mV, not V.

  Andrew
