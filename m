From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 8/9] [Xilinx] xilinx_hwicap: Update driver to use generic io
	accessors
Date: Fri, 23 Jul 2010 13:57:42 -0700
Message-ID: <e8b3593c-3be3-4b4e-aabd-e3baeb4e792a@VA3EHSMHS026.ehs.local>
References: <1279918663-29960-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-4-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-5-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-6-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-7-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-8-git-send-email-stephen.neuendorffer@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1279918663-29960-8-git-send-email-stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

out_be32 and in_be32 are mainly powerpc-isms.  Switch
to using ioread32be and iowrite32be instead.  This allows
the code to be used on x86 or ARM, for instance.

Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
 drivers/char/xilinx_hwicap/buffer_icap.c   |   16 +++++-----
 drivers/char/xilinx_hwicap/fifo_icap.c     |   39 +++++++++++++--------------
 drivers/char/xilinx_hwicap/xilinx_hwicap.c |    1 +
 3 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/char/xilinx_hwicap/buffer_icap.c b/drivers/char/xilinx_hwicap/buffer_icap.c
index 05d8977..bc361fc 100644
--- a/drivers/char/xilinx_hwicap/buffer_icap.c
+++ b/drivers/char/xilinx_hwicap/buffer_icap.c
@@ -87,7 +87,7 @@
  **/
 u32 buffer_icap_get_status(struct hwicap_drvdata *drvdata)
 {
-	return in_be32(drvdata->base_address + XHI_STATUS_REG_OFFSET);
+	return ioread32be(drvdata->base_address + XHI_STATUS_REG_OFFSET);
 }
 
 /**
@@ -101,7 +101,7 @@ u32 buffer_icap_get_status(struct hwicap_drvdata *drvdata)
 static inline u32 buffer_icap_get_bram(void __iomem *base_address,
 		u32 offset)
 {
-	return in_be32(base_address + (offset << 2));
+	return ioread32be(base_address + (offset << 2));
 }
 
 /**
@@ -114,7 +114,7 @@ static inline u32 buffer_icap_get_bram(void __iomem *base_address,
  **/
 static inline bool buffer_icap_busy(void __iomem *base_address)
 {
-	u32 status = in_be32(base_address + XHI_STATUS_REG_OFFSET);
+	u32 status = ioread32be(base_address + XHI_STATUS_REG_OFFSET);
 	return (status & 1) == XHI_NOT_FINISHED;
 }
 
