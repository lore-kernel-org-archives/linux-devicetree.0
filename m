From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/6] video: mxsfb: remove dotclk_delay from platform_data
Date: Thu, 14 Mar 2013 13:53:27 +0800
Message-ID: <1363240410-16865-4-git-send-email-shawn.guo@linaro.org>
References: <1363240410-16865-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1363240410-16865-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Florian Tobias Schandinat <FlorianSchandinat-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

There is no in-tree mxsfb users using mxsfb_platform_data dotclk_delay.
Let's remove it from mxsfb_platform_data to ease full device tree
adoption of mxsfb driver.  If later we have platform/board need to
configure this parameter, we can add it into device tree bindings.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/video/mxsfb.c |    1 -
 include/linux/mxsfb.h |    1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/video/mxsfb.c b/drivers/video/mxsfb.c
index 776d0d5..001983a 100644
--- a/drivers/video/mxsfb.c
+++ b/drivers/video/mxsfb.c
@@ -700,7 +700,6 @@ static int mxsfb_init_fbinfo(struct mxsfb_info *host)
 	var->accel_flags = 0;
 	var->vmode = FB_VMODE_NONINTERLACED;
 
-	host->dotclk_delay = pdata->dotclk_delay;
 	host->ld_intf_width = pdata->ld_intf_width;
 
 	/* Memory allocation for framebuffer */
diff --git a/include/linux/mxsfb.h b/include/linux/mxsfb.h
index 93fc34b..6d64e2e 100644
--- a/include/linux/mxsfb.h
+++ b/include/linux/mxsfb.h
@@ -33,7 +33,6 @@ struct mxsfb_platform_data {
 
 	unsigned default_bpp;
 
-	unsigned dotclk_delay;	/* refer manual HW_LCDIF_VDCTRL4 register */
 	unsigned ld_intf_width;	/* refer STMLCDIF_* macros */
 };
 
-- 
1.7.9.5
