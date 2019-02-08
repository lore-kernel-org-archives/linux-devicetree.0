From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next v2 0/6] Add comphy support for Armada 38x
Date: Fri, 8 Feb 2019 10:04:35 +0000
Message-ID: <20190208100435.bljszwiwc26wwpfj@shell.armlinux.org.uk>
References: <20190207161825.ueinmyf6ygjiqzzy@shell.armlinux.org.uk>
 <20190207.181049.1229639710283404215.davem@davemloft.net>
 <20190208085821.7556a18d@windsurf>
 <295924f0-1007-4b39-189b-1b21e4bf1b86@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <295924f0-1007-4b39-189b-1b21e4bf1b86@ti.com>
Sender: netdev-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, David Miller <davem@davemloft.net>, andrew@lunn.ch, gregory.clement@bootlin.com, jason@lakedaemon.net, sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, netdev@vger.kernel.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 08, 2019 at 02:52:26PM +0530, Kishon Vijay Abraham I wrote:
> Hi,
> 
> On 08/02/19 1:28 PM, Thomas Petazzoni wrote:
> > Hello David,
> > 
> > On Thu, 07 Feb 2019 18:10:49 -0800 (PST)
> > David Miller <davem@davemloft.net> wrote:
> > 
> >> From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
> >> Date: Thu, 7 Feb 2019 16:18:25 +0000
> >>
> >>> This series adds support for the comphy for Armada 38x, which allows
> >>> these SoCs to use 2500BASE-X mode with appropriate SFP modules.
> >>>
> >>> Tested on SolidRun Clearfog after updating for the 5.0 merge window
> >>> changes.  
> >>
> >> Series applied, thanks Russell.
> > 
> > This series contained:
> > 
> >  - Device Tree bindings that had not been ACKed by the DT bindings
> >    maintainers, one of which should have been merged through the
> >    drivers/phy maintainer tree.
> > 
> >  - A brand new drivers/phy driver that had not been ACKed by the
> >    drivers/phy maintainer.
> 
> The PHY driver looks good to me. But I think it might still be better to take
> it via PHY tree since there are other Marvell drivers that are getting merged
> and will result in conflicts in Kconfig and Makefile.

... which would have the effect that if the DTS and mvneta changes
are merged ahead of the PHY changes into Linus' tree, mvneta breaks.
Breaking stuff in the merge window is something that needs to be
avoided - that's the exact time that bisects need to work.

Splitting a dependent patch series up for different subsystems to
avoid conflicts is not always a good idea.

Linus has said many times that he's okay dealing with simple
conflicts during the merge window (normally wanting the requester to
at least be aware of the conflict.)  Yet, some seem to have fostered
an idea that "conflicts are bad and must be avoided at all costs".
I've sent Linus several pull requests with conflicts during the age
of git, and the conflict resolution diff in the pull request email.
It's *never* been a problem, even if Linus has decided a slightly
different resolution is better.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
