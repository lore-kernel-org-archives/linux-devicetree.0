From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH 1/6] usb: bdc: driver runs out of buffer descriptors on large ADB transfers
Date: Thu, 20 Jun 2019 17:09:46 -0400
Message-ID: <1561064991-16874-2-git-send-email-alcooperx@gmail.com>
References: <1561064991-16874-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561064991-16874-1-git-send-email-alcooperx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, devicetree@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Version v1.0.40 of the Android host ADB software increased maximum
transfer sizes from 256K to 1M. Since the STB ADB gadget driver
requests only 16K at a time, the BDC driver ran out of buffer
descriptors (BDs) if the queuing happens faster than the incoming
16K transfers. This issue is fixed by doubling the number of BDs
that can be queued so that the entire 1M request can be queued
without running out of buffers.

Signed-off-by: Al Cooper <alcooperx@gmail.com>
---
 drivers/usb/gadget/udc/bdc/bdc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc.h b/drivers/usb/gadget/udc/bdc/bdc.h
index 6e1e881dc51e..ac75e25c3b6a 100644
--- a/drivers/usb/gadget/udc/bdc/bdc.h
+++ b/drivers/usb/gadget/udc/bdc/bdc.h
@@ -44,7 +44,7 @@
 #define NUM_SR_ENTRIES	64
 
 /* Num of bds per table */
-#define NUM_BDS_PER_TABLE	32
+#define NUM_BDS_PER_TABLE	64
 
 /* Num of tables in bd list for control,bulk and Int ep */
 #define NUM_TABLES	2
-- 
1.9.0.138.g2de3478
