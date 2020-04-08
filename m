Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D47C2BB54
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B3C02082D
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YE/PaUCH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730193AbgDHTvx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:51:53 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45061 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730179AbgDHTvx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:51:53 -0400
Received: by mail-lj1-f195.google.com with SMTP id t17so8963461ljc.12
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w1vgjQwRljbyZ8hzPEbGFRIMCdtcxcKSs14d3tFq/l4=;
        b=YE/PaUCHBQqxFaSPk44HwH/HFwiS5tDsYVjauJnTGb9DovjpGZfeK6K6h/KvBq21Eu
         HDQIAmz6/0hBZeJxI+yDdcbZI17+qdWgkziNlv4C4tKTGiaEG14uFmSeTtewAiF49WjD
         TbzL8pXyssUuNw7mxixr9kXS6pG1X+a5ekcT4ROEQ0ypTbwQN3LHt2UCQ7OYaXQNXF5L
         62sjmgIf3hJfGH3UbDPieBhu6uCKIrx91/QREbMSDQZ5+2N6ND8RGN8twS/vOKPtoL69
         vB/FFME6SLriDJ087hYi+1S7u8H8O39HtAhnVNFieEPGZlA663xNqr9HzvqySMuBRMmZ
         3Lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=w1vgjQwRljbyZ8hzPEbGFRIMCdtcxcKSs14d3tFq/l4=;
        b=FHpVa85LR0WS1Tr6aO8lrElIp7O6QBlsbtXUHkEVloO4O6lsxJssrW5RNTANmESM2h
         IaDv+mhnNXvzRMbwsZEG9SH/AgisjBfB+O7ohr7ekEDhlL59PbyPCiY268fPAEEYb1nY
         X67BEetI/9pj1sEw+dh7gVwPa/bfYoWY+mX6Gf/Dlxz22J3bwf/5BUmxpHvNim+UzwYk
         kPbeqBlXuHe1S8wx+JoOVA2h+n4vkYdloVI7TnyaQ5+8zWalaz33C712FwA+lgTGelcm
         QOcX1dtAOarfiJg3YPc0S+2VRXHwTj2x5Zw1o12WHcy48/RRQ9UjE7Xe/Mj8FHa2baD1
         z3Hw==
X-Gm-Message-State: AGi0PuaMSOq18IQibUHF2b28CFeqyHLmce/a3xmmyeWZ6kOgnfIBRuuV
        R7FM38dxdC754ZId9j1Xr70=
X-Google-Smtp-Source: APiQypJ8k32aBhpewo5nN7orUc4Bcf6hjjwbG8+Pt3vD1N8GhFawqgYlC++l+GornRwCFRJzYMhkRw==
X-Received: by 2002:a2e:7606:: with SMTP id r6mr5845883ljc.118.1586375510887;
        Wed, 08 Apr 2020 12:51:50 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:51:50 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH v2 09/36] dt-bindings: display: convert innolux,p079zca to DT Schema
Date:   Wed,  8 Apr 2020 21:50:42 +0200
Message-Id: <20200408195109.32692-10-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

As the binding matches panel-simple, added the compatible to the
panel-simple list.
With this change enable-gpios is now optional.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Chris Zhong <zyw@rock-chips.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/innolux,p079zca.txt         | 22 -------------------
 .../bindings/display/panel/panel-simple.yaml  |  2 ++
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
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 8fc117d1547c..328df95cbe88 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -143,6 +143,8 @@ properties:
       - innolux,n116bge
         # InnoLux 15.6" WXGA TFT LCD panel
       - innolux,n156bge-l21
+        # Innolux P079ZCA 7.85" 768x1024 TFT LCD panel
+      - innolux,p079zca
         # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
       - innolux,zj070na-01p
         # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
-- 
2.20.1

