Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF92C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 14:25:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F30CC20716
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 14:25:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0pDaIKU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgA0OZn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 09:25:43 -0500
Received: from mail-pj1-f49.google.com ([209.85.216.49]:35164 "EHLO
        mail-pj1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgA0OZn (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 09:25:43 -0500
Received: by mail-pj1-f49.google.com with SMTP id q39so3186154pjc.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jan 2020 06:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0GNKW4dAwC2IPC8DrYUW50WkaWvnguz2WhfJNZ54dek=;
        b=H0pDaIKUY3LIPy4nvspAzrrnoJE0u0o82gQlr2lz8J1fSbwCMtb84vUC9YWHnD2qyH
         P14GY7v2yR/1aDRmaTO1SH0EgQ9eQ6oDFf5RJ2E6vKH0WLBVRKOKXOzM9o6svE7+0wre
         CAHrYzzXtQEBpgQoLjRYVxAOlMJ3JTX2juz9mkBb6uwaMDHOZj/jLeAr+5vC8bNAjTlm
         2JCGxOWJ+xidKTzHPi+fzi1iCOrIpc/cFqKgweeTRK58z3paoMDVvBYRN5W5C4L9Oaun
         LAtOBADISYYG/WDne+srhxcusfupoYrSGvZ0diZ0bqMMfOlSvBHXOwwri61DNJ7SXxcw
         +qAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0GNKW4dAwC2IPC8DrYUW50WkaWvnguz2WhfJNZ54dek=;
        b=CqNm+CdNeFb3Y/zogsgNkaG0di4fbPu9GBmrAFX0XV5fmhz4KJqN/gi6hA2mXSSnIu
         7eB18m8+Z0XGVSXT/RRwSMeSEpporlZ7TUPvE5GguJcBHaKysXCVavTnChiwj5ljGFAv
         hufasqAOv7PooqWtvf/QYuf3kJq3//er7VRTfjs+YsdF1ReL387jnw4UTXyer0rFtdpK
         l4criO5S+Dz5MgZisvlXn2d5TIXPdbp696JtcVLt0BAAuw0GjBF7+SEI4MFcsUHljVHw
         VKnjqEyB6tPz7KEAu5FnLIivNoWSVBAHKs1pcoyqskRMUkcvah9yUHOzpqx6J5tIh0HF
         vFsQ==
X-Gm-Message-State: APjAAAWbCvWdMVVnkcxQFCCX1VXIdg4f5Qy2bsIJoe3oZEzl1X1c1wHR
        u0a+c2wDS/s6PmJGRO5/9yc=
X-Google-Smtp-Source: APXvYqz0Q5j3nM/3shrUkC76OHHxyHL8sPHjxQLfQxghJE26Ql4TSTpUVw0xQoFLL54nRDhxPIHr2Q==
X-Received: by 2002:a17:902:7484:: with SMTP id h4mr17320821pll.206.1580135142694;
        Mon, 27 Jan 2020 06:25:42 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:583:2633:933c:f34d])
        by smtp.gmail.com with ESMTPSA id k12sm15811506pgm.65.2020.01.27.06.25.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 27 Jan 2020 06:25:42 -0800 (PST)
From:   Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To:     noralf@tronnes.org, Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: [PATCH v4 1/3] dt-bindings: add vendor prefix for OzzMaker and Waveshare Electronics
Date:   Mon, 27 Jan 2020 19:55:33 +0530
Message-Id: <aa8799c4164b54fa5c4ca55e48966d7b61352c2c.1580134320.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1580134320.git.kamlesh.gurudasani@gmail.com>
References: <cover.1580134320.git.kamlesh.gurudasani@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add vendor prefix for OzzMaker [1] and Waveshare Electronics [2]
Both are display manufacturers

[1] https://ozzmaker.com/about/
[2] https://www.waveshare.com/contact_us

Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ac4804d..dfb926d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -721,6 +721,8 @@ patternProperties:
     description: OmniVision Technologies
   "^oxsemi,.*":
     description: Oxford Semiconductor, Ltd.
+  "^ozzmaker,.*":
+    description: OzzMaker
   "^panasonic,.*":
     description: Panasonic Corporation
   "^parade,.*":
@@ -1038,6 +1040,8 @@ patternProperties:
     description: Vision Optical Technology Co., Ltd.
   "^vxt,.*":
     description: VXT Ltd
+  "^waveshare,.*":
+    description: Waveshare Electronics
   "^wd,.*":
     description: Western Digital Corp.
   "^wetek,.*":
-- 
2.7.4

