Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE98C2BB85
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 12:20:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF14A20786
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 12:20:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WQyDyR5m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635319AbgDPMT4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 08:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2635294AbgDPMTd (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Apr 2020 08:19:33 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72FDFC03C1AF
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 05:19:29 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id d17so4515325wrg.11
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 05:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HXXf6CzGWvqGfJ+pWD/XxsKx7m/sfAMCErpAVa4yyHE=;
        b=WQyDyR5mxzNp5S9/EFFpNUBzyCTrTp2awkJyanbeEFwI7GQHQF6wbpwEwd+J9y+Upf
         qEzKbb5p8JSw6giqyoQ8c3kElv/qoYGvCe1/xCr4lg6pTaVtbW6ErRiHU88hL3t9VNbB
         hhiYTyMz3U2/c8QGkhk8GwYOR1CYm1Kc7ZHlN/E7INk4aXqte01N1CSiyAp2tveR1B2I
         hb7cQ9CsHMHsxaI2V7jJmoW2KDav/NTUM93UD8Vif1i9eqqJ7NQ1fzC0WTcRwn2aiWl/
         zA0XNuRTHj4BeQ6HxqOBh8YmKwiNvREECaZahCrX4PcwvIhE6M82DGq7hR9Agv1jpOn6
         0YkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HXXf6CzGWvqGfJ+pWD/XxsKx7m/sfAMCErpAVa4yyHE=;
        b=dCQ6q5dOYWywjdn02wDIidhlyj1EkS4HweCRd06tsc5MuhJONOH3WEdstu4eQWCFlI
         kDNYtfgK7jr5tzsNVrR7iD6vaLen6rIImmTa77yfCgklT0fcQiob/tYcVYvOV+ErPt8X
         Hh6e8o0eAFY5kDaTUqNqQUgdJhRC78h45jwLrtYD69bkDxQz5MRJQAKwgzI4BSPGCiN7
         89ioXcrqpI+7I3AanRkhTCpdSDr4aeekMrKTbWZG5yWJoVeteQ0DzZlTjsHZZIeJnDiI
         RCBfvl6Jhsb/kuzHunFv6tkr/chXm/VqNkq6kDHU2FiL0uzagOab/52ki2MN7kdbt125
         +0VQ==
X-Gm-Message-State: AGi0PuZrcnpeenzFsRZDR2kllyPfV+TnJQD/QFtu5qOqEt/i0FxWQ0sz
        hx1A/Ugr75WnA84Y7riqXe7rdw==
X-Google-Smtp-Source: APiQypKqIj6sEk0xjD5CGDimPOpkhr5FgQcDq+KtN3ZtPclHdg8q5OF+FP+2ZyDS9S0qDaRuPbSqCQ==
X-Received: by 2002:a05:6000:12c5:: with SMTP id l5mr35779556wrx.185.1587039568034;
        Thu, 16 Apr 2020 05:19:28 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
        by smtp.gmail.com with ESMTPSA id i13sm22035602wro.50.2020.04.16.05.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 05:19:27 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org
Cc:     linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 8/8] dt-bindings: usb: dwc3: remove old DWC3 wrapper
Date:   Thu, 16 Apr 2020 14:19:10 +0200
Message-Id: <20200416121910.12723-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200416121910.12723-1-narmstrong@baylibre.com>
References: <20200416121910.12723-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

There is now an updated bindings for these SoCs making the old
compatible obsolete.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/usb/amlogic,dwc3.txt  | 42 -------------------
 1 file changed, 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/amlogic,dwc3.txt

diff --git a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
deleted file mode 100644
index 9a8b631904fd..000000000000
--- a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Amlogic Meson GX DWC3 USB SoC controller
-
-Required properties:
-- compatible:	depending on the SoC this should contain one of:
-			* amlogic,meson-axg-dwc3
-			* amlogic,meson-gxl-dwc3
-- clocks:	a handle for the "USB general" clock
-- clock-names:	must be "usb_general"
-- resets:	a handle for the shared "USB OTG" reset line
-- reset-names:	must be "usb_otg"
-
-Required child node:
-A child node must exist to represent the core DWC3 IP block. The name of
-the node is not important. The content of the node is defined in dwc3.txt.
-
-PHY documentation is provided in the following places:
-- Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
-- Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
-
-Example device nodes:
-		usb0: usb@ff500000 {
-			compatible = "amlogic,meson-axg-dwc3";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			clocks = <&clkc CLKID_USB>;
-			clock-names = "usb_general";
-			resets = <&reset RESET_USB_OTG>;
-			reset-names = "usb_otg";
-
-			dwc3: dwc3@ff500000 {
-				compatible = "snps,dwc3";
-				reg = <0x0 0xff500000 0x0 0x100000>;
-				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
-				dr_mode = "host";
-				maximum-speed = "high-speed";
-				snps,dis_u2_susphy_quirk;
-				phys = <&usb3_phy>, <&usb2_phy0>;
-				phy-names = "usb2-phy", "usb3-phy";
-			};
-		};
-- 
2.22.0

