Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554C1C2BA1A
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 261E520769
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DD1bKhJP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730176AbgDHTvq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:51:46 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45851 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbgDHTvq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:51:46 -0400
Received: by mail-lf1-f65.google.com with SMTP id f8so6075094lfe.12
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=724/lfLQXagg3iBwy3nhrx1mv6xJ9vurcClPnBGSmdI=;
        b=DD1bKhJPg0YJyuw3KDAjtl5+8V/mS7cpL6VRrInSPwb5kCQ8fYVOCylh671+i+GgrO
         aQ6IP9eVbZu/KFmbqWznIwLTxQz8j5OU9VUyys1AOgJ+sDm2dofFqFGyk9xucYwK/TMH
         21kYkSIBXYDxbV9VEJF4hnCaSLMXMXEKVP5+c2eKF9iLOw8eFqNOQ3cKJanTtKs35CTy
         muR5KYyVJ1N8CdvZoQWR1cZgxxzD/TDGPKjLgr4cGJfAyWFoXWqCzO//kiMgvKGgOnmp
         VM0dWiEvRghrv8h7WB0DpNeSCxLJqBS/XzntnVPDzdi54bR91aYScMe7sjcv5n2xHjyr
         R16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=724/lfLQXagg3iBwy3nhrx1mv6xJ9vurcClPnBGSmdI=;
        b=dpHmyo9uNatlcur076nsg0dMsLwKje07TfamOUbDuXWd5eW1brAibySIHMn0QgMsEJ
         fd6lLkwjV0ilw5actc7jCgLewYhMFFM4xNPh4qIcwJBQf0NbzVHhKLzP4BcjDbi8pg+h
         efxsR1A7o1IvF8M9leouRu68Y6okZ1Bxbl02YZLAQb3Ni0zDqUtDMI2TyFR/duVDGkP3
         liyvG0quLyAhMvcQMuUKLB0ZoCKDJp8QTzh0R26enE6Fut4hk4SNuugdtO4BN5ifE07s
         2plMWDpmg0LkuT3sgOuQZKvf6hereIhwtRUvf8pQqC1WfHCQi1g7y1aRA2Dzo429+vm9
         lC4Q==
X-Gm-Message-State: AGi0Puby7qQecAAezRYiYpmoeq9H99XP98UCf1ou2WE3LJLV5U+ndBjD
        USOMt/1/akc5DO2wiZ38nro=
X-Google-Smtp-Source: APiQypKyZ+P2VTnHN61mAiyG/8Kk7/dsCVnRJle8luKRqOOJ0Det3YcWnuGUAQcR129tK+Bst+f/Bg==
X-Received: by 2002:ac2:5192:: with SMTP id u18mr5501184lfi.114.1586375503698;
        Wed, 08 Apr 2020 12:51:43 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:51:42 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 03/36] dt-bindings: display: add te-gpios to panel-common
Date:   Wed,  8 Apr 2020 21:50:36 +0200
Message-Id: <20200408195109.32692-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Several bindings specifies a "te-gpios" for tearing effect signal.
Add this to panel-common so we have a shared definition.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../devicetree/bindings/display/panel/panel-common.yaml    | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
index dd97907a7450..17b8367f12dd 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
@@ -124,6 +124,13 @@ properties:
       while active. Active high reset signals can be supported by inverting the
       GPIO specifier polarity flag.
 
+  te-gpios:
+    maxItems: 1
+    description:
+      GPIO spec for the tearing effect synchronization signal.
+      The tearing effect signal is active high. Active low signals can be
+      supported by inverting the GPIO specifier polarity flag.
+
   # Power
   power-supply:
     description:
-- 
2.20.1

