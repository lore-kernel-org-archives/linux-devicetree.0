Return-Path: <SRS0=qh1l=5T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE603C2D0E8
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 11:41:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 834A92073B
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 11:41:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura-hr.20150623.gappssmtp.com header.i=@sartura-hr.20150623.gappssmtp.com header.b="z9abDNdI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403782AbgDCLk7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Apr 2020 07:40:59 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53146 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728066AbgDCLk7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Apr 2020 07:40:59 -0400
Received: by mail-wm1-f65.google.com with SMTP id t8so6818945wmi.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2020 04:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O50Gx6rk+wnrYYoowjLyR0iGzy1NO7KyGopLJExdfSE=;
        b=z9abDNdIei6Jogiontn/W6q8FgmXjboqlQnpVhtcCA7XD7FJVj5qaJyDQcuPm4ZI2o
         RhbXgNPXza5zxHBVUOseYHCPkUfaH1SCQz5U0OKGUUqNUmzPIFiCbAiiEzPnQu7lvARM
         5MNmtHpmIkYezDSJPZGNCCvBa/Y0WpEbsMyHdqfLa1yqtA8Vdot6T+XJBPdhS0l6ZhBq
         2P19Kv+H/K1PLmo74xHKbxd7335m7xzfsLU4m+9+ZqprAeoJsOVLC/lQZw36sgr/Hb/C
         c1oZPIMkU2EoI7yHNlOaKH7Yk4iVHFx0ISkdwiSpjFKE7T8FNXXhH0rsyZfeODNn2Gc7
         Tamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O50Gx6rk+wnrYYoowjLyR0iGzy1NO7KyGopLJExdfSE=;
        b=S/4Eq9N3Yws35ijZRF0nOTHb7V48HU/7LVaouPfwwMzWjYpP1QGZ4kN/9UHnqXU3XY
         QHhjci6owmoOE/1v94tjLT9xkjWR7i5wWqIqv/iIzgNzNT2u2A62AJrhP0tXjE1RpQbg
         QfKOysiHGct/q2EgDn7weJog/gDR52dhQa2tDHwkfSXCOcbGloCXK4z6fF2w+r9JQ7IP
         602ovkizizF1sCjAXP7hLpjiU2wCMhZ5ezyxVumKyNZg8aqH79WFsSoflCHrUQY0OY+n
         /u/OmFX6ho2ehdwouwkxKwKZ8YawpYETOApChYKR5IE3CLYTZ3/GlLh4j2LrCrY3s6ZP
         cj4A==
X-Gm-Message-State: AGi0PuZd2ee2NAyRTr4LvXUxo7kD5NqzLxsvg2qlc9G0d90K4vET4Sce
        mNldLBHC6qen6SzYqPx6kjaRvA==
X-Google-Smtp-Source: APiQypJkSanW+EcNhfC6YNTQD6pFP9FvhotDhVGxwUvZOc++TU5vRmEFsilKl4bwzNtedter13VIiA==
X-Received: by 2002:a1c:418b:: with SMTP id o133mr8582992wma.165.1585914057449;
        Fri, 03 Apr 2020 04:40:57 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-48.xnet.hr. [88.207.96.48])
        by smtp.googlemail.com with ESMTPSA id s9sm14477643wmc.2.2020.04.03.04.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 04:40:56 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Abhishek Sahu <absahu@codeaurora.org>,
        Pavel Kubelun <be.dissent@gmail.com>,
        Christian Lamparter <chunkeey@gmail.com>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH] ARM: dts: qcom: ipq4019: fix high resolution timer
Date:   Fri,  3 Apr 2020 13:40:40 +0200
Message-Id: <20200403114040.349787-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Abhishek Sahu <absahu@codeaurora.org>

Cherry-picked from CAF QSDK repo.
Original commit message:
The kernel is failing in switching the timer for high resolution
mode and clock source operates in 10ms resolution. The always-on
property needs to be given for timer device tree node to make
clock source working in 1ns resolution.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
Signed-off-by: Pavel Kubelun <be.dissent@gmail.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
Tested-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index ee45253361cb..b4803a428340 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -166,6 +166,7 @@ timer {
 			     <1 4 0xf08>,
 			     <1 1 0xf08>;
 		clock-frequency = <48000000>;
+		always-on;
 	};
 
 	soc {
-- 
2.26.0

