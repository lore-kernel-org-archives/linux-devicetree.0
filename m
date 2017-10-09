From: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: [PATCH v3 4/5] uio: uio_pdrv_genirq: Add st,stm32f100 to dt compatible list
Date: Tue, 10 Oct 2017 11:46:54 +1300
Message-ID: <20171009224655.6173-5-chris.packham@alliedtelesis.co.nz>
References: <20171009224655.6173-1-chris.packham@alliedtelesis.co.nz>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171009224655.6173-1-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The stm32f100 is a general purpose micro controller. Allow users to
interact with one as a uio device.

Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
---
Changes in v3:
- (replaces "uio: add default compatible string to uio_pdrv_genirq")
- remove superfluous change suggested by checkpatch.pl
- As suggested by Rob, add specific dt bindings for the hardware I'm
  supporting. uio_pdrv_genirq is one potential implementor of a compatible
  driver.

 drivers/uio/uio_pdrv_genirq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/uio/uio_pdrv_genirq.c b/drivers/uio/uio_pdrv_genirq.c
index f598ecddc8a7..532de98034c2 100644
--- a/drivers/uio/uio_pdrv_genirq.c
+++ b/drivers/uio/uio_pdrv_genirq.c
@@ -253,11 +253,12 @@ static const struct dev_pm_ops uio_pdrv_genirq_dev_pm_ops = {
 
 #ifdef CONFIG_OF
 static struct of_device_id uio_of_genirq_match[] = {
+	{ .compatible = "st,stm32f100" },
 	{ /* This is filled with module_parm */ },
 	{ /* Sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, uio_of_genirq_match);
-module_param_string(of_id, uio_of_genirq_match[0].compatible, 128, 0);
+module_param_string(of_id, uio_of_genirq_match[1].compatible, 128, 0);
 MODULE_PARM_DESC(of_id, "Openfirmware id of the device to be handled by uio");
 #endif
 
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
