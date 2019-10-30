Return-Path: <SRS0=UUkD=YX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F00CA9EC6
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 12:24:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 535792087E
	for <linux-devicetree@archiver.kernel.org>; Wed, 30 Oct 2019 12:24:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JeM5H6a2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbfJ3MYg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 30 Oct 2019 08:24:36 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43126 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726119AbfJ3MYf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 30 Oct 2019 08:24:35 -0400
Received: by mail-wr1-f68.google.com with SMTP id n1so2054619wra.10
        for <devicetree@vger.kernel.org>; Wed, 30 Oct 2019 05:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MKCua1iUyxONn+bsOWnRZuMnXqiDfqvw9FIMx0dZRF8=;
        b=JeM5H6a2s+6CWd9XEIxYAUqb70ZFjnB/1nhiQCi/ckl5nLth712zbo3IvCI/EbsOLT
         MNm9i6RSPi8qZuw3Fx29Wrvnw6dItVeND28wsGa6nVBFppFShvdau60mMt27hcRSsxx3
         TPPUuFWN2fsM0QwdasBVpdXmw28Jt72mUY7pjeMqijG7P6S4mwnhR6wApD8+UnNQERPd
         19uy3WIVQJEKLb/e4h5d7/kZ5z/PBDN507ElNHDwBVdO5DvGT5hVFVtxlgObftxX2ZTW
         s9gUsc334wSJF47aiFdPg/Hj0ezaiJ4SlPjA4Yi4CM5YLW+8DZSOe3BV4itybE7pp0Nk
         Kb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MKCua1iUyxONn+bsOWnRZuMnXqiDfqvw9FIMx0dZRF8=;
        b=O/VYE3XiiOph5DyDMlu1pKMneOoulky+ew0QmMfnBjvb4TYt/WQRsGsHif4EwnV7U9
         qYVLj+85rbiC4zdP2B9xPHsTZqdLCGdNLTz1ruriHS9TDWYYFr7BlxZz9J3Cf3e4caiB
         WQYSB6VAQL0kZBGFyC2hvTQ+wLS9LTAxVPS2fxDie+JYdRX/Orc6cfWMh852lrYdLTNp
         eXm1HIi0WCvkXAJ84OUrTWZ+zeBkUP/RfRB9IFcEd/hxWzqaV6RXx7QJoSJ9zlcCrnm4
         eI9VCzYqjQwskgyK0DnUGtduc7aiEUq0YBV2Zh9+TBLMxaDM2zzkYQIDHAEQyVMDJdDM
         eKbg==
X-Gm-Message-State: APjAAAVOjZcqLnW9zTAjM/20QQm5wUw6AAo62LBNnYv86uVkwEvdCLUN
        cHvND5aOfj9+z4kM8/IJcfyqag==
X-Google-Smtp-Source: APXvYqzeJed9goyylmqlOBs3LxL7op1lRQ9/rFSPpVdMhG8ysk+IWFKHtQYfDtxb9UaVHLJiJm/kFQ==
X-Received: by 2002:adf:fe81:: with SMTP id l1mr2930329wrr.165.1572438273075;
        Wed, 30 Oct 2019 05:24:33 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id p13sm2075919wma.41.2019.10.30.05.24.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 30 Oct 2019 05:24:32 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mark.rutland@arm.com, mripard@kernel.org, robh+dt@kernel.org,
        wens@csie.org, jernej.skrabec@siol.net
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 1/3] ARM64: dts: sun50i-h6-pine-h64: state that the DT supports the modelB
Date:   Wed, 30 Oct 2019 12:24:13 +0000
Message-Id: <1572438255-26107-2-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572438255-26107-1-git-send-email-clabbe@baylibre.com>
References: <1572438255-26107-1-git-send-email-clabbe@baylibre.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The current sun50i-h6-pine-h64 DT does not specify which model (A or B)
it supports.
When this file was created, only modelA was existing, but now both model
exists and with the time, this DT drifted to support the model B since it is
the most common one.
Furtheremore, some part of the model A does not work with it like ethernet and
HDMI connector (as confirmed by Jernej on IRC).

So it is time to settle the issue, and the easiest way is to state that
this DT is for model B.
Easiest since only a small name changes is required.
Doing the opposite (stating this file is for model A) will add changes (for
ethernet and HDMI) and so, will break too many setup.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml     | 4 ++--
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 972b1e9ee804..9a1e4992b9e9 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -594,9 +594,9 @@ properties:
           - const: pine64,pine64-plus
           - const: allwinner,sun50i-a64
 
-      - description: Pine64 PineH64
+      - description: Pine64 PineH64 model B
         items:
-          - const: pine64,pine-h64
+          - const: pine64,pine-h64-modelB
           - const: allwinner,sun50i-h6
 
       - description: Pine64 LTS
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index 30102daf83cc..f9070d9e6c43 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -10,8 +10,8 @@
 #include <dt-bindings/gpio/gpio.h>
 
 / {
-	model = "Pine H64";
-	compatible = "pine64,pine-h64", "allwinner,sun50i-h6";
+	model = "Pine H64 model B";
+	compatible = "pine64,pine-h64-modelB", "allwinner,sun50i-h6";
 
 	aliases {
 		ethernet0 = &emac;
-- 
2.23.0

