Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31F8C2D0C4
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 18:12:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9FC8C222C4
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 18:12:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qz+VoZCi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbfLISMC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 13:12:02 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52232 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbfLISMC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 13:12:02 -0500
Received: by mail-wm1-f65.google.com with SMTP id p9so326194wmc.2
        for <devicetree@vger.kernel.org>; Mon, 09 Dec 2019 10:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4K50bdfBGo5wv/ohbkLG+3JipC6XSwfSyXBMUuskNmE=;
        b=qz+VoZCi2ZkZPf4O3bdy8khdtdl8t/tUseUIY6WiqKbbJWekc5IUQKdpcypm5EMkel
         xqPdHX3CeThQc2N0RtPMuUniauvWEWGq40GoYXI0yVd8LbEWNP96eaGnT4QP070SobzJ
         zuv3qeO3/+eK+CLCq8+o3mKjEP3FAQTHumSHPD/d1MYdMravg1n14/mT+AUeE2Zn7uoy
         qC+fiL+l2N8Gkov7H0UAFhurlkzwGLezZQOw5F/R/0Cq3xJiG1q/d/Hb+9envEQ/tXGJ
         sCHDsfLiaL23XiTlMiAPMm2WhhcmLcB73I3Vk0eIJFuBaKHVAaglqEEM0v6qB0IqTR0A
         HDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4K50bdfBGo5wv/ohbkLG+3JipC6XSwfSyXBMUuskNmE=;
        b=VvurXxRUJN9M1ZC00d0brrjr+4U4Nrbyzx2u1ipptIAFFuMue/SLy5tS61mEiSTznX
         ZFkMExfh9vDtg+N0J2ComhSAaCPhMFNmgGlRZ1cA9WdLL9WLyIbpYMoNMoiEbyA9VSHx
         nXHaDL5K9D5o9BDkOpIZGChsVDc3Yll8EaSAg1TOGO64RIpR3BsDfpWATDf0i+RkuJcI
         yjL6e77mpQuYqryVOYq9xt14JoJLQR54g7RB/aF7ixW959wSF50W1bLCKdtqb3+s9t5X
         R5leGbmhO8haph+v6tW2FkQz30jYFRtfF+mo89VQpq9+D1nR70sJmGv1AgNUxNyxmQTT
         PZqA==
X-Gm-Message-State: APjAAAUTqVWuaoHVKMMrJ8YW6XdaSRouKQ3VL2S6joF4OsAa+jjFEOYh
        9acEz1+nxlwowS8Vg7UQHY69MfOdKdI=
X-Google-Smtp-Source: APXvYqymGhua6k1UiWoRVt/h0So4MtX0nqsi2/M4ba7JykDOOETk0lX7gu+MYa5fgf+Qs3/UisNgYA==
X-Received: by 2002:a7b:c851:: with SMTP id c17mr337626wml.71.1575915120418;
        Mon, 09 Dec 2019 10:12:00 -0800 (PST)
Received: from localhost.localdomain (adsl-62-167-101-88.adslplus.ch. [62.167.101.88])
        by smtp.gmail.com with ESMTPSA id h2sm309838wrv.66.2019.12.09.10.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 10:11:59 -0800 (PST)
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
Subject: [PATCH v3 04/13] ACPI/IORT: Support PASID for platform devices
Date:   Mon,  9 Dec 2019 19:05:05 +0100
Message-Id: <20191209180514.272727-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209180514.272727-1-jean-philippe@linaro.org>
References: <20191209180514.272727-1-jean-philippe@linaro.org>
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
2.24.0

