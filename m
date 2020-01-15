Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C0BC3F68F
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 12:53:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94C7524671
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 12:53:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RQa6zVa9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgAOMxe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 07:53:34 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42810 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728884AbgAOMxb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 07:53:31 -0500
Received: by mail-wr1-f66.google.com with SMTP id q6so15559936wro.9
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 04:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+Rlh4fuYqJBRp2jOU8B0MlV1M4d0Kd3bn04JlNplJUI=;
        b=RQa6zVa9SRTjAkDpWaeNQ+TzHNaqSmjwUNjLiSStgQQFU8m1OhdHW06usASKfswEOm
         ekBnCK32y0eGel6xTuDdUakkQQN3qPA3G8RZ2bB2/vEsRD4EoWf2rDFY7CHKqlFY4vh0
         QQFCA9QYc73ULV1UlWEobvL9/no+9Vz/XZYY2Tj674ONdjmt9oZZufAB1mBcKnbhBt2q
         4ZyVannnpIUGVhmPOs8HxT18d9vQXPh7dxHC9oOgWg1bO+r8Uh6hZp5mpAIPltKup6q6
         726G40en2MsW4RUUOKkrDY94g3Urf6AAlYT9SgfBjoDblDCkp9GNBhcmObIfka7aytXi
         sROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Rlh4fuYqJBRp2jOU8B0MlV1M4d0Kd3bn04JlNplJUI=;
        b=nJsaQKoZWpP9wrCo8RLy67mZQx4ReyHITv9WiLPS6mitkoPxYiCNR+9DEAYgB2KCbm
         ceZrCUZcXV+oDjzCwlxq4km4WLxZzzgu7ESZdn/bDpa/HN0luoeIgfNLn1iA6B66ZS5Q
         C6cZpm95zok/1rw6cr6WQ7S8B5/J76wmrYgN44psDUBI+ySId1eGFfiyg4lc7tWcrqu6
         jikbhq1FtHLgMdmmp7IIoGb0Tq46mRVppTepvyq/pbmL+9l6I5LwnCk7KbEGm5TwwWRc
         Rb3vfWxEozBnjUOaaNOKavQgO+rz42qDZoc3o+qNJfhHVUxX8rLXjxQl2hJo1GW35evQ
         ZXKw==
X-Gm-Message-State: APjAAAWdyTqsL88GLvv1d3LH9BSZSlyPes13+4oG/oM+PT5bXyz02245
        MZp8Lv0XCtMbjKADQQ7YimkrCw==
X-Google-Smtp-Source: APXvYqzMgS/+4YiEL+CRzGGcAhTGiJstPbrqmMFBjWd9wKtGLhNavA3EcOaksZRO/N8Ru4NFTMuSgQ==
X-Received: by 2002:a05:6000:118d:: with SMTP id g13mr32846130wrx.141.1579092809778;
        Wed, 15 Jan 2020 04:53:29 -0800 (PST)
Received: from localhost.localdomain ([2001:171b:2266:ba60:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id d12sm25196171wrp.62.2020.01.15.04.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 04:53:29 -0800 (PST)
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, will@kernel.org
Cc:     joro@8bytes.org, robh+dt@kernel.org, mark.rutland@arm.com,
        lorenzo.pieralisi@arm.com, guohanjun@huawei.com,
        sudeep.holla@arm.com, rjw@rjwysocki.net, lenb@kernel.org,
        robin.murphy@arm.com, bhelgaas@google.com, eric.auger@redhat.com,
        jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
Subject: [PATCH v5 02/13] dt-bindings: document PASID property for IOMMU masters
Date:   Wed, 15 Jan 2020 13:52:28 +0100
Message-Id: <20200115125239.136759-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115125239.136759-1-jean-philippe@linaro.org>
References: <20200115125239.136759-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Arm systems, some platform devices behind an SMMU may support the PASID
feature, which offers multiple address space. Let the firmware tell us
when a device supports PASID.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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
2.24.1

