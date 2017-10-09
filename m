From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 5/5] uio: uio_pdrv_genirq: Add "marvell,88e2040" to dt compatible list
Date: Tue, 10 Oct 2017 11:46:55 +1300
Message-ID: <20171009224655.6173-6-chris.packham@alliedtelesis.co.nz>
References: <20171009224655.6173-1-chris.packham@alliedtelesis.co.nz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171009224655.6173-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

The marvell,88e2040 is a N-BaseT Ethernet PHY which requires a userspace
driver. uio_pdrv_genirq can be used to provide interrupts to such a
userspace driver.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v3:
- (replaces "uio: add default compatible string to uio_pdrv_genirq")
- As suggested by Rob, add specific dt bindings for the hardware I'm
  supporting. uio_pdrv_genirq is one potential implementor of a compatible
  driver.

 drivers/uio/uio_pdrv_genirq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/uio/uio_pdrv_genirq.c b/drivers/uio/uio_pdrv_genirq.c
index 532de98034c2..4bcab82b899e 100644
--- a/drivers/uio/uio_pdrv_genirq.c
+++ b/drivers/uio/uio_pdrv_genirq.c
@@ -254,11 +254,12 @@ static const struct dev_pm_ops uio_pdrv_genirq_dev_pm_ops = {
 #ifdef CONFIG_OF
 static struct of_device_id uio_of_genirq_match[] = {
 	{ .compatible = "st,stm32f100" },
+	{ .compatible = "marvell,88e2040" },
 	{ /* This is filled with module_parm */ },
 	{ /* Sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, uio_of_genirq_match);
-module_param_string(of_id, uio_of_genirq_match[1].compatible, 128, 0);
+module_param_string(of_id, uio_of_genirq_match[2].compatible, 128, 0);
 MODULE_PARM_DESC(of_id, "Openfirmware id of the device to be handled by uio");
 #endif
 
-- 
2.14.2
