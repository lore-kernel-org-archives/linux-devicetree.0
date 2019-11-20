Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC490C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 14:55:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D115206F4
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 14:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574261739;
	bh=kSjMiLQHP19m2SuyacP8dEwwtZYhnXjpF3cjUXQfpW4=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=isXeNP4OsAaBFCEZoC0IIbUpgYTRo4Ce9ITd+EP6zX88PfV8E5Ln3UstJn8YHDtB/
	 m96OxSFY+KrfJwKz0Va+fefWJrVCNSiwNefq65NN53rAW9MYYW8H2SaEv2JMEZ2XUp
	 3avZSR4d/IL/a4e7Ovj2w4ajlAwmAq53aq6MrlUw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731775AbfKTOzj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 09:55:39 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46995 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731086AbfKTOzj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Nov 2019 09:55:39 -0500
Received: by mail-ot1-f65.google.com with SMTP id n23so21392826otr.13
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 06:55:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A+/KtB0TcGuwm0rqG+XnXBXTw2iYyI4Q2Zl2m9VClEM=;
        b=h3o2f0OwwhNvvxaUSIlbTitEBTGy3/GiAWoBL04RJanjN3l5cSsEOmqex69oJVfino
         3kmQ9VkZPjuTTgRUqrbxspWo7niZhRuAlw8cGuWcRGTGS3Wqzb91wLsCbJdRyJh9/caY
         Dpbh/uztsuIUk3wvc7szj6RkPY7VbpBeyDr2A1f1mSnEn92ztMyzFVb4+AR+G87p0Yub
         PbKdcYzq2fSeCLe94jE5Ic3hszWTuFUjeoseZj+7MU45PFzBfc1mLQ/s8CnMNaPuLp6S
         EEvKnIYTJzXXtzxnZz+oLjMV6QDLsSMtwst3IFwKghD082hE0RCnXpu+HgdE6QTaOuqI
         EJPw==
X-Gm-Message-State: APjAAAWT1gzogtsxu0MUfHDPAWu8Q65kPe1XTb8ox2LR8CUUGYP7MNSJ
        ElKcz4J2NK+whn7JUqdN+6ntcSs=
X-Google-Smtp-Source: APXvYqyVlY6SP2U7iXaDSt17cqYwi8MUABCu1sAStaRTozWgXOnXDlwANdcPZWTufRNHNK9HyqIxvg==
X-Received: by 2002:a9d:70d0:: with SMTP id w16mr2376180otj.239.1574261737996;
        Wed, 20 Nov 2019 06:55:37 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id e93sm8544988otb.60.2019.11.20.06.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 06:55:37 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Peter Rosin <peda@axentia.se>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH] dt-bindings: arm: Remove leftover axentia.txt
Date:   Wed, 20 Nov 2019 08:55:36 -0600
Message-Id: <20191120145536.17884-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The bindings described in axentia.txt are already covered by
atmel-at91.yaml, so remove the file.

Cc: Peter Rosin <peda@axentia.se>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/axentia.txt       | 28 -------------------
 MAINTAINERS                                   |  1 -
 2 files changed, 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/axentia.txt

diff --git a/Documentation/devicetree/bindings/arm/axentia.txt b/Documentation/devicetree/bindings/arm/axentia.txt
deleted file mode 100644
index de58f2463880..000000000000
--- a/Documentation/devicetree/bindings/arm/axentia.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Device tree bindings for Axentia ARM devices
-============================================
-
-Linea CPU module
-----------------
-
-Required root node properties:
-compatible = "axentia,linea",
-	     "atmel,sama5d31", "atmel,sama5d3", "atmel,sama5";
-and following the rules from atmel-at91.txt for a sama5d31 SoC.
-
-
-Nattis v2 board with Natte v2 power board
------------------------------------------
-
-Required root node properties:
-compatible = "axentia,nattis-2", "axentia,natte-2", "axentia,linea",
-	     "atmel,sama5d31", "atmel,sama5d3", "atmel,sama5";
-and following the rules from above for the axentia,linea CPU module.
-
-
-TSE-850 v3 board
-----------------
-
-Required root node properties:
-compatible = "axentia,tse850v3", "axentia,linea",
-	     "atmel,sama5d31", "atmel,sama5d3", "atmel,sama5";
-and following the rules from above for the axentia,linea CPU module.
diff --git a/MAINTAINERS b/MAINTAINERS
index 97b28c913813..8d711f764dfb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2859,7 +2859,6 @@ AXENTIA ARM DEVICES
 M:	Peter Rosin <peda@axentia.se>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-F:	Documentation/devicetree/bindings/arm/axentia.txt
 F:	arch/arm/boot/dts/at91-linea.dtsi
 F:	arch/arm/boot/dts/at91-natte.dtsi
 F:	arch/arm/boot/dts/at91-nattis-2-natte-2.dts
-- 
2.20.1

