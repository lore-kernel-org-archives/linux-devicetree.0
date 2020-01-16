Return-Path: <SRS0=HSwc=3F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A6FC33CAF
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 18:23:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6401B2051A
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jan 2020 18:23:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XS5Gnet0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392073AbgAPSXY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jan 2020 13:23:24 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37642 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405291AbgAPSXX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jan 2020 13:23:23 -0500
Received: by mail-wm1-f68.google.com with SMTP id f129so4859287wmf.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jan 2020 10:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bKzyTMx/EE6hYfa6xT4QOtv7PoRTzC4cnmE6saFEzZ8=;
        b=XS5Gnet0V1x9yQqCMC2ffevRg1STQIoU0YZrQ0LLNDqr8VKtEDV2LmxCv8U5G1IlH0
         LiJ0b9/G4Ce9rw04C7dbsDRgIXk09Mf4S1ETN8x9ktGh8+GEv4VvQdxqt4Kz62fDOMrv
         vigDSD76YL/ic+myUUSEDRW2X7g/qP/gFEvkA8jUwZnKOcRq7XtYtTaBmDbBpxtnPoqT
         UKK75TwQfc1HzNnj1SX6SeV2C/VAUzmbZbSxt8acPzT6nkctmkFHffvi/botExJI/1k7
         kOXozBk422Ly/CezpH8RyWit2nLwtj2PKoKMSWO9L/l9FhB30au1JF5tYzP3s7M7KoBn
         R/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bKzyTMx/EE6hYfa6xT4QOtv7PoRTzC4cnmE6saFEzZ8=;
        b=iRNJPTTd9BzfVvSmWkmbImHZojKX2plQzB4TfYnVqEhb5wlEQAZ7UQwkBzxXOLgZIz
         H1QCZlyIn3dmZeq6A+hchB2SVG7HxZkhDI6BBKRHNKnkJP+29lmpqyie3uPAIIAC1f7f
         IlOacTHP19JyA39yqwif2tZHpQkoaToDbYGEiEnpopK+UIYUV8cZ7OQHaf3G+C5OC6Vu
         2PAKSRNlM5p1dMPxM2E0QDj835W675ZT2AcvAanBiOKt0NM5v0/QG5ONVl077qCQbxgM
         j3cDW2h8FxVZIJ6McnBt97d8jkDMUZ5Gvoy8kh4pg5escB6B/Lj25I5Se53Y0wSUH59P
         3zYQ==
X-Gm-Message-State: APjAAAX+/eYOC0NyXQipuXEr/HX7G9QutE+w/D3U/sei995udNad34bI
        1AC8SP7tgpgznzEhzodWX936rg==
X-Google-Smtp-Source: APXvYqxsdQKMHzHde+rNzloenzO/Yx4EXE3hDkjCTmoJvF84QCCFWJ1LmS1W89NN6PHrcRYRQq2ymg==
X-Received: by 2002:a05:600c:48a:: with SMTP id d10mr315293wme.87.1579199000823;
        Thu, 16 Jan 2020 10:23:20 -0800 (PST)
Received: from mai.imgcgcw.net ([2a01:e34:ed2f:f020:6c63:1b50:1156:7f0f])
        by smtp.gmail.com with ESMTPSA id b137sm1087920wme.26.2020.01.16.10.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 10:23:20 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS)
Subject: [PATCH 03/17] dt-bindings: timer: renesas, cmt: Document r8a774b1 CMT support
Date:   Thu, 16 Jan 2020 19:22:50 +0100
Message-Id: <20200116182304.4926-3-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200116182304.4926-1-daniel.lezcano@linaro.org>
References: <74bf7170-401f-2962-ea5a-1e21431a9349@linaro.org>
 <20200116182304.4926-1-daniel.lezcano@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Biju Das <biju.das@bp.renesas.com>

Document SoC specific bindings for RZ/G2N (r8a774b1) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Link: https://lore.kernel.org/r/1570104229-59144-1-git-send-email-biju.das@bp.renesas.com
---
 Documentation/devicetree/bindings/timer/renesas,cmt.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
index a444cfc5852a..a747fabab7d3 100644
--- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
+++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
@@ -29,6 +29,8 @@ Required Properties:
     - "renesas,r8a77470-cmt1" for the 48-bit CMT1 device included in r8a77470.
     - "renesas,r8a774a1-cmt0" for the 32-bit CMT0 device included in r8a774a1.
     - "renesas,r8a774a1-cmt1" for the 48-bit CMT devices included in r8a774a1.
+    - "renesas,r8a774b1-cmt0" for the 32-bit CMT0 device included in r8a774b1.
+    - "renesas,r8a774b1-cmt1" for the 48-bit CMT devices included in r8a774b1.
     - "renesas,r8a774c0-cmt0" for the 32-bit CMT0 device included in r8a774c0.
     - "renesas,r8a774c0-cmt1" for the 48-bit CMT devices included in r8a774c0.
     - "renesas,r8a7790-cmt0" for the 32-bit CMT0 device included in r8a7790.
-- 
2.17.1

