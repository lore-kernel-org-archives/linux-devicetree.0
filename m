Return-Path: <SRS0=Tykm=BJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36F5C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 10:02:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4905206F5
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 10:02:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvCoa/0/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728772AbgG3KC3 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jul 2020 06:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgG3KC2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 30 Jul 2020 06:02:28 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF288C061794
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 03:02:27 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id q17so13594178pls.9
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 03:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MO72mG+dWhjXsuhz31SfGb8hRyP/pb73MD0FYQnJVGg=;
        b=OvCoa/0/2Fnldj0/k9jnjh5g6/Z2vJisXKT/w/wwIsDWGDJ+XNfIoFrMQit9Dsz6Yd
         7PzzMkxwqFk1gzXrf3tMhGKWHyrPISbRMU36uzY2U5veR4ljZjReaCDIhf98i0vJXU09
         ndyPKrpfeJUOKtfEyDpIrt7ChJcPgJytOr57lOC/JoiYGZqBEurPVrPeL7kURKYiXwEm
         cFwefFXqTrHv2dRQMLZJBcQLVSLBbCMPDE+f+oebSmyMqD8HXLdxYbXTtTC5RdabliTX
         ypYea+CJ9g5ygoH6cGOTVGb8P7XB+dtRbpOvrXAKqR4MB8A3LblfachI7dK0FX9+VCEq
         RUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MO72mG+dWhjXsuhz31SfGb8hRyP/pb73MD0FYQnJVGg=;
        b=G05flrFG0EFePB3J/LdVGNDI4vCQEctECy7n4S3A5TVjhOfEeso0KWCUC/nnmifVsM
         ohmmVMjKZ5P+LwzQ1lmtZ0O9F4x+1zev79XS/iEET1+dTCb6JNy7/CioWGNiAN/YV/IV
         pAVKsin8ECdLejhJB3G9vu29QrTom25ze5igaQa5Eg/sZgH41QCwBuBhrezy9499Vqhm
         L9KHiYFEakracSg4QAcvSUhSNSo+L4kbWgm8xkLktAGEvoVUdTmt+5m3oeTJP/g04xiT
         uTD68pIFAv7wm3qaLkE6T4Z1QCyIjFTJYB5AXpdCMUeGe35nzdK9IpUSYv7yWK02zmnx
         W7eA==
X-Gm-Message-State: AOAM532kP5Kz11CktFhqB2erkJFFbPJAAnUacu9/A4f05RY+biykING5
        6gJdKunVZJpnO/tNxiEDd8cmkaXp
X-Google-Smtp-Source: ABdhPJwV5BjFx3WacpN5lFykYkivmHIsmIGFQ4SAbnTX7iOXog/7rh1DFN895x+skrvl4wpCSq/bhQ==
X-Received: by 2002:a17:90b:1949:: with SMTP id nk9mr6357635pjb.185.1596103347183;
        Thu, 30 Jul 2020 03:02:27 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.37])
        by smtp.gmail.com with ESMTPSA id d12sm5476640pfh.196.2020.07.30.03.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 03:02:26 -0700 (PDT)
From:   Anand Moon <linux.amoon@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v1 3/3] arm64: dts: amlogic: meson-g12: add missing ethernet reset ID
Date:   Thu, 30 Jul 2020 10:02:09 +0000
Message-Id: <20200730100209.793-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200730100209.793-1-linux.amoon@gmail.com>
References: <20200730100209.793-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add missing etherent reset ID for reset controller to reset
ethernet mac controller.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 593a006f4b7b..7f291e6e9847 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -189,6 +189,8 @@ ethmac: ethernet@ff3f0000 {
 			clock-names = "stmmaceth", "clkin0", "clkin1";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "stmmaceth";
 			status = "disabled";
 
 			mdio0: mdio {
-- 
2.28.0

