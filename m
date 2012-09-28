From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] crypto: convert to use be16_add_cpu()
Date: Fri, 28 Sep 2012 12:52:25 +0800
Message-ID: <CAPgLHd83AK565T27aqLUcK4o8ZJh=RCaBaqcnHH8ivwQTBgcaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-crypto-owner@vger.kernel.org>
Sender: linux-crypto-owner@vger.kernel.org
To: herbert@gondor.apana.org.au, grant.likely@secretlab.ca, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-crypto@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Convert cpu_to_be16(be16_to_cpu(E1) + E2) to use be16_add_cpu().

dpatch engine is used to auto generate this patch.
(https://github.com/weiyj/dpatch)

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/crypto/talitos.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c
index efff788..c1bf42f 100644
--- a/drivers/crypto/talitos.c
+++ b/drivers/crypto/talitos.c
@@ -919,8 +919,7 @@ static int sg_to_link_tbl(struct scatterlist *sg, int sg_count,
 		sg_count--;
 		link_tbl_ptr--;
 	}
-	link_tbl_ptr->len = cpu_to_be16(be16_to_cpu(link_tbl_ptr->len)
-					+ cryptlen);
+	be16_add_cpu(&link_tbl_ptr->len, cryptlen);
 
 	/* tag end of link table */
 	link_tbl_ptr->j_extent = DESC_PTR_LNKTBL_RETURN;
