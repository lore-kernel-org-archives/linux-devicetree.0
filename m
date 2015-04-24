From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [RFC 09/12] i2c: core: Probe i2c master devices on demand
Date: Fri, 24 Apr 2015 16:47:25 +0200
Message-ID: <1429886848-5843-10-git-send-email-tomeu.vizoso@collabora.com>
References: <1429886848-5843-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429886848-5843-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Alexander Holler <holler@ahsoftware.de>, Olof Johansson <olof@lixom.net>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
List-Id: devicetree@vger.kernel.org

When looking up an i2c master through its DT node, ensure that the
corresponding device has been registered.
---
 drivers/i2c/i2c-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
index 098f698..53a3588 100644
--- a/drivers/i2c/i2c-core.c
+++ b/drivers/i2c/i2c-core.c
@@ -40,6 +40,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
+#include <linux/of_platform.h>
 #include <linux/clk/clk-conf.h>
 #include <linux/completion.h>
 #include <linux/hardirq.h>
@@ -1339,6 +1340,8 @@ struct i2c_adapter *of_find_i2c_adapter_by_node(struct device_node *node)
 {
 	struct device *dev;
 
+	of_platform_device_ensure(node);
+
 	dev = bus_find_device(&i2c_bus_type, NULL, node,
 					 of_dev_node_match);
 	if (!dev)
-- 
2.3.6
