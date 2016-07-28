From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/2] arm64: marvell: add support for the slave CP in Armada 8K
Date: Thu, 28 Jul 2016 16:35:54 +0200
Message-ID: <1469716556-15299-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Omri Itach <omrii-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

The following set of two patches add support for the slave CP HW block
found in the Armada 8K SoCs. As a reminder:

 - Armada 7K is an SoC with one AP and one CP. The AP is the part that
   contains the CPU, cache and a few basic I/Os. The CP is the part
   that contains most interesting I/Os (PCIe, SATA, USB, Ethernet,
   etc.)

 - Armada 8K is an SoC with one AP and two CPs.

This set of patches add support for the second CP found in Armada 8K,
also called the "slave CP110".

Thanks,

Thomas

Thomas Petazzoni (2):
  arm64: dts: marvell: add description for the slave CP110 in Armada 8K
  arm64: dts: marvell: add description for the Armada 8040 dev board

 arch/arm64/boot/dts/marvell/Makefile               |   1 +
 arch/arm64/boot/dts/marvell/armada-8020.dtsi       |   1 +
 .../{armada-8020.dtsi => armada-8040-db.dts}       | 109 ++++++++-
 arch/arm64/boot/dts/marvell/armada-8040.dtsi       |   1 +
 .../arm64/boot/dts/marvell/armada-cp110-slave.dtsi | 246 +++++++++++++++++++++
 5 files changed, 351 insertions(+), 7 deletions(-)
 copy arch/arm64/boot/dts/marvell/{armada-8020.dtsi => armada-8040-db.dts} (55%)
 create mode 100644 arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
