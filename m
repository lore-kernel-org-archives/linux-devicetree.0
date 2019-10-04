From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 07/21] media: ti-vpe: Set MAX height supported to 2048 pixels
Date: Fri, 4 Oct 2019 11:29:38 -0500
Message-ID: <20191004162952.4963-8-bparrot@ti.com>
References: <20191004162952.4963-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191004162952.4963-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ram Prasad <x0038811@ti.com>, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

From: Ram Prasad <x0038811@ti.com>

VPE's max height supported MAX_H is set to 1184 which is the
padded height from VC1 decoder output.

In case of 90, 270 degree rotated video processing, input to
VPE will be 1080x1920, 720x1280 etc and MAX_H needs to be set
correct value. Setting MAX_H to 2048 as worst case height.

Signed-off-by: Ram Prasad <x0038811@ti.com>
Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/vpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
index f3ee9ff87927..bbbf11174e16 100644
--- a/drivers/media/platform/ti-vpe/vpe.c
+++ b/drivers/media/platform/ti-vpe/vpe.c
@@ -52,7 +52,7 @@
 #define MIN_W		32
 #define MIN_H		32
 #define MAX_W		2048
-#define MAX_H		1184
+#define MAX_H		2048
 
 /* required alignments */
 #define S_ALIGN		0	/* multiple of 1 */
-- 
2.17.1
