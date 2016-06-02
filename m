From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: [PATCH 4/4] MAINTAINERS: mtd: Add maintainer for Evatronix NAND
 flash driver
Date: Thu, 2 Jun 2016 09:53:37 +0200
Message-ID: <alpine.DEB.2.02.1606020952560.19416@lnxricardw1.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Benoit Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>David Woodhouse <dwmw2@infradead.org>
Cc: Linux mtd <linux-mtd@lists.infradead.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Signed-off-by: Ricard Wanderlof <ricardw@axis.com>
---
 MAINTAINERS |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9c567a4..d28b863 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4320,6 +4320,12 @@ F:	Documentation/networking/phy.txt
 F:	drivers/of/of_mdio.c
 F:	drivers/of/of_net.c
=20
+EVATRONIX NAND FLASH DRIVER
+M:	Ricard Wanderlof <ricardw@axis.com>
+L:	linux-mtd@lists.infradead.org
+S:	Maintained
+F:	drivers/mtd/nand/evatronix_nand.c
+
 EXT2 FILE SYSTEM
 M:	Jan Kara <jack@suse.com>
 L:	linux-ext4@vger.kernel.org
--=20
1.7.10.4


--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
