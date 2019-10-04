From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 18/21] media: ti-vpe: csc: rgb-to-yuv HD full range coeff are wrong
Date: Fri, 4 Oct 2019 11:29:49 -0500
Message-ID: <20191004162952.4963-19-bparrot@ti.com>
References: <20191004162952.4963-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191004162952.4963-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

The RGB to YUV HD full range coefficients did not match the TRM values
and appeared to be a cut-n-paste from the YUV to RGB section.

Replace the entries with the values from the TRM.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/csc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/csc.c b/drivers/media/platform/ti-vpe/csc.c
index eda2a5985da7..f0c45d187b5f 100644
--- a/drivers/media/platform/ti-vpe/csc.c
+++ b/drivers/media/platform/ti-vpe/csc.c
@@ -81,8 +81,8 @@ static struct colorspace_coeffs colorspace_coeffs[4] = {
 		},
 		{
 			/* HDTV */
-			0x04A8, 0x0000, 0x072C, 0x04A8, 0x1F26, 0x1DDE,
-			0x04A8, 0x0873, 0x0000, 0x0C20, 0x0134, 0x0B7C,
+			0x00bb, 0x0275, 0x003f, 0x1f99, 0x1ea5, 0x01c2,
+			0x01c2, 0x1e67, 0x1fd7, 0x0040, 0x0200, 0x0200,
 		},
 	},
 };
-- 
2.17.1
