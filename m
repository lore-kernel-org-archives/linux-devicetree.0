From: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RFC v12 2/7] dma: mpc512x: separate 'compatible' values for MPC512x and MPC8308
Date: Wed, 23 Apr 2014 17:53:24 +0400
Message-ID: <1398261209-5578-3-git-send-email-a13xp0p0v88@gmail.com>
References: <1398261209-5578-1-git-send-email-a13xp0p0v88@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398261209-5578-1-git-send-email-a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

MPC512x and MPC8308 have similar DMA controllers, but are independent SoCs.
DMA controller driver should have separate 'compatible' values for these SoCs.

Signed-off-by: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/powerpc/boot/dts/mpc8308_p1m.dts | 2 +-
 arch/powerpc/boot/dts/mpc8308rdb.dts  | 2 +-
 drivers/dma/mpc512x_dma.c             | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/dts/mpc8308_p1m.dts b/arch/powerpc/boot/dts/mpc8308_p1m.dts
index 651e4f5..57f86cd 100644
--- a/arch/powerpc/boot/dts/mpc8308_p1m.dts
+++ b/arch/powerpc/boot/dts/mpc8308_p1m.dts
@@ -296,7 +296,7 @@
 		};
 
 		dma@2c000 {
-			compatible = "fsl,mpc8308-dma", "fsl,mpc5121-dma";
+			compatible = "fsl,mpc8308-dma";
 			reg = <0x2c000 0x1800>;
 			interrupts = <3 0x8
 					94 0x8>;
diff --git a/arch/powerpc/boot/dts/mpc8308rdb.dts b/arch/powerpc/boot/dts/mpc8308rdb.dts
index 9ce45f2..d0211f0 100644
--- a/arch/powerpc/boot/dts/mpc8308rdb.dts
+++ b/arch/powerpc/boot/dts/mpc8308rdb.dts
@@ -265,7 +265,7 @@
 		};
 
 		dma@2c000 {
-			compatible = "fsl,mpc8308-dma", "fsl,mpc5121-dma";
+			compatible = "fsl,mpc8308-dma";
 			reg = <0x2c000 0x1800>;
 			interrupts = <3 0x8
 					94 0x8>;
diff --git a/drivers/dma/mpc512x_dma.c b/drivers/dma/mpc512x_dma.c
index 2ce248b..0b17f4d 100644
--- a/drivers/dma/mpc512x_dma.c
+++ b/drivers/dma/mpc512x_dma.c
@@ -815,6 +815,7 @@ static int mpc_dma_remove(struct platform_device *op)
 
 static struct of_device_id mpc_dma_match[] = {
 	{ .compatible = "fsl,mpc5121-dma", },
+	{ .compatible = "fsl,mpc8308-dma", },
 	{},
 };
 
-- 
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
