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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDACC433EB
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 08:36:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66B2B2074B
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 08:36:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUPcgdRG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgGQIgX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jul 2020 04:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726974AbgGQIgQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jul 2020 04:36:16 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD740C061755;
        Fri, 17 Jul 2020 01:36:15 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id d16so7014431edz.12;
        Fri, 17 Jul 2020 01:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UKKt1i+qbb7u1MCS8ODLjX9FpnfwbfNBADcfLCJcoNk=;
        b=OUPcgdRGfHBaIyE07DxAgHEsGAJchRmLtt8wCEg7nVFBm36LvFl37rxywBzGOJo8wL
         AujuSqXksDhLCbq74NX1L1e6uZ/+wemBYGjofH5Lxi0dNHgsk6hGmJZjj3G2f08qhgXe
         RYgKPFa7e4YSNI9UgZXiFmHwzrElsKRhwHyBoxbmUYRLq3Z3cIEQX89nlLNq9LDqj7E1
         Micu+IvV3G2Dlbfj6pprJonk8ADrb20ZKoU7vM3hEBFKLOsSHTZj7AFRjNrx2BE5PG+w
         QNQT9THWO94qqD/tsFtnpZaRFtftTWjfIhhGwQUmmtQ5KtJEBQi/eqtJORFGlBaUh8V7
         7b8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UKKt1i+qbb7u1MCS8ODLjX9FpnfwbfNBADcfLCJcoNk=;
        b=s2iHmKHEYGrVoDjP7L/7jVIOXrHCp+b1VyR23EJjOZbKYpzny2EvR4bP2xma2R1el5
         /oXLh/P4UjanShYBvrWDJAUsFamcFxsPjslOW+ePTxptWO3Zy4k6hw5QRc6T7CTED3V1
         Rw+VRkbybNncHxa6qrHeSL7FFQN/IGTBF+a1O0UZnHS+7y3ZlE59uzUC+G6/4OEXIyoZ
         rteamcUFCZNPbjUe0UYvuBJs4oWTn5GW9PaJahDQYLqCYXZW4Rd/i7Zcoe+zR1K89Yjv
         bjiCPSekckR0VPhm/JjFoIdfcqiNjZ4kUjuz5grvAo7r4vuoztxQ7dawVs9daZwVOCPv
         AA1g==
X-Gm-Message-State: AOAM532pzWgii07KF12s37dA0TbQ384my13zUKZPH5CzMht5vSYVAOej
        OU8w0JsH04L1ChPuCfPVmLcXqPYq
X-Google-Smtp-Source: ABdhPJySzetdMLRbHWosbzzD4UCkj6mQY50Ymnb6XBhSxYEHQLajfwo4shxW66CXpA3k45bJW/QNSA==
X-Received: by 2002:aa7:c341:: with SMTP id j1mr8557511edr.197.1594974974219;
        Fri, 17 Jul 2020 01:36:14 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id da20sm7799527edb.27.2020.07.17.01.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 01:36:12 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Terje Bergstrom <tbergstrom@nvidia.com>,
        Debarshi Dutta <ddutta@nvidia.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: Add documentation for GV11B GPU
Date:   Fri, 17 Jul 2020 10:36:08 +0200
Message-Id: <20200717083609.557205-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The GV11B's device tree bindings are the same as for GP10B, though the
GPU is not completely compatible, so all that is needed is a different
compatible string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- document the "fuse" clock which needs to be enabled during the GPU
  initialization

 .../devicetree/bindings/gpu/nvidia,gk20a.txt  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
index f32bbba4d3bc..662a3c8a7d29 100644
--- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
+++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.txt
@@ -6,6 +6,7 @@ Required properties:
   - nvidia,gk20a
   - nvidia,gm20b
   - nvidia,gp10b
+  - nvidia,gv11b
 - reg: Physical base address and length of the controller's registers.
   Must contain two entries:
   - first entry for bar0
@@ -25,6 +26,9 @@ Required properties:
 If the compatible string is "nvidia,gm20b", then the following clock
 is also required:
   - ref
+If the compatible string is "nvidia,gv11b", then the following clock is also
+required:
+  - fuse
 - resets: Must contain an entry for each entry in reset-names.
   See ../reset/reset.txt for details.
 - reset-names: Must include the following entries:
@@ -88,3 +92,24 @@ Example for GP10B:
 		power-domains = <&bpmp TEGRA186_POWER_DOMAIN_GPU>;
 		iommus = <&smmu TEGRA186_SID_GPU>;
 	};
+
+Example for GV11B:
+
+	gpu@17000000 {
+		compatible = "nvidia,gv11b";
+		reg = <0x17000000 0x10000000>,
+		      <0x18000000 0x10000000>;
+		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "stall", "nonstall";
+		clocks = <&bpmp TEGRA194_CLK_GPCCLK>,
+			 <&bpmp TEGRA194_CLK_GPU_PWR>,
+			 <&bpmp TEGRA194_CLK_FUSE>;
+		clock-names = "gpu", "pwr", "fuse";
+		resets = <&bpmp TEGRA194_RESET_GPU>;
+		reset-names = "gpu";
+		dma-coherent;
+
+		power-domains = <&bpmp TEGRA194_POWER_DOMAIN_GPU>;
+		iommus = <&smmu TEGRA194_SID_GPU>;
+	};
-- 
2.27.0

