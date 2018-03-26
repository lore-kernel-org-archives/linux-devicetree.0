From: Murali Karicheri <m-karicheri2@ti.com>
Subject: [net-next PATCH 4/5] Revert "net: netcp: remove dead code from the
 driver"
Date: Mon, 26 Mar 2018 16:15:11 -0400
Message-ID: <1522095312-23249-5-git-send-email-m-karicheri2@ti.com>
References: <1522095312-23249-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1522095312-23249-1-git-send-email-m-karicheri2@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ssantosh@kernel.org, malat@debian.org, w-kwok2@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, davem@davemloft.net, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

As the probe sequence is not guaranteed contrary to the assumption
of the commit 2d8e276a9030, same has to be reverted.

commit 2d8e276a9030 ("net: netcp: remove dead code from the driver")

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
---
 drivers/net/ethernet/ti/netcp_core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/ti/netcp_core.c b/drivers/net/ethernet/ti/netcp_core.c
index f5a7eb2..9c51b25 100644
--- a/drivers/net/ethernet/ti/netcp_core.c
+++ b/drivers/net/ethernet/ti/netcp_core.c
@@ -2155,6 +2155,7 @@ static int netcp_probe(struct platform_device *pdev)
 	struct device_node *child, *interfaces;
 	struct netcp_device *netcp_device;
 	struct device *dev = &pdev->dev;
+	struct netcp_module *module;
 	int ret;
 
 	if (!node) {
@@ -2203,6 +2204,14 @@ static int netcp_probe(struct platform_device *pdev)
 	/* Add the device instance to the list */
 	list_add_tail(&netcp_device->device_list, &netcp_devices);
 
+	/* Probe & attach any modules already registered */
+	mutex_lock(&netcp_modules_lock);
+	for_each_netcp_module(module) {
+		ret = netcp_module_probe(netcp_device, module);
+		if (ret < 0)
+			dev_err(dev, "module(%s) probe failed\n", module->name);
+	}
+	mutex_unlock(&netcp_modules_lock);
 	return 0;
 
 probe_quit_interface:
-- 
1.9.1
