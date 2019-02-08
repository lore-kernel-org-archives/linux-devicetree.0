From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next v2 0/6] Add comphy support for Armada 38x
Date: Fri, 8 Feb 2019 10:06:45 +0000
Message-ID: <20190208100645.pkv6dwy5p3nepq6s@shell.armlinux.org.uk>
References: <20190207161825.ueinmyf6ygjiqzzy@shell.armlinux.org.uk>
 <20190207.181049.1229639710283404215.davem@davemloft.net>
 <20190208085821.7556a18d@windsurf>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190208085821.7556a18d@windsurf>
Sender: netdev-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: David Miller <davem@davemloft.net>, andrew@lunn.ch, gregory.clement@bootlin.com, jason@lakedaemon.net, kishon@ti.com, sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, netdev@vger.kernel.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 08, 2019 at 08:58:21AM +0100, Thomas Petazzoni wrote:
> Hello David,
> 
> On Thu, 07 Feb 2019 18:10:49 -0800 (PST)
> David Miller <davem@davemloft.net> wrote:
> 
> > From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
> > Date: Thu, 7 Feb 2019 16:18:25 +0000
> > 
> > > This series adds support for the comphy for Armada 38x, which allows
> > > these SoCs to use 2500BASE-X mode with appropriate SFP modules.
> > > 
> > > Tested on SolidRun Clearfog after updating for the 5.0 merge window
> > > changes.  
> > 
> > Series applied, thanks Russell.
> 
> This series contained:
> 
>  - Device Tree bindings that had not been ACKed by the DT bindings
>    maintainers, one of which should have been merged through the
>    drivers/phy maintainer tree.

Actually, it was reviewed by Rob on 3rd December, but I omitted to
add the attributation he sent.  So that point is false.

> 
>  - A brand new drivers/phy driver that had not been ACKed by the
>    drivers/phy maintainer.
> 
>  - Changes to platform Device Tree that should have been merged through
>    the platform tree.
> 
> Only patches 4/6 and 5/6 should go through the net-next tree, all the
> other patches should have gone through other trees.
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
