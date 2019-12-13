Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F8CC2D0BF
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 04:57:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7095922527
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 04:57:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X2PRwyMy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731900AbfLME5k (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 23:57:40 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45604 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731496AbfLME5k (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 23:57:40 -0500
Received: by mail-pl1-f196.google.com with SMTP id bc8so710256plb.12
        for <devicetree@vger.kernel.org>; Thu, 12 Dec 2019 20:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cvwe20yUJDJuFJ66zvHMDZeiCBexsoGR7m8CsDCyCu4=;
        b=X2PRwyMyCuxiKRaie0hFrkxzqLEOPlOz+26PPrWgf6Uclbta2wGm5N7QPTP9IHfAZm
         qx41XdHXGk0wGNodDYVtSfyomKAInudAl44gz5Cnjh7ZJo3RVGyljrrldIcrM0UG/Ql6
         gSkNnNEOqi7MXs8lWa00tcK16Z1ieFZsGUj4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cvwe20yUJDJuFJ66zvHMDZeiCBexsoGR7m8CsDCyCu4=;
        b=ogTzeKLmjlgYJ3ieatQ9wEEFo3WfKLAw+Uib7WXFoQGlOTrRG1/8A/ma9U3N7rSiJ+
         lGoPEUfThS2boYYWGhdebxexilrAZPB3pIBy/FWXv9dx7xOhnIKR62O1oaUYQmGsI58M
         /1jzFTQc9Jh0x3VZkQL6Rdbj55vuqciK5xd0JKdZLajXdt3lZ6JiSFlG9g9b5E32r1aN
         ePi2/kd/fCp9JVWw5lfBfLpsDDhPryOEU2dbf8y0WWkhWSn4R5x6LjQLSrME4n/p15LH
         xS3bls/54/rUwWPf1nYUfivaI0AxzxkSPYNNMmKf4c9fqutRgCoNKGVlaLbma72ug/hM
         VU6g==
X-Gm-Message-State: APjAAAV2iFixsI7xvOoLGATuT08srhXVqGfnX9G/MCQVgGDgHk2CM5Fa
        1hP1FkMvPFejewYOzKztrEmkrg==
X-Google-Smtp-Source: APXvYqwnWUp0o8KtiSrYFm8++pXYoHNI+Rddu1ElryZsNalMMsCCoQR6YhWaVxkyQC5g//D6B5tL2A==
X-Received: by 2002:a17:90a:8a12:: with SMTP id w18mr14128302pjn.68.1576213059923;
        Thu, 12 Dec 2019 20:57:39 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:b852:bd51:9305:4261])
        by smtp.gmail.com with ESMTPSA id o16sm8539538pgl.58.2019.12.12.20.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 20:57:39 -0800 (PST)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Kurtz <djkurtz@chromium.org>
Subject: [PATCH] arm64: dts: mt8173: add Mediatek JPEG Codec
Date:   Fri, 13 Dec 2019 12:57:20 +0800
Message-Id: <20191213045720.172738-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add JPEG codec node in mt8173.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 15f1842f6df3..82df8940d515 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1401,6 +1401,20 @@ vcodec_enc: vcodec@18002000 {
 						 <&topckgen CLK_TOP_UNIVPLL1_D2>;
 		};
 
+		jpegdec: jpegdec@18004000 {
+			compatible = "mediatek,mt8173-jpgdec";
+			reg = <0 0x18004000 0 0x1000>;
+			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&vencsys CLK_VENC_CKE0>,
+				 <&vencsys CLK_VENC_CKE3>;
+			clock-names = "jpgdec-smi",
+				      "jpgdec";
+			power-domains = <&scpsys MT8173_POWER_DOMAIN_VENC>;
+			mediatek,larb = <&larb3>;
+			iommus = <&iommu M4U_PORT_JPGDEC_WDMA>,
+				 <&iommu M4U_PORT_JPGDEC_BSDMA>;
+		};
+
 		vencltsys: clock-controller@19000000 {
 			compatible = "mediatek,mt8173-vencltsys", "syscon";
 			reg = <0 0x19000000 0 0x1000>;
-- 
2.24.1.735.g03f4e72817-goog

