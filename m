Return-Path: <SRS0=scSd=ZS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8B8C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 11:22:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A6DB220748
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 Nov 2019 11:22:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="soPDOoMq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbfKZLWo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 Nov 2019 06:22:44 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52763 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727218AbfKZLWn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 Nov 2019 06:22:43 -0500
Received: by mail-wm1-f68.google.com with SMTP id l1so2786698wme.2
        for <devicetree@vger.kernel.org>; Tue, 26 Nov 2019 03:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oKGzby8P8zqSIN7PWp3MhkkCn5+ssHtpMy31CDyRRnM=;
        b=soPDOoMqrrNqbH7MyNVNlH5kSjHiZNWIoDFyGbh2IDQ0kkb3XVHj2Gl783W2KQ6pM1
         +EYP6ImYgpPJn0I/Q2NuxbXhPqg8vHoInqT88vIwBrACURx8ezBp1hZOAY7pu/MbFMPb
         CExoj5OuqVrSFHxBZKjIlzhN44MjlW//Sh+Vdy7jFpD9QNZ559Edde1ySvm4q1aCZsFw
         9zUjes7IGt6sKsbrOHTZ0HvMDNdL32or5WLgmctWB8fYLyFxJ6nzj6pVmYX/HkDm0hOK
         t8p112Dm6vInLhvOHqOTdYRYw4N1st9X3HNmShLkIthGYEc3Yp2ntJo5ZMdo5/Un8FcQ
         qfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oKGzby8P8zqSIN7PWp3MhkkCn5+ssHtpMy31CDyRRnM=;
        b=lqo6SpS6XfRCEDE8QR4K0DmJ7AekJnKamo22ithuZDeInoSXeDOLoS9Kx1F7Bi9IlT
         e6cXZucVbhi7yILHPd46hucjvrRUw0mhuQyKq1IdM3gUxkIUV4fjUR8320W6PrVJqCyi
         eqMWma2Pq/kDiC/Ix5gJtQ3gFpht46O3Zbefq/xFYDABOdtP39jg60WjQs1zrIiLdUPp
         kq8PUX72PocXGKRGomUWlGcyJVOD43bonfMKZX34xi++Hc3giAPpdiV1D/Ayvm7dN1W5
         Rx5QMJIPRqB4cvXSYQMcUCWmomA922CaQOie7DsneIV6I5CNWWhzuh/434U3XDOiE0Wq
         ot8g==
X-Gm-Message-State: APjAAAWeQcEECK/ZGMpUif6MTL4Sb6Npb1qHGyEDZaNQlJC90xfhisDI
        QcSGs3wPlLrjBG6Y3yiTTY+QdVFIKIc=
X-Google-Smtp-Source: APXvYqyNeJ7HOIOPvphZa5VxQ4vjsn71PNUZAPjH6hlZf8qtdLpqY20RV4ar4ZbIbtZV0fguM5jrcw==
X-Received: by 2002:a1c:1b85:: with SMTP id b127mr3591449wmb.108.1574767361432;
        Tue, 26 Nov 2019 03:22:41 -0800 (PST)
Received: from localhost ([37.238.189.12])
        by smtp.gmail.com with ESMTPSA id f1sm13746609wru.6.2019.11.26.03.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 03:22:40 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 1/2] dt-bindings: Add vendor prefix for Videostrong
Date:   Tue, 26 Nov 2019 14:22:34 +0300
Message-Id: <20191126112235.11390-2-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191126112235.11390-1-mohammad.rasim96@gmail.com>
References: <20191126112235.11390-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Videostrong Technology Co., Ltd., A manufacturer of Android Players & STB
(Android with DVB Hybrid box & DVB-T2/S2/C/ISDB-T/DTMB-TH/ATSC )as well as
HD media players.

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 05b3904a995b..a7e5b4bf8c4b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1008,6 +1008,8 @@ patternProperties:
     description: Variscite Ltd.
   "^via,.*":
     description: VIA Technologies, Inc.
+  "^videostrong,.*":
+    description: Videostrong Technology Co., Ltd.
   "^virtio,.*":
     description: Virtual I/O Device Specification, developed by the OASIS consortium
   "^vishay,.*":
-- 
2.24.0

