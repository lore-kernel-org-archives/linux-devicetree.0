From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 3/3] drm/tinydrm: Fix setting of the column/page end addresses.
Date: Wed, 24 Oct 2018 11:43:13 -0700
Message-ID: <20181024184313.2967-4-eric@anholt.net>
References: <20181024184313.2967-1-eric@anholt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181024184313.2967-1-eric@anholt.net>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

If the clipped dirty region's x/y happened to align to 256, we would
have set the top 8 bits wrong.  Noticed by inspection, not by
reproducing a bug.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 drivers/gpu/drm/tinydrm/mipi-dbi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tinydrm/mipi-dbi.c b/drivers/gpu/drm/tinydrm/mipi-dbi.c
index cb3441e51d5f..1bb870021f6e 100644
--- a/drivers/gpu/drm/tinydrm/mipi-dbi.c
+++ b/drivers/gpu/drm/tinydrm/mipi-dbi.c
@@ -240,10 +240,10 @@ static int mipi_dbi_fb_dirty(struct drm_framebuffer *fb,
 
 	mipi_dbi_command(mipi, MIPI_DCS_SET_COLUMN_ADDRESS,
 			 (clip.x1 >> 8) & 0xFF, clip.x1 & 0xFF,
-			 (clip.x2 >> 8) & 0xFF, (clip.x2 - 1) & 0xFF);
+			 ((clip.x2 - 1) >> 8) & 0xFF, (clip.x2 - 1) & 0xFF);
 	mipi_dbi_command(mipi, MIPI_DCS_SET_PAGE_ADDRESS,
 			 (clip.y1 >> 8) & 0xFF, clip.y1 & 0xFF,
-			 (clip.y2 >> 8) & 0xFF, (clip.y2 - 1) & 0xFF);
+			 ((clip.y2 - 1) >> 8) & 0xFF, (clip.y2 - 1) & 0xFF);
 
 	ret = mipi_dbi_command_buf(mipi, MIPI_DCS_WRITE_MEMORY_START, tr,
 				(clip.x2 - clip.x1) * (clip.y2 - clip.y1) * 2);
-- 
2.19.1
