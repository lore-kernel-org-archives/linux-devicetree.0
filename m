From: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v1 1/1] of: unittest: unflatten device tree on UML when testing
Date: Tue, 12 Feb 2019 10:53:05 -0800
Message-ID: <20190212185305.112847-2-brendanhiggins@google.com>
References: <20190212185305.112847-1-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212185305.112847-1-brendanhiggins@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, frowand.list@gmail.com, mcgrof@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>
List-Id: devicetree@vger.kernel.org

UML supports enabling OF, and is useful for running the device tree
tests, so add support for unflattening device tree blobs so we can
actually use it.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 drivers/of/unittest.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 84427384654d5..effa4e2b9d992 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2527,6 +2527,9 @@ static int __init of_unittest(void)
 	}
 	of_node_put(np);
 
+	if (IS_ENABLED(CONFIG_UML))
+		unflatten_device_tree();
+
 	pr_info("start of unittest - you will see error messages\n");
 	of_unittest_check_tree_linkage();
 	of_unittest_check_phandles();
-- 
2.20.1.791.gb4d0f1c61a-goog
