Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A55AC35248
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 12:53:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 40AF1207FF
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 12:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aMEN5de5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729075AbgAOMxk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 07:53:40 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51206 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbgAOMxj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 07:53:39 -0500
Received: by mail-wm1-f66.google.com with SMTP id d73so17740922wmd.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 04:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ovlZEJ3MFxMFIeaWjeBxqpybO8xAZBGhmofvDyv09KM=;
        b=aMEN5de52sUoibJjcgOb+6eTx1h6fTv2UQ6WOa5q3Q6KiJA4GEB9NVcvkjp5XTDpw0
         jyrlMPEEviSdgsEwPxnn9Qz4ztTIX7m8d3wu8FrFmUwKiXL+nOjMqWUR5vGtLernKgVK
         Q4R3z+oQjYLX0uQdMrVVaHa5dbQc3Tw0ln21IYTTubylIuPt2K9feenebb5Pze+7i3iH
         72VB4jpBo6CPlpj9BX+uLH0Gq/t5k7z+IV0RzkE2TBQ3QZHc/sNDML1H9dU55iSMdK92
         vuUczV5TEeoRgiZ9py79YvE0UIEZiXLTzJDRV+IIxn6fWVQr8YnXBCTycNdwBzUwU5eM
         OJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ovlZEJ3MFxMFIeaWjeBxqpybO8xAZBGhmofvDyv09KM=;
        b=X5tpWHhIg7Urv0T7aTXU28AQOBphNDIMZqifzUyWTbvZhDgjLeWLJPm5eS7ddVPe8Z
         KZI1Kaq7Fw5ZDnPhAMWhYlbEF65RI0loR+gwODczyG8G5DM5aTN5i29KcAiWRe0DEGpH
         upoFvAwCFN3wnCriUUHhUmmeeZw4wDmytVzLf3ZB0TYpS52bI7cMaLQGy+rusa+EH8lS
         ble3VFghXjM3lYtHn3Nb+Mp2OonS+/WEDvig8ica7G7lFwUj/H7pHZHfDg99BVMjIglZ
         KaLbyjESDcXZDXAJWcwJ5u2RaBBPTp9HCmFaLuo0EhOXDLcWbIX0ATI1hJ71SzFKtw1q
         faiQ==
X-Gm-Message-State: APjAAAVkH20nm+2zke5rxPeK1DT5JFkI5vnrTDrDgQZWxj1bwBLkiq6a
        by14fkh8Oc+9PB6NVr+ypHxqQA==
X-Google-Smtp-Source: APXvYqwvjgPB35BKDw3598B+f3tN02Oa/sBncf4ulCANAV1l9+FYbfBBXQvNAcGYK7F4agxMEERIfA==
X-Received: by 2002:a7b:c4c5:: with SMTP id g5mr33782202wmk.85.1579092817895;
        Wed, 15 Jan 2020 04:53:37 -0800 (PST)
Received: from localhost.localdomain ([2001:171b:2266:ba60:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id d12sm25196171wrp.62.2020.01.15.04.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 04:53:37 -0800 (PST)
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, will@kernel.org
Cc:     joro@8bytes.org, robh+dt@kernel.org, mark.rutland@arm.com,
        lorenzo.pieralisi@arm.com, guohanjun@huawei.com,
        sudeep.holla@arm.com, rjw@rjwysocki.net, lenb@kernel.org,
        robin.murphy@arm.com, bhelgaas@google.com, eric.auger@redhat.com,
        jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
Subject: [PATCH v5 09/13] iommu/arm-smmu-v3: Prepare for handling arm_smmu_write_ctx_desc() failure
Date:   Wed, 15 Jan 2020 13:52:35 +0100
Message-Id: <20200115125239.136759-10-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115125239.136759-1-jean-philippe@linaro.org>
References: <20200115125239.136759-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Second-level context descriptor tables will be allocated lazily in
arm_smmu_write_ctx_desc(). Help with handling allocation failure by
moving the CD write into arm_smmu_domain_finalise_s1().

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/arm-smmu-v3.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 7b7dea596f60..c35863073ab3 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -2299,8 +2299,15 @@ static int arm_smmu_domain_finalise_s1(struct arm_smmu_domain *smmu_domain,
 	cfg->cd.ttbr	= pgtbl_cfg->arm_lpae_s1_cfg.ttbr[0];
 	cfg->cd.tcr	= pgtbl_cfg->arm_lpae_s1_cfg.tcr;
 	cfg->cd.mair	= pgtbl_cfg->arm_lpae_s1_cfg.mair;
+
+	ret = arm_smmu_write_ctx_desc(smmu_domain, 0, &cfg->cd);
+	if (ret)
+		goto out_free_cd_tables;
+
 	return 0;
 
+out_free_cd_tables:
+	arm_smmu_free_cd_tables(smmu_domain);
 out_free_asid:
 	arm_smmu_bitmap_free(smmu->asid_map, asid);
 	return ret;
@@ -2567,10 +2574,6 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	if (smmu_domain->stage != ARM_SMMU_DOMAIN_BYPASS)
 		master->ats_enabled = arm_smmu_ats_supported(master);
 
-	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1)
-		arm_smmu_write_ctx_desc(smmu_domain, 0,
-					&smmu_domain->s1_cfg.cd);
-
 	arm_smmu_install_ste_for_dev(master);
 
 	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
-- 
2.24.1

