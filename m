From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
Subject: [PATCH 1/2] peci: aspeed: Add AST2600 compatible string
Date: Wed, 2 Oct 2019 14:11:59 +0800
Message-ID: <20191002061200.29888-2-chiawei_wang@aspeedtech.com>
References: <20191002061200.29888-1-chiawei_wang@aspeedtech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191002061200.29888-1-chiawei_wang@aspeedtech.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jae.hyun.yoo@linux.intel.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ryan_chen@aspeedtech.com, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, jason.m.bills@linux.intel.com, chiawei_wang@aspeedtech.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The AST2600 SoC contains the same register set as AST25xx.

Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
---
 drivers/peci/peci-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/peci/peci-aspeed.c b/drivers/peci/peci-aspeed.c
index 51cb2563ceb6..4eed119dc83b 100644
--- a/drivers/peci/peci-aspeed.c
+++ b/drivers/peci/peci-aspeed.c
@@ -485,6 +485,7 @@ static int aspeed_peci_remove(struct platform_device *pdev)
 static const struct of_device_id aspeed_peci_of_table[] = {
 	{ .compatible = "aspeed,ast2400-peci", },
 	{ .compatible = "aspeed,ast2500-peci", },
+	{ .compatible = "aspeed,ast2600-peci", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, aspeed_peci_of_table);
-- 
2.17.1
