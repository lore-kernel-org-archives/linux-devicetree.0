Return-Path: <SRS0=WWNl=FN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from foss.arm.com ([217.140.101.70]:60222 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752492AbeBSOv5 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 19 Feb 2018 09:51:57 -0500
From: Gilad Ben-Yossef <gilad@benyossef.com>
Subject: [PATCH 4/4] crypto: ccree: replace memset+kfree with kzfree
Date: Mon, 19 Feb 2018 14:51:24 +0000
Message-Id: <1519051887-4668-5-git-send-email-gilad@benyossef.com>
In-Reply-To: <1519051887-4668-1-git-send-email-gilad@benyossef.com>
References: <1519051887-4668-1-git-send-email-gilad@benyossef.com>
Sender: devicetree-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Ofir Drang <ofir.drang@arm.com>, linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Replace memset to 0 followed by kfree with kzfree for
simplicity.

Signed-off-by: Gilad Ben-Yossef <gilad@benyossef.com>
---
 drivers/crypto/ccree/cc_request_mgr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/ccree/cc_request_mgr.c b/drivers/crypto/ccree/cc_request_mgr.c
index 2fa0663..83a8aaae 100644
--- a/drivers/crypto/ccree/cc_request_mgr.c
+++ b/drivers/crypto/ccree/cc_request_mgr.c
@@ -81,8 +81,7 @@ void cc_req_mgr_fini(struct cc_drvdata *drvdata)
 	/* Kill tasklet */
 	tasklet_kill(&req_mgr_h->comptask);
 #endif
-	memset(req_mgr_h, 0, sizeof(struct cc_req_mgr_handle));
-	kfree(req_mgr_h);
+	kzfree(req_mgr_h);
 	drvdata->request_mgr_handle = NULL;
 }
 
-- 
2.7.4

