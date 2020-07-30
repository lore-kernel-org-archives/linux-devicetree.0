Return-Path: <SRS0=Tykm=BJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF70FC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 10:02:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A143D206F5
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 10:02:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbUnbw1m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728548AbgG3KCV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jul 2020 06:02:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgG3KCU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 30 Jul 2020 06:02:20 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E0CC061794
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 03:02:20 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t10so8279122plz.10
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 03:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oZ7SWSzvwwbS3EpvgZK6SEDfeD6G2eNEW69i7sZy4RQ=;
        b=XbUnbw1mhtlAOwfYAqrTCCYYOeGp72p+gE8bjIvWCW4s3d7UFHXkbdC6SzFtmWWIP2
         hIEOiSyvg0SlqOGG68fGQprSd73JM9IS+hXuKUP55g+JT+xdz5FA/fTy3bh5a95Us88m
         Qi+Q3Fx23lSFT0N4SiEpnaJpIozSuGq6odQ1GHhzvSMT0HA2EOriSW2sA+QEN76iuW8w
         LQcjaD0UX1kUe/QJvYiVvC5csMMalMYAS7L7Xmo0QDNcVc1YC82RmQZXQNWrax5dxtN0
         1WAi7XbFXh6QTvKMS/cgG6HOWKvubNaBzfjb+Zs+VepLud3kx3HhFAg2sgMp7m7PT6qF
         le4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oZ7SWSzvwwbS3EpvgZK6SEDfeD6G2eNEW69i7sZy4RQ=;
        b=mSst+vjQo17a5Zzf/0ftDgraxMITBqIF6cT5dXchBEqziKuXZS6Ufap++Vj7va8PTq
         MnIkpoBdLaYOgyN8PDQP7P4mvSjpjysVdKdJdMQ6oFe02q5QoFQudTVq2dLg8Dcxm8n7
         2C/Ac8JFgx1zEVe0c0z6JFETc23Kscslyy9LyjknlQs5xLEpAvnyv1LyEcyyMIqleMb8
         C0OaiJtD2yRGv6M44ydLuw0NHM7CXPVV17SZc9YBweCBxwTKawEM6/pmN9fQUM5rAkDd
         Y1zHIPAKbUOIJA3V4Xy9YbUj1cVvHJeI+Kd8By7z0oTXx+Mz/Y8cpVm6ucm5ZCTFPsng
         jYZg==
X-Gm-Message-State: AOAM532myFmQlW3mJtKxv1QTwE5yUdtk3gncSbD5bIS/7MsMbi6KNSlk
        4MV6UTJ07+lHVtdwG0NxyXs91WF4
X-Google-Smtp-Source: ABdhPJwZbh5+9WfKlj1CCG0taNSZwWVmTcOxeGhhTboKzyiNHu/2x7rUEv9et/7G59VkaCSYgQA1og==
X-Received: by 2002:a17:902:9042:: with SMTP id w2mr2345751plz.8.1596103340192;
        Thu, 30 Jul 2020 03:02:20 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.37])
        by smtp.gmail.com with ESMTPSA id d12sm5476640pfh.196.2020.07.30.03.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 03:02:19 -0700 (PDT)
From:   Anand Moon <linux.amoon@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v1 1/3] arm64: dts: amlogic: meson-gx: add missing ethernet reset ID
Date:   Thu, 30 Jul 2020 10:02:07 +0000
Message-Id: <20200730100209.793-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200730100209.793-1-linux.amoon@gmail.com>
References: <20200730100209.793-1-linux.amoon@gmail.com>
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
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index ba63c36b22e0..8720c83990ce 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -574,6 +575,8 @@ ethmac: ethernet@c9410000 {
 			interrupt-names = "macirq";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "stmmaceth";
 			status = "disabled";
 		};
 
-- 
2.28.0

