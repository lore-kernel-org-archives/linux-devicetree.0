Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5449C2BA2B
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E8EA2078E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJrnqBT9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730216AbgDHTwA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:52:00 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43825 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730184AbgDHTv7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:51:59 -0400
Received: by mail-lf1-f65.google.com with SMTP id k28so6091412lfe.10
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=79d8ydBEeVchzXXOzRIawXTAySSjx90jaugBrSZsHQA=;
        b=bJrnqBT9cd9ybEv/ObtZp0zMaDd4qGK6riRu2c5RkkFvE1hIeZdFgxFt3VnPRKytqq
         Hu/QOwH5M2GFx9b+4Kgr11iv2EMCl+THZ4SE73K7YrK5c8y2Q4/4KiM0uKAg960mKBDE
         4ZnVphSaUz5dNynfpZgPy7AX54RJ0EJTvx54Qbp8R1ZrqrTN/yBfWlVNhFi8ztTOx25u
         CeMKyKYyGyBlZgZ7ZHqzfF30Hw4Lfr/cUyvKmPIVVj4g2txYD2av5w/1loBfJtwcbrbN
         FpqgD1bpvU7lasHgbpc/9Tzi35tRBuhIbb4+oh3/2EIXItMJD5rYFiNZu1lPgm8MJlZi
         fYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=79d8ydBEeVchzXXOzRIawXTAySSjx90jaugBrSZsHQA=;
        b=NnqoE/nEq1umKdpBkVX93wQYDiOdWNzUcqI6urw7U5BYRSdQ6Zr4X0bQcxQcA4I4fh
         q2rkd6QqY46+ikzI/W22J10Cqh+RPfZwadW5NPdULIhmZN5OTHrOOoIIVHUZ51Bu2iAV
         slTcApBc7O55T3/atj4VaUGFV5//8/Yw9FjGMHdqt33zftzUy01SpBSvoOkTl1PielpL
         +AIoCsqPwWxZN1toC3r/Rr3brtvBzmcjUuqHjT5tES95dS8xVuWRFwDAPYGO6sM9dq9K
         zv3fkqJCPMA93G1tv3VXX6UDK+4J0p7swkWB7fxwCSKWEzwvTMfz/2+ozaNUTb4dTCG2
         1MgA==
X-Gm-Message-State: AGi0PuZzfdUbh4IM2AQEGxJqeOVSHkOQpAy6XyQkxx2tDtfVgxw92RBZ
        oFf0GoJvtWJeWF9nAZSLcUs=
X-Google-Smtp-Source: APiQypI93VEntAsC4tx0iRCQh3Hx52ByIPE/1htlLC1d+Sux+/LLEHizMFmf+jMbfcUIlQQJpr+jaw==
X-Received: by 2002:ac2:5559:: with SMTP id l25mr5563589lfk.55.1586375517195;
        Wed, 08 Apr 2020 12:51:57 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:51:56 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Brian Masney <masneyb@onstation.org>,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v2 15/36] dt-bindings: display: convert simple lg panels to DT Schema
Date:   Wed,  8 Apr 2020 21:50:48 +0200
Message-Id: <20200408195109.32692-16-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the lg panels that matches the panel-simple binding to
panel-simple.yaml

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Brian Masney <masneyb@onstation.org>
Cc: Brian Masney <masneyb@onstation.org>
Cc: Alexandre Courbot <acourbot@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../devicetree/bindings/display/panel/lg,acx467akm-7.txt   | 7 -------
 .../devicetree/bindings/display/panel/lg,ld070wx3-sl01.txt | 7 -------
 .../devicetree/bindings/display/panel/lg,lh500wx1-sd03.txt | 7 -------
 .../devicetree/bindings/display/panel/panel-simple.yaml    | 6 ++++++
 4 files changed, 6 insertions(+), 21 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,acx467akm-7.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.txt
 delete mode 100644 Documentation/devicetree/bindings/display/panel/lg,lh500wx1-sd03.txt

diff --git a/Documentation/devicetree/bindings/display/panel/lg,acx467akm-7.txt b/Documentation/devicetree/bindings/display/panel/lg,acx467akm-7.txt
deleted file mode 100644
index fc1e1b325e49..000000000000
--- a/Documentation/devicetree/bindings/display/panel/lg,acx467akm-7.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-LG ACX467AKM-7 4.95" 1080×1920 LCD Panel
-
-Required properties:
-- compatible: must be "lg,acx467akm-7"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.txt b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.txt
deleted file mode 100644
index 5e649cb9aa1a..000000000000
--- a/Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-LG Corporation 7" WXGA TFT LCD panel
-
-Required properties:
-- compatible: should be "lg,ld070wx3-sl01"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/lg,lh500wx1-sd03.txt b/Documentation/devicetree/bindings/display/panel/lg,lh500wx1-sd03.txt
deleted file mode 100644
index a04fd2b2e73d..000000000000
--- a/Documentation/devicetree/bindings/display/panel/lg,lh500wx1-sd03.txt
+++ /dev/null
@@ -1,7 +0,0 @@
-LG Corporation 5" HD TFT LCD panel
-
-Required properties:
-- compatible: should be "lg,lh500wx1-sd03"
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 328df95cbe88..e4f8133f48bb 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -155,8 +155,14 @@ properties:
       - kyo,tcg121xglp
         # LeMaker BL035-RGB-002 3.5" QVGA TFT LCD panel
       - lemaker,bl035-rgb-002
+        # LG ACX467AKM-7 4.95" 1080×1920 LCD Panel
+      - lg,acx467akm-7
         # LG 7" (800x480 pixels) TFT LCD panel
       - lg,lb070wv8
+        # LG Corporation 7" WXGA TFT LCD panel
+      - lg,ld070wx3-sl01
+        # LG Corporation 5" HD TFT LCD panel
+      - lg,lh500wx1-sd03
         # LG LP079QX1-SP0V 7.9" (1536x2048 pixels) TFT LCD panel
       - lg,lp079qx1-sp0v
         # LG 9.7" (2048x1536 pixels) TFT LCD panel
-- 
2.20.1

