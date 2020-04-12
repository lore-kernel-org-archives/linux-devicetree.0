Return-Path: <SRS0=a8L4=54=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DF5C2BA2B
	for <linux-devicetree@archiver.kernel.org>; Sun, 12 Apr 2020 13:21:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E41720709
	for <linux-devicetree@archiver.kernel.org>; Sun, 12 Apr 2020 13:21:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6OTx9B8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgDLNVu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 12 Apr 2020 09:21:50 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38660 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbgDLNVu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 12 Apr 2020 09:21:50 -0400
Received: by mail-lj1-f195.google.com with SMTP id v16so6305769ljg.5
        for <devicetree@vger.kernel.org>; Sun, 12 Apr 2020 06:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CCfFjrfv4+Ar3EwCkCD8HCK0f6hsu+EXSm+czE6taUw=;
        b=f6OTx9B8k+HT3i+ADgQ2rpwq5bFL9vzShwvpvXkXGSHFSEfL5mEHb5hiGJ6n6pDMRJ
         wLE3RCDcrqGhQRnMCJZ/XrSLNjN35VZzWpocZppMNxf9VKWrXXGIe2Y2C2p2NAF90lvo
         JzPP+33YuUzYsQ3KSmcC75ttQMVf9VI8gF8+JyEkFuagEM2bio9K5izlh7BbiPfrAlOc
         oW3GY21ntO/yq6Pi5jsKte5n+gM0o5gB7HZOje60k7ib5OD3Dh3p14AmON2AQE7pdCLr
         jvfKMHIvLUXjPsXZ6besg0xB36BkFiySOy0cSS1zveahlW4zVZEq6ZuH9LM2gAPNfjop
         T/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=CCfFjrfv4+Ar3EwCkCD8HCK0f6hsu+EXSm+czE6taUw=;
        b=KLHk9j++ZCWkTiy4fYb4IAj51ejmcR3kUnY8Tws0mWXZ1jqSDLrJJFwbSlL0qPQJcy
         kq6pHOEfxPx2JcEEfP7Et1gJpIjafkzfe7jYiGBFbCZW56+/j65uZivS1HuRUK3iAPta
         SjCmdzYyQBWsuF0qBNruO87yEe7TCVSk3d1Db4QFkeCcFeTotO4uUiPkL+Ztfi3y+nTt
         gCo2Gnt2g5yloh6u3ISrpXlTGywvqYFxlVnzIz2se7MA7fI0VAhBBNWDod/iSUfMwSFI
         2Wlj6lJTuWP4XMjzzA1ffWonjEgfeEzAG5PpKm30yqTzzPcvJcU8ka2CvxltJXYb4A1R
         kU5g==
X-Gm-Message-State: AGi0PuZBVIY/+Hrmq2UfUcfL7u6DScs7OU+V8+Tc96IAdf+1sS/rmNyY
        Pf+2tXxny87HvJthoDUbtAM=
X-Google-Smtp-Source: APiQypJIE14WO7g2+GNChhp2sUQDAyxwxhxYTCsdSgq2BtVGozEmwOsm1ek/iTHfmS0IO5lO4mZRcw==
X-Received: by 2002:a2e:b5d1:: with SMTP id g17mr7795429ljn.139.1586697707893;
        Sun, 12 Apr 2020 06:21:47 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id y29sm5330801ljd.26.2020.04.12.06.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2020 06:21:47 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 1/1] dt-bindings: display: allow port and ports in panel-lvds
Date:   Sun, 12 Apr 2020 15:21:39 +0200
Message-Id: <20200412132139.11418-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200412132139.11418-1-sam@ravnborg.org>
References: <20200412132139.11418-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Both port and ports names may be used in a panel-lvds binding
  port - for a single port
  ports - if there is more than one port in sub-nodes

Fixes the following warning:
advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property

advantech,idk-2121wr.yaml needs several ports, so uses a ports node.

v2:
  - Use oneOf - makes the logic more obvious (Rob)
  - Added Fixes tag
  - Added port: true, ports:true

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh@kernel.org>
Fixes: 8efef33eff50 ("dt-bindings: display: Add idk-2121wr binding")
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org
---
 .../devicetree/bindings/display/panel/lvds.yaml        | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
index d0083301acbe..a5587c4f5ad0 100644
--- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
@@ -96,12 +96,20 @@ properties:
       If set, reverse the bit order described in the data mappings below on all
       data lanes, transmitting bits for slots 6 to 0 instead of 0 to 6.
 
+  port: true
+  ports: true
+
 required:
   - compatible
   - data-mapping
   - width-mm
   - height-mm
   - panel-timing
-  - port
+
+oneOf:
+  - required:
+    - port
+  - required:
+    - ports
 
 ...
-- 
2.20.1

