From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 2/6] media: sun6i: Add H3 compatible
Date: Fri, 30 Nov 2018 15:58:45 +0800
Message-ID: <20181130075849.16941-3-wens@csie.org>
References: <20181130075849.16941-1-wens@csie.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181130075849.16941-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The CSI controller found on the H3 (and H5) is a reduced version of the
one found on the A31. It only has 1 channel, instead of 4 channels for
time-multiplexed BT.656. Since the H3 is a reduced version, it cannot
"fallback" to a compatible that implements more features than it
supports.

Add a compatible string entry for the H3.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index 6950585edb5a..ee882b66a5ea 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -893,6 +893,7 @@ static int sun6i_csi_remove(struct platform_device *pdev)
 
 static const struct of_device_id sun6i_csi_of_match[] = {
 	{ .compatible = "allwinner,sun6i-a31-csi", },
+	{ .compatible = "allwinner,sun8i-h3-csi", },
 	{ .compatible = "allwinner,sun8i-v3s-csi", },
 	{},
 };
-- 
2.20.0.rc1
