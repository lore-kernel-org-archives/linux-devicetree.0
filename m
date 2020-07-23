Return-Path: <SRS0=BM7I=BC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99478C433E5
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 09:02:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 741032071A
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 09:02:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ZozH9q0A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbgGWJCY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jul 2020 05:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbgGWJCX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jul 2020 05:02:23 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26EADC0619DC
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2020 02:02:23 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id g67so2763900pgc.8
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2020 02:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4tPRnuMo6P2al0fa5yE86no6k6kmiCiMMqx340iPK/0=;
        b=ZozH9q0AwXVGn3wkmqQHhZCwekCwR6I+uVErphLFpN+NWAvlyaIKoICXW+W41CU7QF
         /G+IUtU45EIyqHJqBK/4SMRtTHc6rHpWqgc0V1qQ1M+ximzLCT+O47XJxuWyddeWWb4z
         KDcTJO6ebuX0VT3JKFqhDTcXqpHh4PbERD3wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4tPRnuMo6P2al0fa5yE86no6k6kmiCiMMqx340iPK/0=;
        b=Odarf+06IO6rSloCGwocAm6F9H0lZB+7B6ymn1R5NccWR8imh7xx1kCjU4HIpCo/31
         ZaH69uBFdvTeDhiuunonr/lP+Y/iIU4rzi1FJx3wST+BGGnYx8kGCoHtyDKb9sWsX5+1
         8TT+hcRMQLXZClca762q8NzuMvoocUzrtzcR6SmTQ47FOvNqMckwsm+DEAvw1UUSAhGp
         eKKF5bdpr5QHyd0BMgvcfawYTIjuiqnUOvJH7ZvZtkGhg11RTZx6lDgxdt0ILS097tL+
         Q8UOV8GC5lNkKdFjVu3XUi/t2KjaFv6A62CKHl8Yqfv7N0bk7VWFpdRQWNhqd2xy7cNK
         agPQ==
X-Gm-Message-State: AOAM532PnEAYLJnNEYMJPlFDhl233ZyNGuBnW8ZGZchvLSOBrASBpDSQ
        W1nb9YqS/Im+dG/muWcOdJbpKw==
X-Google-Smtp-Source: ABdhPJxGn9ZwTP2/G+qxUTJRMewuabrHt25C09m3AN4C7sxuJWyualP1023fExiG5DNu7ZDmXGtCOw==
X-Received: by 2002:a65:6650:: with SMTP id z16mr3505091pgv.161.1595494942657;
        Thu, 23 Jul 2020 02:02:22 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:cbf:ea0:8a30:a3af])
        by smtp.gmail.com with ESMTPSA id k23sm2319383pgb.92.2020.07.23.02.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 02:02:21 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc:     Suniel Mahesh <sunil@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v3 1/4] dt-bindings: arm: rockchip: Update ROCKPi 4 binding
Date:   Thu, 23 Jul 2020 14:32:07 +0530
Message-Id: <20200723090210.41201-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

ROCKPi 4 has 3 variants of hardware platforms called
ROCKPi 4A, 4B, and 4C.

- ROCKPi 4A has no Wif/BT.
- ROCKPi 4B has AP6256 Wifi/BT, PoE.
- ROCKPi 4C has AP6256 Wifi/BT, PoE, miniDP, USB Host enabled
  GPIO pin change compared to 4B, 4C

So, update the existing ROCKPi 4 binding to support
ROCKPi 4A/B/C hardware platforms.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- new patch

 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index db2e35796795..e6f656b0bd56 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -430,8 +430,12 @@ properties:
           - const: radxa,rock
           - const: rockchip,rk3188
 
-      - description: Radxa ROCK Pi 4
+      - description: Radxa ROCK Pi 4A/B/C
         items:
+          - enum:
+              - const: radxa,rockpi4a
+              - const: radxa,rockpi4b
+              - const: radxa,rockpi4c
           - const: radxa,rockpi4
           - const: rockchip,rk3399
 
-- 
2.25.1

