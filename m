From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH] of/video: fix build breakage in FB drivers
Date: Thu,  3 Jun 2010 02:20:44 +0200
Message-ID: <1275524444-19674-1-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fixes build errors in a number of framebuffer drivers caused
by the OF device_node pointer being moved into struct device

Signed-off-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
---
 drivers/video/bw2.c               |    2 +-
 drivers/video/cg14.c              |    2 +-
 drivers/video/cg3.c               |    2 +-
 drivers/video/leo.c               |    2 +-
 drivers/video/mb862xx/mb862xxfb.c |    2 +-
 drivers/video/p9100.c             |    2 +-
 drivers/video/tcx.c               |    2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/video/bw2.c b/drivers/video/bw2.c
index 2c371c0..09f1b9b 100644
--- a/drivers/video/bw2.c
+++ b/drivers/video/bw2.c
@@ -275,7 +275,7 @@ static int __devinit bw2_do_default_mode(struct bw2_par *par,
 
 static int __devinit bw2_probe(struct of_device *op, const struct of_device_id *match)
 {
-	struct device_node *dp = op->node;
+	struct device_node *dp = op->dev.of_node;
 	struct fb_info *info;
 	struct bw2_par *par;
 	int linebytes, err;
diff --git a/drivers/video/cg14.c b/drivers/video/cg14.c
index d12e05b..e5dc224 100644
--- a/drivers/video/cg14.c
+++ b/drivers/video/cg14.c
@@ -465,7 +465,7 @@ static void cg14_unmap_regs(struct of_device *op, struct fb_info *info,
 
 static int __devinit cg14_probe(struct of_device *op, const struct of_device_id *match)
 {
-	struct device_node *dp = op->node;
+	struct device_node *dp = op->dev.of_node;
 	struct fb_info *info;
 	struct cg14_par *par;
 	int is_8mb, linebytes, i, err;
diff --git a/drivers/video/cg3.c b/drivers/video/cg3.c
index b98f93f..558d73a 100644
--- a/drivers/video/cg3.c
+++ b/drivers/video/cg3.c
@@ -349,7 +349,7 @@ static int __devinit cg3_do_default_mode(struct cg3_par *par)
 static int __devinit cg3_probe(struct of_device *op,
 			       const struct of_device_id *match)
 {
-	struct device_node *dp = op->node;
+	struct device_node *dp = op->dev.of_node;
 	struct fb_info *info;
 	struct cg3_par *par;
 	int linebytes, err;
diff --git a/drivers/video/leo.c b/drivers/video/leo.c
index 3d78953..9e8bf7d 100644
--- a/drivers/video/leo.c
+++ b/drivers/video/leo.c
@@ -550,7 +550,7 @@ static void leo_unmap_regs(struct of_device *op, struct fb_info *info,
 static int __devinit leo_probe(struct of_device *op,
 			       const struct of_device_id *match)
 {
-	struct device_node *dp = op->node;
+	struct device_node *dp = op->dev.of_node;
 	struct fb_info *info;
 	struct leo_par *par;
 	int linebytes, err;
diff --git a/drivers/video/mb862xx/mb862xxfb.c b/drivers/video/mb862xx/mb862xxfb.c
index 0540de4..4e2b8cc 100644
--- a/drivers/video/mb862xx/mb862xxfb.c
+++ b/drivers/video/mb862xx/mb862xxfb.c
@@ -553,7 +553,7 @@ static int mb862xx_gdc_init(struct mb862xxfb_par *par)
 static int __devinit of_platform_mb862xx_probe(struct of_device *ofdev,
 					       const struct of_device_id *id)
 {
-	struct device_node *np = ofdev->node;
+	struct device_node *np = ofdev->dev.of_node;
 	struct device *dev = &ofdev->dev;
 	struct mb862xxfb_par *par;
 	struct fb_info *info;
diff --git a/drivers/video/p9100.c b/drivers/video/p9100.c
index c85dd40..6552751 100644
--- a/drivers/video/p9100.c
+++ b/drivers/video/p9100.c
@@ -251,7 +251,7 @@ static void p9100_init_fix(struct fb_info *info, int linebytes, struct device_no
 
 static int __devinit p9100_probe(struct of_device *op, const struct of_device_id *match)
 {
-	struct device_node *dp = op->node;
+	struct device_node *dp = op->dev.of_node;
 	struct fb_info *info;
 	struct p9100_par *par;
 	int linebytes, err;
diff --git a/drivers/video/tcx.c b/drivers/video/tcx.c
index ef7a7bd..cc039b3 100644
--- a/drivers/video/tcx.c
+++ b/drivers/video/tcx.c
@@ -365,7 +365,7 @@ static void tcx_unmap_regs(struct of_device *op, struct fb_info *info,
 static int __devinit tcx_probe(struct of_device *op,
 			       const struct of_device_id *match)
 {
-	struct device_node *dp = op->node;
+	struct device_node *dp = op->dev.of_node;
 	struct fb_info *info;
 	struct tcx_par *par;
 	int linebytes, i, err;
-- 
1.7.0.4
