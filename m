From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 15/21] media: ti-vpe: Set the DMA mask and coherent mask
Date: Mon, 7 Oct 2019 10:10:03 -0500
Message-ID: <20191007151009.22095-16-bparrot@ti.com>
References: <20191007151009.22095-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007151009.22095-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

VPE uses VPDMA (built-in dma engine) to transfer data to and from the IP
and memory. VPDMA expect 32 bits addresses. To make sure that is always
the case set the DMA mask and coherent mask for the device.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/vpe.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index ad9d8b559cad..d7f8eb901475 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -2517,6 +2517,13 @@ static int vpe_probe(struct platform_device *pdev)
 	struct vpe_dev *dev;
 	int ret, irq, func;
 
+	ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(&pdev->dev,
+			"32-bit consistent DMA enable failed\n");
+		return ret;
+	}
+
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
-- 
2.17.1
