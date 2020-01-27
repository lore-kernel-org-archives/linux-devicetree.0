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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8FCC33CB7
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 14:07:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E82122071E
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 14:07:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwhr13/H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgA0OHh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 09:07:37 -0500
Received: from mail-pj1-f53.google.com ([209.85.216.53]:39604 "EHLO
        mail-pj1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgA0OHh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 09:07:37 -0500
Received: by mail-pj1-f53.google.com with SMTP id e9so247145pjr.4
        for <devicetree@vger.kernel.org>; Mon, 27 Jan 2020 06:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0GNKW4dAwC2IPC8DrYUW50WkaWvnguz2WhfJNZ54dek=;
        b=rwhr13/HrBEf9QNvCTpsZTGUEvrogC0nV4FkwsdlXPtdykUvBfZeU/7Z+Zjf5A/k1x
         vXrOocthoKZrdQaVO9zcsMwtnesNllpddSrLBnxB+ga1sFr2O1TMn+LhNuTosAxVgiv2
         20EmndfmZ3wF+weTulUTurBQgD6BRAxAPYWaZwich0nYbqn++i30saeQ8o7s4a8nn3KK
         StTgtK2C+cEYxbaSTz1CSR6hQmvIx0FMrpGuyB0of0WhiKxyrdBTFek8Bl9xPEVNWJFm
         8OlpyyKhpLslGqG0mWgQEM8wh/wgtqUJax+o3zZRUZuRYq2vB6mpvcSpntbfL7GxJRO2
         y2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0GNKW4dAwC2IPC8DrYUW50WkaWvnguz2WhfJNZ54dek=;
        b=D4TcX1CGwszfGuU0saSKijDClK3mcJofjNeHjND66HnXz/sQXhs3DwYq1uXDM7Es4q
         ZyydyCM60Yu9IQqTmI190aov094uiRbez5BHKVdWoFWyK+DvGAmwUFGq4NWUy3OYl3ej
         wmB+WzPr+iIJEGdTP9bOr9JNYpQTStjBNLbznBWJtXMrlj7DGoHytT648Mm5PI7MqlPB
         pkNdZNagtWl+XUIrNFDVCHNY0Faqhj+CouOimKlg+1Qa2zvC4lDCIIm+/dEh0PHCfOxB
         C+yxTzV3R8skmewIO5ukjgYb3IqVaqoT3/rHII9oD7ZlalQtwEQgphz2a1SjEu6fZjJL
         9uMw==
X-Gm-Message-State: APjAAAWoKrlgqdGoblYUOl4HpTVStW3S3f8Nx3n1TphsFZKmpeOPFQiJ
        IeZc0/cNSC9S40aRqKvixu8=
X-Google-Smtp-Source: APXvYqzBRYAxDsGrgyOKBpShwFV/wANY+piTn7TwHNOttnXNFt9T76smOWQZxc4dJe0zlfwMm/nYfw==
X-Received: by 2002:a17:902:265:: with SMTP id 92mr16479330plc.188.1580134056768;
        Mon, 27 Jan 2020 06:07:36 -0800 (PST)
Received: from localhost.localdomain ([2405:201:d809:ffa6:583:2633:933c:f34d])
        by smtp.gmail.com with ESMTPSA id l2sm16016167pjt.31.2020.01.27.06.07.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 27 Jan 2020 06:07:36 -0800 (PST)
From:   Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To:     noralf@tronnes.org, Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: add vendor prefix for OzzMaker and Waveshare Electronics
Date:   Mon, 27 Jan 2020 19:37:05 +0530
Message-Id: <aa8799c4164b54fa5c4ca55e48966d7b61352c2c.1580133212.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1580133211.git.kamlesh.gurudasani@gmail.com>
References: <cover.1580133211.git.kamlesh.gurudasani@gmail.com>
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

