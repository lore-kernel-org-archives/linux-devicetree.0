From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH RESEND 3/4] mfd: tps65090: Pass irq domain when adding mfd sub devices
Date: Sun, 27 Jan 2013 14:27:14 +0530
Message-ID: <1359277035-16854-4-git-send-email-ldewangan@nvidia.com>
References: <1359277035-16854-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1359277035-16854-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: sameo@linux.intel.com
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, broonie@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

When device is get added through DT then irq_base is 0 (zero)
and in this case regmap_irq_chip_get_base() generates warning.
The interrupt of this device get added through irq_domain_add_linear()
when irq_base is 0.

Hence pass the irq domain in place of base_irq when calling
mfd_add_devices().

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/mfd/tps65090.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
index e4cf030..3e987be 100644
--- a/drivers/mfd/tps65090.c
+++ b/drivers/mfd/tps65090.c
@@ -236,7 +236,7 @@ static int tps65090_i2c_probe(struct i2c_client *client,
 
 	ret = mfd_add_devices(tps65090->dev, -1, tps65090s,
 		ARRAY_SIZE(tps65090s), NULL,
-		regmap_irq_chip_get_base(tps65090->irq_data), NULL);
+		0, regmap_irq_get_domain(tps65090->irq_data));
 	if (ret) {
 		dev_err(&client->dev, "add mfd devices failed with err: %d\n",
 			ret);
-- 
1.7.1.1

