Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682BAC28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 10:36:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EA7F20663
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 10:36:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ryLcfp51"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbgEFKgu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 06:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728338AbgEFKgu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 06:36:50 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE6EC061A0F
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 03:36:49 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ms17so656972pjb.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 03:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vEDmWehMN/OIIrM/DKtPb1UlmBRTwVcciQ9VU68K/2M=;
        b=ryLcfp51SykLd9eefw2sS9ewCxi+++Zq5sX+EjkbRb7WOUQ1qANVnDpeQmvvde/GVw
         Ccxp+sXYLk82A+UuVx1FAN7GKEwl9ozaYECReDZWh+av7GNTvC+7vx98bSt9sJDw6T73
         0STo/RwhuSm/UdmKfd9Syn7YsZ5DAsFtZNXJJMi3wirfJ3WR6X9ed8m4j6nceNOjR+t/
         3XofwEa2xMwX6Ma6CJMMPxJYwIOjhiiO/LU61iQywxHcZTaXHPCDPJ7J5j8Zn31AwdNU
         j/RL5soUEBHIIfELLknip3S3wqiOX8C+bfhGNet8LpLde4PWw8YnSPzB6e8E9/hTUQAr
         CgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vEDmWehMN/OIIrM/DKtPb1UlmBRTwVcciQ9VU68K/2M=;
        b=A6FO2GtQr8okYTAj8XQcKfJMlDIu8cS5386ZrS0tm3MhnC3X5cEIDiKlim8LDs7zvE
         XQFu/nu9AD7Wv6tU8Yn2dncBa7Syp1PE/7Fer21H+zy4sEgkRwIP9l+mTL78tuHb/JRy
         shx0MYEbYBfC4wXfe33JFbc2bZxPnKVJEssUkHMILVp0BoQm2dHpd1LbrfYgFWDShw5e
         APUDmpRttapRPtOL6rHbgVZvTtiiuUEh+Y7nI5BG8B08BewWSHDXbAhIk3qFJmO1ktaH
         hTODuSwZyy06ZPAE21YmGmh/Rpv+IdoZ7m63IZoIpX2hEsqTVwuTaCHqMe9EnhFZARs1
         nggA==
X-Gm-Message-State: AGi0PuYkt6PlT4anaDcZlDINy16Bh2g+EglNxKiN7toxgLXaTbmrSAAR
        ohQpuC7rdrbGRKoeisTrSNs=
X-Google-Smtp-Source: APiQypJs8QJWPtZF/NlFI0/mIfFH2Iqo0osSzXmtIRNQXtI6a6a8ii7XMBdpbp1MgbdmgT189WJ/VQ==
X-Received: by 2002:a17:90a:2e82:: with SMTP id r2mr8158837pjd.128.1588761408522;
        Wed, 06 May 2020 03:36:48 -0700 (PDT)
Received: from localhost.localdomain ([106.215.43.48])
        by smtp.gmail.com with ESMTPSA id i72sm1601582pfe.104.2020.05.06.03.36.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2020 03:36:47 -0700 (PDT)
From:   Amit Singh Tomar <amittomer25@gmail.com>
To:     andre.przywara@arm.com, afaerber@suse.de,
        manivannan.sadhasivam@linaro.org, robh+dt@kernel.org
Cc:     cristian.ciocaltea@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH RFC 5/8] arm64: dts: actions: Add DMA Controller for S700
Date:   Wed,  6 May 2020 16:06:07 +0530
Message-Id: <1588761371-9078-6-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588761371-9078-1-git-send-email-amittomer25@gmail.com>
References: <1588761371-9078-1-git-send-email-amittomer25@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This commit adds DAM controller present on Actions S700, it differs from
S900 in terms of number of dma channels and requests.

Signed-off-by: Amit Singh Tomar <amittomer25@gmail.com>
---
 arch/arm64/boot/dts/actions/s700.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/actions/s700.dtsi b/arch/arm64/boot/dts/actions/s700.dtsi
index 0397c5dd3dec..56f2f84812cb 100644
--- a/arch/arm64/boot/dts/actions/s700.dtsi
+++ b/arch/arm64/boot/dts/actions/s700.dtsi
@@ -245,5 +245,18 @@
 				     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		dma: dma-controller@e0230000 {
+			compatible = "actions,s700-dma";
+			reg = <0x0 0xe0230000 0x0 0x1000>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			dma-channels = <10>;
+			dma-requests = <44>;
+			clocks = <&cmu CLK_DMAC>;
+		};
 	};
 };
-- 
2.7.4