@@ -129,7 +129,7 @@ static inline bool buffer_icap_busy(void __iomem *base_address)
 static inline void buffer_icap_set_size(void __iomem *base_address,
 		u32 data)
 {
-	out_be32(base_address + XHI_SIZE_REG_OFFSET, data);
+	iowrite32be(data, base_address + XHI_SIZE_REG_OFFSET);
 }
 
 /**
@@ -143,7 +143,7 @@ static inline void buffer_icap_set_size(void __iomem *base_address,
 static inline void buffer_icap_set_offset(void __iomem *base_address,
 		u32 data)
 {
-	out_be32(base_address + XHI_BRAM_OFFSET_REG_OFFSET, data);
+	iowrite32be(data, base_address + XHI_BRAM_OFFSET_REG_OFFSET);
 }
 
 /**
@@ -159,7 +159,7 @@ static inline void buffer_icap_set_offset(void __iomem *base_address,
 static inline void buffer_icap_set_rnc(void __iomem *base_address,
 		u32 data)
 {
-	out_be32(base_address + XHI_RNC_REG_OFFSET, data);
+	iowrite32be(data, base_address + XHI_RNC_REG_OFFSET);
 }
 
 /**
@@ -174,7 +174,7 @@ static inline void buffer_icap_set_rnc(void __iomem *base_address,
 static inline void buffer_icap_set_bram(void __iomem *base_address,
 		u32 offset, u32 data)
 {
-	out_be32(base_address + (offset << 2), data);
+	iowrite32be(data, base_address + (offset << 2));
 }
 
 /**
@@ -255,7 +255,7 @@ static int buffer_icap_device_write(struct hwicap_drvdata *drvdata,
  **/
 void buffer_icap_reset(struct hwicap_drvdata *drvdata)
 {
-    out_be32(drvdata->base_address + XHI_STATUS_REG_OFFSET, 0xFEFE);
+	iowrite32be(0xFEFE, drvdata->base_address + XHI_STATUS_REG_OFFSET);
 }
 
 /**
diff --git a/drivers/char/xilinx_hwicap/fifo_icap.c b/drivers/char/xilinx_hwicap/fifo_icap.c
index 02225eb..062df1d 100644
--- a/drivers/char/xilinx_hwicap/fifo_icap.c
+++ b/drivers/char/xilinx_hwicap/fifo_icap.c
@@ -94,7 +94,7 @@ static inline void fifo_icap_fifo_write(struct hwicap_drvdata *drvdata,
 		u32 data)
 {
 	dev_dbg(drvdata->dev, "fifo_write: %x\n", data);
-	out_be32(drvdata->base_address + XHI_WF_OFFSET, data);
+	iowrite32be(data, drvdata->base_address + XHI_WF_OFFSET);
 }
 
 /**
@@ -105,7 +105,7 @@ static inline void fifo_icap_fifo_write(struct hwicap_drvdata *drvdata,
  **/
 static inline u32 fifo_icap_fifo_read(struct hwicap_drvdata *drvdata)
 {
-	u32 data = in_be32(drvdata->base_address + XHI_RF_OFFSET);
+	u32 data = ioread32be(drvdata->base_address + XHI_RF_OFFSET);
 	dev_dbg(drvdata->dev, "fifo_read: %x\n", data);
 	return data;
 }
@@ -118,7 +118,7 @@ static inline u32 fifo_icap_fifo_read(struct hwicap_drvdata *drvdata)
 static inline void fifo_icap_set_read_size(struct hwicap_drvdata *drvdata,
 		u32 data)
 {
-	out_be32(drvdata->base_address + XHI_SZ_OFFSET, data);
+	iowrite32be(data, drvdata->base_address + XHI_SZ_OFFSET);
 }
 
 /**
@@ -127,7 +127,7 @@ static inline void fifo_icap_set_read_size(struct hwicap_drvdata *drvdata,
  **/
 static inline void fifo_icap_start_config(struct hwicap_drvdata *drvdata)
 {
-	out_be32(drvdata->base_address + XHI_CR_OFFSET, XHI_CR_WRITE_MASK);
+	iowrite32be(XHI_CR_WRITE_MASK, drvdata->base_address + XHI_CR_OFFSET);
 	dev_dbg(drvdata->dev, "configuration started\n");
 }
 
@@ -137,7 +137,7 @@ static inline void fifo_icap_start_config(struct hwicap_drvdata *drvdata)
  **/
 static inline void fifo_icap_start_readback(struct hwicap_drvdata *drvdata)
 {
-	out_be32(drvdata->base_address + XHI_CR_OFFSET, XHI_CR_READ_MASK);
+	iowrite32be(XHI_CR_READ_MASK, drvdata->base_address + XHI_CR_OFFSET);
 	dev_dbg(drvdata->dev, "readback started\n");
 }
 
@@ -159,7 +159,7 @@ static inline void fifo_icap_start_readback(struct hwicap_drvdata *drvdata)
  **/
 u32 fifo_icap_get_status(struct hwicap_drvdata *drvdata)
 {
-	u32 status = in_be32(drvdata->base_address + XHI_SR_OFFSET);
+	u32 status = ioread32be(drvdata->base_address + XHI_SR_OFFSET);
 	dev_dbg(drvdata->dev, "Getting status = %x\n", status);
 	return status;
 }
