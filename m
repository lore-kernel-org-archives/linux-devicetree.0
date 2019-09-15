From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: dts: imx6dl: SolidRun: add phy node with 100Mb/s
 max-speed
Date: Sun, 15 Sep 2019 13:29:29 +0100
Message-ID: <20190915122929.GB25745@shell.armlinux.org.uk>
References: <20190910155507.491230-1-tinywrkb@gmail.com>
 <20190910185033.GD9761@lunn.ch>
 <87muf6oyvr.fsf@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87muf6oyvr.fsf@tarshish>
Sender: linux-kernel-owner@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: Andrew Lunn <andrew@lunn.ch>, tinywrkb <tinywrkb@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 15, 2019 at 09:30:00AM +0300, Baruch Siach wrote:
> Hi Andrew,
> 
> On Tue, Sep 10 2019, Andrew Lunn wrote:
> > On Tue, Sep 10, 2019 at 06:55:07PM +0300, tinywrkb wrote:
> >> Cubox-i Solo/DualLite carrier board has 100Mb/s magnetics while the
> >> Atheros AR8035 PHY on the MicroSoM v1.3 CPU module is a 1GbE PHY device.
> >>
> >> Since commit 5502b218e001 ("net: phy: use phy_resolve_aneg_linkmode in
> >> genphy_read_status") ethernet is broken on Cubox-i Solo/DualLite devices.
> >
> > Hi Tinywrkb
> >
> > You emailed lots of people, but missed the PHY maintainers :-(
> >
> > Are you sure this is the patch which broken it? Did you do a git
> > bisect.
> 
> Tinywrkb confirmed to me in private communication that revert of
> 5502b218e001 fixes Ethernet for him on effected system.
> 
> He also referred me to an old Cubox-i spec that lists 10/100 Ethernet
> only for i.MX6 Solo/DualLite variants of Cubox-i. It turns out that
> there was a plan to use a different 10/100 PHY for Solo/DualLite
> SOMs. This plan never materialized. All SolidRun i.MX6 SOMs use the same
> AR8035 PHY that supports 1Gb.
> 
> Commit 5502b218e001 might be triggering a hardware issue on the affected
> Cubox-i. I could not reproduce the issue here with Cubox-i and a Dual
> SOM variant running v5.3-rc8. I have no Solo/DualLite variant handy at
> the moment.

With 5.3 due out today, I'll be updating my systems to that, which will
include quite a few variants of the Hummingboard.

It looks like one of my Solo Hummingboards (running a fully up to date
Fedora 28) has encountered a problem, so needs a reboot...

systemd-journald[436]: Failed to retrieve credentials for PID 17906, ignoring: Cannot allocate memory
systemd-journald[436]: Failed to open runtime journal: Cannot allocate memory

# ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
...
root       436  0.0  5.2 3128140 26392 ?       Ss   Aug03   1:20 /usr/lib/systemd/systemd-journald
# uptime
 13:28:41 up 42 days, 19:13,  1 user,  load average: 0.00, 0.03, 0.00

Looks like systemd-journald has a rather bad memory leak...

#include <std-complaints-about-systemd>

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
