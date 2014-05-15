From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v6 06/17] usb: host: xhci-plat: sort the headers in alphabetic
 order
Date: Thu, 15 May 2014 12:17:31 +0200
Message-ID: <1400149062-32661-7-git-send-email-gregory.clement@free-electrons.com>
References: <1400149062-32661-1-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1400149062-32661-1-git-send-email-gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, devicetree@vger.kernel.org, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Sorting the headers in alphabetic order will help to reduce the conflict
when adding new headers later.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
Acked-by: Felipe Balbi <balbi@ti.com>
---
 drivers/usb/host/xhci-plat.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 151901ce1ba9..f5351af4b2c5 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -11,11 +11,11 @@
  * version 2 as published by the Free Software Foundation.
  */
 
-#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
 #include <linux/module.h>
-#include <linux/slab.h>
 #include <linux/of.h>
-#include <linux/dma-mapping.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "xhci.h"
 
-- 
1.8.1.2
