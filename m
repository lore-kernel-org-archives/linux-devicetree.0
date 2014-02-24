From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH 1/3] fs_enet: update clock names to comply with FEC binding
Date: Mon, 24 Feb 2014 11:25:55 +0100
Message-ID: <1393237557-31406-1-git-send-email-gsi@denx.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

a recent FEC binding document update that was motivated by i.MX
development revealed that ARM and PowerPC implementations in Linux
did not agree on the clock names to use for the FEC nodes

change the OF clock lookup to prefer "ipg" over "per", which
improves compliance with the binding, and keeps compatibility
with former device trees

Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
---
 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c |   13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index 62f042d4aaa9..ce20184b96cb 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -1037,11 +1037,20 @@ static int fs_enet_probe(struct platform_device *ofdev)
 			fpi->use_rmii = 1;
 	}
 
-	/* make clock lookup non-fatal (the driver is shared among platforms),
+	/* the driver is shared across several PowerPC platforms, not all
+	 * of them provide COMMON_CLK support, and newer kernels are supposed
+	 * to keep working with older DT blobs, so clock lookup is non-fatal
+	 *
 	 * but require enable to succeed when a clock was specified/found,
 	 * keep a reference to the clock upon successful acquisition
+	 *
+	 * the FEC binding is shared with ARM platforms, so we lookup several
+	 * clock names to prefer the common naming convention yet support
+	 * names that were used before unification
 	 */
-	clk = devm_clk_get(&ofdev->dev, "per");
+	clk = devm_clk_get(&ofdev->dev, "ipg");
+	if (IS_ERR(clk))
+		clk = devm_clk_get(&ofdev->dev, "per");
 	if (!IS_ERR(clk)) {
 		err = clk_prepare_enable(clk);
 		if (err) {
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
