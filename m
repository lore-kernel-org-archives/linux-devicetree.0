From: Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCHv3] drivers/amba: add reset control to amba bus probe
Date: Thu,  8 Aug 2019 09:01:53 -0500
Message-ID: <20190808140153.9156-1-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: dinguyen@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com, keescook@chromium.org, anton@enomsg.org, ccross@android.com, tony.luck@intel.com
List-Id: devicetree@vger.kernel.org

The primecell controller on some SoCs, i.e. SoCFPGA, is held in reset by
default. Until recently, the DMA controller was brought out of reset by the
bootloader(i.e. U-Boot). But a recent change in U-Boot, the peripherals that
are not used are held in reset and are left to Linux to bring them out of
reset.

Add a mechanism for getting the reset property and de-assert the primecell
module from reset if found. This is a not a hard fail if the reset property
is not present in the device tree node, so the driver will continue to probe.

Because there are different variants of the controller that may have multiple
reset signals, the code will find all reset(s) specified and de-assert them.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v3: add a reset_control_put()
    add error handling for -EPROBE_DEFER
v2: move reset control to bus code
    find all reset properties and de-assert them
---
 drivers/amba/bus.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
index 100e798a5c82..00e68ea416ca 100644
--- a/drivers/amba/bus.c
+++ b/drivers/amba/bus.c
@@ -18,6 +18,7 @@
 #include <linux/limits.h>
 #include <linux/clk/clk-conf.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 
 #include <asm/irq.h>
 
@@ -401,6 +402,28 @@ static int amba_device_try_add(struct amba_device *dev, struct resource *parent)
 	ret = amba_get_enable_pclk(dev);
 	if (ret == 0) {
 		u32 pid, cid;
+		int count;
+		struct reset_control *rstc;
+
+		/*
+		 * Find reset control(s) of the amba bus and de-assert them.
+		 */
+		count = reset_control_get_count(&dev->dev);
+		while (count > 0) {
+			rstc = of_reset_control_get_shared_by_index(dev->dev.of_node, count - 1);
+			if (IS_ERR(rstc)) {
+				if (PTR_ERR(rstc) == -EPROBE_DEFER) {
+					ret = -EPROBE_DEFER;
+				} else {
+					dev_err(&dev->dev, "Can't get amba reset!\n");
+				}
+				break;
+			} else {
+				reset_control_deassert(rstc);
+				reset_control_put(rstc);
+				count--;
+			}
+		}
 
 		/*
 		 * Read pid and cid based on size of resource
-- 
2.20.0
