Return-Path: <SRS0=Rh3i=5E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839CBC4332D
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 05:41:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5BAE220757
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 05:41:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GNA5dhAf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727160AbgCSFk5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Mar 2020 01:40:57 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39712 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727141AbgCSFkv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Mar 2020 01:40:51 -0400
Received: by mail-pl1-f194.google.com with SMTP id m1so568615pll.6
        for <devicetree@vger.kernel.org>; Wed, 18 Mar 2020 22:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z/69m7Zf+ruag16yCUxMLHHMI4Yg4kUCSYDk0zKgyCg=;
        b=GNA5dhAfvYYpetATfgKyqLZz5xlqU1swtnZ8dzTWy+4qldc1xRRbyXZak0HEBTVC9d
         Jrg18WL4KAFFq2QXJ3vjKAGQceRb/D6/f4UfoBnqwJuPD6vjnWCLEAEgSod9vHxQX+ej
         BDIFlrEBBqvgkoxy7lAdszwi6BFG3XySWcWss0gnwUUd/h/Qubwa+ORCnV0/Ib6kBol+
         fT1t1to1sBkgDvDUMTaiZ6+nxhevdSVkkIy8YmE9K+gLRLnZMnWOW4g1B8kl2bfEGH7G
         m1mrtPFlotMHwVAHSswInC3EoDzYxrkyaHseIgZBkpXvDTfh5DzDlbFaQ9omhU8wXQTi
         1hag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z/69m7Zf+ruag16yCUxMLHHMI4Yg4kUCSYDk0zKgyCg=;
        b=k6cHt2E2Hl0wILxX7hXrFd0lVf+ULqj+DUwPTPYcV+Mwvi0dOUIBD5M8raEYrqSyRu
         I44D1pXuDi82EHPfPqIL3NAYaaDERL7o2mAJKi+QxO2LvwwfW7/GYsam9lY3DcEgSq+y
         X3qSDrWzm2njBw6oAd8NBTsYBB5X+BqezbSLATbi5T+wfAxW/Q5/uGFh7h7jxd9PEJqN
         Z5MfE0s+7vdFy06m7UhI3JKkGFe0l8/UlZNNCAxAR7CYeuoPh7/m3xk+f6gsq0X+nMYo
         Y55sY1Y0ZIYKmO6tuse1YP+tec9oHwGmmduafVg2lkdvF5Nrri+6VhwN7rpeyIrdnKou
         6mcQ==
X-Gm-Message-State: ANhLgQ1QrRuOgXN7HSb+kYoCCTQgB9ZCNFWbh5i5wKmf5++Ynjt19U8k
        TKu987EIcvdx5mCN9XyHqr1eNA==
X-Google-Smtp-Source: ADFU+vsRf2sDvae95TJ6VcZ7xmIYGkaloU4QXsDM6UWMf7v+/ukUDbAHYC3DGNVQzt1wESDRV1ejsA==
X-Received: by 2002:a17:90a:e505:: with SMTP id t5mr1967909pjy.101.1584596448549;
        Wed, 18 Mar 2020 22:40:48 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l125sm229126pgl.57.2020.03.18.22.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 22:40:47 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>
Subject: [PATCH 4/4] arm64: dts: qcom: msm8996: Make GPU node control GPU_GX GDSC
Date:   Wed, 18 Mar 2020 22:39:02 -0700
Message-Id: <20200319053902.3415984-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200319053902.3415984-1-bjorn.andersson@linaro.org>
References: <20200319053902.3415984-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Presumably the GPU node needs to control both the GPU and GPU GX power
domains, but given that GPU GX now depends on the GPU GDSC both can
effectively be controlled by controlling GPU GX. So use this instead.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 14827adebd94..f29f45e9737b 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -639,7 +639,7 @@ gpu@b00000 {
 				"mem",
 				"mem_iface";
 
-			power-domains = <&mmcc GPU_GDSC>;
+			power-domains = <&mmcc GPU_GX_GDSC>;
 			iommus = <&adreno_smmu 0>;
 
 			nvmem-cells = <&gpu_speed_bin>;
-- 
2.24.0

