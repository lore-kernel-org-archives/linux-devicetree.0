Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9BFCA9EB7
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 10:36:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7585520659
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 10:36:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S8Bihem9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbfJUKgX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 06:36:23 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37143 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728358AbfJUKgX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 21 Oct 2019 06:36:23 -0400
Received: by mail-pf1-f194.google.com with SMTP id y5so8167689pfo.4
        for <devicetree@vger.kernel.org>; Mon, 21 Oct 2019 03:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=vAk0yGeiCW4SKIjJnq+f9xqPKX6m5wwJtivbwF55fLs=;
        b=S8Bihem9RpDcOyr4KCVSnTKgeUfPM47uXgFRw0WH/pp1ZI/CGMgOaRarY4+jS8r4gS
         PZpQcWGZJydjFrJx+3/rQeLATVNn+cjQP78gMtCe7O3pARui+qlMs6eRZJgxCjP2i+S9
         zexPLrcg0i73kjZjwihN4Bei1fNq1WVTYQ5v0l6Q7AhZjLbA7OTGd6eZNsBQFLIl0P6z
         MuP6Jc07fhAxSwYpluUMayVoKIkd89LX0INf8iTC0i3POAmGNGI0l9R2lIvdBYXAixEL
         U7Bfklp9rj0e4JB2/ZjWLoYflbAl246lin6/JZsAc6eGDBUKkoJem52JZkMxarUnsSqw
         HkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=vAk0yGeiCW4SKIjJnq+f9xqPKX6m5wwJtivbwF55fLs=;
        b=gmuNyp5VpCTiB4+TySCcFMhgF8qczNNS3GRfIAcCgUQCRuIISrY0e/rtdxk/008gPb
         57Z/ZgdVIzOFzDDPVXGFg/uScUbW/M3cDDamG51IESciVmlgpXvGrLwfT/yaFbfxxfxg
         40FQ4GyaswsoxDmEE63nMqK4rALXkZQyL8yhqqmm/jFOOclBvsf/GvkrMJmSyEUt3O1+
         1qVxdqPm5t0NpHqLqK23H148GTctS24hd3lVwdaUL2yfMkExTxWWGO1ayM10lkz6YRlm
         HJvLFvcXdgNklYko/NEI78EjbSvBy7TW2LSAkgw1d/Ymstdtubh6gpaqY73qwaLkv18Q
         DwOg==
X-Gm-Message-State: APjAAAV2Z8N/PZ+q9wXCdkApqar3sxVbpe3Clpn5LkyRzeCtHmdEz0P9
        SzQ9nHKIwRMQ0mCWrUwVu53EbA==
X-Google-Smtp-Source: APXvYqw5wwC5YcvuabWh6R87MJJua4G4qRlb7eFz5yGtKtbysUKwbLA8bUKJcPJmbaNuXHSaejJowg==
X-Received: by 2002:a63:7d53:: with SMTP id m19mr25458922pgn.450.1571654182214;
        Mon, 21 Oct 2019 03:36:22 -0700 (PDT)
Received: from localhost ([49.248.62.222])
        by smtp.gmail.com with ESMTPSA id 19sm14665031pjd.23.2019.10.21.03.36.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 03:36:21 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org, julia.lawall@lip6.fr,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v6 11/15] arm64: dts: qcs404: thermal: Add interrupt support
Date:   Mon, 21 Oct 2019 16:05:30 +0530
Message-Id: <63d6b0b8bba0d217c2f7bb4240c587ead933b6be.1571652874.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Register upper-lower interrupt for the tsens controller.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index a97eeb4569c00..b6a4e60739362 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -290,6 +290,8 @@
 			nvmem-cells = <&tsens_caldata>;
 			nvmem-cell-names = "calib";
 			#qcom,sensors = <10>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

