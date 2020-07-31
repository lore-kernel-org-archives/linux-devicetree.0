Return-Path: <SRS0=uLJJ=BK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650DBC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 08:20:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F59320838
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jul 2020 08:20:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="urMlrhKZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731853AbgGaIUz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jul 2020 04:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731510AbgGaIUz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jul 2020 04:20:55 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49886C061574
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2020 01:20:55 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id k13so8903613plk.13
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2020 01:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EAeGAtIVrSVa+XtAyFFPGmEyfij/VDCDtDCWaTPKURs=;
        b=urMlrhKZUiBFWXmWI2T2HlAKyOKQCOLXcjZUgEzXECrKoneutcgTx2MR8u5cvdRx2b
         5w5a5KId5l5AXfxtmFe1tyUiwWnpqflR0bXUM00zlcHznPdoMt6GovBRhWBz4eUcShsR
         xJFJxyb+fLQ905DEgZmhjUv2xnffLg+JDEk9I8CZ20x2/sw1IVLQjJ7laOvYw+zO9CBl
         17N0ykXKwg2UixfAKN8iF+ICpK1j0S86JA7XWN5erclB8zcoa2eLQpxrZjOTLyHKDpqg
         y2j5z/7EUJM9XuK66+M0Yf7XK6otjAllnJPSU4pLUDmtlz3omTB2Wgh53UbUbNdzCCDJ
         Asiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EAeGAtIVrSVa+XtAyFFPGmEyfij/VDCDtDCWaTPKURs=;
        b=f4BpJaREuD4TVHRBA/GQhTo7VefFGpVQfq0a38RdwdjbAl6Vf5ELtdOUZZ3qoqYxMF
         aqXAtQED5h/8o4Sz8r37YliqZfmoY4E9dqGWoGpn1NUf3EvEMOyHB0nZcdL1Ag11YAVw
         bPILZ0RDg4RB/wCe3x6tEslbCnq/C6dpsaZmjvAB7zLwkFW7c2MA6/UpHcaC0IfqU51H
         Ujtecm5EEwQctZa/2SmnHt0yTu+auJWn9n4hVMycY2XMsln2jHrrZh4dkxOEbgc4Evnb
         FQ8XS3xVvzDnSN0YBNgYqdGetJNbHiAsY71IDA2UBvunjXeF9051fo/y7bYFxlLu5lBt
         /Y8g==
X-Gm-Message-State: AOAM533QAvnFYg1sx1piXEPWU/iM1LZwd//rJ22EEKCyur+UjuffNgiv
        8rUCo7hMUYDzNs/3ErSGpnX6athJ
X-Google-Smtp-Source: ABdhPJxgL0lhx3Q80JazIJvxeeNOZVy7i1JZ3IU+YYaa6/GwlMKp/GJSxz3GT1+wEgUPcZAd1BogsA==
X-Received: by 2002:a17:902:b902:: with SMTP id bf2mr2805513plb.100.1596183654722;
        Fri, 31 Jul 2020 01:20:54 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.37])
        by smtp.gmail.com with ESMTPSA id 202sm5892917pfy.6.2020.07.31.01.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 01:20:54 -0700 (PDT)
From:   Anand Moon <linux.amoon@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v2 1/3] arm64: dts: amlogic: meson-gx: add missing ethernet reset ID
Date:   Fri, 31 Jul 2020 08:20:41 +0000
Message-Id: <20200731082043.1682-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200731082043.1682-1-linux.amoon@gmail.com>
References: <20200731082043.1682-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add missing etherent reset ID for reset controller to reset
ethernet mac controller.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Changes V2
-Rebased on linux-next-20200730
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 0edd137151f8..726b91d3a905 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/meson-gxbb-power.h>
+#include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -575,6 +576,8 @@ ethmac: ethernet@c9410000 {
 			interrupt-names = "macirq";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "stmmaceth";
 			power-domains = <&pwrc PWRC_GXBB_ETHERNET_MEM_ID>;
 			status = "disabled";
 		};
-- 
2.28.0

