From: marek.bykowski@gmail.com
Subject: [PATCH 1/2] bus: arm-ccn: Enable stats for CCN-512 interconnect
Date: Mon,  7 Oct 2019 15:21:14 +0200
Message-ID: <1570454475-2848-1-git-send-email-marek.bykowski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, will@kernel.org, pawel.moll@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Bykowski <marek.bykowski@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Marek Bykowski <marek.bykowski@gmail.com>

Add compatible string for the ARM CCN-512 interconnect

Signed-off-by: Marek Bykowski <marek.bykowski@gmail.com>
---
 drivers/perf/arm-ccn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/perf/arm-ccn.c b/drivers/perf/arm-ccn.c
index 7dd850e02f19..b6e00f35a448 100644
--- a/drivers/perf/arm-ccn.c
+++ b/drivers/perf/arm-ccn.c
@@ -1545,6 +1545,7 @@ static int arm_ccn_remove(struct platform_device *pdev)
 static const struct of_device_id arm_ccn_match[] = {
 	{ .compatible = "arm,ccn-502", },
 	{ .compatible = "arm,ccn-504", },
+	{ .compatible = "arm,ccn-512", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, arm_ccn_match);
-- 
2.21.0.896.g6a6c0f1
