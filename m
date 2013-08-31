From: Yijing Wang <wangyijing@huawei.com>
Subject: [PATCH] irq/of: Fix comment typo for irq_of_parse_and_map
Date: Sat, 31 Aug 2013 09:44:10 +0800
Message-ID: <1377913450-30108-1-git-send-email-wangyijing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Yijing Wang <wangyijing@huawei.com>, Hanjun Guo <guohanjun@huawei.com>
List-Id: devicetree@vger.kernel.org

Fix trivial comment typo for irq_of_parse_and_map().

Signed-off-by: Yijing Wang <wangyijing@huawei.com>
---
 drivers/of/irq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 1264923..1752988 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -28,7 +28,7 @@
 
 /**
  * irq_of_parse_and_map - Parse and map an interrupt into linux virq space
- * @device: Device node of the device whose interrupt is to be mapped
+ * @dev: Device node of the device whose interrupt is to be mapped
  * @index: Index of the interrupt to map
  *
  * This function is a wrapper that chains of_irq_map_one() and
-- 
1.7.1
