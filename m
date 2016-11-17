From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 00/13] Various Armada 375 DT warning fixup
Date: Fri, 18 Nov 2016 00:08:17 +0100
Message-ID: <20161117230830.31047-1-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

In this third version as request by Rob Herring I removed the '_' sign
in the unit address. I also added a comment in the device tree files
explaining how this unit address was composed.

Gregory

Gregory CLEMENT (13):
  ARM: dts: armada-375: Add node labels
  ARM: dts: armada-375: Use the node labels
  ARM: dts: armada-375: Fixup mdio DT warning
  ARM: dts: armada-375: Fixup bootrom DT warning
  ARM: dts: armada-375: Fixup devbus DT warning
  ARM: dts: armada-375: Fixup sa-ram DT warning
  ARM: dts: armada-375: Fixup pcie DT warnings
  ARM: dts: armada-375: Fixup pinctrl DT warnings
  ARM: dts: armada-375: Fixup soc DT warning
  ARM: dts: armada-375: Fixup internal-regs DT warning
  ARM: dts: armada-375: Remove skeleton.dtsi
  ARM: dts: armada-375: Fixup memory DT warning
  ARM: dts: armada-375: Fixup ethernet child DT warning

 arch/arm/boot/dts/armada-375-db.dts | 277 ++++++++++++++++++------------------
 arch/arm/boot/dts/armada-375.dtsi   | 102 ++++++++-----
 2 files changed, 205 insertions(+), 174 deletions(-)

-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
