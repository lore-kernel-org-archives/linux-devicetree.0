From: Karol Lewandowski <k.lewandowsk@samsung.com>
Subject: [PATCH] [media] s5p-g2d: Make it possible to instantiate driver from DT
Date: Wed, 14 Mar 2012 12:16:36 +0100
Message-ID: <1331723796-11620-1-git-send-email-k.lewandowsk@samsung.com>
References: <CAJuYYwQ54idFZGvyujimrhhedSveK9ob8j+686D6ABdavAA_SA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAJuYYwQ54idFZGvyujimrhhedSveK9ob8j+686D6ABdavAA_SA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: k.debski@samsung.com
Cc: m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, thomas.abraham@linaro.org, Karol Lewandowski <k.lewandowsk@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org

This driver requires standard properties like (address and irq)
which are automatically marshalled for drivers by OF core.

Signed-off-by: Karol Lewandowski <k.lewandowsk@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/media/video/s5p-g2d/g2d.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/media/video/s5p-g2d/g2d.c b/drivers/media/video/s5p-g2d/g2d.c
index febaa67..6a8db51 100644
--- a/drivers/media/video/s5p-g2d/g2d.c
+++ b/drivers/media/video/s5p-g2d/g2d.c
@@ -20,6 +20,7 @@
 #include <linux/interrupt.h>
 
 #include <linux/platform_device.h>
+#include <linux/of.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
@@ -795,12 +796,21 @@ static int g2d_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static struct of_device_id g2d_dt_match[] = {
+	{ .compatible = "samsung,s5pv210-g2d" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, g2d_dt_match);
+#endif
+
 static struct platform_driver g2d_pdrv = {
 	.probe		= g2d_probe,
 	.remove		= g2d_remove,
 	.driver		= {
 		.name = G2D_NAME,
 		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(g2d_dt_match),
 	},
 };
 
-- 
1.7.9
