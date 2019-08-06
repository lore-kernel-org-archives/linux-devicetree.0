From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH 1/2] of/platform: Fix fn definitons for of_link_is_valid() and of_link_property()
Date: Tue,  6 Aug 2019 12:26:53 -0700
Message-ID: <20190806192654.138605-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, kernel-team@android.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

of_link_is_valid() can be static since it's not used anywhere else.

of_link_property() return type should have been int instead of bool.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 21838226d68a..f68de5c4aeff 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -506,7 +506,7 @@ int of_platform_default_populate(struct device_node *root,
 }
 EXPORT_SYMBOL_GPL(of_platform_default_populate);
 
-bool of_link_is_valid(struct device_node *con, struct device_node *sup)
+static bool of_link_is_valid(struct device_node *con, struct device_node *sup)
 {
 	of_node_get(sup);
 	/*
@@ -625,7 +625,7 @@ static const struct supplier_bindings bindings[] = {
 	{ },
 };
 
-static bool of_link_property(struct device *dev, struct device_node *con_np,
+static int of_link_property(struct device *dev, struct device_node *con_np,
 			     const char *prop)
 {
 	struct device_node *phandle;
-- 
2.22.0.770.g0f2c4a37fd-goog
