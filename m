Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024FDC433E5
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 14:33:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFA76206F4
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 14:33:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ku55tpGp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728896AbgGPOdx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 10:33:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgGPOdv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 10:33:51 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F07C061755;
        Thu, 16 Jul 2020 07:33:51 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id d16so4888022edz.12;
        Thu, 16 Jul 2020 07:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YGCp2APVC4UtHLQu1ncbQQ8xQNK26HTOlJJtmViM0RM=;
        b=Ku55tpGp4Q1NZye//rZ+dDYbha/NX5x0phnPvAMND1wpOpQhbumYHyk+wB4/hDCkVv
         3bhqJYWy4QM/FhzTJalo6EGa5XWmCaGjIMcBZnFi+syCQn6QkHGzbvM+OJYYxl2p4/Iv
         lOm7kyZHFLsfrHiuQRwgwg20eiEpf9n6/BHGinihXxDP/BIFCqkiGxB5U+LOLHHmdBtj
         Z/nH/bMavZxUagHifY704/n9EnCuJ6JTQs0qS4rgnGzjmWcdBSJZszTKqhXFznAjQVNA
         0XzWF4fGSVnb41jBTGdsbj6cyOa1f3Tbc6l3kKeT4Ur/QlpVh+FRXi6VIKBggu2rWYDl
         h4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YGCp2APVC4UtHLQu1ncbQQ8xQNK26HTOlJJtmViM0RM=;
        b=cSrzCESJsYtONP763Vm4rKKdUgPUd6wdI2emX2C2hXu596b5bqCyz/n3WJ6hD9vsug
         DFHKcyRHh5xYhzbi4A4XaaARLkcKbhtRlMBvoeX8hCdvK4YY7vVwE6wnOOn1MQ9G7LHP
         ghu0BIj0nP0jHbAOAdbsSz0OM0mCsDj3epJ4PXLFym1ck4+IZRGa2KCWzAtPhHsgCY6t
         HMnBuP2jzc7IvZbl+vqgk3rZ4sY4cl1s1ol0QxJmdnFP0uYPDALSyLRLKAV9f0m8/jwO
         5i70ix1/6QKkQDswydQs9OhX+rhX2SGy0zg4q3Ul0F3y7iJ/tfcqoclF7yBP1dUB/eXQ
         991w==
X-Gm-Message-State: AOAM531hWNe4AHS8xu6JboL6zW0avilsdyOEelYRUqH1wMcP+899/VKo
        qZWyig/ax23R2F3WdcFp9Z0=
X-Google-Smtp-Source: ABdhPJwEroVrR5v1BDRHGeZoUvW37zCydzEd4NVRPvNBUEbr1KgHeAyXkxIvEcf2zUnX2B0lyGHz4g==
X-Received: by 2002:a05:6402:14c1:: with SMTP id f1mr4920406edx.342.1594910030012;
        Thu, 16 Jul 2020 07:33:50 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d19sm5270823ejk.47.2020.07.16.07.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:33:47 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Terje Bergstrom <tbergstrom@nvidia.com>,
        Debarshi Dutta <ddutta@nvidia.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/2] arm64: tegra: Add the GPU on Tegra194
Date:   Thu, 16 Jul 2020 16:33:41 +0200
Message-Id: <20200716143341.545804-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716143341.545804-1-thierry.reding@gmail.com>
References: <20200716143341.545804-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The GPU found on NVIDIA Tegra194 SoCs is a Volta generation GPU called
GV11B.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 98c366ab4aab..14da0793be69 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1395,6 +1395,39 @@ sor3: sor@15bc0000 {
 				nvidia,interface = <3>;
 			};
 		};
+
+		gpu@17000000 {
+			compatible = "nvidia,gv11b";
+			reg = <0x17000000 0x10000000>,
+			      <0x18000000 0x10000000>;
+			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "stall", "nonstall";
+			clocks = <&bpmp TEGRA194_CLK_GPCCLK>,
+				 <&bpmp TEGRA194_CLK_GPU_PWR>;
+			clock-names = "gpu", "pwr";
+			resets = <&bpmp TEGRA194_RESET_GPU>;
+			reset-names = "gpu";
+			status = "disabled";
+
+			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_GPU>;
+			interconnects = <&mc TEGRA194_MEMORY_CLIENT_NVL1R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL1RHP &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL1W &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL2R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL2RHP &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL2W &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL3R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL3RHP &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL3W &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL4R &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL4RHP &emc>,
+					<&mc TEGRA194_MEMORY_CLIENT_NVL4W &emc>;
+			interconnect-names = "dma-mem", "read-0-hp", "write-0",
+					     "read-1", "read-1-hp", "write-1",
+					     "read-2", "read-2-hp", "write-2",
+					     "read-3", "read-3-hp", "write-3";
+		};
 	};
 
 	pcie@14100000 {
-- 
2.27.0

