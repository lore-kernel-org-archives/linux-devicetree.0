Return-Path: <SRS0=Wk2R=75=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C86C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 12:18:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75EDF20C09
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 12:18:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="hwME/2Hm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgFPMSB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 16 Jun 2020 08:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728795AbgFPMRh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 16 Jun 2020 08:17:37 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 223B2C08C5C4
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2020 05:17:37 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id v24so8312419plo.6
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2020 05:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MpmBavrAY+NcMSTsAQ48p6wNUiPoSL0d6miZz8y14IE=;
        b=hwME/2Hm3k/tQH8+cNITC/0sv5z1s66dwLdL9ZBejhoO8dCZP8qWsUz1a7Ty6ig6/k
         ZwMDrtDor3C/9rmei6eOmJ03z7IO5+ZmY0lJ4C91pk38otK0rMkONaIUlhBecx/xZp7H
         a8Q/lGNgicWPz2MztwMBSKUoMI9KIuvaIMr8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MpmBavrAY+NcMSTsAQ48p6wNUiPoSL0d6miZz8y14IE=;
        b=dPCy403ufXE5iWlJx+8qJq2HJJQJ44lozM/93NTSX/GJ9bYwhI79e8nnnRvFS5n+vc
         SugMKSaffBb3mglpxLllNxurtKX+6lb2MANWdOTmMftVaFzoy4vfnnsuq8RYISQfaDZb
         hsVW0a0cdPq93M7XiE7h5ScVrI5nrham4Wpgv9cqZNNHHo9UlB9iiAi3+8ttt9XM2IC7
         F7FOj1ztSu1/oALa5pO3SX19ZILEGEhVB2J4lCK4/iuBzfI1f3I9auU+b3Odjp0jwzMp
         wgviXurfqGYDu9+fisnzT/DkAEtJ+XV9D7H98B6dr5hO5DZgIehGU2ccbNYxuY8utsC8
         jkng==
X-Gm-Message-State: AOAM533FMDPZnVtQ+gsQg/P+vC0v2pI7fyNllINH9VEJtQgaG/ExP8GJ
        YXjBNBLaxRQDJpwEVwogP/GJkKVIX4Y=
X-Google-Smtp-Source: ABdhPJx+VzlhYRDn2bciHUsOTxFZn0WI19a1389Xf6c/UNJAsKB62DbXZwkrPG+vjKCyonbf4o/IyQ==
X-Received: by 2002:a17:90a:f0d4:: with SMTP id fa20mr2743765pjb.160.1592309856671;
        Tue, 16 Jun 2020 05:17:36 -0700 (PDT)
Received: from shiro.work (p1285116-ipngn200805sizuokaden.shizuoka.ocn.ne.jp. [114.171.61.116])
        by smtp.googlemail.com with ESMTPSA id f23sm2360703pja.8.2020.06.16.05.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 05:17:36 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v4 12/12] ARM: mstar: Add dts for 70mai midrive d08
Date:   Tue, 16 Jun 2020 21:15:25 +0900
Message-Id: <20200616121525.1409790-13-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200616121525.1409790-1-daniel@0x0f.com>
References: <20200612130032.3905240-2-daniel@0x0f.com>
 <20200616121525.1409790-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adds initial support for the 70mai midrive d08 dash camera.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/Makefile                    |  3 ++-
 .../boot/dts/mercury5-ssc8336n-midrived08.dts | 25 +++++++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/mercury5-ssc8336n-midrived08.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 4a5f8075a4f6..caf4a47ba799 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1344,7 +1344,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
 dtb-$(CONFIG_ARCH_MILBEAUT) += milbeaut-m10v-evb.dtb
 dtb-$(CONFIG_ARCH_MSTARV7) += \
 	infinity-msc313-breadbee_crust.dtb \
-	infinity3-msc313e-breadbee.dtb
+	infinity3-msc313e-breadbee.dtb \
+	mercury5-ssc8336n-midrived08.dtb
 dtb-$(CONFIG_ARCH_ZX) += zx296702-ad1.dtb
 dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-ast2500-evb.dtb \
diff --git a/arch/arm/boot/dts/mercury5-ssc8336n-midrived08.dts b/arch/arm/boot/dts/mercury5-ssc8336n-midrived08.dts
new file mode 100644
index 000000000000..f24bd8cb8e60
--- /dev/null
+++ b/arch/arm/boot/dts/mercury5-ssc8336n-midrived08.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+/dts-v1/;
+#include "mercury5-ssc8336n.dtsi"
+
+/ {
+	model = "70mai Midrive D08";
+	compatible = "70mai,midrived08", "mstar,mercury5";
+
+	aliases {
+		serial0 = &pm_uart;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&pm_uart {
+	status = "okay";
+};
-- 
2.27.0.rc0

