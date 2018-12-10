From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 7/8] mfd: axp20x: Clean up included headers
Date: Mon, 10 Dec 2018 20:42:18 +0200
Message-ID: <0cd6a4f334a84bfcbbdd805ccabe132611517ba3.1544466940.git-series.plaes@plaes.org>
References: <cover.4110554ae84987dedb8b58888a8a63d6b7f98c72.1544466940.git-series.plaes@plaes.org>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDB4J47M7YERBFPHXLQAKGQEWLDGJEA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.4110554ae84987dedb8b58888a8a63d6b7f98c72.1544466940.git-series.plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Cc: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>

Add the bitops.h header as we need it, alphabetize header order.

Signed-off-by: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Acked-for-MFD-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/mfd/axp20x.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index dfc3cff..c3f3dbd 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -16,18 +16,19 @@
  * published by the Free Software Foundation.
  */
 
-#include <linux/err.h>
+#include <linux/acpi.h>
+#include <linux/bitops.h>
 #include <linux/delay.h>
+#include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
+#include <linux/mfd/axp20x.h>
+#include <linux/mfd/core.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
-#include <linux/mfd/axp20x.h>
-#include <linux/mfd/core.h>
-#include <linux/of_device.h>
-#include <linux/acpi.h>
 
 #define AXP20X_OFF	0x80
 
-- 
git-series 0.9.1
