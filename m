Return-Path: <SRS0=KHJB=AD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189DCC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 17:32:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F008D2076E
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 17:32:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20150623.gappssmtp.com header.i=@beagleboard-org.20150623.gappssmtp.com header.b="LhbGWaTF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730092AbgFVRc1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 13:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730087AbgFVRcZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 22 Jun 2020 13:32:25 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9274C061797
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 10:32:24 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id rk21so2460646ejb.2
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 10:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=esraNk9vYcbt+aYhCal6Rv+dFZCSdTm7//1cm/DqNAg=;
        b=LhbGWaTFVPf141FJ+VrlM1gm9G0Yx9T8OzJsVp75vXKaqYFoXf5GmC8kpq2EpwwBbc
         WqOxWY+Tg9AsLYgOz1eO/LBiR+MVYTEfOkKxkgHAnxxI/56s2ggpsK/r/j/7SL1++AMP
         SDLZKqsstrA3w9vruCcX1oPVY8uC0Q6yXReSYG9DVhLmm+/Uqq6mmd+e1SYBBXOExrgd
         s9Qnj0Q1Hszp8W0gNV884tUzFLS+cHFswvbroJwNUn1qRoJIz/FwglnYHd4rTywkKgLw
         Q7b6HII+eeMzKJpkWXli3tFONXpY94d5smgvEkrme+nK5Rm88QCngPMJej+Qa3qer9do
         8iyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=esraNk9vYcbt+aYhCal6Rv+dFZCSdTm7//1cm/DqNAg=;
        b=HCHPhvrKNPhHu7W8OBAhD+8K2fLU5/kZBCSWiCU5yU8+Y7jbY0j6h8ZSQI7OIhhCav
         +Ndy1ZOeOvFR1Okq1p1aLdC90fj2/ivGfDdrA4EoR5NKnG4gTPoHho+9CvjuSOTEJq0h
         L546/mXMx1hFifMSW+WMzeMzWmHmF3A5R9DEjda/CDNtA2AbLH8EiyFNofn+xs1qfX2B
         2Ia/UIvoPjrhJkwfmdTd3UoGu6lUpfIw8oMocYBf8zHdsIO7GrMZVIaXx5cqK+towcnD
         qyFbjX/m5JQVUpAD6lKJUHidE0h6UmmzFPYRhQ9rPoS8C27ZsdA6XJe9WO8ZNmlT5apT
         q1ow==
X-Gm-Message-State: AOAM531nlRh6T+LZghq6UubCk6anQOWOWrDbszT30+hH1h3OOBiqtI5E
        fOEjQe++7IJQFEOXsT09Ld1kGg==
X-Google-Smtp-Source: ABdhPJy+SFPlroEIO3VTMMRuyksrmrJdFlyJ5PCayo2U6g0j3Kq28XVgQDvES259MOoHErSiuzhQNA==
X-Received: by 2002:a17:906:e05:: with SMTP id l5mr17849171eji.318.1592847143378;
        Mon, 22 Jun 2020 10:32:23 -0700 (PDT)
Received: from localhost.localdomain (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id z1sm4747386ejb.41.2020.06.22.10.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:32:22 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v3 3/3] ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2
Date:   Mon, 22 Jun 2020 19:29:51 +0200
Message-Id: <20200622172951.524306-4-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200622172951.524306-1-drew@beagleboard.org>
References: <20200622172951.524306-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This requires AM33XX_PADCONF macro in omap.h to be modified to keep pin
conf and pin mux values separate.

pinctrl-single.c must also be changed to support "pinctrl-single,pins"
with 3 arguments (offset, conf, mux).

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 arch/arm/boot/dts/am33xx-l4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 7ff11d6bf0f2..dafd6e8b42a1 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -278,7 +278,7 @@ scm: scm@0 {
 				am33xx_pinmux: pinmux@800 {
 					compatible = "pinctrl-single";
 					reg = <0x800 0x238>;
-					#pinctrl-cells = <1>;
+					#pinctrl-cells = <2>;
 					pinctrl-single,register-width = <32>;
 					pinctrl-single,function-mask = <0x7f>;
 				};
-- 
2.25.1

