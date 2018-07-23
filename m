From: Pengbo Mu <pengbo.mu@nxp.com>
Subject: [PATCH v6 1/4] usb: dwc3: add global soc bus configuration reg0
Date: Mon, 23 Jul 2018 11:06:21 +0800
Message-ID: <1532315184-22985-1-git-send-email-pengbo.mu@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradeadorg, ran.wang_1@nxp.com, pengbo.mu@nxp.com
List-Id: devicetree@vger.kernel.org

Add the macro definition for global soc bus configuration
register 0

Signed-off-by: Changming Huang <jerry.huang@nxp.com>
Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
Signed-off-by: Pengbo Mu <pengbo.mu@nxp.com>
---
Changes in v6:
 - delete some register unrelated
Changes in v5:
 - no change
Changes in v4:
 - no change
Changes in v3:
 - no change
Changes in v2:
 - split the patch
 - add more macro definition for soc bus configuration register
---
 drivers/usb/dwc3/core.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 285ce0e..213b939 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -163,6 +163,17 @@
 
 /* Bit fields */
 
+/* Global SoC Bus Configuration INCRx Register 0 */
+#define DWC3_GSBUSCFG0_INCR256BRSTENA	(1 << 7) /* INCR256 burst */
+#define DWC3_GSBUSCFG0_INCR128BRSTENA	(1 << 6) /* INCR128 burst */
+#define DWC3_GSBUSCFG0_INCR64BRSTENA	(1 << 5) /* INCR64 burst */
+#define DWC3_GSBUSCFG0_INCR32BRSTENA	(1 << 4) /* INCR32 burst */
+#define DWC3_GSBUSCFG0_INCR16BRSTENA	(1 << 3) /* INCR16 burst */
+#define DWC3_GSBUSCFG0_INCR8BRSTENA	(1 << 2) /* INCR8 burst */
+#define DWC3_GSBUSCFG0_INCR4BRSTENA	(1 << 1) /* INCR4 burst */
+#define DWC3_GSBUSCFG0_INCRBRSTENA	(1 << 0) /* undefined length enable */
+#define DWC3_GSBUSCFG0_INCRBRST_MASK	0xff
+
 /* Global Debug Queue/FIFO Space Available Register */
 #define DWC3_GDBGFIFOSPACE_NUM(n)	((n) & 0x1f)
 #define DWC3_GDBGFIFOSPACE_TYPE(n)	(((n) << 5) & 0x1e0)
-- 
2.7.4
