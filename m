Return-Path: <SRS0=ik/T=TE=intel.com=lkp@kernel.org>
Date: Sat, 4 May 2019 19:40:50 +0800
From: kbuild test robot <lkp@intel.com>
Subject: [RFC PATCH] allegro: allegro_alloc_buffer() can be static
Message-ID: <20190504114050.GA12462@lkp-kbuild10>
References: <20190503122010.16663-5-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503122010.16663-5-m.tretter@pengutronix.de>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: kbuild-all@01.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org, tfiga@chromium.org, dshah@xilinx.com, hverkuil@xs4all.nl
List-ID: <devicetree@vger.kernel.org>


Fixes: ccd8b4b2b72d ("allegro: add Allegro DVT video IP core driver")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 allegro-core.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 5ed8553..f4313cc 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -732,8 +732,8 @@ allegro_get_firmware_info(struct allegro_dev *dev,
  * Buffers that are used internally by the MCU.
  */
 
-int allegro_alloc_buffer(struct allegro_dev *dev,
-			 struct allegro_buffer *buffer, size_t size)
+static int allegro_alloc_buffer(struct allegro_dev *dev,
+				struct allegro_buffer *buffer, size_t size)
 {
 	buffer->vaddr = dma_alloc_coherent(&dev->plat_dev->dev, size,
 					   &buffer->paddr, GFP_KERNEL);
@@ -744,7 +744,7 @@ int allegro_alloc_buffer(struct allegro_dev *dev,
 	return 0;
 }
 
-void allegro_free_buffer(struct allegro_dev *dev, struct allegro_buffer *buffer)
+static void allegro_free_buffer(struct allegro_dev *dev, struct allegro_buffer *buffer)
 {
 	if (buffer->vaddr) {
 		dma_free_coherent(&dev->plat_dev->dev, buffer->size,
@@ -1604,7 +1604,7 @@ static int allegro_receive_message(struct allegro_dev *dev)
 	return err;
 }
 
-irqreturn_t allegro_hardirq(int irq, void *data)
+static irqreturn_t allegro_hardirq(int irq, void *data)
 {
 	struct allegro_dev *dev = data;
 	unsigned int status;
@@ -1618,7 +1618,7 @@ irqreturn_t allegro_hardirq(int irq, void *data)
 	return IRQ_WAKE_THREAD;
 }
 
-irqreturn_t allegro_irq_thread(int irq, void *data)
+static irqreturn_t allegro_irq_thread(int irq, void *data)
 {
 	struct allegro_dev *dev = data;
 
