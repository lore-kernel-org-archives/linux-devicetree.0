From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/4] of: Grammar s/an/a/
Date: Wed, 22 Oct 2014 11:44:54 +0200
Message-ID: <1413971095-27192-3-git-send-email-geert+renesas@glider.be>
References: <1413971095-27192-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413971095-27192-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/of/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 48d6673fa9a28bf0..cff3afcff1951faf 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -923,7 +923,7 @@ const struct of_device_id *__of_match_node(const struct of_device_id *matches,
 }
 
 /**
- * of_match_node - Tell if an device_node has a matching of_match structure
+ * of_match_node - Tell if a device_node has a matching of_match structure
  *	@matches:	array of of device match structures to search in
  *	@node:		the of device structure to match against
  *
-- 
1.9.1
