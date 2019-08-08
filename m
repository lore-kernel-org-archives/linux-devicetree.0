Return-Path: <SRS0=jjqY=WE=oracle.com=dan.carpenter@kernel.org>
Date: Thu, 8 Aug 2019 13:32:07 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] of/platform: Clean up a return type in of_link_property()
Message-ID: <20190808103207.GA30506@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Rob Herring <robh+dt@kernel.org>, Saravana Kannan <saravanak@google.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This function is supposed to return zero on success and negative
error codes on failure but currently it returns true on failure.  The
caller only checks for zero and non-zero so this mixup doesn't cause any
runtime issues.

Fixes: 690ff7881b26 ("of/platform: Add functional dependency link from DT bindings")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/of/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 21838226d68a..86fb8ab8c012 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -625,7 +625,7 @@ static const struct supplier_bindings bindings[] = {
 	{ },
 };
 
-static bool of_link_property(struct device *dev, struct device_node *con_np,
+static int of_link_property(struct device *dev, struct device_node *con_np,
 			     const char *prop)
 {
 	struct device_node *phandle;
-- 
2.20.1
