Return-Path: <SRS0=mubR=72=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC48C433E0
	for <linux-devicetree@archiver.kernel.org>; Sat, 13 Jun 2020 14:06:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 063652074D
	for <linux-devicetree@archiver.kernel.org>; Sat, 13 Jun 2020 14:06:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWEhjEMl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgFMOG4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 13 Jun 2020 10:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbgFMOG4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 13 Jun 2020 10:06:56 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AFEBC03E96F;
        Sat, 13 Jun 2020 07:06:56 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id n9so4913161plk.1;
        Sat, 13 Jun 2020 07:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uSoq7dCkhb9mg6g/FHh6ciPwhzSs4StAhWsPV10NcgA=;
        b=MWEhjEMlIWaRzZOFGHKl5DpDcy/ta1NJS5teLU9l2r6JRj1OuweO5LwNEadZ0XT3I8
         iN1ILO8lx70Xh4JGH9lLePEiDKIXr6xt2OHEnWcRcc2+g7jxE1x3omzKgNBOj7M1q2yW
         Yzi2C8m/1XvXMZrOQnShhvBFbt7ggYFH6/B820Js1usox2I9GRQDVtt95jL8MejBWxVk
         9bIfJCBJo2KVxAG2NvmD13hPM4HmWwhAxIp4WHppltLxtFJAHhiaN77/slgKVAip/StG
         gxfyyuLRpNtSq2uBCjbWNOY4hfwJs/lO1rmRNOPGX+orQ0ZEl85R+R/V2EQfnSq+e9f1
         nMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uSoq7dCkhb9mg6g/FHh6ciPwhzSs4StAhWsPV10NcgA=;
        b=V51WTOB6WvoW5CfPT4QUBiEL3b7VhL1s7StlR4dkKHY1qndoflm/2C2zE/NM1wKnz1
         fwjBSutjoTBltRikKDJPAwzA0XajEP1N4PUAqqL+ly63lz5fcPZedcOEiGdZzfcJLD7y
         lc7YD4Pnl4bW+CBH//Fi5N6QlsgbQguy/dMFVMdgEHwk8p2X3XySL+wwbhqE2cJIy6U7
         liwbIVy+WeejLM0wdUrZ5PbDk5UsbV1iAG1DMF/IepUA25s26Bepd9S6Iwbel3ORgWN7
         Ft0GsU0WFTdL5shD+SHOUhS1iccuPGc+qYedx2TCN+HWjKaOAPHHrnysK0jemgXSvS7J
         DiHA==
X-Gm-Message-State: AOAM5316dVqDJ/IYqBmwXJDyTNOVGMEqMnmdHYWD9mV1jHZlQqCTWKng
        PlgBkKE/tkEwgctHMV0vNRk=
X-Google-Smtp-Source: ABdhPJx9BAJzdZyVkEBmSd3z/lTFGCtgPcOb2RpfJmJKzh5RMJXOCrPDQ/0KRZ79O8xEXlx+9HOODg==
X-Received: by 2002:a17:902:848d:: with SMTP id c13mr15357259plo.289.1592057215546;
        Sat, 13 Jun 2020 07:06:55 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d809:ffb0:2ceb:aeb8:b257:998d])
        by smtp.gmail.com with ESMTPSA id k12sm9054291pfk.219.2020.06.13.07.06.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jun 2020 07:06:55 -0700 (PDT)
From:   Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        Noralf Tronnes <noralf@tronnes.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: add vendor prefix for EastRising Technology Co.,Ltd
Date:   Sat, 13 Jun 2020 19:36:46 +0530
Message-Id: <10dbf4687981634c510462804b8af6bbcf113fbf.1592055494.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1592055494.git.kamlesh.gurudasani@gmail.com>
References: <cover.1592055494.git.kamlesh.gurudasani@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add vendor prefix for display manufacturer company EastRising
Technology Co.,Ltd

[1]https://eastrising.en.ec21.com/

Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 7a39732..1b3d445 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -279,6 +279,8 @@ patternProperties:
     description: Dyna-Image
   "^ea,.*":
     description: Embedded Artists AB
+  "^eastrising,.*":
+    description: EastRising Technology Co.,Ltd
   "^ebs-systart,.*":
     description: EBS-SYSTART GmbH
   "^ebv,.*":
-- 
2.7.4