@@ -170,7 +170,7 @@ u32 fifo_icap_get_status(struct hwicap_drvdata *drvdata)
  **/
 static inline u32 fifo_icap_busy(struct hwicap_drvdata *drvdata)
 {
-	u32 status = in_be32(drvdata->base_address + XHI_SR_OFFSET);
+	u32 status = ioread32be(drvdata->base_address + XHI_SR_OFFSET);
 	return (status & XHI_SR_DONE_MASK) ? 0 : 1;
 }
 
@@ -183,7 +183,7 @@ static inline u32 fifo_icap_busy(struct hwicap_drvdata *drvdata)
 static inline u32 fifo_icap_write_fifo_vacancy(
 		struct hwicap_drvdata *drvdata)
 {
-	return in_be32(drvdata->base_address + XHI_WFV_OFFSET);
+	return ioread32be(drvdata->base_address + XHI_WFV_OFFSET);
 }
 
 /**
@@ -195,7 +195,7 @@ static inline u32 fifo_icap_write_fifo_vacancy(
 static inline u32 fifo_icap_read_fifo_occupancy(
 		struct hwicap_drvdata *drvdata)
 {
-	return in_be32(drvdata->base_address + XHI_RFO_OFFSET);
+	return ioread32be(drvdata->base_address + XHI_RFO_OFFSET);
 }
 
 /**
@@ -361,13 +361,12 @@ void fifo_icap_reset(struct hwicap_drvdata *drvdata)
 	 * Reset the device by setting/clearing the RESET bit in the
 	 * Control Register.
 	 */
-	reg_data = in_be32(drvdata->base_address + XHI_CR_OFFSET);
+	reg_data = ioread32be(drvdata->base_address + XHI_CR_OFFSET);
 
-	out_be32(drvdata->base_address + XHI_CR_OFFSET,
-				reg_data | XHI_CR_SW_RESET_MASK);
-
-	out_be32(drvdata->base_address + XHI_CR_OFFSET,
-				reg_data & (~XHI_CR_SW_RESET_MASK));
+	iowrite32be(reg_data | XHI_CR_SW_RESET_MASK,
+		    drvdata->base_address + XHI_CR_OFFSET);
+	iowrite32be(reg_data & (~XHI_CR_SW_RESET_MASK),
+		    drvdata->base_address + XHI_CR_OFFSET);
 
 }
 
@@ -382,12 +381,12 @@ void fifo_icap_flush_fifo(struct hwicap_drvdata *drvdata)
 	 * Flush the FIFO by setting/clearing the FIFO Clear bit in the
 	 * Control Register.
 	 */
-	reg_data = in_be32(drvdata->base_address + XHI_CR_OFFSET);
+	reg_data = ioread32be(drvdata->base_address + XHI_CR_OFFSET);
 
-	out_be32(drvdata->base_address + XHI_CR_OFFSET,
-				reg_data | XHI_CR_FIFO_CLR_MASK);
+	iowrite32be(reg_data | XHI_CR_FIFO_CLR_MASK,
+		    drvdata->base_address + XHI_CR_OFFSET);
 
-	out_be32(drvdata->base_address + XHI_CR_OFFSET,
-				reg_data & (~XHI_CR_FIFO_CLR_MASK));
+	iowrite32be(reg_data & (~XHI_CR_FIFO_CLR_MASK),
+		    drvdata->base_address + XHI_CR_OFFSET);
 }
 
diff --git a/drivers/char/xilinx_hwicap/xilinx_hwicap.c b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
index 6172689..7d0f0fb 100644
--- a/drivers/char/xilinx_hwicap/xilinx_hwicap.c
+++ b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
@@ -95,6 +95,7 @@
 /* For open firmware. */
 #include <linux/of_device.h>
 #include <linux/of_platform.h>
+#include <linux/of_address.h>
 #endif
 
 #include "xilinx_hwicap.h"
-- 
1.5.6.6



This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
