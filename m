Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB57FC6198
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 15:27:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C8862178F
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 15:27:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Stc/zRTg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbfKHP1A (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 10:27:00 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34600 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbfKHP1A (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Nov 2019 10:27:00 -0500
Received: by mail-wr1-f66.google.com with SMTP id e6so7561545wrw.1
        for <devicetree@vger.kernel.org>; Fri, 08 Nov 2019 07:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FjGV9dHEsXE/CXRMwyPeo6zW+qyz6ot3r0JcxY8EA5E=;
        b=Stc/zRTgvuJV42ldqRHlqe8DkziQ/xZI3K/M//32mxdJaRU1jz2L5/fMxZ1QFhpcGb
         EvSLry3iFu8329VB2GuTsvuMtRKQtUr6NhZe+OfFoUtq8NdYCPynlIwHbw/GjFUbmRC+
         H6gal8DBpakRVo3SnhTJfseRLFp1XqfFkb3D3NUiwdPCcqFJAIgPj+gGr6Z9Up4EP+4P
         8+Ut1quAnJxAurGbZKQH/VrQGWCWm7la8zmxc89J8tDCxR4MRqdAj9qnVky2l9P/QGSc
         7hQrDyjXx2qQgCLFiaNFaKInDn2CY6ehhHcEYqTjArSQZFKJgu0xbSGyle/kTSvYSm0a
         jagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FjGV9dHEsXE/CXRMwyPeo6zW+qyz6ot3r0JcxY8EA5E=;
        b=VCqo/qeaLZ3m1fEd0qhjkA4Lwt7kfUCdkUI9A8QTB+8YsqOSRRVaGwVddGpDrF41b0
         XSXJ+rc0ImOLluSmaEY/J72KaNBrnsBjkLOsfymnt/HtRVTDSX9ln2To6G7vaqxjZzLi
         OjSVeEznACiX3WJa/bspJUfzYiZNdNmyecR0uTszA1Qds14WWuxhDfJ0DWLDD7EQF+Sd
         fndiRizAPH+mpl7lid/XRCo9nP5qXGFDDvOILnarAPcanbvpIOjq9UNsV7mHP+5eAYrJ
         HrRTBv+U+FhbKTktstCPBY5eE1MCspJ9APETEgN0T2XYQKQAwIKD83Wk0n8HCTTTFQtc
         4lFw==
X-Gm-Message-State: APjAAAVj/IV2Kl2kHL6WKhobpNCY2p+u2yIXnjn/vXtfAJuYobPPxnD0
        ZzJ+cPH8+F4Kz+BYTSMWTZtPLQ==
X-Google-Smtp-Source: APXvYqyYxAoUhXJzLGprymri1AM4kybRhlq/Xshi8NVcy8x0x8VatgjfP55PcG/0utxa9PrTdLVdag==
X-Received: by 2002:a5d:4c4e:: with SMTP id n14mr9845340wrt.260.1573226817077;
        Fri, 08 Nov 2019 07:26:57 -0800 (PST)
Received: from localhost.localdomain ([85.195.192.192])
        by smtp.gmail.com with ESMTPSA id w18sm6579232wrp.31.2019.11.08.07.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 07:26:56 -0800 (PST)
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     joro@8bytes.org, robh+dt@kernel.org, mark.rutland@arm.com,
        lorenzo.pieralisi@arm.com, guohanjun@huawei.com,
        sudeep.holla@arm.com, rjw@rjwysocki.net, lenb@kernel.org,
        will@kernel.org, robin.murphy@arm.com, zhangfei.gao@linaro.org,
        eric.auger@redhat.com, jonathan.cameron@huawei.com
Subject: [PATCH v2 8/8] iommu/arm-smmu-v3: Add support for PCI PASID
Date:   Fri,  8 Nov 2019 16:25:08 +0100
Message-Id: <20191108152508.4039168-9-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108152508.4039168-1-jean-philippe@linaro.org>
References: <20191108152508.4039168-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Enable PASID for PCI devices that support it. Since the SSID tables are
allocated by arm_smmu_attach_dev(), PASID has to be enabled early enough.
arm_smmu_dev_feature_enable() would be too late, since by that time the
main DMA domain has already been attached. Do it in add_device() instead.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/arm-smmu-v3.c | 51 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 88ec0bf33492..3ee313c08325 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -2633,6 +2633,49 @@ static void arm_smmu_disable_ats(struct arm_smmu_master *master)
 	atomic_dec(&smmu_domain->nr_ats_masters);
 }
 
+static int arm_smmu_enable_pasid(struct arm_smmu_master *master)
+{
+	int ret;
+	int features;
+	int num_pasids;
+	struct pci_dev *pdev;
+
+	if (!dev_is_pci(master->dev))
+		return -ENOSYS;
+
+	pdev = to_pci_dev(master->dev);
+
+	features = pci_pasid_features(pdev);
+	if (features < 0)
+		return -ENOSYS;
+
+	num_pasids = pci_max_pasids(pdev);
+	if (num_pasids <= 0)
+		return -ENOSYS;
+
+	ret = pci_enable_pasid(pdev, features);
+	if (!ret)
+		master->ssid_bits = min_t(u8, ilog2(num_pasids),
+					  master->smmu->ssid_bits);
+	return ret;
+}
+
+static void arm_smmu_disable_pasid(struct arm_smmu_master *master)
+{
+	struct pci_dev *pdev;
+
+	if (!dev_is_pci(master->dev))
+		return;
+
+	pdev = to_pci_dev(master->dev);
+
+	if (!pdev->pasid_enabled)
+		return;
+
+	master->ssid_bits = 0;
+	pci_disable_pasid(pdev);
+}
+
 static void arm_smmu_detach_dev(struct arm_smmu_master *master)
 {
 	unsigned long flags;
@@ -2841,13 +2884,16 @@ static int arm_smmu_add_device(struct device *dev)
 
 	master->ssid_bits = min(smmu->ssid_bits, fwspec->num_pasid_bits);
 
+	/* Note that PASID must be enabled before, and disabled after ATS */
+	arm_smmu_enable_pasid(master);
+
 	if (!(smmu->features & ARM_SMMU_FEAT_2_LVL_CDTAB))
 		master->ssid_bits = min_t(u8, master->ssid_bits,
 					  CTXDESC_LINEAR_CDMAX);
 
 	ret = iommu_device_link(&smmu->iommu, dev);
 	if (ret)
-		goto err_free_master;
+		goto err_disable_pasid;
 
 	group = iommu_group_get_for_dev(dev);
 	if (IS_ERR(group)) {
@@ -2860,6 +2906,8 @@ static int arm_smmu_add_device(struct device *dev)
 
 err_unlink:
 	iommu_device_unlink(&smmu->iommu, dev);
+err_disable_pasid:
+	arm_smmu_disable_pasid(master);
 err_free_master:
 	kfree(master);
 	fwspec->iommu_priv = NULL;
@@ -2880,6 +2928,7 @@ static void arm_smmu_remove_device(struct device *dev)
 	arm_smmu_detach_dev(master);
 	iommu_group_remove_device(dev);
 	iommu_device_unlink(&smmu->iommu, dev);
+	arm_smmu_disable_pasid(master);
 	kfree(master);
 	iommu_fwspec_free(dev);
 }
-- 
2.23.0

