From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] of: Delete an unnecessary check before the function call
 "of_node_put"
Date: Tue, 19 Jul 2016 22:52:12 +0200
Message-ID: <8db62ad3-2e8a-327e-30a8-594f628cd8be@users.sourceforge.net>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>
List-Id: devicetree@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 19 Jul 2016 22:42:22 +0200

The of_node_put() function tests whether its argument is NULL
and then returns immediately.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/of/base.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index a4b6087..2601167 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1609,8 +1609,7 @@ static int __of_parse_phandle_with_args(const struct device_node *np,
 	 */
 
  err:
-	if (it.node)
-		of_node_put(it.node);
+	of_node_put(it.node);
 	return rc;
 }
 
-- 
2.9.2
