From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 02/13] media: am437x-vpfe: Fix missing first line
Date: Fri, 20 Sep 2019 12:05:43 -0500
Message-ID: <20190920170554.29666-3-bparrot@ti.com>
References: <20190920170554.29666-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190920170554.29666-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>, Jyri Sarha <jsarha@ti.com>
List-Id: devicetree@vger.kernel.org

Previous generation of this driver were hard coded to handle
encoder/decoder where the first line never contains any data and
was therefore always skipped, however when dealing with actual
camera sensors the first line is always present.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index a3d22f90e64c..1521c072f3e3 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -345,13 +345,9 @@ static void vpfe_ccdc_setwin(struct vpfe_ccdc *ccdc,
 	if (frm_fmt == CCDC_FRMFMT_INTERLACED) {
 		vert_nr_lines = (image_win->height >> 1) - 1;
 		vert_start >>= 1;
-		/* Since first line doesn't have any data */
-		vert_start += 1;
 		/* configure VDINT0 */
 		val = (vert_start << VPFE_VDINT_VDINT0_SHIFT);
 	} else {
-		/* Since first line doesn't have any data */
-		vert_start += 1;
 		vert_nr_lines = image_win->height - 1;
 		/*
 		 * configure VDINT0 and VDINT1. VDINT1 will be at half
-- 
2.17.1
