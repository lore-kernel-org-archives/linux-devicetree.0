Return-Path: <SRS0=BM7I=BC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E4BC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 12:40:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6614C20768
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 12:40:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="cwimNVVU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbgGWMkP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jul 2020 08:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbgGWMkP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jul 2020 08:40:15 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B179C0619DC
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2020 05:40:15 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id w17so2496977ply.11
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2020 05:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m++NcJD4D9qyIM0yoYrA2193x1gO/IpyUHnTZrnYdqE=;
        b=cwimNVVUL2ZRKhYUpjPnCahoeZjEkgePw8zWlUz/Vx7t0fPDr0Oe3xwu5LJnh9LxPP
         CN6hlNMyhiedaPW2yQc+yBxt5rQUKquKbYOR24sIkuKTfy6GM5a2XUgJYiqPZR1Y/hBj
         iEfXOe9hIhZfTkniR+EKk06710g5xWqc8VOcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m++NcJD4D9qyIM0yoYrA2193x1gO/IpyUHnTZrnYdqE=;
        b=dgDnCkaQ6d10Vu+gh3OPSZpb5GjwVYinPugXwspqSEedb3anN66wUdYN/C7StWWi+P
         2ozEl8PW4LzuyRApKYApglEtFk7PMUci4gFozxa0tw3dq72pDE6CQuBsA9rIs7nA/s9K
         6J8HClhMZvt6K/ZPYbA7nkK1mLKeT3ID6GG+BJ3YVMLyxYv6rVuc+PbAjqk4/r4srvHV
         ktRpAfZgxke6o0CNwwQqLdubhfVv1tZL1CrMlOjBVZChVk0ImlOnnHWKPgbzpYlFpQqU
         za6v7x+EXvUbjCYRBBznKoXgl5zxneLad5blJn5kDr/8OumBriXsCgoRw28XFACZl9Ra
         WGYQ==
X-Gm-Message-State: AOAM5331sUIlbC6cL3MxqjGyMqbHd3U5NbPWkmyGVI/V5BJe9fwWQQVJ
        Zd678W4Cfzqy2yDJcSlxLuD6eA==
X-Google-Smtp-Source: ABdhPJwVRBhB8JfLTcYDzcTUPhTG8ljFSnglRRGudi5SwWLBmNYO+qwbzW8ovkKER9L7EWcSldjoPA==
X-Received: by 2002:a17:90a:cb0e:: with SMTP id z14mr236606pjt.140.1595508014924;
        Thu, 23 Jul 2020 05:40:14 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:cbf:ea0:8a30:a3af])
        by smtp.gmail.com with ESMTPSA id m26sm3051270pff.84.2020.07.23.05.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 05:40:13 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc:     Suniel Mahesh <sunil@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 1/7] dt-bindings: arm: rockchip: Add Engicam PX30.Core EDIMM2.2 Starter Kit
Date:   Thu, 23 Jul 2020 18:09:45 +0530
Message-Id: <20200723123951.149497-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200723123951.149497-1-jagan@amarulasolutions.com>
References: <20200723123951.149497-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

PX30.Core is an EDIMM SOM based on Rockchip PX30 from Engicam.

EDIMM2.2 Starter Kit is an EDIMM 2.2 Form Factor Capacitive
Evaluation Board from Engicam.

PX30.Core needs to mount on top of this Evaluation board for
creating complete PX30.Core EDIMM2.2 Starter Kit.

Add bindings for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index e6f656b0bd56..392bdb7042de 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -70,6 +70,12 @@ properties:
           - const: elgin,rv1108-r1
           - const: rockchip,rv1108
 
+      - description: Engicam PX30.Core EDIMM2.2 Starter Kit
+        items:
+          - const: engicam,px30-core-edimm2.2
+          - const: engicam,px30-px30-core
+          - const: rockchip,px30
+
       - description: Firefly Firefly-RK3288
         items:
           - enum:
-- 
2.25.1

