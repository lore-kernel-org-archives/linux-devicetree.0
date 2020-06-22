Return-Path: <SRS0=KHJB=AD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B94CC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 07:59:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 638192083E
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 07:59:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BNOYV4j6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbgFVH7w (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 03:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbgFVH7u (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 22 Jun 2020 03:59:50 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90597C061797
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 00:59:50 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id k4so14849112oik.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 00:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wsD4JPbpu6P4JVf54PUOXffj8NM5iwWqNtOuxNrh1Ek=;
        b=BNOYV4j6OzxYc7GgjKpKV5iHhJDTcp7c44mazYdUT13aaDi4kX/kj0nSDBVIy20Kuv
         2iWXqdC8MelZ6pT8J7IMyiTr761V9lDjt40hGEj2cUegqHluLTKhW9JO/foBnKb8WbU2
         FPTMALkLdzsxrhvNkF75jEIkblhVdLIjoKKaSmvy8I+JxtUpLFNkM/wPUoR+TPwKdnme
         MFx5YdfH7JjV73EMfUZOh8BCsp3DazzPy3yLz5VRQ2duLgqhUuGVSDFz3I1ctv8fCfH2
         M8WPY5rpRck6TXr/33Onpu5U2a2hN/c5h6xux7gLdrFN5AN/3yTOAozV3wy6bYlLkajy
         jIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wsD4JPbpu6P4JVf54PUOXffj8NM5iwWqNtOuxNrh1Ek=;
        b=BaV8oI8T/RTSiwj458e5s+YbGqOYeiuEY7l0z0YBsU6fmVjaBReJVbbinI3SxNR1oK
         AgsBJovZydLAnMyUTh0sCKDHx1dKlmsgPsUjYUvO6A+PliTCov+8X9JCSru9enYt7rga
         paxwT/cho00GuEHjCLrsGrjlYjrGjV0c0MR4DPkyjKSliny/b3l6XVjxNV8cfLeQnYHS
         ga44+VXM3jrWEJ8oNR3qYQP4O8tU6cbNSh+BNlHSF4Y+jkD4UBL8Ba4uWBXPxhaPyOmW
         Eq4JKeexE7+/J93ILuRswEp0E24QatE+C0QfAww54/z5FYQ1xwTDwp5tlT8WJrt6xTMI
         S8HA==
X-Gm-Message-State: AOAM530xu17/SvExDGRilH1BTxD4WZOHvS+57U1XmKTEdET99Vl/qAlS
        ajd6dQEYCNfMsFLH83rmWNec0A==
X-Google-Smtp-Source: ABdhPJzzr4SQgqtDcXOQA6jIMEtE2S+/98sTWL4tFRZgSSkA+8K8Ny8EKzh9/a1r9NRfHry3qVgZfQ==
X-Received: by 2002:a05:6808:6ca:: with SMTP id m10mr11477202oih.27.1592812789939;
        Mon, 22 Jun 2020 00:59:49 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f7sm3135396otl.60.2020.06.22.00.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:59:49 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 3/4] hwspinlock: qcom: Allow mmio usage in addition to syscon
Date:   Mon, 22 Jun 2020 00:59:55 -0700
Message-Id: <20200622075956.171058-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200622075956.171058-1-bjorn.andersson@linaro.org>
References: <20200622075956.171058-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

In modern Qualcomm platforms the mutex region of the TCSR is forked off
into its own block, all with a offset of 0 and stride of 4096, and in
some of these platforms no other registers in this region is accessed
from Linux.

So add support for directly memory mapping this register space, to avoid
the need to represent this block using a syscon.

Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Use devm_platform_ioremap_resource()

 drivers/hwspinlock/qcom_hwspinlock.c | 70 +++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 16 deletions(-)

diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index f0da544b14d2..364710966665 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -70,41 +70,79 @@ static const struct of_device_id qcom_hwspinlock_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, qcom_hwspinlock_of_match);
 
-static int qcom_hwspinlock_probe(struct platform_device *pdev)
+static struct regmap *qcom_hwspinlock_probe_syscon(struct platform_device *pdev,
+						   u32 *base, u32 *stride)
 {
-	struct hwspinlock_device *bank;
 	struct device_node *syscon;
-	struct reg_field field;
 	struct regmap *regmap;
-	size_t array_size;
-	u32 stride;
-	u32 base;
 	int ret;
-	int i;
 
 	syscon = of_parse_phandle(pdev->dev.of_node, "syscon", 0);
-	if (!syscon) {
-		dev_err(&pdev->dev, "no syscon property\n");
-		return -ENODEV;
-	}
+	if (!syscon)
+		return ERR_PTR(-ENODEV);
 
 	regmap = syscon_node_to_regmap(syscon);
 	of_node_put(syscon);
 	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
+		return regmap;
 
-	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 1, &base);
+	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 1, base);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "no offset in syscon\n");
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
-	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 2, &stride);
+	ret = of_property_read_u32_index(pdev->dev.of_node, "syscon", 2, stride);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "no stride syscon\n");
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	}
 
+	return regmap;
+}
+
+static const struct regmap_config tcsr_mutex_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= 0x40000,
+	.fast_io		= true,
+};
+
+static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
+						 u32 *offset, u32 *stride)
+{
+	struct device *dev = &pdev->dev;
+	void __iomem *base;
+
+	/* All modern platform has offset 0 and stride of 4k */
+	*offset = 0;
+	*stride = 0x1000;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return ERR_CAST(base);
+
+	return devm_regmap_init_mmio(dev, base, &tcsr_mutex_config);
+}
+
+static int qcom_hwspinlock_probe(struct platform_device *pdev)
+{
+	struct hwspinlock_device *bank;
+	struct reg_field field;
+	struct regmap *regmap;
+	size_t array_size;
+	u32 stride;
+	u32 base;
+	int i;
+
+	regmap = qcom_hwspinlock_probe_syscon(pdev, &base, &stride);
+	if (IS_ERR(regmap) && PTR_ERR(regmap) == -ENODEV)
+		regmap = qcom_hwspinlock_probe_mmio(pdev, &base, &stride);
+
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
 	array_size = QCOM_MUTEX_NUM_LOCKS * sizeof(struct hwspinlock);
 	bank = devm_kzalloc(&pdev->dev, sizeof(*bank) + array_size, GFP_KERNEL);
 	if (!bank)
-- 
2.26.2

