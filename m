From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH net-next 8/8] MAINTAINERS: Add entry for Microsemi Ethernet switches
Date: Fri, 23 Mar 2018 21:11:17 +0100
Message-ID: <20180323201117.8416-9-alexandre.belloni@bootlin.com>
References: <20180323201117.8416-1-alexandre.belloni@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180323201117.8416-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>
Cc: Allan Nielsen <Allan.Nielsen@microsemi.com>, razvan.stefanescu@nxp.com, po.liu@nxp.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Add myself as a maintainer for the Microsemi Ethernet switches.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 14ce8b290fea..45be80225130 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9177,6 +9177,12 @@ F:	include/linux/cciss*.h
 F:	include/uapi/linux/cciss*.h
 F:	Documentation/scsi/smartpqi.txt
 
+MICROSEMI ETHERNET SWITCH DRIVER
+M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
+L:	netdev@vger.kernel.org
+S:	Supported
+F:	drivers/net/ethernet/mscc/
+
 MICROSOFT SURFACE PRO 3 BUTTON DRIVER
 M:	Chen Yu <yu.c.chen@intel.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.16.2
