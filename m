From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 2/2] uio: add default compatible string to uio_pdrv_genirq
Date: Fri, 22 Sep 2017 03:48:14 +1200
Message-ID: <20170921154814.7510-3-chris.packham@alliedtelesis.co.nz>
References: <20170921154814.7510-1-chris.packham@alliedtelesis.co.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170921154814.7510-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

Add a default compatible string "linux,uio-pdrv-genirq" to
uio_pdrv_genirq to make it usable without supplying a module parameter.
The module parameter is still supported in addition to the default.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/uio/uio_pdrv_genirq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/uio/uio_pdrv_genirq.c b/drivers/uio/uio_pdrv_genirq.c
index f598ecddc8a7..4d089240533e 100644
--- a/drivers/uio/uio_pdrv_genirq.c
+++ b/drivers/uio/uio_pdrv_genirq.c
@@ -253,11 +253,12 @@ static const struct dev_pm_ops uio_pdrv_genirq_dev_pm_ops = {
 
 #ifdef CONFIG_OF
 static struct of_device_id uio_of_genirq_match[] = {
+	{ .compatible = "linux,uio-pdrv-genirq" },
 	{ /* This is filled with module_parm */ },
 	{ /* Sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, uio_of_genirq_match);
-module_param_string(of_id, uio_of_genirq_match[0].compatible, 128, 0);
+module_param_string(of_id, uio_of_genirq_match[1].compatible, 128, 0);
 MODULE_PARM_DESC(of_id, "Openfirmware id of the device to be handled by uio");
 #endif
 
-- 
2.14.1
