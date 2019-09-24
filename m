From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 2/8] media: i2c: ov2659: Fix sensor detection to actually fail when device is not present
Date: Tue, 24 Sep 2019 11:44:08 -0500
Message-ID: <20190924164414.21897-3-bparrot@ti.com>
References: <20190924164414.21897-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190924164414.21897-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>, Jyri Sarha <jsarha@ti.com>
List-Id: devicetree@vger.kernel.org

Make sure that if the expected sensor device id register
is not recognized properly the failure is propagated
up so devices are not left partially initialized.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 drivers/media/i2c/ov2659.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index 17573257097d..efbe6dc720e2 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1330,11 +1330,12 @@ static int ov2659_detect(struct v4l2_subdev *sd)
 		unsigned short id;
 
 		id = OV265X_ID(pid, ver);
-		if (id != OV2659_ID)
+		if (id != OV2659_ID) {
 			dev_err(&client->dev,
 				"Sensor detection failed (%04X, %d)\n",
 				id, ret);
-		else {
+			ret = -ENODEV;
+		} else {
 			dev_info(&client->dev, "Found OV%04X sensor\n", id);
 			ret = ov2659_init(sd, 0);
 		}
-- 
2.17.1
