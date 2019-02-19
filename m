From: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v3] of: unittest: unflatten device tree on UML when testing
Date: Tue, 19 Feb 2019 15:54:22 -0800
Message-ID: <20190219235422.256847-1-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, frowand.list@gmail.com, mcgrof@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>
List-Id: devicetree@vger.kernel.org

UML supports enabling OF, and is useful for running the device tree
tests, so add support for unflattening device tree blobs so we can
actually use it.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 drivers/of/unittest.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 84427384654d5..98f0dfc91c2a3 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2514,6 +2514,10 @@ static int __init of_unittest(void)
 	int res;
 
 	/* adding data for unittest */
+
+	if (IS_ENABLED(CONFIG_UML))
+		unittest_unflatten_overlay_base();
+
 	res = unittest_data_add();
 	if (res)
 		return res;
-- 
2.21.0.rc0.258.g878e2cd30e-goog
