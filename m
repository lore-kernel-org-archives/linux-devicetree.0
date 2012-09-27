From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: [PATCH 09/14] media: mt9t112: support deferred probing
Date: Thu, 27 Sep 2012 16:07:28 +0200
Message-ID: <1348754853-28619-10-git-send-email-g.liakhovetski@gmx.de>
References: <1348754853-28619-1-git-send-email-g.liakhovetski@gmx.de>
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1348754853-28619-1-git-send-email-g.liakhovetski@gmx.de>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, Magnus Damm <magnus.damm@gmail.com>, linux-sh@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Stephen Warren <swarren@wwwdotorg.org>, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

If .probe() is called without our private data, this might mean, that the
host driver hasn't probed yet. Defer probing in this case.

Signed-off-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
---
 drivers/media/i2c/soc_camera/mt9t112.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/media/i2c/soc_camera/mt9t112.c b/drivers/media/i2c/soc_camera/mt9t112.c
index dfa03f0..9e0837c 100644
--- a/drivers/media/i2c/soc_camera/mt9t112.c
+++ b/drivers/media/i2c/soc_camera/mt9t112.c
@@ -1094,7 +1094,10 @@ static int mt9t112_probe(struct i2c_client *client,
 	};
 	int ret;
 
-	if (!icl || !icl->priv) {
+	if (!icl)
+		return -EPROBE_DEFER;
+
+	if (!icl->priv) {
 		dev_err(&client->dev, "mt9t112: missing platform data!\n");
 		return -EINVAL;
 	}
-- 
1.7.2.5
