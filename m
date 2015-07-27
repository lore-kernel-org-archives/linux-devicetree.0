From: <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH 3/4] reset: socfpga: Update reset-socfpga to read the altr,modrst-offset property
Date: Mon, 27 Jul 2015 13:57:23 -0500
Message-ID: <1438023444-11881-4-git-send-email-dinguyen@opensource.altera.com>
References: <1438023444-11881-1-git-send-email-dinguyen@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438023444-11881-1-git-send-email-dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

In order for the Arria10 to be able to re-use the reset driver for SoCFPGA
Cyclone5/Arria5, we need to read the 'altr,modrst-offset' property from the
device tree entry. The 'altr,modrst-offset' property is the first register
into the reset manager that is used for bringing peripherals out of reset.

Signed-off-by: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
 drivers/reset/reset-socfpga.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/reset/reset-socfpga.c b/drivers/reset/reset-socfpga.c
index 0a8def3..9074d41 100644
--- a/drivers/reset/reset-socfpga.c
+++ b/drivers/reset/reset-socfpga.c
@@ -24,11 +24,11 @@
 #include <linux/types.h>
 
 #define NR_BANKS		4
-#define OFFSET_MODRST		0x10
 
 struct socfpga_reset_data {
 	spinlock_t			lock;
 	void __iomem			*membase;
+	u32				modrst_offset;
 	struct reset_controller_dev	rcdev;
 };
 
@@ -45,8 +45,8 @@ static int socfpga_reset_assert(struct reset_controller_dev *rcdev,
 
 	spin_lock_irqsave(&data->lock, flags);
 
-	reg = readl(data->membase + OFFSET_MODRST + (bank * NR_BANKS));
-	writel(reg | BIT(offset), data->membase + OFFSET_MODRST +
+	reg = readl(data->membase + data->modrst_offset + (bank * NR_BANKS));
+	writel(reg | BIT(offset), data->membase + data->modrst_offset +
 				 (bank * NR_BANKS));
 	spin_unlock_irqrestore(&data->lock, flags);
 
@@ -67,8 +67,8 @@ static int socfpga_reset_deassert(struct reset_controller_dev *rcdev,
 
 	spin_lock_irqsave(&data->lock, flags);
 
-	reg = readl(data->membase + OFFSET_MODRST + (bank * NR_BANKS));
-	writel(reg & ~BIT(offset), data->membase + OFFSET_MODRST +
+	reg = readl(data->membase + data->modrst_offset + (bank * NR_BANKS));
+	writel(reg & ~BIT(offset), data->membase + data->modrst_offset +
 				  (bank * NR_BANKS));
 
 	spin_unlock_irqrestore(&data->lock, flags);
@@ -85,7 +85,7 @@ static int socfpga_reset_status(struct reset_controller_dev *rcdev,
 	int offset = id % BITS_PER_LONG;
 	u32 reg;
 
-	reg = readl(data->membase + OFFSET_MODRST + (bank * NR_BANKS));
+	reg = readl(data->membase + data->modrst_offset + (bank * NR_BANKS));
 
 	return !(reg & BIT(offset));
 }
@@ -100,6 +100,8 @@ static int socfpga_reset_probe(struct platform_device *pdev)
 {
 	struct socfpga_reset_data *data;
 	struct resource *res;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 
 	/*
 	 * The binding was mainlined without the required property.
@@ -120,6 +122,11 @@ static int socfpga_reset_probe(struct platform_device *pdev)
 	if (IS_ERR(data->membase))
 		return PTR_ERR(data->membase);
 
+	if (of_property_read_u32(np, "altr,modrst-offset", &data->modrst_offset)) {
+		dev_err(dev, "no altr,modrst-offset specified in device tree\n");
+		return -ENODEV;
+	}
+
 	spin_lock_init(&data->lock);
 
 	data->rcdev.owner = THIS_MODULE;
-- 
2.4.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
