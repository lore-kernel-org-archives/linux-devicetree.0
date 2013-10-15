From: George Cherian <george.cherian@ti.com>
Subject: [PATCH v2 1/2] phy: omap-usb2: Arrange the include in alphabetical order
Date: Tue, 15 Oct 2013 12:23:44 +0530
Message-ID: <1381820025-31376-2-git-send-email-george.cherian@ti.com>
References: <1381820025-31376-1-git-send-email-george.cherian@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381820025-31376-1-git-send-email-george.cherian@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Cc: tony@atomide.com, balbi@ti.com, kishon@ti.com, rob@landley.net, ijc+devicetree@hellion.org.uk, swarren@wwwdotorg.org, mark.rutland@arm.com, pawel.moll@arm.com, rob.herring@calxeda.com, gregkh@linuxfoundation.org, George Cherian <george.cherian@ti.com>
List-Id: devicetree@vger.kernel.org

This patch arranges the includes in alphabetical order

Signed-off-by: George Cherian <george.cherian@ti.com>
---
 drivers/phy/phy-omap-usb2.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/phy-omap-usb2.c b/drivers/phy/phy-omap-usb2.c
index bfc5c33..3e5f08c 100644
--- a/drivers/phy/phy-omap-usb2.c
+++ b/drivers/phy/phy-omap-usb2.c
@@ -16,20 +16,20 @@
  *
  */
 
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
-#include <linux/of.h>
-#include <linux/io.h>
 #include <linux/usb/omap_usb.h>
-#include <linux/usb/phy_companion.h>
-#include <linux/clk.h>
-#include <linux/err.h>
-#include <linux/pm_runtime.h>
-#include <linux/delay.h>
 #include <linux/usb/omap_control_usb.h>
-#include <linux/phy/phy.h>
-#include <linux/of_platform.h>
+#include <linux/usb/phy_companion.h>
 
 /**
  * omap_usb2_set_comparator - links the comparator present in the sytem with
-- 
1.8.1
