Return-Path: <SRS0=KrzM=AP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74F0C433DF
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 10:28:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 874D420870
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 10:28:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbV/lzm9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgGDK2S (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jul 2020 06:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgGDK2R (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jul 2020 06:28:17 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F37C061794
        for <devicetree@vger.kernel.org>; Sat,  4 Jul 2020 03:28:17 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id s9so39727784ljm.11
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2020 03:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dH3Z+kl6o2dfyL4qa34soh2RFGX0Yk+95gG53PZ+Qhc=;
        b=LbV/lzm9Up0Af/PHNmdJb1SKGNfb9UGu3e2qs9Di60vbsRUnOy0HPKp8LZ6Vjrkacd
         XMyEwV7tyMOozy4z2EaLghCwhIPGmciDcyI/OlC++BSPJhciHz1R6dez8cxfpKE/d122
         DMSWCBt7+epuwby5iA9Ur8WUK77oGH7zJCoQHWFHsmgQKsD+UzgTxjkM84GYgDCMyjlS
         72bBw4uipL+K68cA3zem3Y4gFq1YD2VH6h/R86tu3ogDpxT3h8igJdA/JXOAKRWEj+5g
         qDxvmca3pDcCCDAFCX9MBxJg0j7U9upwLiI/+xH+rVrCTabKv40FSk5oPkOUaGQD6pI6
         bdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=dH3Z+kl6o2dfyL4qa34soh2RFGX0Yk+95gG53PZ+Qhc=;
        b=AeJSOzVoEMjJDxihHiTJrlSiFdt/dIg+OY1Tu1spPKSrrnsTfB211rk79kjn7MFq8E
         f6ZFHGUjhpdoCAGGnxOysP5wnhWBfEWlnJ2aiRC9uUc3tv7qiklUwckxaTvSVzXmiGf8
         jRirTlEd8bWbxyZcb0fEyYYCKIOPNo+bsFXd38+VxYKHboDCqB7+F2+mnijEFCIiQfko
         yyObHVkSNOIk4P3uzf5qdx40GeCbw6D/2QpauKc15IlJtb4SLW+1GEMOOxywpAd3JjA+
         PVdf1O4B2CV19xMLeTPPyqq+L2qreuPh6y8D93vl055HRrBdQMq9lQk6S8lxKL7mhx/z
         czDA==
X-Gm-Message-State: AOAM531+lgRHXKNkPkOgV327o0Offl7nwRqBkHcbAkpfkmBwtsPM+qb3
        O6BrlQmXu9OBL9QiCiEY6pU=
X-Google-Smtp-Source: ABdhPJzI3dJJQeiYqiDo0ihYX8hL5jZulRnJVw1oAb0UE5nqMPJFhton/eIHFX/lTwvHSYpTjKI5qA==
X-Received: by 2002:a2e:4812:: with SMTP id v18mr22742267lja.353.1593858495778;
        Sat, 04 Jul 2020 03:28:15 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
        by smtp.gmail.com with ESMTPSA id z23sm5366913ljz.3.2020.07.04.03.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2020 03:28:15 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Chris Zhong <zyw@rock-chips.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v3 1/3] dt-bindings: display: convert innolux,p079zca to DT Schema
Date:   Sat,  4 Jul 2020 12:28:04 +0200
Message-Id: <20200704102806.735713-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704102806.735713-1-sam@ravnborg.org>
References: <20200704102806.735713-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

As the binding matches panel-simple-dsi, added the compatible to the
panel-simple-dsi list.
With this change enable-gpios is now optional.

v2:
  - It is a DSI panel, add it to panel-simple-dsi (Rob)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Chris Zhong <zyw@rock-chips.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/innolux,p079zca.txt         | 22 -------------------
 .../display/panel/panel-simple-dsi.yaml       |  2 ++
 2 files changed, 2 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt

diff --git a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt b/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
deleted file mode 100644
index 3ab8c7412cf6..000000000000
--- a/Documentation/devicetree/bindings/display/panel/innolux,p079zca.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Innolux P079ZCA 7.85" 768x1024 TFT LCD panel
-
-Required properties:
-- compatible: should be "innolux,p079zca"
-- reg: DSI virtual channel of the peripheral
-- power-supply: phandle of the regulator that provides the supply voltage
-- enable-gpios: panel enable gpio
-
-Optional properties:
-- backlight: phandle of the backlight device attached to the panel
-
-Example:
-
-	&mipi_dsi {
-		panel@0 {
-			compatible = "innolux,p079zca";
-			reg = <0>;
-			power-supply = <...>;
-			backlight = <&backlight>;
-			enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 16778ce782fc..c0dd9fa29f1d 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -33,6 +33,8 @@ properties:
       - auo,b080uan01
         # Boe Corporation 8.0" WUXGA TFT LCD panel
       - boe,tv080wum-nl0
+        # Innolux P079ZCA 7.85" 768x1024 TFT LCD panel
+      - innolux,p079zca
         # Kingdisplay KD097D04 9.7" 1536x2048 TFT LCD panel
       - kingdisplay,kd097d04
         # LG ACX467AKM-7 4.95" 1080×1920 LCD Panel
-- 
2.25.1

