Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F00EC2BB1D
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 05:50:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1471320784
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 05:50:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F1npRqch"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725283AbgDIFuX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 01:50:23 -0400
Received: from mail-pl1-f172.google.com ([209.85.214.172]:39566 "EHLO
        mail-pl1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgDIFuX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 01:50:23 -0400
Received: by mail-pl1-f172.google.com with SMTP id k18so3449388pll.6
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 22:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oD+3H5EUXyXsIZqvMLC6/CrJcPMIkJIU4sPceYOTfRs=;
        b=F1npRqchyAr0X0Lz8WopTJ4+ES+oIcIfoiGvDxtYi2XSm8IP40UWH46FMGHafKnYGr
         XB4qW92qvkHjtS+KUYVDdB62YtBL3aPuusfHH+Cf0KWY159W+Xj5RcIvtBa635UW7aab
         d9HzZdAscSUZIsTJP7zcM9NPOrAbilWA6706Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oD+3H5EUXyXsIZqvMLC6/CrJcPMIkJIU4sPceYOTfRs=;
        b=L88fvUnB4TNaRK3/QlDOzbdFq+D+AC6FZQMe+kZAb2HlNcNWE1an3nZm46izLDD6c2
         zaGAhz61HCQgyLHOYl7+B+LM6W5tX/FaNxqQtf3y+QQKWdd38ZRZSI4T2GORKKP0gP2s
         55T2WhsrTm9gY6PDQrJm66c1cFc9J4EgFISWoo+xOTj3idAyFAdlXoak4PNA9iZKbwYO
         dUpZXyMG7W/xDrPEU0USgQrbJijJMr2RIzKpdOidcJu9WviRB9XgbRA/NW/gVD0ZDK4O
         dkm9mW/8JcExlQfWIv1klDjup76kMgYSdEtW0Jy3ziZa0NP2jh471MeY2AElTuD2GspI
         lTXA==
X-Gm-Message-State: AGi0PuYXM7D9wMG+RiMgC6X58rHqNNJU6G8Hh1X312R/2mVbJaNQTJyn
        NBmRmQ29km3sCevtIjtQ09okQw==
X-Google-Smtp-Source: APiQypLK+pYxgG3+6e6LhdOWp0EqgJ5nl8iuNInYwCrYi/OgrCelBK9E5/cYQjucscbvzheyUhVjbA==
X-Received: by 2002:a17:902:7897:: with SMTP id q23mr10557900pll.312.1586411421919;
        Wed, 08 Apr 2020 22:50:21 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:b852:bd51:9305:4261])
        by smtp.gmail.com with ESMTPSA id 198sm18471721pfa.87.2020.04.08.22.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 22:50:21 -0700 (PDT)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v2] arm64: dts: mt8173: Add gce setting in mmsys and display node
Date:   Thu,  9 Apr 2020 13:50:12 +0800
Message-Id: <20200409055012.199320-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

In order to use GCE function, we need add some informations
into display node (mboxes, mediatek,gce-client-reg, mediatek,gce-events).

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
change log:
v1->v2: align with
19d8e335d58a ("dt-binding: gce: remove atomic_exec in mboxes property")
60fa8c13ab1a ("drm/mediatek: Move gce event property to mutex device node")
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index ccb8e88a60c5..8337ba42845d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -549,7 +549,7 @@ gce: mailbox@10212000 {
 			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&infracfg CLK_INFRA_GCE>;
 			clock-names = "gce";
-			#mbox-cells = <3>;
+			#mbox-cells = <2>;
 		};
 
 		mipi_tx0: mipi-dphy@10215000 {
@@ -916,6 +916,9 @@ mmsys: clock-controller@14000000 {
 			assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
 			assigned-clock-rates = <400000000>;
 			#clock-cells = <1>;
+			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
+				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
 		};
 
 		mdp_rdma0: rdma@14001000 {
@@ -996,6 +999,7 @@ ovl0: ovl@1400c000 {
 			clocks = <&mmsys CLK_MM_DISP_OVL0>;
 			iommus = <&iommu M4U_PORT_DISP_OVL0>;
 			mediatek,larb = <&larb0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
 		};
 
 		ovl1: ovl@1400d000 {
@@ -1006,6 +1010,7 @@ ovl1: ovl@1400d000 {
 			clocks = <&mmsys CLK_MM_DISP_OVL1>;
 			iommus = <&iommu M4U_PORT_DISP_OVL1>;
 			mediatek,larb = <&larb4>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
 		};
 
 		rdma0: rdma@1400e000 {
@@ -1016,6 +1021,7 @@ rdma0: rdma@1400e000 {
 			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
 			mediatek,larb = <&larb0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
 		};
 
 		rdma1: rdma@1400f000 {
@@ -1026,6 +1032,7 @@ rdma1: rdma@1400f000 {
 			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
 			mediatek,larb = <&larb4>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
 		};
 
 		rdma2: rdma@14010000 {
@@ -1036,6 +1043,7 @@ rdma2: rdma@14010000 {
 			clocks = <&mmsys CLK_MM_DISP_RDMA2>;
 			iommus = <&iommu M4U_PORT_DISP_RDMA2>;
 			mediatek,larb = <&larb4>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
 		};
 
 		wdma0: wdma@14011000 {
@@ -1046,6 +1054,7 @@ wdma0: wdma@14011000 {
 			clocks = <&mmsys CLK_MM_DISP_WDMA0>;
 			iommus = <&iommu M4U_PORT_DISP_WDMA0>;
 			mediatek,larb = <&larb0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
 		};
 
 		wdma1: wdma@14012000 {
@@ -1056,6 +1065,7 @@ wdma1: wdma@14012000 {
 			clocks = <&mmsys CLK_MM_DISP_WDMA1>;
 			iommus = <&iommu M4U_PORT_DISP_WDMA1>;
 			mediatek,larb = <&larb4>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
 		};
 
 		color0: color@14013000 {
@@ -1064,6 +1074,7 @@ color0: color@14013000 {
 			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x3000 0x1000>;
 		};
 
 		color1: color@14014000 {
@@ -1072,6 +1083,7 @@ color1: color@14014000 {
 			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_COLOR1>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x4000 0x1000>;
 		};
 
 		aal@14015000 {
@@ -1080,6 +1092,7 @@ aal@14015000 {
 			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_AAL>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
 		};
 
 		gamma@14016000 {
@@ -1088,6 +1101,7 @@ gamma@14016000 {
 			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_DISP_GAMMA>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x6000 0x1000>;
 		};
 
 		merge@14017000 {
@@ -1193,6 +1207,8 @@ mutex: mutex@14020000 {
 			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 			clocks = <&mmsys CLK_MM_MUTEX_32K>;
+			mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
+                                              <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
 		};
 
 		larb0: larb@14021000 {
-- 
2.26.0.292.g33ef6b2f38-goog

