Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB14C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 09:46:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8FD1207BB
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 09:46:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="fNOnpaIO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728106AbgGJJqh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 05:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728099AbgGJJqg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 05:46:36 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F70C08C5CE
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 02:46:36 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id i14so2301610pfu.13
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 02:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MQ9QSpZzOSQjrYrekwiRm8/VgUg0LpUCsXicKIGN+PI=;
        b=fNOnpaIOCqDqW7+7ILBX1qyMPc/QG8K8MYJkLzaGlj35X6XyhePrTKgiJ2jptf6cQh
         p2i090zWej/nh0gawCjhvMuLa8oF3x532WPSukJ1oFcWm9CydbWMn1NL5SFelO9ZJBEi
         D+raNysQ0aTlLooXAqOonUpjjZau3861Wpt94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MQ9QSpZzOSQjrYrekwiRm8/VgUg0LpUCsXicKIGN+PI=;
        b=cTK+YAytAiweXgmXSZWjPpPuWoVCtJSKJ3tIo9qOoGrDGo3vAy3PC7EQaFoplNZfzI
         15oppgaBUjvl4VJyS4ZLbRqCrrTA/nVMXyAWFLi58KZF/qK34e/SQpM/p+bcz89tCTht
         VZRoN8VefSgFRstYU0Ku5kv+INJx2VT73U33nH/HcYXQCHs52K9/OxDcVECV2hNra5LJ
         K0/F3jmPRrGG1DM51i0cFB0A1XcBAiYJ8KqZ9XGUxNCkFjUVpU+QqhKEW2pMiPLh1M3L
         qphQDyng2qkYE5QfIAni5j77QPO/LC9Ls3/PLcSHhH1wkhWNMv8xH4cSFSUKUHOmO4tc
         /l4g==
X-Gm-Message-State: AOAM530E53B1QdtAtRw1YBu1Eo9ByVQoGDi8fbmoD6YtwhLdlMgm6zpR
        bigI82r//LClP0LhdrfgSv/odA==
X-Google-Smtp-Source: ABdhPJzKiNSiCUh11EQVe+CMzikkPJRbBmGXSSEEluAtGaH6Sb/XEWk6d4yWKItBJpL6TsQASJPqPQ==
X-Received: by 2002:aa7:9630:: with SMTP id r16mr58408487pfg.144.1594374395746;
        Fri, 10 Jul 2020 02:46:35 -0700 (PDT)
Received: from shiro.work ([2400:4162:2428:2f01:7285:c2ff:fe8e:66d7])
        by smtp.googlemail.com with ESMTPSA id z9sm5133213pgh.94.2020.07.10.02.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 02:46:35 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux@armlinux.org.uk, arnd@arndb.de,
        afaerber@suse.de, maz@kernel.org, w@1wt.eu,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v5 11/12] ARM: mstar: Add dts for msc313(e) based BreadBee boards
Date:   Fri, 10 Jul 2020 18:45:43 +0900
Message-Id: <20200710094544.430258-12-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710094544.430258-1-daniel@0x0f.com>
References: <20200710094544.430258-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

BreadBee is an opensource development board based on the
MStar msc313(e) SoC.

Hardware details, schematics and so on can be found at:
https://github.com/breadbee/breadbee

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/Makefile                    |  3 +++
 .../dts/infinity-msc313-breadbee_crust.dts    | 25 +++++++++++++++++++
 .../boot/dts/infinity3-msc313e-breadbee.dts   | 25 +++++++++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 arch/arm/boot/dts/infinity-msc313-breadbee_crust.dts
 create mode 100644 arch/arm/boot/dts/infinity3-msc313e-breadbee.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index e6a1cac0bfc7..4a5f8075a4f6 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1342,6 +1342,9 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
 	mt8127-moose.dtb \
 	mt8135-evbp1.dtb
 dtb-$(CONFIG_ARCH_MILBEAUT) += milbeaut-m10v-evb.dtb
+dtb-$(CONFIG_ARCH_MSTARV7) += \
+	infinity-msc313-breadbee_crust.dtb \
+	infinity3-msc313e-breadbee.dtb
 dtb-$(CONFIG_ARCH_ZX) += zx296702-ad1.dtb
 dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-ast2500-evb.dtb \
diff --git a/arch/arm/boot/dts/infinity-msc313-breadbee_crust.dts b/arch/arm/boot/dts/infinity-msc313-breadbee_crust.dts
new file mode 100644
index 000000000000..f24c5580d3e4
--- /dev/null
+++ b/arch/arm/boot/dts/infinity-msc313-breadbee_crust.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+/dts-v1/;
+#include "infinity-msc313.dtsi"
+
+/ {
+	model = "BreadBee Crust";
+	compatible = "thingyjp,breadbee-crust", "mstar,infinity";
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
diff --git a/arch/arm/boot/dts/infinity3-msc313e-breadbee.dts b/arch/arm/boot/dts/infinity3-msc313e-breadbee.dts
new file mode 100644
index 000000000000..1f93401c8530
--- /dev/null
+++ b/arch/arm/boot/dts/infinity3-msc313e-breadbee.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+/dts-v1/;
+#include "infinity3-msc313e.dtsi"
+
+/ {
+	model = "BreadBee";
+	compatible = "thingyjp,breadbee", "mstar,infinity3";
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
2.27.0

