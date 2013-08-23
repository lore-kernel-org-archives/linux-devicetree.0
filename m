Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-bk0-f47.google.com ([209.85.214.47]:54150 "EHLO
	mail-bk0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752943Ab3HWDE2 (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 22 Aug 2013 23:04:28 -0400
Received: by mail-bk0-f47.google.com with SMTP id mx12so30248bkb.34
        for <devicetree@vger.kernel.org>; Thu, 22 Aug 2013 20:04:27 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 23 Aug 2013 11:04:27 +0800
Message-ID: <CAPgLHd_zSXzRWGgQUzsmsM4beiTFKoWtcic6QmJdxhfBvNEZYg@mail.gmail.com>
Subject: [PATCH -next] mtd: ofpart: use for_each_child_of_node() macro
From: Wei Yongjun <weiyj.lk@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: dwmw2@infradead.org, grant.likely@linaro.org, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Use for_each_child_of_node() macro instead of open coding it.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/mtd/ofpart.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 7843a44..d64f8c3 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -43,9 +43,8 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 		return 0;
 
 	/* First count the subnodes */
-	pp = NULL;
 	nr_parts = 0;
-	while ((pp = of_get_next_child(node, pp))) {
+	for_each_child_of_node(node,  pp) {
 		if (node_has_compatible(pp))
 			continue;
 
@@ -59,9 +58,8 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 	if (!*pparts)
 		return -ENOMEM;
 
-	pp = NULL;
 	i = 0;
-	while ((pp = of_get_next_child(node, pp))) {
+	for_each_child_of_node(node,  pp) {
 		const __be32 *reg;
 		int len;
 		int a_cells, s_cells;

