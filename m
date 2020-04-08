Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F033C2BA1B
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 41C2820769
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzzcPZNk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730260AbgDHTwK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:52:10 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:33023 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729564AbgDHTwK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:52:10 -0400
Received: by mail-lj1-f182.google.com with SMTP id q22so5253575ljg.0
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VLNfyRlmaYQ3/Tah2cpzN27telonR8g89G9XuIdJiRY=;
        b=lzzcPZNk3D+gr/CuCxW+wG0s2eiBtcOwaQ+4kVNKOjv0ELjFALUSyfhD6PMy82Is6W
         rfi0xNy6EBM6iiEwzcuMSyPtq25HJZrUGKE1dM5IaT7lgnO92QrVQrP/QveCFdPDQoB7
         fiNdNwH+Ut2D6kPE6+EgGEnNd3SIyqEO2XocbnaHXOyjHkFRbbRjasw4y/i9drd/aZSv
         o9Q7avZnj+YocaKUVMmIDhcKZOU88P9WtXCdyi9EplgE0PdAtMCYxcWEdD2TNNzBL8TD
         dpU1JaHDKISHIKJtTyKFuT2cRcbs3qVu5sSiW8wbsugOAL846McmY+wnFHjssBf0AM46
         u4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=VLNfyRlmaYQ3/Tah2cpzN27telonR8g89G9XuIdJiRY=;
        b=jrDavwXNeQYCgKbi+aolIUsNytxRixs/OtylraPRev8SO4tuvNrnbxS6Q8Uiq397TV
         rDqVwllSu7PEFvYyGOgV5DHFfHI60HkzGsJWOC4zdsWB33oq1486X0DaeLux0Mfn6Xcw
         rfm3I5tTlm3aEZp3V8l7Jbax9sTeg9thE5mrd86cDm1MgkVUFg0zpj9Asv2llm/M/VM8
         9oUYrOQbwokX4as9O1ECRBBxGZAO2TpsnH5W0CohJai8iclnwWa9pywKGLVuC+tIEsLh
         Pvc/50JUfJdz0hz/7VFJu7SxghgySPYnnKHqW3YnXS06DcF7Oh5EVZkJ0Uy5Qa3bfZWk
         e/PA==
X-Gm-Message-State: AGi0PuZTSVwR8mRqyvyl9ZFnDE76SfBvpPG4PMhoGiQ2lKsmgFGtit1i
        jyeJAZB43Jz7S1QDqqWyYSA=
X-Google-Smtp-Source: APiQypJyrRv0aS4Yh2ooLaXwJplXtwi5QzSmKmOw4hVeMqh0eP+Sek81CoQP0pujKQ7qi07udXd0ag==
X-Received: by 2002:a05:651c:c7:: with SMTP id 7mr5972954ljr.124.1586375528305;
        Wed, 08 Apr 2020 12:52:08 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:52:07 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Marek Belisko <marek@goldelico.com>
Subject: [PATCH v2 25/36] dt-bindings: display: convert startek,startek-kd050c to DT Schema
Date:   Wed,  8 Apr 2020 21:50:58 +0200
Message-Id: <20200408195109.32692-26-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Marek Belisko <marek@goldelico.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/startek,startek-kd050c.txt  |  4 ---
 .../display/panel/startek,startek-kd050c.yaml | 33 +++++++++++++++++++
 2 files changed, 33 insertions(+), 4 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.txt b/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.txt
deleted file mode 100644
index 70cd8d18d841..000000000000
--- a/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.txt
+++ /dev/null
@@ -1,4 +0,0 @@
-Startek Electronic Technology Co. KD050C 5.0" WVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "startek,startek-kd050c"
diff --git a/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.yaml b/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.yaml
new file mode 100644
index 000000000000..fd668640afd1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/startek,startek-kd050c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Startek Electronic Technology Co. KD050C 5.0" WVGA TFT LCD panel
+
+maintainers:
+  - Nikita Kiryanov <nikita@compulab.co.il>
+
+allOf:
+  - $ref: panel-dpi.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: startek,startek-kd050c
+      - {} # panel-dpi, but not listed here to avoid false select
+
+  backlight: true
+  enable-gpios: true
+  height-mm: true
+  label: true
+  panel-timing: true
+  port: true
+  power-supply: true
+  reset-gpios: true
+  width-mm: true
+
+additionalProperties: false
+
+...
-- 
2.20.1

