From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] of: irq: Remove WARN_ON() for kzalloc() failure
Date: Thu,  2 May 2019 14:40:15 +0200
Message-ID: <20190502124015.3898-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

There is no need to print a backtrace if kzalloc() fails, as the memory
allocation core already takes care of that.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/of/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index e1f6f392a4c0dde0..7f84bb4903caaf4d 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -500,7 +500,7 @@ void __init of_irq_init(const struct of_device_id *matches)
 		 * pointer, interrupt-parent device_node etc.
 		 */
 		desc = kzalloc(sizeof(*desc), GFP_KERNEL);
-		if (WARN_ON(!desc)) {
+		if (!desc) {
 			of_node_put(np);
 			goto err;
 		}
-- 
2.17.1
