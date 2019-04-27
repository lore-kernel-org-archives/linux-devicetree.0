From: Dragan Cvetic <dragan.cvetic@xilinx.com>
Subject: [PATCH V3 12/12] MAINTAINERS: add maintainer for SD-FEC
Date: Sat, 27 Apr 2019 23:05:06 +0100
Message-ID: <1556402706-176271-13-git-send-email-dragan.cvetic@xilinx.com>
References: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de, gregkh@linuxfoundation.org, michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Dragan Cvetic <dragan.cvetic@xilinx.com>, Derek Kiernan <derek.kiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

support

Add maintainer entry for Xilinx SD-FEC driver support.

Signed-off-by: Derek Kiernan <derek.kiernan@xilinx.com>
Signed-off-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b8d72ee..14e9335 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17116,6 +17116,18 @@ S:	Supported
 F:	Documentation/filesystems/xfs.txt
 F:	fs/xfs/
 
+XILINX SD-FEC IP CORES
+M:	Derek Kiernan <derek.kiernan@xilinx.com>
+M:	Dragan Cvetic <dragan.cvetic@xilinx.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/misc/xlnx,sd-fec.txt
+F:	Documentation/misc-devices/xilinx_sdfec.rst
+F:	Documentation/misc-devices/index.rst
+F:	drivers/misc/xilinx_sdfec.c
+F:	drivers/misc/Kconfig
+F:	drivers/misc/Makefile
+F:	include/uapi/misc/xilinx_sdfec.h
+
 XILINX AXI ETHERNET DRIVER
 M:	Anirudha Sarangi <anirudh@xilinx.com>
 M:	John Linn <John.Linn@xilinx.com>
-- 
2.7.4
