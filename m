From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] usb: renesas_usbhs: unify Gen2/3 pipe_config setting
Date: Tue,  3 Oct 2017 20:09:13 +0900
Message-ID: <1507028954-15738-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1507028954-15738-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507028954-15738-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch unifies the Gen2 and Gen3 pipe_config setting on
usbhs_parse_dt().

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index f0ce304..2a860e4 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -519,8 +519,11 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
 		dparam->enable_gpio = gpio;
 
 	if (dparam->type == USBHS_TYPE_RCAR_GEN2 ||
-	    dparam->type == USBHS_TYPE_RCAR_GEN3)
+	    dparam->type == USBHS_TYPE_RCAR_GEN3) {
 		dparam->has_usb_dmac = 1;
+		dparam->pipe_configs = usbhsc_new_pipe;
+		dparam->pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
+	}
 
 	return info;
 }
@@ -577,17 +580,9 @@ static int usbhs_probe(struct platform_device *pdev)
 	switch (priv->dparam.type) {
 	case USBHS_TYPE_RCAR_GEN2:
 		priv->pfunc = usbhs_rcar2_ops;
-		if (!priv->dparam.pipe_configs) {
-			priv->dparam.pipe_configs = usbhsc_new_pipe;
-			priv->dparam.pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
-		}
 		break;
 	case USBHS_TYPE_RCAR_GEN3:
 		priv->pfunc = usbhs_rcar3_ops;
-		if (!priv->dparam.pipe_configs) {
-			priv->dparam.pipe_configs = usbhsc_new_pipe;
-			priv->dparam.pipe_size = ARRAY_SIZE(usbhsc_new_pipe);
-		}
 		break;
 	default:
 		if (!info->platform_callback.get_id) {
-- 
1.9.1
