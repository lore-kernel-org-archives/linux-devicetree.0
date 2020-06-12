Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C643DC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A311C20842
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 14:20:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEwKWO1L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgFLOUM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbgFLOUL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 10:20:11 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3015EC08C5C1;
        Fri, 12 Jun 2020 07:20:11 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l11so9941499wru.0;
        Fri, 12 Jun 2020 07:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VOYwdmEMw/z4lW67OcK7qK+qAMqY7Sia5UePwj/cidQ=;
        b=pEwKWO1LB1tqyApaS1+N4V3LP+fHEzXcb82s3p0EaV075veJOLgAAWzp4ieuDnSMBG
         pIauuqGxa8Xmtf/byqlT4IHAPU+mk37zGvdfoZ7NBZAFJeOSOhCJ2F8i/22rnEmu7VIN
         pr/QfQ0lqeP4S6nUuVKZ6g47xhCf3OI+08Y97mXXq1T5lhfWBbCSy7KNSMWOjJ5okhkI
         Jp/up4c5WePv4OEkKO+Z53FV+2w1+LzqxUxee8CLkKJz3NG+3Hw0xNCxz4GJzotayZh1
         aQfo8dXCwOmoCik8INuUQfqQjnahqcojaQf/Ya5Mi+R7oK22kmxUC0pKbYBYjwRH+zMH
         i/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VOYwdmEMw/z4lW67OcK7qK+qAMqY7Sia5UePwj/cidQ=;
        b=ipIFt1JQ4wZO1aSXg7UmBqdXB3yF/yicxbxr6A2qKnWnWfvSpoO8W2834yme5Kjo+1
         GBCs/DHplDIQQHITAHsGGOj5XbV1/OvgbUj5g9upUuhQP3IWfpdP+G67EVKsSUxXQEPN
         NOjRWnWMtNK85RWiXC/bBT8A2d1zOb5aYSlHcN64xdSinFduBSxvX1zfmNLdovv1Sdog
         CsG42NVcdo8vDa8LvkP8AzBrVw7+GEuUmjh0Wl8nnRr7j2ylMwNjW5vyJeaz6K1+uD7l
         6FgFnmLm+RhNu4K9rjg7nkDnJsXfb/stDJHzlx2OLYJCreGJOzyPvhMMWsGLc3UQxhuF
         c7SA==
X-Gm-Message-State: AOAM533FzfL46ULoh5Dv6AsIb4BnzxSziSP7t0tmab6SdvOMqPPGeZNw
        oScHiB/k7Ft7WC5OHBx/7AQ=
X-Google-Smtp-Source: ABdhPJwNVDezSeXkAWbbOpO/dr4oppaQ3Mg9mGqIVUq1Kxd4oyLGdV2Rgqs6yxrO2GTtzBZkPvk3rA==
X-Received: by 2002:a05:6000:47:: with SMTP id k7mr14461682wrx.233.1591971609964;
        Fri, 12 Jun 2020 07:20:09 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r12sm10749410wrc.22.2020.06.12.07.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 07:20:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 30/38] dt-bindings: panel: Allow reg property for DSI panels
Date:   Fri, 12 Jun 2020 16:18:55 +0200
Message-Id: <20200612141903.2391044-31-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200612141903.2391044-1-thierry.reding@gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

For DSI panels the "reg" property is needed to represent the virtual
channel of the given panel.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index d6cca1479633..34fe3d42b829 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -267,6 +267,9 @@ properties:
         # Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
       - winstar,wf35ltiacd
 
+  reg:
+    description: virtual channel for DSI panels
+
   backlight: true
   enable-gpios: true
   port: true
-- 
2.24.1

