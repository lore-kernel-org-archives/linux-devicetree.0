From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] of/platform: Drop superfluous cast in of_device_make_bus_id()
Date: Mon, 24 Jun 2019 14:46:20 +0200
Message-ID: <20190624124620.21891-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

There is no need to cast "u64" to "unsigned long long" before printing
it, as both types have been made identical on all architectures many
years ago.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/of/platform.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 04ad312fd85b9a2a..efbff44581b3ee2a 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -92,8 +92,7 @@ static void of_device_make_bus_id(struct device *dev)
 		reg = of_get_property(node, "reg", NULL);
 		if (reg && (addr = of_translate_address(node, reg)) != OF_BAD_ADDR) {
 			dev_set_name(dev, dev_name(dev) ? "%llx.%pOFn:%s" : "%llx.%pOFn",
-				     (unsigned long long)addr, node,
-				     dev_name(dev));
+				     addr, node, dev_name(dev));
 			return;
 		}
 
-- 
2.17.1
