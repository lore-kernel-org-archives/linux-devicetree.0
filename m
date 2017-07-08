From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 0/6] Macchiatobin updates
Date: Sat, 8 Jul 2017 20:13:17 +0100
Message-ID: <20170708191317.GM4902@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series, based upon the 4.12-rc6 backports branch in the MISL tree:
- adds a maintainer entry for the Macchiatobin board.
- adds GPIO interrupt support to the CP110s
- adds the pinmux entries
- corrects the 5V regulator GPIO entry
- adds support for the I2C mux (used for the SFP slots)
- adds PCIe support

All entries include the appropriate pinmux and GPIO configuration.

PCIe support has not been tested locally as I have no PCIe cards to
test with; this patch includes support for the PCIe reset GPIO signal.
If others can test that patch and let me know whether it works, I would
be most grateful.

 MAINTAINERS                                        |  6 ++
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dts  | 89 +++++++++++++++++++++-
 .../boot/dts/marvell/armada-cp110-master.dtsi      | 11 ++-
 .../arm64/boot/dts/marvell/armada-cp110-slave.dtsi | 11 ++-
 4 files changed, 112 insertions(+), 5 deletions(-)

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
