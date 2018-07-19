From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v2 05/10] coresight: Fix remote endpoint parsing
Date: Thu, 19 Jul 2018 11:55:09 +0100
Message-ID: <1531997715-6767-6-git-send-email-suzuki.poulose@arm.com>
References: <1531997715-6767-1-git-send-email-suzuki.poulose@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531997715-6767-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, robh@kernel.org, mathieu.poirier@linaro.org, sudeep.holla@arm.com, frowand.list@gmail.com, devicetree@vger.kernel.org, mark.rutland@arm.com, matt.sealey@arm.com, charles.garcia-tobin@arm.com, coresight@lists.linaro.org, john.horley@arm.com, mike.leach@linaro.org, Suzuki K Poulose <suzuki.poulose@arm.com>
List-Id: devicetree@vger.kernel.org

When parsing the remote endpoint of an output port, we do :
     rport = of_graph_get_remote_port(ep);
     rparent = of_graph_get_remote_port_parent(ep);

and then parse the "remote_port" as if it was the remote endpoint,
which is wrong. The code worked fine because we used endpoint number
as the port number. Let us fix it and optimise a bit as:

     remote_ep = of_graph_get_remote_endpoint(ep);
     if (remote_ep)
        remote_parent = of_graph_get_port_parent(remote_ep);

and then, parse the remote_ep for the port/endpoint details.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/hwtracing/coresight/of_coresight.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/of_coresight.c b/drivers/hwtracing/coresight/of_coresight.c
index c5f664c..16a77a7 100644
--- a/drivers/hwtracing/coresight/of_coresight.c
+++ b/drivers/hwtracing/coresight/of_coresight.c
@@ -133,7 +133,7 @@ static int of_coresight_parse_endpoint(struct device *dev,
 	int ret = 0;
 	struct of_endpoint endpoint, rendpoint;
 	struct device_node *rparent = NULL;
-	struct device_node *rport = NULL;
+	struct device_node *rep = NULL;
 	struct device *rdev = NULL;
 
 	do {
@@ -141,16 +141,16 @@ static int of_coresight_parse_endpoint(struct device *dev,
 		if (of_graph_parse_endpoint(ep, &endpoint))
 			break;
 		/*
-		 * Get a handle on the remote port and parent
-		 * attached to it.
+		 * Get a handle on the remote endpoint and the device it is
+		 * attached to.
 		 */
-		rparent = of_graph_get_remote_port_parent(ep);
+		rep = of_graph_get_remote_endpoint(ep);
+		if (!rep)
+			break;
+		rparent = of_graph_get_port_parent(rep);
 		if (!rparent)
 			break;
-		rport = of_graph_get_remote_port(ep);
-		if (!rport)
-			break;
-		if (of_graph_parse_endpoint(rport, &rendpoint))
+		if (of_graph_parse_endpoint(rep, &rendpoint))
 			break;
 
 		/* If the remote device is not available, defer probing */
@@ -164,15 +164,15 @@ static int of_coresight_parse_endpoint(struct device *dev,
 		pdata->child_names[*i] = devm_kstrdup(dev,
 						      dev_name(rdev),
 						      GFP_KERNEL);
-		pdata->child_ports[*i] = rendpoint.id;
+		pdata->child_ports[*i] = rendpoint.port;
 		/* Move the index */
 		(*i)++;
 	} while (0);
 
 	if (rparent)
 		of_node_put(rparent);
-	if (rport)
-		of_node_put(rport);
+	if (rep)
+		of_node_put(rep);
 	if (rdev)
 		put_device(rdev);
 
-- 
2.7.4
