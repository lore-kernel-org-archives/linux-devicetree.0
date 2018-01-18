From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH -next] of: platform: fix OF node refcount leak
Date: Thu, 18 Jan 2018 10:43:39 +0000
Message-ID: <1516272219-25359-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, Loys Ollivier <lollivier@baylibre.com>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

We need to call of_node_put() for device nodes obtained with
of_find_node_by_path().

Fixes: 3aa0582fdb82 ("of: platform: populate /firmware/ node from of_platform_default_populate_init()")
Reported-by: Loys Ollivier <lollivier@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/of/platform.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Hi Rob,

You had Acked the original patch and it's queued via ARM SoC. So can you
please provide ack on this if you are OK with the change.

Regards,
Sudeep

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 6a01dab597c7..c00d81dfac0b 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -514,8 +514,10 @@ static int __init of_platform_default_populate_init(void)
 		of_platform_device_create(node, NULL, NULL);

 	node = of_find_node_by_path("/firmware");
-	if (node)
+	if (node) {
 		of_platform_populate(node, NULL, NULL, NULL);
+		of_node_put(node);
+	}

 	/* Populate everything else. */
 	of_platform_default_populate(NULL, NULL, NULL);
--
2.7.4
