From: Nishanth Menon <nm@ti.com>
Subject: [RFC PATCH 7/8] drivers: mailbox: Make ti-msgmr driver depend on ARCH_K3
Date: Tue, 5 Jun 2018 01:16:28 -0500
Message-ID: <20180605061629.4759-8-nm@ti.com>
References: <20180605061629.4759-1-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180605061629.4759-1-nm@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>, Suman Anna <s-anna@ti.com>
List-Id: devicetree@vger.kernel.org

ti-msgmr driver can support K3 platforms as well.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 drivers/mailbox/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 725dce5ba62d..f87a857d21a5 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -99,12 +99,12 @@ config STI_MBOX
 
 config TI_MESSAGE_MANAGER
 	tristate "Texas Instruments Message Manager Driver"
-	depends on ARCH_KEYSTONE
+	depends on ARCH_KEYSTONE || ARCH_K3
 	help
 	  An implementation of Message Manager slave driver for Keystone
-	  architecture SoCs from Texas Instruments. Message Manager is a
-	  communication entity found on few of Texas Instrument's keystone
-	  architecture SoCs. These may be used for communication between
+	  and K3 architecture SoCs from Texas Instruments. Message Manager
+	  is a communication entity found on few of Texas Instrument's keystone
+	  and K3 architecture SoCs. These may be used for communication between
 	  multiple processors within the SoC. Select this driver if your
 	  platform has support for the hardware block.
 
-- 
2.15.1
