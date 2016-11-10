From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 00/14] Various Armada 375 DT warning fixup
Date: Thu, 10 Nov 2016 01:09:46 +0100
Message-ID: <20161110001000.10619-1-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

This series follow the work done on the Armada 370/XP:
http://lists.infradead.org/pipermail/linux-arm-kernel/2016-November/466006.html

This patchset fixes up various warning from the DT compiler when using
the flag W=1 with make. This time there is no remaining warnings.

As there was only one board associated to Armada 375 its dts have been
fully converted to use the labels.

Gregory

Gregory CLEMENT (14):
  ARM: dts: armada-375: Add node labels
  ARM: dts: armada-375: Use the node labels
  ARM: dts: armada-375: Fixup mdio DT warning
  ARM: dts: armada-375: Fixup bootrom DT warning
  ARM: dts: armada-375: Fixup devbus DT warning
  ARM: dts: armada-375: Fixup sa-ram DT warning
  ARM: dts: armada-375: Fixup pcie DT warnings
  ARM: dts: armada-375: Fixup pcie DT warnings
  ARM: dts: armada-375: Fixup pinctrl DT warnings
  ARM: dts: armada-375: Fixup soc DT warning
  ARM: dts: armada-375: Fixup internal-regs DT warning
  ARM: dts: armada-375: Remove skeleton.dtsi
  ARM: dts: armada-375: Fixup memory DT warning
  ARM: dts: armada-375: Fixup ethernet child DT warning

 arch/arm/boot/dts/armada-375-db.dts | 273 ++++++++++++++++++------------------
 arch/arm/boot/dts/armada-375.dtsi   |  80 +++++------
 2 files changed, 179 insertions(+), 174 deletions(-)

-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
