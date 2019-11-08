Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8ACFC6195
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 15:26:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3AF8222CB
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 15:26:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BDQ7ZeC9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbfKHP06 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 10:26:58 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38414 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbfKHP06 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Nov 2019 10:26:58 -0500
Received: by mail-wm1-f65.google.com with SMTP id z19so6624145wmk.3
        for <devicetree@vger.kernel.org>; Fri, 08 Nov 2019 07:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XcF4FI/xEJT2ddBZxLwsH4kwVBtXhLcA/n4y2uy3gfU=;
        b=BDQ7ZeC9LB/2Lh6DQj16J8t0f6umU/jbny0nZwuikklVbgDi7dCWTbWMm0aRjLi005
         V9skokHIp4EKef66gOqo4I/nTxWGvc+9S6EKjBlJxyLdKbQSqZqWvqeY+Z77HTqkfX16
         4JkmEuH7gjM/RdLJO9BN/Vyp34vnY9Hjxh0xTuSOc2pbbXcqJvbeKLT8KPs3B6zuGeSk
         oQeEJyv8qFljGOOQ55RrjTk0fCjjESA+CfjKaY7SQ8SZ3HRmaDrfbgz8Gb5nIqgT00q+
         AA1hFm+CnyswDokicO8N1z95D2kGm5pzZtaKebbBgrFl7rKhfqfepJE34J7LhtfZSbFY
         G1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XcF4FI/xEJT2ddBZxLwsH4kwVBtXhLcA/n4y2uy3gfU=;
        b=n/HQ75oaVK/HY0yAP/nJmuLCANKVocJ/OWzZhRwiSa27dizKZh2tRJyzPDtH66xS9f
         uAVbtiUzijvKu6Kw4eIufyfEil7etQy4XD7TCCeiTlKwInxA5jAx4X68v5a/xX8Lb7D0
         lYNrK4UbGb05K9GSWlaB0ojIoTSC/ptUsqMEHq13+rCyuk1s/+qy8BPoRjpL/LWDhBZx
         sKEEyqLbq4Q083oV4WO4+4NDkrpNnZ5XxY6JVFewvX16kl/1niXv6yjyc7fKteaSjR8W
         MsRYIqzJGTwtPtGEc+x1YmhRtq13p3uw34M/T+aUuaIrcb3TE2HXAICRbQmzShG900Qu
         /QlQ==
X-Gm-Message-State: APjAAAU14Fyf7t6tKRJjEkIpzf6r1PxAp6yFn0ORI/36diu5uFpOGnZP
        DLKo23x7tPaTYUOVz/S5LfbLmlemJK4x2w==
X-Google-Smtp-Source: APXvYqzgCicwCZbEjPp1W/xKMCJmORJ4A/9v+uL6ZQTDFPmzJrCekPgMET2BLRpL/BAud9T+NepWPQ==
X-Received: by 2002:a1c:9917:: with SMTP id b23mr8603435wme.42.1573226815904;
        Fri, 08 Nov 2019 07:26:55 -0800 (PST)
Received: from localhost.localdomain ([85.195.192.192])
        by smtp.gmail.com with ESMTPSA id w18sm6579232wrp.31.2019.11.08.07.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 07:26:55 -0800 (PST)
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     joro@8bytes.org, robh+dt@kernel.org, mark.rutland@arm.com,
        lorenzo.pieralisi@arm.com, guohanjun@huawei.com,
        sudeep.holla@arm.com, rjw@rjwysocki.net, lenb@kernel.org,
        will@kernel.org, robin.murphy@arm.com, zhangfei.gao@linaro.org,
        eric.auger@redhat.com, jonathan.cameron@huawei.com
Subject: [PATCH v2 7/8] iommu/arm-smmu-v3: Improve add_device() error handling
Date:   Fri,  8 Nov 2019 16:25:07 +0100
Message-Id: <20191108152508.4039168-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108152508.4039168-1-jean-philippe@linaro.org>
References: <20191108152508.4039168-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Let add_device() clean up after itself. The iommu_bus_init() function
does call remove_device() on error, but other sites (e.g. of_iommu) do
not.

Don't free level-2 stream tables because we'd have to track if we
allocated each of them or if they are used by other endpoints. It's not
worth the hassle since they are managed resources.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/arm-smmu-v3.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 82eac89ee187..88ec0bf33492 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -2826,14 +2826,16 @@ static int arm_smmu_add_device(struct device *dev)
 	for (i = 0; i < master->num_sids; i++) {
 		u32 sid = master->sids[i];
 
-		if (!arm_smmu_sid_in_range(smmu, sid))
-			return -ERANGE;
+		if (!arm_smmu_sid_in_range(smmu, sid)) {
+			ret = -ERANGE;
+			goto err_free_master;
+		}
 
 		/* Ensure l2 strtab is initialised */
 		if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
 			ret = arm_smmu_init_l2_strtab(smmu, sid);
 			if (ret)
-				return ret;
+				goto err_free_master;
 		}
 	}
 
@@ -2843,13 +2845,25 @@ static int arm_smmu_add_device(struct device *dev)
 		master->ssid_bits = min_t(u8, master->ssid_bits,
 					  CTXDESC_LINEAR_CDMAX);
 
+	ret = iommu_device_link(&smmu->iommu, dev);
+	if (ret)
+		goto err_free_master;
+
 	group = iommu_group_get_for_dev(dev);
-	if (!IS_ERR(group)) {
-		iommu_group_put(group);
-		iommu_device_link(&smmu->iommu, dev);
+	if (IS_ERR(group)) {
+		ret = PTR_ERR(group);
+		goto err_unlink;
 	}
 
-	return PTR_ERR_OR_ZERO(group);
+	iommu_group_put(group);
+	return 0;
+
+err_unlink:
+	iommu_device_unlink(&smmu->iommu, dev);
+err_free_master:
+	kfree(master);
+	fwspec->iommu_priv = NULL;
+	return ret;
 }
 
 static void arm_smmu_remove_device(struct device *dev)
-- 
2.23.0

