From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] of/platform: export of_default_bus_match_table
Date: Tue,  5 Jan 2016 11:17:53 +0900
Message-ID: <1451960273-19934-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Currently, drivers/bus/uniphier-system-bus.c is kept from being a
module due to the unresolved reference to of_default_bus_match_table.

Refer to commit 326ea45aa827 ("bus: uniphier: allow only built-in
driver").

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/of/platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index af98343..8d103e4 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -31,6 +31,7 @@ const struct of_device_id of_default_bus_match_table[] = {
 #endif /* CONFIG_ARM_AMBA */
 	{} /* Empty terminated list */
 };
+EXPORT_SYMBOL(of_default_bus_match_table);
 
 static int of_dev_node_match(struct device *dev, void *data)
 {
-- 
1.9.1
