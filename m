From: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/4] [media] davinci: vpif_capture: don't lock over s_stream
Date: Fri, 18 Nov 2016 16:32:06 -0800
Message-ID: <20161119003208.10550-2-khilman@baylibre.com>
References: <20161119003208.10550-1-khilman@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20161119003208.10550-1-khilman@baylibre.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc: devicetree@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, Axel Haslam <ahaslam@baylibre.com>, =?UTF-8?q?Bartosz=20Go=C5=82aszewski?= <bgolaszewski@baylibre.com>, Alexandre Bailon <abailon@baylibre.com>, David Lechner <david@lechnology.com>
List-Id: devicetree@vger.kernel.org

Video capture subdevs may be over I2C and may sleep during xfer, so we
cannot do IRQ-disabled locking when calling the subdev.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/media/platform/davinci/vpif_capture.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
index 79cef74e164f..becc3e63b472 100644
--- a/drivers/media/platform/davinci/vpif_capture.c
+++ b/drivers/media/platform/davinci/vpif_capture.c
@@ -193,12 +193,16 @@ static int vpif_start_streaming(struct vb2_queue *vq, unsigned int count)
 		}
 	}
 
+	spin_unlock_irqrestore(&common->irqlock, flags);
+
 	ret = v4l2_subdev_call(ch->sd, video, s_stream, 1);
 	if (ret && ret != -ENOIOCTLCMD && ret != -ENODEV) {
 		vpif_dbg(1, debug, "stream on failed in subdev\n");
 		goto err;
 	}
 
+	spin_lock_irqsave(&common->irqlock, flags);
+
 	/* Call vpif_set_params function to set the parameters and addresses */
 	ret = vpif_set_video_params(vpif, ch->channel_id);
 	if (ret < 0) {
-- 
2.9.3
