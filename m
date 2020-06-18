Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F27C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 10:09:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC1A821548
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 10:09:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fAQvbqBH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728639AbgFRKJH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 18 Jun 2020 06:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728717AbgFRKJC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 18 Jun 2020 06:09:02 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66F6C0613EE
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 03:08:59 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id bh7so2232790plb.11
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 03:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tg/Hm1A2t+lsaJur4AOo5t83FkcPA6mYe4DsoUQP1Mg=;
        b=fAQvbqBHcgo8Q8qpa2FuXBYTJR3XAC4kMacXW4eiiO19pCNQCy+KFvZvhq8qyR4ORb
         rKAGyxGdy1ZsbfKWmv8u1I+NMqbCNXXbD3Z94kUcuhJ+nLSHE7myXyQ5q24+AoAvvZGJ
         5NyL50/gO71s8/dk4lAl2Lx7VhwAjRlW0eH0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tg/Hm1A2t+lsaJur4AOo5t83FkcPA6mYe4DsoUQP1Mg=;
        b=cbgwbM/2NZhr89MRHHA+duYrgWJ44g/EEqUhB+4SlsnacLqGAglqvgTjsPamLfXY6G
         oU7zsr8Z4Io0GOe9rSE4kU1+/Gjw5EfP0PZV+qKFOQ1hRsestOv9H3eWUk80dSSh/xv0
         Hj9zwk92OiKySJqmJJF4DojXheqOEAmznn8hNFbZIXkE9lLmjJOlXVYXy2nu4/a/Jz4Y
         xDYKrt6U81X7FrtkRvNUhv8hGpHq7eHt7t1Q50WRApXm3sERl8qwMQ/gS33G0kdqYVaV
         PRqfZJgATMSoUyU4AJHWEMNiuhjMqDty9W6OlakIiabZDW0kofndj+xyOcAxuKCRdYWU
         MCag==
X-Gm-Message-State: AOAM533Q+ON9CbQc0llYONJ6sJrErZX/kkeaeuN4D4Kq4NEx3PiQsh7h
        Mdm5HklXO6uPo7tW4I2z6n2v9j5GGnrYNA==
X-Google-Smtp-Source: ABdhPJyCE56MacJy+rzWLhSlQ5DQWsr/6CsvbeyHuLNduw/AkcYxXxf6DUZG3PzMtdzHx0vZ9GTF+g==
X-Received: by 2002:a17:90a:224a:: with SMTP id c68mr3243563pje.21.1592474938662;
        Thu, 18 Jun 2020 03:08:58 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:b0c7:f192:869b:df87])
        by smtp.gmail.com with ESMTPSA id o16sm2190793pgg.57.2020.06.18.03.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 03:08:58 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc:     Tom Cubie <tom@radxa.com>, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 2/4] dt-bindings: arm: rockchip: Add Rock Pi N8 binding
Date:   Thu, 18 Jun 2020 15:38:30 +0530
Message-Id: <20200618100832.94202-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618100832.94202-1-jagan@amarulasolutions.com>
References: <20200618100832.94202-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Rock Pi N8 is a Rockchip RK3288 based SBC, which has
- VMARC RK3288 SOM (as per SMARC standard) from Vamrs.
- Compatible carrier board from Radxa.

VMARC RK3288 SOM need to mount on top of dalang carrier
board for making Rock PI N8 SBC.

Add dt-bindings for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index d4a4045092df..db2e35796795 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -435,6 +435,12 @@ properties:
           - const: radxa,rockpi4
           - const: rockchip,rk3399
 
+      - description: Radxa ROCK Pi N8
+        items:
+          - const: radxa,rockpi-n8
+          - const: vamrs,rk3288-vmarc-som
+          - const: rockchip,rk3288
+
       - description: Radxa ROCK Pi N10
         items:
           - const: radxa,rockpi-n10
-- 
2.25.1

