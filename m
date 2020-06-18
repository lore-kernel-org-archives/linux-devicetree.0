Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79777C433E2
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 12:52:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BDF420885
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 12:52:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20150623.gappssmtp.com header.i=@beagleboard-org.20150623.gappssmtp.com header.b="TiuuX/Sd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730047AbgFRMwA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 18 Jun 2020 08:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730030AbgFRMvx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 18 Jun 2020 08:51:53 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C22BC0613EE
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 05:51:53 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id t194so5516838wmt.4
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 05:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+0u89dpmgvQy4plYwwslEmSBiru+bR25mmVExT9ZnYw=;
        b=TiuuX/SdtqRxO1POZ1JiW5Hy2GFaKV93vyNQMVQOy5teZ9AgCJLGPSSnXyOmCDBEUz
         bs6Q6tC8Q8QCv/hVDRI53LLBfuHJ/0nBs/NAsvTv4lmXuJhKByZy1gzQS8bGO4fwryaA
         lHQYWy7p59e61ydNP0aYDMdjz2DklMtM/+9QBq7DYEpM9dsABml7vbZG10g//W1+YA1A
         CxneXxP6sZGKnfhQIs+3Ua56kKThzmDJwIyivVu20LsjbQG6TnR3my9Jq+fI4SAKbUjW
         C5XM251MVSf5ukXeYVaYERqX/D4WohOdPlT2zv+ly2ORU4yqREvY0CWUcgF+yV6Q1wgM
         jEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+0u89dpmgvQy4plYwwslEmSBiru+bR25mmVExT9ZnYw=;
        b=NKgWr6EyN2QT2NF/Qbn6e4TNsHzBS7eLqutzaWxbbvlojw9JAOEZ+zMO5OscQZrEg/
         qYOgl4pab+eFrB5nX9PB7JrMnI+/LpCAw5iaq/utOtMKBlvBlPaCEZssgplKbewIdfOC
         Nvn+5V0W/ow3JwqU4ggNCz6BF8L20aMIg9hg46g4B4tLE7cN7ZwMck7KSov+Eei5ItAI
         PlpUKU50ap/AkQwNhWh3/hvr7/+8GZJdpdK/KsVBdE/KGSHUBEBCmKM5n6C7wbEw+nyu
         O3BPdiiHMBe/81uEN9ostOR5HbYzmv+qWvGIqRQEtKr+NOgHi9/XisROVpPjYjwhN11b
         IcgA==
X-Gm-Message-State: AOAM531L/KeWjpotJszMvD/lc5s0MHd442QEMxVPA0SZFcMZf+7EEqKr
        ujdRV4HV87R3kTHWCNi/CCYPfw==
X-Google-Smtp-Source: ABdhPJzZfibMUZiL+eVz9fIQNUlgeCf8L/u/t5OdsJBEcZqoBou07CPY4UPJL2CC9XruVrC+oYqBvg==
X-Received: by 2002:a1c:ddc1:: with SMTP id u184mr3705202wmg.115.1592484712360;
        Thu, 18 Jun 2020 05:51:52 -0700 (PDT)
Received: from localhost.localdomain (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id v27sm3714151wrv.81.2020.06.18.05.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 05:51:51 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH 3/3] pinctrl: single: parse #pinctrl-cells = 2
Date:   Thu, 18 Jun 2020 14:50:57 +0200
Message-Id: <20200618125057.41252-4-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618125057.41252-1-drew@beagleboard.org>
References: <20200618125057.41252-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

If "pinctrl-single,pins" has 3 arguments (offset, conf, mux) then
pcs_parse_one_pinctrl_entry() does an OR operation on to get the
value to store in the register.

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/pinctrl-single.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 02f677eb1d53..e6d1cf25782c 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1017,10 +1017,17 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 			break;
 		}
 
-		/* Index plus one value cell */
 		offset = pinctrl_spec.args[0];
 		vals[found].reg = pcs->base + offset;
-		vals[found].val = pinctrl_spec.args[1];
+
+		switch (pinctrl_spec.args_count) {
+		case 2:
+			vals[found].val = pinctrl_spec.args[1];
+			break;
+		case 3:
+			vals[found].val = (pinctrl_spec.args[1] | pinctrl_spec.args[2]);
+			break;
+		}
 
 		dev_dbg(pcs->dev, "%pOFn index: 0x%x value: 0x%x\n",
 			pinctrl_spec.np, offset, pinctrl_spec.args[1]);
-- 
2.25.1

