Return-Path: <SRS0=LTWd=4A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B40C2BA83
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 06:05:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC2EE2073C
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 06:05:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GidHGpfU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgBLGFt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Feb 2020 01:05:49 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:39627 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgBLGFt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Feb 2020 01:05:49 -0500
Received: by mail-pj1-f67.google.com with SMTP id e9so408391pjr.4
        for <devicetree@vger.kernel.org>; Tue, 11 Feb 2020 22:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Js4SWp4AxGnmgpS0xpb2r+20hjEB6ZJuleDc08nwvzc=;
        b=GidHGpfU+1Q586bqtdp7qWIQdqBWX0kfx/pBWtI1uAajniLiy2nPpkxJ7JjnAweVHg
         ilZrHgwOmIDgE611haEEILEBp4woWOhMLh2UhtBdIbORMMG6SuYfjXk2XjPtQTp5tyr1
         WkA/POXqdq+jTPxtC+KlqAU+qgfuXQsKGJ1cI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Js4SWp4AxGnmgpS0xpb2r+20hjEB6ZJuleDc08nwvzc=;
        b=KncWdxxEDDJM7AbV8E/jHHpLimidkaV3WHz7ru+bSIRNgJqc0tnalKzZgbkWBFoNEF
         z6T96Lle3htOZq4QLLVVTnhO30tqImMyBrEqBsn/ujAKuRMcawTALc235Kg/0+lcK7ar
         MXFPOCohIIK7I7uM5g3TEmGck3/nCg9hcPJg5Rq/Xcrc+bO+rmK7Gq0VztkIcDQFy1kn
         Wiokt6vp+qu5n95NoqxfEUSR6dgwrAk5Ue1eyLq4VlBYds/GuEeW1CeplXwenSsTliVd
         w+oY9GF3OM5K1ij8t9++BWAoLlnjYBwiWxRJ9WQrrD1cqfCcTcTp0d3bZp04/zLcFtmG
         XqRQ==
X-Gm-Message-State: APjAAAUsm4sEV0h+OSRJk92Ic9iUeWFiElnbBZ+hwg5dLsMOAXJRpYuy
        DQS5AvADl5dQ1fAKst0NBboJIA==
X-Google-Smtp-Source: APXvYqxpyZsLuZkNUFq1aaY5ImmMD5AfRib3xtsrExdV4p76C8R6dTdGEPgJdoE+a7Q4WF+2gH+auA==
X-Received: by 2002:a17:902:9f88:: with SMTP id g8mr22080796plq.100.1581487546921;
        Tue, 11 Feb 2020 22:05:46 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:b852:bd51:9305:4261])
        by smtp.gmail.com with ESMTPSA id d69sm6792163pfd.72.2020.02.11.22.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 22:05:46 -0800 (PST)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mt8173: add arm,no-tick-in-suspend in timer
Date:   Wed, 12 Feb 2020 14:05:37 +0800
Message-Id: <20200212060536.156890-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Arch timer stops during system suspend. Add arm,no-tick-in-suspend
property in timer.

This is a follow up for d8ec7595a013
("clocksource/drivers/arm_arch_timer: Don't assume clock runs in
suspend")

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 8b4e806d5119..1a9ad90bd7a6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -331,6 +331,7 @@ timer {
 			      (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 10
 			      (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		arm,no-tick-in-suspend;
 	};
 
 	soc {
-- 
2.25.0.225.g125e21ebc7-goog

