Return-Path: <SRS0=kXhk=5A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CDEC0044D
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 02:02:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 99AAD2051A
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 02:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jiH9bpyp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727544AbgCOCCf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 14 Mar 2020 22:02:35 -0400
Received: from mail-ed1-f52.google.com ([209.85.208.52]:34309 "EHLO
        mail-ed1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgCOCCf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 14 Mar 2020 22:02:35 -0400
Received: by mail-ed1-f52.google.com with SMTP id i24so13498074eds.1
        for <devicetree@vger.kernel.org>; Sat, 14 Mar 2020 19:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9oaTRbmXh8YDwKHKnzGVIS7f6wuqtnZ7xd23oLTEEto=;
        b=jiH9bpypMJvdPe8XlrGt2qIBH0ac9i0GdP9NUU8Dbj21jnOYrHb0bpgF+yR2ExaTYd
         NAzRvP5rwXw9qS1pTlpVkDL1uK1h23pv4kRIx7rjoVJlKJ4JGKbRFRzPcCVKSHyr0Exa
         QYfrr56GTgIxZP4PKS3KLmbx2h8wu8mhnBIfesQ90NCsMIdxbmKKElN3L5ZdH/gmbfBb
         +mKXbkpKXgh37oIgvXP29B9BlEW9ZNN3qEa89bFCLbLLvpJ23EET2a315DQkHekpY87W
         PJnlFxnqdeB7VyXFW1bKPwiALokrPnjTfWn9E+nLuatsB2E1UE6hGwgIdU1DjH+yWgJ5
         EaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=9oaTRbmXh8YDwKHKnzGVIS7f6wuqtnZ7xd23oLTEEto=;
        b=Tr0whdFUzuwwbbHfpm5Z0PyAsGuh/ZWWQXmrS50nGHsSmukClqOtnuYKa3emYFL+5/
         D0b93r/YJI07LAiJEoMGMLLLkicPLBRMmpUTlUFAluF1o7NEyRhiTyevlfNG7rkRdjrw
         o16n74q8eOY2T6f0rvAGcyxFtnEzAOxprG5LkdDrhMkeCicbAYJjGwoyt/WV6vHHGBze
         KMpkOexvqXOeAQcD1merM6gmU2vpzryR4R4Aba2e3PZ30nHH0gGZe6di/8n5/bmJ1R0q
         VT4NtVr0sETGdeN4TwRPxZnJUShYuHY+egKefyEsxBxh62CNaOVVivYc378hJSR+o9oo
         mjyQ==
X-Gm-Message-State: ANhLgQ0LzXSqsYfezkDURAGUkqQmMyzsKQHnfMFF3HgcuWxCoyBM/D3e
        S1+6PmH56qmZWgeuS1FrXQn0bBeZ
X-Google-Smtp-Source: ADFU+vvH1iIivBsmhWr5uHtWe7gtlRpbjBV0BUayRn5Pu0EOIMWSnmqA2h3aU7ENFknpE70YCgDJCQ==
X-Received: by 2002:a05:6512:10c4:: with SMTP id k4mr11585029lfg.98.1584199859650;
        Sat, 14 Mar 2020 08:30:59 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id n200sm15650418lfa.50.2020.03.14.08.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2020 08:30:59 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 3/3] dt-bindings: display: grammar fixes in panel/
Date:   Sat, 14 Mar 2020 16:30:47 +0100
Message-Id: <20200314153047.2486-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200314153047.2486-1-sam@ravnborg.org>
References: <20200314153047.2486-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Fix a few grammar/editorial issues spotted by Laurent Pinchart.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>
---
 .../bindings/display/panel/display-timings.yaml           | 8 ++++----
 .../devicetree/bindings/display/panel/panel-common.yaml   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/display-timings.yaml b/Documentation/devicetree/bindings/display/panel/display-timings.yaml
index c8c0c9cb0492..56903ded005e 100644
--- a/Documentation/devicetree/bindings/display/panel/display-timings.yaml
+++ b/Documentation/devicetree/bindings/display/panel/display-timings.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/panel/display-timings.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: display timing bindings
+title: display timings bindings
 
 maintainers:
   - Thierry Reding <thierry.reding@gmail.com>
@@ -14,7 +14,7 @@ maintainers:
 description: |
   A display panel may be able to handle several display timings,
   with different resolutions.
-  The display-timings node makes it possible to specify the timing
+  The display-timings node makes it possible to specify the timings
   and to specify the timing that is native for the display.
 
 properties:
@@ -25,8 +25,8 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: |
       The default display timing is the one specified as native-mode.
-      If no native-mode is specified then the first node is assumed the
-      native mode.
+      If no native-mode is specified then the first node is assumed
+      to be the native mode.
 
 patternProperties:
   "^timing":
diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
index ed051ba12084..dee4faffd204 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
@@ -63,9 +63,9 @@ properties:
 
   display-timings:
     description:
-      Some display panels supports several resolutions with different timing.
+      Some display panels supports several resolutions with different timings.
       The display-timings bindings supports specifying several timings and
-      optional specify which is the native mode.
+      optionally specify which is the native mode.
     allOf:
       - $ref: display-timings.yaml#
 
-- 
2.20.1

