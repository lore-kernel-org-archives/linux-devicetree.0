From: Joachim Eastwood <manabian@gmail.com>
Subject: [PATCH 4/5] pcmcia: at91_cf: clean up header includes
Date: Thu, 14 Feb 2013 18:42:45 +0100
Message-ID: <1360863766-22511-5-git-send-email-manabian@gmail.com>
References: <1360863766-22511-1-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pcmcia-bounces+glkpd-linux-pcmcia=m.gmane.org@lists.infradead.org>
In-Reply-To: <1360863766-22511-1-git-send-email-manabian@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-pcmcia>,
 <mailto:linux-pcmcia-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-pcmcia/>
List-Post: <mailto:linux-pcmcia@lists.infradead.org>
List-Help: <mailto:linux-pcmcia-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-pcmcia>,
 <mailto:linux-pcmcia-request@lists.infradead.org?subject=subscribe>
Sender: linux-pcmcia-bounces@lists.infradead.org
Errors-To: linux-pcmcia-bounces+glkpd-linux-pcmcia=m.gmane.org@lists.infradead.org
To: linux@dominikbrodowski.net
Cc: plagnioj@jcrosoft.com, devicetree-discuss@lists.ozlabs.org, linux-pcmcia@lists.infradead.org, nicolas.ferre@atmel.com, Joachim Eastwood <manabian@gmail.com>
List-Id: devicetree@vger.kernel.org

Use includes from linux/ instead of asm/ and remove a
unnecessary mach/ include.

Signed-off-by: Joachim Eastwood <manabian@gmail.com>
---
 drivers/pcmcia/at91_cf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pcmcia/at91_cf.c b/drivers/pcmcia/at91_cf.c
index 43bc342..bce8a64 100644
--- a/drivers/pcmcia/at91_cf.c
+++ b/drivers/pcmcia/at91_cf.c
@@ -18,13 +18,11 @@
 #include <linux/slab.h>
 #include <linux/gpio.h>
 #include <linux/platform_data/atmel.h>
+#include <linux/io.h>
+#include <linux/sizes.h>
 
 #include <pcmcia/ss.h>
 
-#include <mach/hardware.h>
-#include <asm/io.h>
-#include <asm/sizes.h>
-
 #include <mach/at91rm9200_mc.h>
 #include <mach/at91_ramc.h>
 
-- 
1.8.0
