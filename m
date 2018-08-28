From: Rob Herring <robh@kernel.org>
Subject: [PATCH 2/4] of/unittest: add printf tests for node name
Date: Tue, 28 Aug 2018 10:52:52 -0500
Message-ID: <20180828155254.10709-3-robh@kernel.org>
References: <20180828155254.10709-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828155254.10709-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add some printf test for printing the node name (without the
unit-address).

Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/unittest.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 69a522e48970..9def7be9c111 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -299,6 +299,10 @@ static void __init of_unittest_printf(void)
 
 	of_unittest_printf_one(np, "%pOF",  full_name);
 	of_unittest_printf_one(np, "%pOFf", full_name);
+	of_unittest_printf_one(np, "%pOFn", "dev");
+	of_unittest_printf_one(np, "%2pOFn", "dev");
+	of_unittest_printf_one(np, "%5pOFn", "  dev");
+	of_unittest_printf_one(np, "%pOFnc", "dev:test-sub-device");
 	of_unittest_printf_one(np, "%pOFp", phandle_str);
 	of_unittest_printf_one(np, "%pOFP", "dev@100");
 	of_unittest_printf_one(np, "ABC %pOFP ABC", "ABC dev@100 ABC");
-- 
2.17.1
