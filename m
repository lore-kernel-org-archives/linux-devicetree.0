Return-Path: <SRS0=wLM1=AN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3E5C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 03:16:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DE28207D4
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 03:16:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uV0TTUHu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgGBDP7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Jul 2020 23:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgGBDP7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Jul 2020 23:15:59 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0890EC08C5C1
        for <devicetree@vger.kernel.org>; Wed,  1 Jul 2020 20:15:59 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id e192so28228471ybf.17
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2020 20:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=hedYhqgmZAAsOutDncDPqnlpzuuMhTLpZziU+qMbGLE=;
        b=uV0TTUHu2THKmzy3RXnp/AEnYr4oDDtg/sPYvbr0Mqh710YOZDJZJvQFr9QVgDZcMX
         5d2lYdM9u72E1QkKFHRTft+huUGXfsPJtjU19DdtLEZ9p3lkKGzmkDFogpyS4cxl3itc
         zBo16RWvh2qGIr3SDS7LktRGo0khmTd0f7Gir7RnZOnV4XMjncDB/+dXYKUQxnOf8vTR
         uNY8igeGfbTSBBsJFHMdEtHEhFmz0x190+iCOG5qrJSv3pIMQtpEiaoKcbIenNrCEGan
         MWEtkvnoN+/JK2Hr5MgRFGho2FlVxlbChr/mUrzkKg126pb1zy+kaFVurr7TPevdg/Qg
         uhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=hedYhqgmZAAsOutDncDPqnlpzuuMhTLpZziU+qMbGLE=;
        b=pwvcrwXZfCxMFs7KJ9XLXlqodP1+/N5owqYs0Z2Ba2W597NaW5LfyeLnyzQ+hkrR2J
         o/9nGb2qBBwQTZWcelY6mW2HSw+JO0jZWlnN8YxJmgIy4GP86/YePnnCy6J1R6JzwSZA
         /zjIjMeqd+KFQZ+9UOSOtoqz6mWEi6azDOlj8jCh93oRTKzWaRSMb/vmdwSC1VuxvTce
         JpP3BUqg1JOwbZoPT984vy2UebUxRwFEzg4z34Mjq1NeyYbDgdcrZ8C3tvLXfuMCvjIv
         tr3VbNHnA26Qs4fQ0Fec5YnInbJ05Mb5ps7KrWBfn7oU+phMqNsRvXdvEwF/Zos82BJx
         In+A==
X-Gm-Message-State: AOAM533r2nF+PeOGMyP2e6bR47joC7riXa7QBzjrE/bOLtu1fmrPmYir
        V2ywHRLHXulUeoHe5vqzm0MhNhDH0BGd
X-Google-Smtp-Source: ABdhPJwZln/zT2wOn6bCAOC1AOi/fjwfd1XSbq4ltHsJPQtQIDKtLkofPngdXzPKphvtsTpivVQnLM0TkHhw
X-Received: by 2002:a25:2882:: with SMTP id o124mr741616ybo.10.1593659758255;
 Wed, 01 Jul 2020 20:15:58 -0700 (PDT)
Date:   Thu,  2 Jul 2020 13:15:23 +1000
In-Reply-To: <20200702031525.2662441-1-amistry@google.com>
Message-Id: <20200702131350.2.I6131e251d13f60d8c5347bb4faa9dc2364c87848@changeid>
Mime-Version: 1.0
References: <20200702031525.2662441-1-amistry@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH 2/4] dt-bindings: regulator: da9211: Document allowed modes
From:   Anand K Mistry <amistry@google.com>
To:     linux-mediatek@lists.infradead.org
Cc:     hsinyi@chromium.org, drinkcat@chromium.org,
        Anand K Mistry <amistry@google.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch adds a description of how operating modes may be specified.

Signed-off-by: Anand K Mistry <amistry@google.com>
---

 Documentation/devicetree/bindings/regulator/da9211.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/da9211.txt b/Documentation/devicetree/bindings/regulator/da9211.txt
index 27717e816e71..eb871447d508 100644
--- a/Documentation/devicetree/bindings/regulator/da9211.txt
+++ b/Documentation/devicetree/bindings/regulator/da9211.txt
@@ -15,6 +15,8 @@ Required properties:
 Optional properties:
 - enable-gpios: platform gpio for control of BUCKA/BUCKB.
 - Any optional property defined in regulator.txt
+  - regulator-initial-mode and regulator-allowed-modes may be specified using
+    mode values from dt-bindings/regulator/dlg,da9211-regulator.h
 
 Example 1) DA9211
 	pmic: da9211@68 {
@@ -30,6 +32,8 @@ Example 1) DA9211
 				regulator-min-microamp 	= <2000000>;
 				regulator-max-microamp 	= <5000000>;
 				enable-gpios = <&gpio 27 0>;
+				regulator-allowed-modes = <DA9211_BUCK_MODE_SYNC
+							   DA9211_BUCK_MODE_AUTO>;
 			};
 		};
 	};
-- 
2.27.0.212.ge8ba1cc988-goog

