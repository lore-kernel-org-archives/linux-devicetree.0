From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 7/9] [Xilinx] xilinx_hwicap: use linux/io.h instead of asm/io.h
Date: Fri, 23 Jul 2010 13:57:41 -0700
Message-ID: <bd5961af-2af1-4f6d-a220-a03fdbb19453@VA3EHSMHS017.ehs.local>
References: <1279918663-29960-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-4-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-5-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-6-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-7-git-send-email-stephen.neuendorffer@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1279918663-29960-7-git-send-email-stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
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

Better style, and it gives access to the asm-generic/iomap.h
accessors in all architectures.

Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
 drivers/char/xilinx_hwicap/buffer_icap.h   |    3 +--
 drivers/char/xilinx_hwicap/fifo_icap.h     |    3 +--
 drivers/char/xilinx_hwicap/xilinx_hwicap.c |    3 +--
 drivers/char/xilinx_hwicap/xilinx_hwicap.h |    3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/char/xilinx_hwicap/buffer_icap.h b/drivers/char/xilinx_hwicap/buffer_icap.h
index d4f419e..aa859b0 100644
--- a/drivers/char/xilinx_hwicap/buffer_icap.h
+++ b/drivers/char/xilinx_hwicap/buffer_icap.h
@@ -36,8 +36,7 @@
 #include <linux/types.h>
 #include <linux/cdev.h>
 #include <linux/platform_device.h>
-
-#include <asm/io.h>
+#include <linux/io.h>
 #include "xilinx_hwicap.h"
 
 /* Loads a partial bitstream from system memory. */
diff --git a/drivers/char/xilinx_hwicap/fifo_icap.h b/drivers/char/xilinx_hwicap/fifo_icap.h
index 4c9dd9a..b266c40 100644
--- a/drivers/char/xilinx_hwicap/fifo_icap.h
+++ b/drivers/char/xilinx_hwicap/fifo_icap.h
@@ -36,8 +36,7 @@
 #include <linux/types.h>
 #include <linux/cdev.h>
 #include <linux/platform_device.h>
-
-#include <asm/io.h>
+#include <linux/io.h>
 #include "xilinx_hwicap.h"
 
 /* Reads integers from the device into the storage buffer. */
diff --git a/drivers/char/xilinx_hwicap/xilinx_hwicap.c b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
index ed8a9ce..6172689 100644
--- a/drivers/char/xilinx_hwicap/xilinx_hwicap.c
+++ b/drivers/char/xilinx_hwicap/xilinx_hwicap.c
@@ -87,8 +87,7 @@
 #include <linux/cdev.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-
-#include <asm/io.h>
+#include <linux/io.h>
 #include <asm/uaccess.h>
 #include <asm/system.h>
 
diff --git a/drivers/char/xilinx_hwicap/xilinx_hwicap.h b/drivers/char/xilinx_hwicap/xilinx_hwicap.h
index 8cca119..e0a6857 100644
--- a/drivers/char/xilinx_hwicap/xilinx_hwicap.h
+++ b/drivers/char/xilinx_hwicap/xilinx_hwicap.h
@@ -36,8 +36,7 @@
 #include <linux/types.h>
 #include <linux/cdev.h>
 #include <linux/platform_device.h>
-
-#include <asm/io.h>
+#include <linux/io.h>
 
 struct hwicap_drvdata {
 	u32 write_buffer_in_use;  /* Always in [0,3] */
-- 
1.5.6.6



This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
