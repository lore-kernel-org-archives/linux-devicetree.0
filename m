From: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 2/4] [media] davinci: vpif_capture: don't lock over s_stream
Date: Mon, 21 Nov 2016 17:44:06 -0800
Message-ID: <20161122014408.22388-3-khilman@baylibre.com>
References: <20161122014408.22388-1-khilman@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20161122014408.22388-1-khilman@baylibre.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc: devicetree@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>, Axel Haslam <ahaslam@baylibre.com>, =?UTF-8?q?Bartosz=20Go=C5=82aszewski?= <bgolaszewski@baylibre.com>, Alexandre Bailon <abailon@baylibre.com>, David Lechner <david@lechnology.com>
List-Id: devicetree@vger.kernel.org

Video capture subdevs may be over I2C and may sleep during xfer, so we
cannot do IRQ-disabled locking when calling the subdev.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/media/platform/davinci/vpif_capture.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
index 87ee1e2c3864..94ee6cf03f02 100644
--- a/drivers/media/platform/davinci/vpif_capture.c
+++ b/drivers/media/platform/davinci/vpif_capture.c
@@ -193,7 +193,10 @@ static int vpif_start_streaming(struct vb2_queue *vq, unsigned int count)
 		}
 	}
 
+	spin_unlock_irqrestore(&common->irqlock, flags);
 	ret = v4l2_subdev_call(ch->sd, video, s_stream, 1);
+	spin_lock_irqsave(&common->irqlock, flags);
+
 	if (ret && ret != -ENOIOCTLCMD && ret != -ENODEV) {
 		vpif_dbg(1, debug, "stream on failed in subdev\n");
 		goto err;
-- 
2.9.3
