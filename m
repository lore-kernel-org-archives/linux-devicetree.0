From: Murali Karicheri <m-karicheri2@ti.com>
Subject: [net-next PATCH v2 10/10] net: netcp: support probe deferral
Date: Tue, 27 Mar 2018 12:31:49 -0400
Message-ID: <1522168309-12338-11-git-send-email-m-karicheri2@ti.com>
References: <1522168309-12338-1-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1522168309-12338-1-git-send-email-m-karicheri2@ti.com>
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

The netcp driver shouldn't proceed until the knav qmss and dma
devices are ready. So return -EPROBE_DEFER if these devices are not
ready.

Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
---
 drivers/net/ethernet/ti/netcp_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/ti/netcp_core.c b/drivers/net/ethernet/ti/netcp_core.c
index 9c51b25..736f6f7 100644
--- a/drivers/net/ethernet/ti/netcp_core.c
+++ b/drivers/net/ethernet/ti/netcp_core.c
@@ -2158,6 +2158,10 @@ static int netcp_probe(struct platform_device *pdev)
 	struct netcp_module *module;
 	int ret;
 
+	if (!knav_dma_device_ready() ||
+	    !knav_qmss_device_ready())
+		return -EPROBE_DEFER;
+
 	if (!node) {
 		dev_err(dev, "could not find device info\n");
 		return -ENODEV;
-- 
1.9.1
