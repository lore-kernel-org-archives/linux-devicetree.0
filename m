From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH 5/9] staging: bcm2835-audio: more generic probe function name
Date: Tue, 16 Oct 2018 17:02:24 +0200
Message-ID: <20181016150228.16994-6-nsaenzjulienne@suse.de>
References: <20181016150228.16994-1-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016150228.16994-1-nsaenzjulienne@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: eric@anholt.net, stefan.wahren@i2se.com, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.de, nsaenzjulienne@suse.de
List-Id: devicetree@vger.kernel.org

There will only be one probe function, there is no use for appendig
"_dt" the end of the name.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
index 6ee8334dfc81..039565311d10 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
@@ -291,7 +291,7 @@ static int snd_add_child_devices(struct device *device, u32 numchans)
 	return 0;
 }
 
-static int snd_bcm2835_alsa_probe_dt(struct platform_device *pdev)
+static int snd_bcm2835_alsa_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	u32 numchans;
@@ -344,7 +344,7 @@ static const struct of_device_id snd_bcm2835_of_match_table[] = {
 MODULE_DEVICE_TABLE(of, snd_bcm2835_of_match_table);
 
 static struct platform_driver bcm2835_alsa0_driver = {
-	.probe = snd_bcm2835_alsa_probe_dt,
+	.probe = snd_bcm2835_alsa_probe,
 #ifdef CONFIG_PM
 	.suspend = snd_bcm2835_alsa_suspend,
 	.resume = snd_bcm2835_alsa_resume,
-- 
2.19.1
