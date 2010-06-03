From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH] of/watchdog: gef_wdt.c: fix build breakage
Date: Thu,  3 Jun 2010 03:30:31 +0200
Message-ID: <1275528631-1523-1-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fixes build error caused by the OF device_node
pointer being moved into struct device

Signed-off-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
---
 drivers/watchdog/gef_wdt.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/watchdog/gef_wdt.c b/drivers/watchdog/gef_wdt.c
index ca0f4c6..1df284f 100644
--- a/drivers/watchdog/gef_wdt.c
+++ b/drivers/watchdog/gef_wdt.c
@@ -273,7 +273,7 @@ static int __devinit gef_wdt_probe(struct of_device *dev,
 		bus_clk = freq;
 
 	/* Map devices registers into memory */
-	gef_wdt_regs = of_iomap(dev->node, 0);
+	gef_wdt_regs = of_iomap(dev->dev.of_node, 0);
 	if (gef_wdt_regs == NULL)
 		return -ENOMEM;
 
-- 
1.7.0.4
