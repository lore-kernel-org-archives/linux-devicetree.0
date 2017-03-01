From: Peng Fan <peng.fan-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 3/3] nvmem: octop: Add i.MX7D support
Date: Wed, 1 Mar 2017 14:40:54 +0800
Message-ID: <1488350454-23860-3-git-send-email-peng.fan@nxp.com>
References: <1488350454-23860-1-git-send-email-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488350454-23860-1-git-send-email-peng.fan-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, van.freenix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peng Fan <peng.fan-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add i.MX7D support.
There is 16 banks, each bank 4 words.

Signed-off-by: Peng Fan <peng.fan-3arQi8VN3Tc@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/nvmem/imx-ocotp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index b8ca1e6..41550ba 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -74,6 +74,7 @@ static const struct of_device_id imx_ocotp_dt_ids[] = {
 	{ .compatible = "fsl,imx6sl-ocotp", (void *)64 },
 	{ .compatible = "fsl,imx6sx-ocotp", (void *)128 },
 	{ .compatible = "fsl,imx6ul-ocotp", (void *)128 },
+	{ .compatible = "fsl,imx7d-ocotp", (void *)64 },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, imx_ocotp_dt_ids);
-- 
2.6.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
