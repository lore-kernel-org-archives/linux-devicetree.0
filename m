Return-Path: <SRS0=c4n5=HG=linaro.org=viresh.kumar@kernel.org>
From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH V3] of: Don't create device for OPP tables
Date: Tue, 17 Apr 2018 11:57:34 +0530
Message-Id: <832f494b89b80c97702bee084bab7000a3ec0854.1523946361.git.viresh.kumar@linaro.org>
In-Reply-To: <152389202198.51482.3779874474342173946@swboyd.mtv.corp.google.com>
References: <152389202198.51482.3779874474342173946@swboyd.mtv.corp.google.com>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The OPP tables are present as separate nodes, whose phandle is used in
the "operating-points-v2" property of devices. Currently the OF core
creates a device for the OPP table unconditionally, which is not used by
any kernel code.

This patch creates another OF device_id table for the nodes which must
be skipped while creating devices and OPP is the only user of it for now.

Reported-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
V2->V3:
- Staticize of_skipped_node_table

V1->V2:
- Added Reviewed-by from Stephen.
- Created a table for nodes to be skipped.

 drivers/of/platform.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index c00d81dfac0b..d75050b85d0c 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -32,6 +32,11 @@ const struct of_device_id of_default_bus_match_table[] = {
 	{} /* Empty terminated list */
 };
 
+static const struct of_device_id of_skipped_node_table[] = {
+	{ .compatible = "operating-points-v2", },
+	{} /* Empty terminated list */
+};
+
 static int of_dev_node_match(struct device *dev, void *data)
 {
 	return dev->of_node == data;
@@ -356,6 +361,12 @@ static int of_platform_bus_create(struct device_node *bus,
 		return 0;
 	}
 
+	/* Skip nodes for which we don't want to create devices */
+	if (unlikely(of_match_node(of_skipped_node_table, bus))) {
+		pr_debug("%s() - skipping %pOF node\n", __func__, bus);
+		return 0;
+	}
+
 	if (of_node_check_flag(bus, OF_POPULATED_BUS)) {
 		pr_debug("%s() - skipping %pOF, already populated\n",
 			__func__, bus);
-- 
2.15.0.194.g9af6a3dea062
