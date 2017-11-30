From: jassisinghbrar@gmail.com
Subject: [PATCH 3/3] MAINTAINERS: Add entry for Socionext ethernet driver
Date: Thu, 30 Nov 2017 21:43:36 +0530
Message-ID: <1512058416-15968-1-git-send-email-jassisinghbrar@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: davem@davemloft.net, arnd.bergmann@linaro.org, ard.biesheuvel@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Jassi Brar <jaswinder.singh@linaro.org>

Add entry for the Socionext Netsec controller driver and DT bindings.

Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa71ab52f..aed9d32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12617,6 +12617,14 @@ F:	drivers/md/raid*
 F:	include/linux/raid/
 F:	include/uapi/linux/raid/
 
+SOCIONEXT (SNI) NETSEC NETWORK DRIVER
+M:	Jassi Brar <jaswinder.singh@linaro.org>
+L:	netdev@vger.kernel.org
+S:	Supported
+S:	Maintained
+F:	drivers/net/ethernet/socionext/netsec.c
+F:	Documentation/devicetree/bindings/net/socionext-netsec.txt
+
 SONIC NETWORK DRIVER
 M:	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
 L:	netdev@vger.kernel.org
-- 
2.7.4
