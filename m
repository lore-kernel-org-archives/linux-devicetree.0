Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1566C352B6
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F6CA2075E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYnB/to8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730214AbgDHTv6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:51:58 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44163 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730187AbgDHTv5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:51:57 -0400
Received: by mail-lj1-f194.google.com with SMTP id z26so4883742ljz.11
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DaICPVhWGMzYWehtRVbV/jO9Up7YjJ7XLHT6tmeYB5E=;
        b=HYnB/to8RJXQKnyDwMdbAnEqtL8JJbJA987j6GgWeJtT7Fz1wkLdhsfcoO7MkdcVol
         o0KcR5zXEZVl6NQbrBkGlbx14iQpYH755wNkDfJ2KHJ8EtRqleoUuVRHSCONchLtd/KD
         Hu7fdoiSZpbjJAdWStNO6AsKlzJQeZU5zR+EEs7JqkGI5UauudPO2qzDQws2pg64twl9
         Z6gshauG8+8Lnh4s4W3rZAdL0elmyp03uxO3k82X8d/FETZqm8BB1lyVEB8Sp4K71EPg
         vFNWfAGbmVvnYFclGoS5r/relJTypd2ifH6LsWU9uwegneI5LwzhLmFfhVh8UU5VMG7s
         J8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=DaICPVhWGMzYWehtRVbV/jO9Up7YjJ7XLHT6tmeYB5E=;
        b=tpM4sGiWgWBs1vMZGU2Jp4IVReLwsp05yGxiF6QGgHzYGAVot5LBh2TjqqR9ecmIKT
         byvXrR+b6KuAO6WvNc95KCIV+3lxdIyDfWM5Kz2TVrxjMYTJY5/ApQnhRsvDIYaqZ+sB
         xBH+zabzVWibQ5SlBT5zYdIA+R9WXcr+dVns12yGJNsT57zS9QAV4B/zpbpwceHFMPhP
         pXLxjlrJxTTJEg1X/ovq8wsGigQ9xlxW6QXtmZuy/BHet36DC/w+ncRUNFsOLbR/y0Pf
         U9rccgRju5Z+QH9r2nnamov0+PZ8KHMCvRlgpyBz53m4k9tVb3+IOnkLhwEoOrQ72n/1
         sjGA==
X-Gm-Message-State: AGi0PuY62yTQk2ER1jYQe3xNWYtbWRZCWiXQ7ZMqIbKXtXyFWFyfeeFl
        5qEXkPJCHa6a9jPNTugXthg=
X-Google-Smtp-Source: APiQypIRlLDB66S2v+CD42pwXG2CjA3QxlWHexQl/bSzdmSMgYVVWvSsx2LYOSWCZeX3WsoKJQEGGA==
X-Received: by 2002:a2e:8612:: with SMTP id a18mr5580381lji.250.1586375516188;
        Wed, 08 Apr 2020 12:51:56 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:51:55 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Nickey Yang <nickey.yang@rock-chips.com>
Subject: [PATCH v2 14/36] dt-bindings: display: convert kingdisplay,kd097d04 to DT Schema
Date:   Wed,  8 Apr 2020 21:50:47 +0200
Message-Id: <20200408195109.32692-15-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

kingdisplay,kd097d04 matches the panel-simple-dsi binding.
The only difference is that enable-gpios is now an optional
property.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Nickey Yang <nickey.yang@rock-chips.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/kingdisplay,kd097d04.txt    | 22 -------------------
 .../display/panel/panel-simple-dsi.yaml       |  2 ++
 2 files changed, 2 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt

diff --git a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt b/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt
deleted file mode 100644
index cfefff688614..000000000000
--- a/Documentation/devicetree/bindings/display/panel/kingdisplay,kd097d04.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Kingdisplay KD097D04 9.7" 1536x2048 TFT LCD panel
-
-Required properties:
-- compatible: should be "kingdisplay,kd097d04"
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
-			compatible = "kingdisplay,kd097d04";
-			reg = <0>;
-			power-supply = <...>;
-			backlight = <&backlight>;
-			enable-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index b2e8742fd6af..949371db0a16 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -29,6 +29,8 @@ properties:
       # compatible must be listed in alphabetical order, ordered by compatible.
       # The description in the comment is mandatory for each compatible.
 
+        # Kingdisplay KD097D04 9.7" 1536x2048 TFT LCD panel
+      - kingdisplay,kd097d04
         # Panasonic 10" WUXGA TFT LCD panel
       - panasonic,vvx10f034n00
 
-- 
2.20.1

