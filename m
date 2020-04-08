Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315B4C3815B
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 04F9320769
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:52:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tg5iAd5e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730245AbgDHTwD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:52:03 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34520 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730241AbgDHTwC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:52:02 -0400
Received: by mail-lj1-f193.google.com with SMTP id m8so787877lji.1
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nnMmg3E6mU6M1/pbP+jwtm3Dp+SV5v9n/rhgOIrVACI=;
        b=Tg5iAd5ewEek0+m5k52fS6PoecN+Q0/+Gib1WqXIU9Ts2mwzJ9psuM5+Jc75J7gXxa
         Mm0xGSs4uB5TqoJNfs/CORNnOOlhxJG38BMrXrzQw0LcbYxPVtotgUUfE01XKO0idtAu
         F3ceJOFfIDAZR7ubBByz3reihnhYFojJivfPSezNFAOc1aSX7hOQ3tTg+EsoMLaR73LI
         iQ3j0s8GK3CNKYschRIwI2oPHAVuD7eotvzepY/jrNhI2zEGOa3cXedEUf0nu0G/Acso
         t65lDTIrn72tTHnOwqEPNz/RY8/Q1Gan4/9+A8Gh6ZM0o6HDCNErFM4eRnslwx2PoHv3
         jYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=nnMmg3E6mU6M1/pbP+jwtm3Dp+SV5v9n/rhgOIrVACI=;
        b=D1LZktAUaf5UY3wyV3KxdNViHNWtEHgHrLwrHogQIKMDMHWilmca1mJ0KLXgaIsTOy
         XqjUCMOEiFg2CNXh1rVLnE/jStel8U/cNXBmx+Zgs4WC4vC72rSRfFJby2Sh3sIYcUI6
         Vo1Lc7saM3ot/gwNktfd6boPIpifodFDG1XTsZr2MzNl5/7sHChB3jh8+qoWViOxL5Q8
         0elgV/0U2oqbIwA/DB54ULFO56bVjIdTo2Uo/HdMvZkEj8b/snVWByAbssaNfVtXJPtg
         UKpNYO0cE1+RygmVFmpO8Sapy0thF/1ZTggtF2O9pQ7ernM6hSabYKs/UU94Vuay+atF
         Uyiw==
X-Gm-Message-State: AGi0PuZThIvHcw/prBxb1U4caplu9ddgpF09ltZohZxKAyIPi0IsjSHf
        C841VKE2OKn+MTbtpnV0tpE=
X-Google-Smtp-Source: APiQypI980jTU7V134I+PWfQUVXoHGZJLDDxuThdAmnP9s/MTUhtDCoWAkQ62ix2o+6wdpb083gIBQ==
X-Received: by 2002:a2e:b177:: with SMTP id a23mr653436ljm.174.1586375519325;
        Wed, 08 Apr 2020 12:51:59 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:51:58 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v2 17/36] dt-bindings: display: convert osddisplays,osd101t2587-53ts to DT Schema
Date:   Wed,  8 Apr 2020 21:50:50 +0200
Message-Id: <20200408195109.32692-18-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

osddisplays,osd101t2587-53ts is compatible with panel-simple-dsi binding,
so list the compatible in the panel-simple-dsi binding file.

v2:
  - It is a DSI panel, move to -dsi binding (Tomi)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/osddisplays,osd101t2587-53ts.txt | 14 --------------
 .../bindings/display/panel/panel-simple-dsi.yaml   |  2 ++
 2 files changed, 2 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.txt

diff --git a/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.txt b/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.txt
deleted file mode 100644
index 9d88e96003fc..000000000000
--- a/Documentation/devicetree/bindings/display/panel/osddisplays,osd101t2587-53ts.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-One Stop Displays OSD101T2587-53TS 10.1" 1920x1200 panel
-
-The panel is similar to OSD101T2045-53TS, but it needs additional
-MIPI_DSI_TURN_ON_PERIPHERAL message from the host.
-
-Required properties:
-- compatible: should be "osddisplays,osd101t2587-53ts"
-- power-supply: as specified in the base binding
-
-Optional properties:
-- backlight: as specified in the base binding
-
-This binding is compatible with the simple-panel binding, which is specified
-in simple-panel.txt in this directory.
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 949371db0a16..f2698d7c09e6 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -31,6 +31,8 @@ properties:
 
         # Kingdisplay KD097D04 9.7" 1536x2048 TFT LCD panel
       - kingdisplay,kd097d04
+        # One Stop Displays OSD101T2587-53TS 10.1" 1920x1200 panel
+      - osddisplays,osd101t2587-53ts
         # Panasonic 10" WUXGA TFT LCD panel
       - panasonic,vvx10f034n00
 
-- 
2.20.1

