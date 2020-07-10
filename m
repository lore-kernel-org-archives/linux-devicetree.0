Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF174C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 01:57:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C06BC20775
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 01:57:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="itockxVW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgGJB5R (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jul 2020 21:57:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:22398 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726856AbgGJB5Q (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 9 Jul 2020 21:57:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594346236; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=4F33MECp3PLMA5dVQe508bFwLJi13Gd+zPp0VmPVuUU=; b=itockxVWsigebmJiRI/xTtrC0YeKJfS5NT+4tna4sSKt19ggbHMMzpkorizWIar8n5YCBRDF
 kqHPrnsgYRT0+NhIEcA1/gYhzLV4utPv7BwIaUoYhsN2sTquDEUc1NZN18ucQBrL3KmJpxSd
 OS3tRuUubiPZqARgCUAbwFx+JJA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-east-1.postgun.com with SMTP id
 5f07caf69f03943e5ca7efdf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 10 Jul 2020 01:57:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 265A8C433CA; Fri, 10 Jul 2020 01:57:09 +0000 (UTC)
Received: from mdtipton-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mdtipton)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CA6FBC433CB;
        Fri, 10 Jul 2020 01:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CA6FBC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mdtipton@codeaurora.org
From:   Mike Tipton <mdtipton@codeaurora.org>
To:     georgi.djakov@linaro.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mdtipton@codeaurora.org>
Subject: [PATCH v2 6/6] interconnect: qcom: Fix small BW votes being truncated to zero
Date:   Thu,  9 Jul 2020 18:56:52 -0700
Message-Id: <20200710015652.19206-7-mdtipton@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200710015652.19206-1-mdtipton@codeaurora.org>
References: <20200710015652.19206-1-mdtipton@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Small BW votes that translate to less than a single BCM unit are
currently truncated to zero. Ensure that non-zero BW requests always
result in at least a vote of 1 to BCM.

Fixes: 976daac4a1c5 ("interconnect: qcom: Consolidate interconnect RPMh support")
Signed-off-by: Mike Tipton <mdtipton@codeaurora.org>
---
 drivers/interconnect/qcom/bcm-voter.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
index be7660b95ccc..887d13721e52 100644
--- a/drivers/interconnect/qcom/bcm-voter.c
+++ b/drivers/interconnect/qcom/bcm-voter.c
@@ -54,8 +54,20 @@ static int cmp_vcd(void *priv, struct list_head *a, struct list_head *b)
 		return 1;
 }
 
+static u64 bcm_div(u64 num, u32 base)
+{
+	/* Ensure that small votes aren't lost. */
+	if (num && num < base)
+		return 1;
+
+	do_div(num, base);
+
+	return num;
+}
+
 static void bcm_aggregate(struct qcom_icc_bcm *bcm)
 {
+	struct qcom_icc_node *node;
 	size_t i, bucket;
 	u64 agg_avg[QCOM_ICC_NUM_BUCKETS] = {0};
 	u64 agg_peak[QCOM_ICC_NUM_BUCKETS] = {0};
@@ -63,22 +75,21 @@ static void bcm_aggregate(struct qcom_icc_bcm *bcm)
 
 	for (bucket = 0; bucket < QCOM_ICC_NUM_BUCKETS; bucket++) {
 		for (i = 0; i < bcm->num_nodes; i++) {
-			temp = bcm->nodes[i]->sum_avg[bucket] * bcm->aux_data.width;
-			do_div(temp, bcm->nodes[i]->buswidth * bcm->nodes[i]->channels);
+			node = bcm->nodes[i];
+			temp = bcm_div(node->sum_avg[bucket] * bcm->aux_data.width,
+				       node->buswidth * node->channels);
 			agg_avg[bucket] = max(agg_avg[bucket], temp);
 
-			temp = bcm->nodes[i]->max_peak[bucket] * bcm->aux_data.width;
-			do_div(temp, bcm->nodes[i]->buswidth);
+			temp = bcm_div(node->max_peak[bucket] * bcm->aux_data.width,
+				       node->buswidth);
 			agg_peak[bucket] = max(agg_peak[bucket], temp);
 		}
 
 		temp = agg_avg[bucket] * bcm->vote_scale;
-		do_div(temp, bcm->aux_data.unit);
-		bcm->vote_x[bucket] = temp;
+		bcm->vote_x[bucket] = bcm_div(temp, bcm->aux_data.unit);
 
 		temp = agg_peak[bucket] * bcm->vote_scale;
-		do_div(temp, bcm->aux_data.unit);
-		bcm->vote_y[bucket] = temp;
+		bcm->vote_y[bucket] = bcm_div(temp, bcm->aux_data.unit);
 	}
 
 	if (bcm->keepalive && bcm->vote_x[QCOM_ICC_BUCKET_AMC] == 0 &&
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

