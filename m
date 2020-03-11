Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138FBC2BB57
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 12:47:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB01F222C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 12:47:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IMq0GOgl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729456AbgCKMrM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 08:47:12 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50509 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729504AbgCKMrL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Mar 2020 08:47:11 -0400
Received: by mail-wm1-f66.google.com with SMTP id a5so1951315wmb.0
        for <devicetree@vger.kernel.org>; Wed, 11 Mar 2020 05:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d0rLUPpWc9LKXF0i9+CPpLN+OwQQCuUUQ2gfv2HulHQ=;
        b=IMq0GOglrv9AJ7IWePlqPKh+g5vEP7KPGWHNuTRmuqqvl++Phj5Ie3+A+QfEKkME3h
         q0vWho6oLDy9c22giASuCH1G1T6he+iSuHY/0OPrxfchkouzillYMOGGlzBA9bwKR7Yg
         +I0CgBIjKYUYCNZqgojagWqC+afKYcAZQQapMTNAk/850hRMXduZJO1Etpt2EYWQCcUy
         n3ofi2ltjHGzGZBjILh2yTVAHr185N6iaj4H1T9AvACvPv+DIvL+M85edL84HEByBf8K
         uVCJ+BkBjMVx15RAWG7GqnxYs9Z1XwTzh1D54MLnPmoo3LAkRQYN2UwFDW+zLVcZypwF
         ZfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d0rLUPpWc9LKXF0i9+CPpLN+OwQQCuUUQ2gfv2HulHQ=;
        b=t9eNvbzSezi8Az5eQUFRl6CU0I67H4r8MjWMkpad6FqxQ5e+nMmMTvJOcKZzmORwO5
         2BvzlbxFGR2QM1miW8GiemC4kW8feeGE31vgd44MYh0lAflYzihaR+PcYT1F4FEXgOym
         SRXRDgjI4Xdz9oNnR6doSyhmsSq8tduU1z4NFN8RaxoWXa7dSlZphAkeA+jBt19S29xt
         LTvoYKxsxBBzz0AzeQIwHInZfVgx3PKWaDurP5WvvzQM9v5qRxdOW4c0mAHpA1tWG3hl
         ORIZAZUcklJL8p1GI6NhqnzjlL2oI+fY2jbqqkddnT697zqGXgGI0FcTL+VculmT43tB
         urGQ==
X-Gm-Message-State: ANhLgQ0cZleIHqqXkENV5lfTJnk7DisxC7nIzi2cHdvjVzB0X2iFhewy
        su4UOz2fAHTdaNVouEVa/AhUNQ==
X-Google-Smtp-Source: ADFU+vtSp3bp4YHfuXWS38IAA5q6tgH8hB5aWJ3nzhD3eOkPVBueydoPmuaFZUj0SnvU9SNNjQlTgg==
X-Received: by 2002:a7b:c414:: with SMTP id k20mr3678319wmi.119.1583930829492;
        Wed, 11 Mar 2020 05:47:09 -0700 (PDT)
Received: from localhost.localdomain ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id c2sm8380020wma.39.2020.03.11.05.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 05:47:09 -0700 (PDT)
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     bhelgaas@google.com, will@kernel.org, robh+dt@kernel.org,
        joro@8bytes.org, baolu.lu@linux.intel.com, sudeep.holla@arm.com,
        linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org
Cc:     lorenzo.pieralisi@arm.com, corbet@lwn.net, mark.rutland@arm.com,
        liviu.dudau@arm.com, guohanjun@huawei.com, rjw@rjwysocki.net,
        lenb@kernel.org, robin.murphy@arm.com, dwmw2@infradead.org,
        amurray@thegoodpenguin.co.uk, frowand.list@gmail.com,
        Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 11/11] Documentation: Generalize the "pci=noats" boot parameter
Date:   Wed, 11 Mar 2020 13:45:06 +0100
Message-Id: <20200311124506.208376-12-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311124506.208376-1-jean-philippe@linaro.org>
References: <20200311124506.208376-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The "pci=noats" kernel parameter disables PCIe ATS globally, and affects
any ATS-capable IOMMU driver. So rather than adding Arm SMMUv3, which
recently gained ATS support, to the list of relevant build options,
simplify the noats description.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c07815d230bc..3e17ddb76731 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3610,8 +3610,8 @@
 				on: Turn realloc on
 		realloc		same as realloc=on
 		noari		do not use PCIe ARI.
-		noats		[PCIE, Intel-IOMMU, AMD-IOMMU]
-				do not use PCIe ATS (and IOMMU device IOTLB).
+		noats		[PCIE] Do not use PCIe ATS (and IOMMU device
+				IOTLB).
 		pcie_scan_all	Scan all possible PCIe devices.  Otherwise we
 				only look for one device below a PCIe downstream
 				port.
-- 
2.25.1

