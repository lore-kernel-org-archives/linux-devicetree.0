Return-Path: <SRS0=TQXC=2M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D3CC2D0C0
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 11:39:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6BC852084D
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 11:39:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cb7VgoXj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbfLVLjf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Dec 2019 06:39:35 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36463 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbfLVLje (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 22 Dec 2019 06:39:34 -0500
Received: by mail-wm1-f68.google.com with SMTP id p17so13517396wma.1;
        Sun, 22 Dec 2019 03:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CdHifGc4Yn+fxqupYyl+eindsUppTeqckkFeDYXRcJc=;
        b=cb7VgoXj+XCkTYqyUgYP8Z33mTL4zk1ziSCQna1Ux2GSdYTOl0lDN8RJK95vvNOaV8
         jZjo00RX6K669eOMPM7yj9qn0bOcsqwOoCnmuqyaDe2Vg4vuegYn4FfIrg+Wsx0RF7D+
         2JLwtjLWP6GF1/Cbj6IcUIhmmTNQaV7P/44Z9wRzvNBAildExbJ3i6/0KOSeTSf12lxV
         ub8jbBl86z5m/1L6VWKRcPQ3dmRyyrUDrR6Hol0dsl3ndEd0uUOmmpQ78rzOTUSGdpnS
         EtrH8vsnLIfsDSk0ck42Z/bDgAzaCSQe/CJ5xYg/yWpHYi/9gy2TBY+BSEI9XhnHTOmx
         3Bpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CdHifGc4Yn+fxqupYyl+eindsUppTeqckkFeDYXRcJc=;
        b=ZhBBK8v2JWszB5n1exjFVZCjMkepa0YgNB24txZxAq0Ta5jvPrkgrOX4+W6GDgX8NB
         nF8FEcGNZNNcHtfF3On6iDMhm4ZTx3fzSoj0exiB4AzmEUn1imUAtNaGBzmC9juA0oSS
         NAvRqx9I7IyvbFTwzlKaqzvXMQsyMooZGUjluQUPmaQLFYRz/geUpqL46KKvG10B7/ow
         O9sSLVpNo5oG2fUOj3pdMfWXB95LK1mYsQRBO1yv7BcWi/E6V3fpLppFJTR8+DniTVPA
         LA7kpT30A9dtisU/iGS0kcFcHPvVX9IYgo/angPvDBdQ42ctIjBGxAKsNlgOmPPJq4tH
         1xrw==
X-Gm-Message-State: APjAAAU+hkQuJc8Ip9NUEMS+ZZay1broOQdblD6f06RjkIMsHhI/Qg4H
        drTbOlq9ANNf3a17EtM8+yM=
X-Google-Smtp-Source: APXvYqzjt0viqW8We1dPD2Tzmw8MrdNTp+zY0IVCFDgAyz+Z/3fxNQQhw1wFAok/UkEP9L+Pz01Mrw==
X-Received: by 2002:a1c:5444:: with SMTP id p4mr7340308wmi.33.1577014772280;
        Sun, 22 Dec 2019 03:39:32 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id c9sm15530881wmc.47.2019.12.22.03.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 03:39:31 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 5/6] ARM: tegra: Rename EMC on Tegra124
Date:   Sun, 22 Dec 2019 12:39:20 +0100
Message-Id: <20191222113921.1469372-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191222113921.1469372-1-thierry.reding@gmail.com>
References: <20191222113921.1469372-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Rename the EMC node to external-memory-controller according to device
tree best practices.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra124-apalis-emc.dtsi     | 2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi | 2 +-
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi   | 2 +-
 arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi | 2 +-
 arch/arm/boot/dts/tegra124.dtsi                | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-emc.dtsi b/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
index d18eaf4a4a3a..32401457ae71 100644
--- a/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-emc.dtsi
@@ -84,7 +84,7 @@ timing-924000000 {
 		};
 	};
 
-	emc@7001b000 {
+	external-memory-controller@7001b000 {
 		emc-timings-1 {
 			nvidia,ram-code = <1>;
 
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi b/arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi
index 784a529e1f19..861d3f22116b 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi
@@ -79,7 +79,7 @@ timing-924000000 {
 		};
 	};
 
-	emc@7001b000 {
+	external-memory-controller@7001b000 {
 		emc-timings-3 {
 			nvidia,ram-code = <3>;
 
diff --git a/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi b/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi
index fb6b3e1a0b1f..c91647d13a50 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi
@@ -219,7 +219,7 @@ timing-792000000 {
 		};
 	};
 
-	emc@7001b000 {
+	external-memory-controller@7001b000 {
 		emc-timings-1 {
 			nvidia,ram-code = <1>;
 
diff --git a/arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi b/arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi
index c7c31d4c1a2b..d2beea0bd15f 100644
--- a/arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi
@@ -68,7 +68,7 @@ timing-792000000 {
 		};
 	};
 
-	emc@7001b000 {
+	external-memory-controller@7001b000 {
 		emc-timings-1 {
 			nvidia,ram-code = <1>;
 
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index a01092b6d26d..7f330b1f150f 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -622,7 +622,7 @@ mc: memory-controller@70019000 {
 		#iommu-cells = <1>;
 	};
 
-	emc: emc@7001b000 {
+	emc: external-memory-controller@7001b000 {
 		compatible = "nvidia,tegra124-emc";
 		reg = <0x0 0x7001b000 0x0 0x1000>;
 		clocks = <&tegra_car TEGRA124_CLK_EMC>;
-- 
2.24.1

