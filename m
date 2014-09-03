From: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: [PATCH 1/5] rtc: at91sam9: remove references to mach specific headers
Date: Wed,  3 Sep 2014 10:45:30 +0200
Message-ID: <1409733934-14465-2-git-send-email-boris.brezillon@free-electrons.com>
References: <1409733934-14465-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1409733934-14465-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Boris BREZILLON <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

In order to support multi platform kernel drivers should not include
machine specific headers.
Copy RTT macros in the driver code and remove any machine specific
headers.

Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
---
 drivers/rtc/rtc-at91sam9.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-at91sam9.c b/drivers/rtc/rtc-at91sam9.c
index 5963743..51f0038 100644
--- a/drivers/rtc/rtc-at91sam9.c
+++ b/drivers/rtc/rtc-at91sam9.c
@@ -22,10 +22,6 @@
 #include <linux/platform_data/atmel.h>
 #include <linux/io.h>
 
-#include <mach/at91_rtt.h>
-#include <mach/cpu.h>
-#include <mach/hardware.h>
-
 /*
  * This driver uses two configurable hardware resources that live in the
  * AT91SAM9 backup power domain (intended to be powered at all times)
@@ -47,6 +43,24 @@
  * registers available, likewise usable for more than "RTC" support.
  */
 
+#define AT91_RTT_MR		0x00			/* Real-time Mode Register */
+#define AT91_RTT_RTPRES		(0xffff << 0)		/* Real-time Timer Prescaler Value */
+#define AT91_RTT_ALMIEN		(1 << 16)		/* Alarm Interrupt Enable */
+#define AT91_RTT_RTTINCIEN	(1 << 17)		/* Real Time Timer Increment Interrupt Enable */
+#define AT91_RTT_RTTRST		(1 << 18)		/* Real Time Timer Restart */
+
+#define AT91_RTT_AR		0x04			/* Real-time Alarm Register */
+#define AT91_RTT_ALMV		(0xffffffff)		/* Alarm Value */
+
+#define AT91_RTT_VR		0x08			/* Real-time Value Register */
+#define AT91_RTT_CRTV		(0xffffffff)		/* Current Real-time Value */
+
+#define AT91_RTT_SR		0x0c			/* Real-time Status Register */
+#define AT91_RTT_ALMS		(1 << 0)		/* Real-time Alarm Status */
+#define AT91_RTT_RTTINC		(1 << 1)		/* Real-time Timer Increment */
+
+#define AT91_SLOW_CLOCK		32768
+
 /*
  * We store ALARM_DISABLED in ALMV to record that no alarm is set.
  * It's also the reset value for that field.
-- 
1.9.1
