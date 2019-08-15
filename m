Return-Path: <SRS0=DLI7=WL=gmail.com=nishkadg.linux@kernel.org>
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] of: unittest: Add of_node_put() before return
Date: Thu, 15 Aug 2019 11:52:18 +0530
Message-Id: <20190815062218.5428-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: robh+dt@kernel.org, frowand.list@gmail.com, devicetree@vger.kernel.org
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
List-ID: <devicetree@vger.kernel.org>

The local variable np in function of_unittest_platform_populate takes
the return value of of_find_node_by_path, which gets a node but does not
put it. If np is not put before return it may cause a memory leak. Hence
put np before a return statement.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/of/unittest.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index e6b175370f2e..480a21e2ed39 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1044,8 +1044,10 @@ static void __init of_unittest_platform_populate(void)
 	test_bus = platform_device_register_full(&test_bus_info);
 	rc = PTR_ERR_OR_ZERO(test_bus);
 	unittest(!rc, "testbus registration failed; rc=%i\n", rc);
-	if (rc)
+	if (rc) {
+		of_node_put(np);
 		return;
+	}
 	test_bus->dev.of_node = np;
 
 	/*
-- 
2.19.1
