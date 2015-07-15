From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: [PATCH 0/7] Another posting of the Dove PMU series
Date: Wed, 15 Jul 2015 19:58:59 +0100
Message-ID: <20150715185859.GC7557@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

What it says in the subject.  Not hopeful of a successful outcome, so I'm
not going to bother wasting time writing stuff here.

 Documentation/devicetree/bindings/soc/dove/pmu.txt |  56 ++
 arch/arm/Kconfig                                   |   1 +
 arch/arm/boot/dts/dove.dtsi                        | 604 +++++++++++----------
 arch/arm/mach-dove/common.c                        |  25 +
 arch/arm/mach-dove/include/mach/pm.h               |  17 -
 arch/arm/mach-dove/irq.c                           |  87 ---
 arch/arm/mach-mvebu/Kconfig                        |   1 +
 arch/arm/mach-mvebu/dove.c                         |   2 +
 drivers/soc/Makefile                               |   2 +
 drivers/soc/dove/Makefile                          |   1 +
 drivers/soc/dove/pmu.c                             | 512 +++++++++++++++++
 include/linux/soc/dove/pmu.h                       |  24 +
 12 files changed, 942 insertions(+), 390 deletions(-)

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
