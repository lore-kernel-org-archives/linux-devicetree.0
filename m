From: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/3] Enable NAND on Armada-7040-DB board
Date: Mon, 25 Sep 2017 16:53:49 +0200
Message-ID: <20170925145352.13145-1-miquel.raynal@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This series adds support for NAND on Armada-7040-DB board.

Besides standard NAND node addition, it also introduces a new compatible
string for the pxa3xx_nand driver to support the subitilities of A7k/A8k
SoCs, as well as a new property used by the pxa3xx_nand driver to grab a
phandle on the system control node in order to enable the NAND
controller itself.

Regards,
Miquel


Gregory CLEMENT (1):
  arm64: dts: marvell: add NAND support on the 7040-DB board

Miquel Raynal (2):
  Documentation: devicetree: add pxa3xx compatible and syscon property
  mtd: nand: pxa3xx: enable NAND controller if the SoC needs it

 .../devicetree/bindings/mtd/pxa3xx-nand.txt        |  4 +++
 arch/arm64/boot/dts/marvell/armada-7040-db.dts     | 24 +++++++++++++
 arch/arm64/boot/dts/marvell/armada-70x0.dtsi       | 14 ++++++++
 .../boot/dts/marvell/armada-cp110-master.dtsi      |  3 +-
 drivers/mtd/nand/pxa3xx_nand.c                     | 41 +++++++++++++++++++---
 5 files changed, 81 insertions(+), 5 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
