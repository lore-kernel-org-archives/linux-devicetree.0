Return-Path: <SRS0=Xf3c=A4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B32C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 08:36:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC2CD20691
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 08:36:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNh1DgPx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgGQIgU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jul 2020 04:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727853AbgGQIgS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jul 2020 04:36:18 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B24EBC061755;
        Fri, 17 Jul 2020 01:36:17 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id n26so9943743ejx.0;
        Fri, 17 Jul 2020 01:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DVLHoeYXUjVm2OkdCazu17iCF0dnNHQdzGYYcSDSF20=;
        b=QNh1DgPx50z+CQu0pLkqwyDbvGV8m0tw/oXYtt5BZZ99oO4KFFA3vXyIvx/4RFbc65
         wqrPUfR2oxPb3RiCbvRPno351bT/TsZHpIXQzsoWp2RHn5Sdnu3qoFjnphk3wIkptzDX
         NcDllh+18SudoW5EeQ+k1HQx8lp2KNw20IhZoluSCHn/jLrn9EctnQDEO4MoNFJvXh06
         s5sgLmcNQhg4UC8MBbErfR1i/DvIxj2U7YBmM+p9FWf1qd8Y3MzNPpfBVj1kIDLT6hAM
         voWq812peScU3YdLNKAJiq+/mWs31cYlP9g3zwyqRw8s9i2s6vOFxmk0+nb7Wz23FDbw
         Pckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DVLHoeYXUjVm2OkdCazu17iCF0dnNHQdzGYYcSDSF20=;
        b=CbTKok3Q2woRGdKpd3EqnbWIn9oZx0z3qfq6y2ztLdPQR7r/RgVXmgzsDhKzQvJTyI
         ebkkX702HLIb0pckghlTGufzNUUnMkkHgfgDR5ftF7ncyEJ1VIVwNxfmIGVavVsm75fn
         NtsyjqaKc3qQr+OBgaqg0oC4WtTiT0/zj50QjDI53kXVLfpV9xcHIiaZnBECKwspQK81
         ct7+ITOHa9BZ4BjzM2o8j/FOD2txNt9IwnjuVKBVG0JDq7RwZNowfVVQsu/ZDsXXwmKe
         2d741cEvYasjpiVYGgDGMpk39XVzA3u6+IPci5owBYub7b5u5C+r0hmieW9Lq0yN7nG6
         jnsQ==
X-Gm-Message-State: AOAM531GoVS320tJ6xD58O6YmmT/QitLB+2Ey26SMoyNcIYo6H50JlMy
        Uxw3ykJ2nX4IOMq/zQaOdAI=
X-Google-Smtp-Source: ABdhPJyguMDPLfo8wBAPq/cmard434hTf6HR8HnTBDCt3dI3IRLJCiWigoxyWNWWrWwpwrBZTLVI8g==
X-Received: by 2002:a17:906:4a44:: with SMTP id a4mr5212375ejv.486.1594974976424;
        Fri, 17 Jul 2020 01:36:16 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id c9sm7641757edv.8.2020.07.17.01.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 01:36:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Terje Bergstrom <tbergstrom@nvidia.com>,
        Debarshi Dutta <ddutta@nvidia.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/2] arm64: tegra: Add the GPU on Tegra194
Date:   Fri, 17 Jul 2020 10:36:09 +0200
Message-Id: <20200717083609.557205-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717083609.557205-1-thierry.reding@gmail.com>
References: <20200717083609.557205-1-thierry.reding@gmail.com>
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
Changes in v3:
- mark the GPU as DMA coherent because that's enforced by the MSS
- add FUSE clock which is needed during GPU initialization
- enable GPU by default

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 98c366ab4aab..48160f48003a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1395,6 +1395,40 @@ sor3: sor@15bc0000 {
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
+				 <&bpmp TEGRA194_CLK_GPU_PWR>,
+				 <&bpmp TEGRA194_CLK_FUSE>;
+			clock-names = "gpu", "pwr", "fuse";
+			resets = <&bpmp TEGRA194_RESET_GPU>;
+			reset-names = "gpu";
+			dma-coherent;
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

