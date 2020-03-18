Return-Path: <SRS0=uBtF=5D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4719C5ACD6
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Mar 2020 17:42:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2BE920719
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Mar 2020 17:42:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l0VQr5mC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbgCRRmW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Mar 2020 13:42:22 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54439 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbgCRRmV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Mar 2020 13:42:21 -0400
Received: by mail-wm1-f68.google.com with SMTP id n8so4423217wmc.4
        for <devicetree@vger.kernel.org>; Wed, 18 Mar 2020 10:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=45CQ8c/ky8+0hWRFL237+1ux25bCOkBLBHqU2LowH0M=;
        b=l0VQr5mC3md/yc+VTMrmxepUnhjah0lZIYK2r7WLXO7ppE+yyU89k0v0F2azUublEl
         xOFDyh1dyxRRbp9BjxkhBD+KOPdt0F2SpZq0/LgDt0f2zwbQQBRiBhj6yZ9SgDbD2RR7
         Fp+Nl4hRboRcU+g6Thy/1t5M83o5lVqe3axF/6i8AxrbGL1kQ1tzkUqCPIYS98/JEiXv
         DkyagZ/Xr+uG5DT7l+Qnfgkvu0TM7onK4n/xifH33P2UUwwH9W9re2qJ3dzSJff/OAn7
         GC3j5hz/usUgdVPW/5A1UBFGdy6Edn7/D6hyYQ7zxqVruy2Gi9JOYoEoQnCGKkx8OtRS
         fR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=45CQ8c/ky8+0hWRFL237+1ux25bCOkBLBHqU2LowH0M=;
        b=D5kqKhlMts+AxJ4ivYy2xBCZ4aUM10wiEQ8ZvIVxfW12ZaqguiXEbEc0gqOSIRUkPg
         e6+UqBqx0Gd7+/kxbrK0/y0CwUkxOd6yX3uLjodmjq55lB/1cW9wlCMzW9Bx8RqHTU/j
         bztFbu8ED33MZ8eMzRBshn6I/EC3YJCiQqGg6rLHZn9ii/SS6CeYRcItBCzQSYJgTNjA
         JOwfG+LObhIeRqLQFwLy/Cw0Wk1qCnQdI5zf/rBwWiu5ecNQT+AIEoG/vem7xfRbe+Vo
         OkRwko7GZRzNOxHjsopPpCuihLAP+F1pZJQCNUqc/fYnp7ooWL3nmP9vjdprNXOSbu6T
         NCiQ==
X-Gm-Message-State: ANhLgQ2GWGMeCd0EohsRCl2vMOuOICVyJV4AFQGvjEhgGIlVyTSktoMW
        npkY3+tE2NWbkrj2aeqJWpIS3Q==
X-Google-Smtp-Source: ADFU+vtlmsP4Fzzm2b6i3cJ54foljjmSawZHfzfOoF20h8kyAxh5UcH/0hm97qd1WX/56Rj1kxhACQ==
X-Received: by 2002:a1c:6745:: with SMTP id b66mr6288616wmc.30.1584553340468;
        Wed, 18 Mar 2020 10:42:20 -0700 (PDT)
Received: from mai.imgcgcw.net ([2a01:e34:ed2f:f020:5d64:ea6:49bd:69d7])
        by smtp.gmail.com with ESMTPSA id r3sm3787212wrm.35.2020.03.18.10.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 10:42:19 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS)
Subject: [PATCH 03/21] dt-bindings: fttmr010: Add ast2600 compatible
Date:   Wed, 18 Mar 2020 18:41:13 +0100
Message-Id: <20200318174131.20582-3-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318174131.20582-1-daniel.lezcano@linaro.org>
References: <e6cd8adf-60df-437a-003f-58e3403e4697@linaro.org>
 <20200318174131.20582-1-daniel.lezcano@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Joel Stanley <joel@jms.id.au>

The ast2600 contains a fttmr010 derivative.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Link: https://lore.kernel.org/r/20191107094218.13210-5-joel@jms.id.au
---
 Documentation/devicetree/bindings/timer/faraday,fttmr010.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/faraday,fttmr010.txt b/Documentation/devicetree/bindings/timer/faraday,fttmr010.txt
index 195792270414..3cb2f4c98d64 100644
--- a/Documentation/devicetree/bindings/timer/faraday,fttmr010.txt
+++ b/Documentation/devicetree/bindings/timer/faraday,fttmr010.txt
@@ -11,6 +11,7 @@ Required properties:
   "moxa,moxart-timer", "faraday,fttmr010"
   "aspeed,ast2400-timer"
   "aspeed,ast2500-timer"
+  "aspeed,ast2600-timer"
 
 - reg : Should contain registers location and length
 - interrupts : Should contain the three timer interrupts usually with
-- 
2.17.1

