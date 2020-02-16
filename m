Return-Path: <SRS0=AK1n=4E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0C5C7619C
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Feb 2020 18:15:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B6CE924676
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Feb 2020 18:15:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JE//nzDh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgBPSPl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 16 Feb 2020 13:15:41 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37501 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgBPSPl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 16 Feb 2020 13:15:41 -0500
Received: by mail-lf1-f67.google.com with SMTP id b15so10214045lfc.4
        for <devicetree@vger.kernel.org>; Sun, 16 Feb 2020 10:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VOa5BvEVC53gAxDGC2Az8GeC+PWsDupUY7BePlsJCzY=;
        b=JE//nzDhbJRZDEWoj65+j0fBdf4afIh+REZdLrUatpuJfHyk5SFggtpQokzTex9HOC
         8N7AxOWr/+9oyWpTqYL5/QleNcV/2C1w5t7Tioj4D+Ntp35Yi9qe586UaPUX5m0ho+s7
         htAGtgZEOOmQ12YhqIkDD/OVQQARgAs/hCYi+z9TNPynfyEyXoAc1Sjaq9z/JWBNuuLc
         X9L7EV3dnTs3+SrWrMLFdas2ZHz0YT34qGktjk5/oBhNB5fk1DMfrgwuDYT7/xnF6KHt
         N8hSLXpcolzW8FVsD+dK2eulCXkpu2NMEoibKnqgOmQQwrIa6dk8hHpMGZx3XAe6hW0D
         4lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=VOa5BvEVC53gAxDGC2Az8GeC+PWsDupUY7BePlsJCzY=;
        b=BiEUi1Ws1InFdm+H77VBB5EY6DsT8B6q29BuezDaUAKQXyoiRUwWWIHCbyRW9IG7L4
         Ry/pfMIsDItTDWcE1H4ezD+PITEH3KP+9GgtCCH9JeWVf/0tPbosPiu5VBRZ8Ds0suqT
         kbhCCxYklUrPXjDCwMHd9qUQESh25itfWJv2gMvYOWejVE/yVJz5NuMj5a5RWoLcnFUJ
         RVbOZKNRQn319fGqFxut343LMyzVqJKcGsHeV5BCitO6EUMRLb/iBXRUca82lwTo44Ly
         aIGAgeXdU5wSq6+xTkP90d2h8Ah0wP6GW43kWMC0q4BYMJVjiNEtqrT7oDpMFSOOR6NI
         b28A==
X-Gm-Message-State: APjAAAViZp+HgMLc6iDIYDrLelvh+UNnRK7Yb0aPL/s2ZRR+FXbW2lY8
        jeLJooY0XMBSe5wuoH2xwQk=
X-Google-Smtp-Source: APXvYqxFx+f4n79IKFN5yY6IXfp11xLEIaNyV8NpiBY8wsoxTO2N5b6whFvxeE3ZgsfI+YSfF9wIbA==
X-Received: by 2002:a19:7015:: with SMTP id h21mr6051881lfc.68.1581876938935;
        Sun, 16 Feb 2020 10:15:38 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id u15sm6157431lfl.87.2020.02.16.10.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2020 10:15:38 -0800 (PST)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 4/5] dt-bindings: display: add data-mapping to panel-dpi
Date:   Sun, 16 Feb 2020 19:15:12 +0100
Message-Id: <20200216181513.28109-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200216181513.28109-1-sam@ravnborg.org>
References: <20200216181513.28109-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add data-mapping property that can be used to specify
the media format used for the connection betwwen the
display controller (connector) and the panel.
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 .../devicetree/bindings/display/panel/panel-dpi.yaml | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
index 40079fc24a63..6a03d2449701 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
@@ -21,6 +21,16 @@ properties:
       - {}
       - const: panel-dpi
 
+  data-mapping:
+    enum:
+      - rgb24
+      - rgb565
+      - bgr666
+      - lvds666
+    description: |
+      Describes the media format, how the display panel is connected
+      to the display interface.
+
   backlight: true
   enable-gpios: true
   height-mm: true
@@ -43,7 +53,7 @@ examples:
         compatible = "osddisplays,osd057T0559-34ts", "panel-dpi";
         label = "osddisplay";
         power-supply = <&vcc_supply>;
-
+        data-mapping = "lvds666";
         backlight = <&backlight>;
 
         port {
-- 
2.20.1

