Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CDDFC6197
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 15:26:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5A580222C5
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 15:26:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rr+E9RT1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbfKHP0u (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 10:26:50 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38403 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbfKHP0u (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Nov 2019 10:26:50 -0500
Received: by mail-wm1-f66.google.com with SMTP id z19so6623791wmk.3
        for <devicetree@vger.kernel.org>; Fri, 08 Nov 2019 07:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xkWcxJ6Iuy+TFzutOZwKsDdjGV2W0A5RS2sI5DD8vzM=;
        b=rr+E9RT1m3Uo7HDUww3oQBuqgMwd4smQJlm1F51cGsAn5yxcXpfWYxrw5HNGAbAN0T
         vCuV/pFnYtG6J/pA8tYatmkzzIt46o+Dibijb10+j8gXZtsXmaPI2hVExy0xaTPM1pUw
         jWyJ4iAp0CaA+2OriDDPyVEAYwIpVTS1sbFx5qbFpaZE0rXPjKfyiWXPnoRAZqG++wEI
         quuvaGA4UYD7FneNYZe2huxUVlofu3I9+CDwSJXYrb2yPBxitzAAjDVaYj/cfBnZTpZK
         Q/VnQBsoVhbXhLUrHkrWvVm1kgTuEYPkBFnVWoN8dc8lROj6lv/76Wr+Dt4SpoqAyU3N
         Cv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xkWcxJ6Iuy+TFzutOZwKsDdjGV2W0A5RS2sI5DD8vzM=;
        b=UmNSW2+sdMzSzuZk/FDO3n75HPUuXN25dn9oq9yGoo2EU5S4VZis2lH9f3vHmTPUl0
         eP5gs1cd36agiz8pKgAlwduCgXutLrDXXT5ZbenMR72YDkWzh5SawAjGZu62mJ6ECHDy
         Ohkp6A7cpwHp6f2+NhyvpmVrDL9oTpFSNPcN1RLq8iJinAH9tFXWKbzlXqZIKMrKfwwe
         8/zkOZZ42FdxJQ78Xx7Wb3vB3zfijqJPxnJrmyn47+bQ4UKDE56C8u9aFYOmnhZLh/FT
         sMHtCUmXxF1L6Tt16S33TB6h2iBTrUf8e0EuDCdmtSzMFbdiNlCDxLGKiOBdmr6seE60
         YNNw==
X-Gm-Message-State: APjAAAVu9VNvC0s7YEwTHZ65h8uFeGBjW6GMnacadOXcXvaMeyAyQNCL
        COwhlKdNWC3QCnc+mhIdMRz6dA==
X-Google-Smtp-Source: APXvYqx/xuA1TPNnHqIK0UYk9J6qHcyjmZQq/kaCmKhNSU7fNuxym1Kdo6WOQxPLxhdoo0A3JfJ3WA==
X-Received: by 2002:a05:600c:210b:: with SMTP id u11mr9006014wml.170.1573226808499;
        Fri, 08 Nov 2019 07:26:48 -0800 (PST)
Received: from localhost.localdomain ([85.195.192.192])
        by smtp.gmail.com with ESMTPSA id w18sm6579232wrp.31.2019.11.08.07.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 07:26:47 -0800 (PST)
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     joro@8bytes.org, robh+dt@kernel.org, mark.rutland@arm.com,
        lorenzo.pieralisi@arm.com, guohanjun@huawei.com,
        sudeep.holla@arm.com, rjw@rjwysocki.net, lenb@kernel.org,
        will@kernel.org, robin.murphy@arm.com, zhangfei.gao@linaro.org,
        eric.auger@redhat.com, jonathan.cameron@huawei.com
Subject: [PATCH v2 1/8] dt-bindings: document PASID property for IOMMU masters
Date:   Fri,  8 Nov 2019 16:25:01 +0100
Message-Id: <20191108152508.4039168-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108152508.4039168-1-jean-philippe@linaro.org>
References: <20191108152508.4039168-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Arm systems, some platform devices behind an SMMU may support the PASID
feature, which offers multiple address space. Let the firmware tell us
when a device supports PASID.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 Documentation/devicetree/bindings/iommu/iommu.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/iommu.txt b/Documentation/devicetree/bindings/iommu/iommu.txt
index 5a8b4624defc..3c36334e4f94 100644
--- a/Documentation/devicetree/bindings/iommu/iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/iommu.txt
@@ -86,6 +86,12 @@ have a means to turn off translation. But it is invalid in such cases to
 disable the IOMMU's device tree node in the first place because it would
 prevent any driver from properly setting up the translations.
 
+Optional properties:
+--------------------
+- pasid-num-bits: Some masters support multiple address spaces for DMA, by
+  tagging DMA transactions with an address space identifier. By default,
+  this is 0, which means that the device only has one address space.
+
 
 Notes:
 ======
-- 
2.23.0

