From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH 9/9] staging: bcm2835-audio: check for VCHIQ during probe
Date: Tue, 16 Oct 2018 17:02:28 +0200
Message-ID: <20181016150228.16994-10-nsaenzjulienne@suse.de>
References: <20181016150228.16994-1-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016150228.16994-1-nsaenzjulienne@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: eric@anholt.net, stefan.wahren@i2se.com, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.de, nsaenzjulienne@suse.de
List-Id: devicetree@vger.kernel.org

The audio data is sent to rpi's VideoCore IV trough VCHIQ. We make sure
it's available and that we fail gracefully in case it isn't there.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
index 039565311d10..f4b19a4a974b 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.c
@@ -294,9 +294,19 @@ static int snd_add_child_devices(struct device *device, u32 numchans)
 static int snd_bcm2835_alsa_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *fw_node;
 	u32 numchans;
 	int err;
 
+	fw_node = of_find_compatible_node(NULL, NULL, "brcm,bcm2835-vchiq");
+	if (!fw_node) {
+		dev_err(&pdev->dev, "no vchiq firmware node\n");
+		return -ENODEV;
+	}
+
+	if (!vchi_ready(fw_node))
+		return -EPROBE_DEFER;
+
 	err = of_property_read_u32(dev->of_node, "brcm,pwm-channels",
 				   &numchans);
 	if (err) {
-- 
2.19.1
