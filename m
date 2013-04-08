From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 6/7] staging: drm/imx: ipu-dc: force black output during
 blanking
Date: Mon,  8 Apr 2013 18:04:37 +0200
Message-ID: <1365437078-22579-7-git-send-email-p.zabel@pengutronix.de>
References: <1365437078-22579-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365437078-22579-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/staging/imx-drm/ipu-v3/ipu-dc.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/imx-drm/ipu-v3/ipu-dc.c b/drivers/staging/imx-drm/ipu-v3/ipu-dc.c
index 355b8a2..1cb0631 100644
--- a/drivers/staging/imx-drm/ipu-v3/ipu-dc.c
+++ b/drivers/staging/imx-drm/ipu-v3/ipu-dc.c
@@ -179,19 +179,21 @@ int ipu_dc_init_sync(struct ipu_dc *dc, struct ipu_di *di, bool interlaced,
 		if (dc->di) {
 			dc_link_event(dc, DC_EVT_NL, 2, 3);
 			dc_link_event(dc, DC_EVT_EOL, 3, 2);
-			dc_link_event(dc, DC_EVT_NEW_DATA, 4, 1);
+			dc_link_event(dc, DC_EVT_NEW_DATA, 1, 1);
 			/* Init template microcode */
 			dc_write_tmpl(dc, 2, WROD(0), 0, map, SYNC_WAVE, 8, 5, 1);
-			dc_write_tmpl(dc, 3, WROD(0), 0, map, SYNC_WAVE, 4, 5, 1);
-			dc_write_tmpl(dc, 4, WROD(0), 0, map, SYNC_WAVE, 0, 5, 1);
+			dc_write_tmpl(dc, 3, WROD(0), 0, map, SYNC_WAVE, 4, 5, 0);
+			dc_write_tmpl(dc, 4, WRG, 0, map, NULL_WAVE, 0, 0, 1);
+			dc_write_tmpl(dc, 1, WROD(0), 0, map, SYNC_WAVE, 0, 5, 1);
 		} else {
 			dc_link_event(dc, DC_EVT_NL, 5, 3);
 			dc_link_event(dc, DC_EVT_EOL, 6, 2);
-			dc_link_event(dc, DC_EVT_NEW_DATA, 7, 1);
+			dc_link_event(dc, DC_EVT_NEW_DATA, 8, 1);
 			/* Init template microcode */
 			dc_write_tmpl(dc, 5, WROD(0), 0, map, SYNC_WAVE, 8, 5, 1);
-			dc_write_tmpl(dc, 6, WROD(0), 0, map, SYNC_WAVE, 4, 5, 1);
-			dc_write_tmpl(dc, 7, WROD(0), 0, map, SYNC_WAVE, 0, 5, 1);
+			dc_write_tmpl(dc, 6, WROD(0), 0, map, SYNC_WAVE, 4, 5, 0);
+			dc_write_tmpl(dc, 7, WRG, 0, map, NULL_WAVE, 0, 0, 1);
+			dc_write_tmpl(dc, 8, WROD(0), 0, map, SYNC_WAVE, 0, 5, 1);
 		}
 	}
 	dc_link_event(dc, DC_EVT_NF, 0, 0);
-- 
1.8.2.rc2
