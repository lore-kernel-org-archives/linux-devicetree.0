From: Kieran Bingham <kieran@ksquared.org.uk>
Subject: [PATCH 1/4] fcp: Extend FCP compatible list to support the FDP
Date: Fri, 27 May 2016 18:19:21 +0100
Message-ID: <1464369565-12259-2-git-send-email-kieran@bingham.xyz>
References: <1464369565-12259-1-git-send-email-kieran@bingham.xyz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464369565-12259-1-git-send-email-kieran@bingham.xyz>
Sender: linux-kernel-owner@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, linux-renesas-soc@vger.kernel.org, kieran@ksquared.org.uk
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The FCP must be powered up for the FDP1 to function, even when the FDP1
does not make use of the FCNL features. Extend the compatible list
to allow us to use the power domain and runtime-pm support.

Signed-off-by: Kieran Bingham <kieran@bingham.xyz>
---
 drivers/media/platform/rcar-fcp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
index 6a7bcc3028b1..0ff6b1edf1db 100644
--- a/drivers/media/platform/rcar-fcp.c
+++ b/drivers/media/platform/rcar-fcp.c
@@ -160,6 +160,7 @@ static int rcar_fcp_remove(struct platform_device *pdev)
 
 static const struct of_device_id rcar_fcp_of_match[] = {
 	{ .compatible = "renesas,fcpv" },
+	{ .compatible = "renesas,fcpf" },
 	{ },
 };
 
-- 
2.5.0
