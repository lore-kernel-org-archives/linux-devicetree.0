Return-Path: <SRS0=R1yt=2J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFCCC2D0C1
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 16:31:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E51D624680
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Dec 2019 16:31:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KsJmWTGB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbfLSQb2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Dec 2019 11:31:28 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39342 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726936AbfLSQb0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Dec 2019 11:31:26 -0500
Received: by mail-wr1-f68.google.com with SMTP id y11so6619650wrt.6
        for <devicetree@vger.kernel.org>; Thu, 19 Dec 2019 08:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SVox6K0aClSgQAj4ZePzlVYlKOAA5RM1JxWE0eeJ+CM=;
        b=KsJmWTGBulFgtHxInjLbvLy9PpRX0GteBfzNXmUrDZJrH+ZYaBQIa1dHh47VnHT3Us
         G2OJX3xgvKyS2XK3zuqcw1ZOXlKDVBJQRRMVF0nOr9xyj+lDw01Q6Jd6vR/rkeYccEHt
         yJOWYb/rjfBgXbMc7wgknxeamdVg+ZZN29ommW/LnpTHOjUz0VpuiDmfABbg1QOhKWEP
         BK79LYU2nE8gQz8QcvCdTDHowZsM7F9ia5UVAVVs4wcvu3pPH0s1tj25cZ4VQrLWBmC5
         SAfWsR+i6gOKs+s2DrspT9Ahp+NfOeXnTsawx79CvIM08A0Wu8V+jAyezZPtTeJVSYeM
         zLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SVox6K0aClSgQAj4ZePzlVYlKOAA5RM1JxWE0eeJ+CM=;
        b=J/b8YuWPaW/aekftyMFfZgnez4DdgIoGF6zTnzGxuFTPdalHWThx4EIQoK39enK+KO
         wAzxTQ1XY1W/K9vpu4GyOZTbaqr5dHRlq5lyrBsqMOijD4hDxfZj1o/M3RspGwtrxeE3
         PKh7KfvMjBvmk40U8d9n0sOSefGPKJTzZnd9VDKl1wGmCt9wk/ICvPydHD8UCjgMzOFZ
         ceJ8NjYXTIFplUptSf5+viEaQ2LzNbcJy/d8Vevf5LhVmjNzBoLqXObEEf6XRC8kaXy0
         Zzdl8aNi9ZM0svnGN0V1mkaFHMM7Te5swnthzedjTG7NF7w1mY+b6UMCaAPlpQpUvQKd
         pbMQ==
X-Gm-Message-State: APjAAAWSEifLptsSu33nGoIIVouj9eo2RpfrPbsIrdYW57aQYiL0kTX4
        rSjMeZ38NO8QsX4CnzB/7kgFUg==
X-Google-Smtp-Source: APXvYqzR3BRml1Osw8Pe6sNrf17z34IMgIAsII/16lKoUagOiEfpACFYNxRXRQ+jtWBFUTIlzmF8Sw==
X-Received: by 2002:adf:eb48:: with SMTP id u8mr9977279wrn.283.1576773084271;
        Thu, 19 Dec 2019 08:31:24 -0800 (PST)
Received: from localhost.localdomain (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
        by smtp.gmail.com with ESMTPSA id u22sm7092068wru.30.2019.12.19.08.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 08:31:23 -0800 (PST)
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org
Cc:     joro@8bytes.org, robh+dt@kernel.org, mark.rutland@arm.com,
        lorenzo.pieralisi@arm.com, guohanjun@huawei.com,
        sudeep.holla@arm.com, rjw@rjwysocki.net, lenb@kernel.org,
        will@kernel.org, robin.murphy@arm.com, bhelgaas@google.com,
        eric.auger@redhat.com, jonathan.cameron@huawei.com,
        zhangfei.gao@linaro.org
Subject: [PATCH v4 04/13] ACPI/IORT: Parse SSID property of named component node
Date:   Thu, 19 Dec 2019 17:30:24 +0100
Message-Id: <20191219163033.2608177-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219163033.2608177-1-jean-philippe@linaro.org>
References: <20191219163033.2608177-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Named component nodes in the IORT tables describe the number of
Substream ID bits (aka. PASID) supported by the device. Propagate this
value to the fwspec structure in order to enable PASID for platform
devices.

Acked-by: Hanjun Guo <guohanjun@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/acpi/arm64/iort.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index 33f71983e001..39f389214ecf 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -11,6 +11,7 @@
 #define pr_fmt(fmt)	"ACPI: IORT: " fmt
 
 #include <linux/acpi_iort.h>
+#include <linux/bitfield.h>
 #include <linux/iommu.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
@@ -924,6 +925,20 @@ static int iort_pci_iommu_init(struct pci_dev *pdev, u16 alias, void *data)
 	return iort_iommu_xlate(info->dev, parent, streamid);
 }
 
+static void iort_named_component_init(struct device *dev,
+				      struct acpi_iort_node *node)
+{
+	struct acpi_iort_named_component *nc;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+
+	if (!fwspec)
+		return;
+
+	nc = (struct acpi_iort_named_component *)node->node_data;
+	fwspec->num_pasid_bits = FIELD_GET(ACPI_IORT_NC_PASID_BITS,
+					   nc->node_flags);
+}
+
 /**
  * iort_iommu_configure - Set-up IOMMU configuration for a device.
  *
@@ -978,6 +993,9 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
 			if (parent)
 				err = iort_iommu_xlate(dev, parent, streamid);
 		} while (parent && !err);
+
+		if (!err)
+			iort_named_component_init(dev, node);
 	}
 
 	/*
-- 
2.24.1

