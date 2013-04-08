From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 3/7] staging: drm/imx: ipu-di: add comments explaining signal
 generator configuration
Date: Mon,  8 Apr 2013 18:04:34 +0200
Message-ID: <1365437078-22579-4-git-send-email-p.zabel@pengutronix.de>
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
 drivers/staging/imx-drm/ipu-v3/ipu-di.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/imx-drm/ipu-v3/ipu-di.c b/drivers/staging/imx-drm/ipu-v3/ipu-di.c
index ec340da..26534b7 100644
--- a/drivers/staging/imx-drm/ipu-v3/ipu-di.c
+++ b/drivers/staging/imx-drm/ipu-v3/ipu-di.c
@@ -413,9 +413,11 @@ static void ipu_di_sync_config_noninterlaced(struct ipu_di *di,
 		sig->v_end_width;
 	struct di_sync_config cfg[] = {
 		{
+			/* 1: INT_HSYNC */
 			.run_count = h_total - 1,
 			.run_src = DI_SYNC_CLK,
 		} , {
+			/* PIN2: HSYNC */
 			.run_count = h_total - 1,
 			.run_src = DI_SYNC_CLK,
 			.offset_count = div * sig->v_to_h_sync,
@@ -424,23 +426,28 @@ static void ipu_di_sync_config_noninterlaced(struct ipu_di *di,
 			.cnt_polarity_trigger_src = DI_SYNC_CLK,
 			.cnt_down = sig->h_sync_width * 2,
 		} , {
+			/* PIN3: VSYNC */
 			.run_count = v_total - 1,
 			.run_src = DI_SYNC_INT_HSYNC,
 			.cnt_polarity_gen_en = 1,
 			.cnt_polarity_trigger_src = DI_SYNC_INT_HSYNC,
 			.cnt_down = sig->v_sync_width * 2,
 		} , {
+			/* 4: Line Active */
 			.run_src = DI_SYNC_HSYNC,
 			.offset_count = sig->v_sync_width + sig->v_start_width,
 			.offset_src = DI_SYNC_HSYNC,
 			.repeat_count = sig->height,
 			.cnt_clr_src = DI_SYNC_VSYNC,
 		} , {
+			/* 5: DE, referenced by DC */
 			.run_src = DI_SYNC_CLK,
 			.offset_count = sig->h_sync_width + sig->h_start_width,
 			.offset_src = DI_SYNC_CLK,
 			.repeat_count = sig->width,
-			.cnt_clr_src = 5,
+			.cnt_clr_src = 5, /* Line Active */
+		} , {
+			/* unused */
 		} , {
 			/* unused */
 		} , {
-- 
1.8.2.rc2
