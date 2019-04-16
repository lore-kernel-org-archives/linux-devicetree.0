From: Colin King <colin.king@canonical.com>
Subject: [PATCH] scripts/dtc: fix spelling mistake "endpont" -> "endpoint"
Date: Tue, 16 Apr 2019 12:12:14 +0100
Message-ID: <20190416111214.22107-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a FAIL message, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 scripts/dtc/checks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/dtc/checks.c b/scripts/dtc/checks.c
index 4834e44b37b2..faddf6a57236 100644
--- a/scripts/dtc/checks.c
+++ b/scripts/dtc/checks.c
@@ -1714,7 +1714,7 @@ static void check_graph_endpoint(struct check *c, struct dt_info *dti,
 		return;
 
 	if (!strprefixeq(node->name, node->basenamelen, "endpoint"))
-		FAIL(c, dti, node, "graph endpont node name should be 'endpoint'");
+		FAIL(c, dti, node, "graph endpoint node name should be 'endpoint'");
 
 	check_graph_reg(c, dti, node);
 
-- 
2.20.1
