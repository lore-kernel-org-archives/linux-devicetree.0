From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH 2/9] staging: bcm2835-audio: don't initialize memory twice
Date: Tue, 16 Oct 2018 17:02:21 +0200
Message-ID: <20181016150228.16994-3-nsaenzjulienne@suse.de>
References: <20181016150228.16994-1-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016150228.16994-1-nsaenzjulienne@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: eric@anholt.net, stefan.wahren@i2se.com, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.de, nsaenzjulienne@suse.de
List-Id: devicetree@vger.kernel.org

The memory is being allocated with devres_alloc(), wich ultimately uses
__GFP_ZERO to call kmalloc. We don't need to zero the memory area again
in bcm2835-audio.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
index 87d56ab1ffa0..0efae7068fef 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
@@ -39,8 +39,6 @@ static int bcm2835_devm_add_vchi_ctx(struct device *dev)
 	if (!vchi_ctx)
 		return -ENOMEM;
 
-	memset(vchi_ctx, 0, sizeof(*vchi_ctx));
-
 	ret = bcm2835_new_vchi_ctx(dev, vchi_ctx);
 	if (ret) {
 		devres_free(vchi_ctx);
-- 
2.19.1
