From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH 2/2] of/platform: Disable generic device linking code for PowerPC
Date: Tue,  6 Aug 2019 12:26:54 -0700
Message-ID: <20190806192654.138605-2-saravanak@google.com>
References: <20190806192654.138605-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190806192654.138605-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, kernel-team@android.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

PowerPC platforms don't use the generic of/platform code to populate the
devices from DT.  Therefore the generic device linking code is never used
in PowerPC.  Compile it out to avoid warning about unused functions.

If a specific PowerPC platform wants to use this code in the future,
bringing this back for PowerPC would be trivial. We'll just need to export
of_link_to_suppliers() and then let the machine specific files do the
linking as they populate the devices from DT.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index f68de5c4aeff..a2a4e4b79d43 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -506,6 +506,7 @@ int of_platform_default_populate(struct device_node *root,
 }
 EXPORT_SYMBOL_GPL(of_platform_default_populate);
 
+#ifndef CONFIG_PPC
 static bool of_link_is_valid(struct device_node *con, struct device_node *sup)
 {
 	of_node_get(sup);
@@ -683,7 +684,6 @@ static int of_link_to_suppliers(struct device *dev)
 	return __of_link_to_suppliers(dev, dev->of_node);
 }
 
-#ifndef CONFIG_PPC
 static const struct of_device_id reserved_mem_matches[] = {
 	{ .compatible = "qcom,rmtfs-mem" },
 	{ .compatible = "qcom,cmd-db" },
-- 
2.22.0.770.g0f2c4a37fd-goog
