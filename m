Return-Path: <SRS0=Wk2R=75=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9797DC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 12:18:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7582D20B80
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 12:18:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="ZEqkViqs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728789AbgFPMRg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 16 Jun 2020 08:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728763AbgFPMRb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 16 Jun 2020 08:17:31 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1113C08C5C4
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2020 05:17:30 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id x11so2914176plo.7
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2020 05:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=znKKGQwm6IauAkWxtciDylTYTkfIPgDD4usrkLNVDVI=;
        b=ZEqkViqsVRhD2LOIkmkDSuLWDlEUKURWtHouZZ2NWY78G2c7PyV1pLyYkZCjgYfdiL
         opArXrWfIWidQhYFItO5SxbFGJLnc0xvFxeyOJ+oYBpoojcd6zLvoD93hmFloEYAi5Bd
         FKOEGKqxQBCf6H33hhdXZBauV6StqVOztoA64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=znKKGQwm6IauAkWxtciDylTYTkfIPgDD4usrkLNVDVI=;
        b=Ot5RaoNGwM2TrgLk5YrNYnM96MWg/NEXRVgtkXWxS3XPxen6Ie4FDzX9RZAm78qn9t
         MyWWfJCHzdUvyzyvJpNdkGwVipjGo4HAmfbj6Q2r1AefY1piCbjcA2TXvo9Q2lxK1tBx
         WmlRfSODpmq8PaXwjXpQryv/veO/QFqzHsh9NRlfY4GKk4w2siocMCoj4CTD+40worJ6
         Y5nZXUv7VveuxTqTZGDCeTLWvhdSA20RGNHpmWncRCWiF4fHlO5w7SkILMve2okl8oBZ
         Cg3V8sgIJC4WmsMtdaBWM+04fKVtBH1s/WcR6D3gTBw5nTRkYYXC8CRDtNzU90gVhmT/
         2P8A==
X-Gm-Message-State: AOAM533TfSqws+CnI2tkWTLFAWi8hC+wbejp8oglVt3emCZAxL+YhvsQ
        eMN0p6AbFc+JAxZEVThUjSLqyNQ29hM=
X-Google-Smtp-Source: ABdhPJzhc2EDipOuZ62BKG7+4ZgTsdmVJkub1/mq7TclWvZEmlp2KOrL4gAY+h39PIifxUTzCdp4/Q==
X-Received: by 2002:a17:90a:224a:: with SMTP id c68mr2364987pje.21.1592309850020;
        Tue, 16 Jun 2020 05:17:30 -0700 (PDT)
Received: from shiro.work (p1285116-ipngn200805sizuokaden.shizuoka.ocn.ne.jp. [114.171.61.116])
        by smtp.googlemail.com with ESMTPSA id f23sm2360703pja.8.2020.06.16.05.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 05:17:29 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v4 09/12] ARM: mstar: Add infinity/infinity3 family dtsis
Date:   Tue, 16 Jun 2020 21:15:22 +0900
Message-Id: <20200616121525.1409790-10-daniel@0x0f.com>
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

This adds two family level dtsis for the infinity and infinity3
and then adds a chip level dtsi each for a chip in those families.

infinity3.dtsi includes infinity.dtsi as these SoCs share most of
their memory map and we would have a lot of duplication otherwise.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 MAINTAINERS                              |  1 +
 arch/arm/boot/dts/infinity-msc313.dtsi   | 14 ++++++++++++++
 arch/arm/boot/dts/infinity.dtsi          |  7 +++++++
 arch/arm/boot/dts/infinity3-msc313e.dtsi | 14 ++++++++++++++
 arch/arm/boot/dts/infinity3.dtsi         |  7 +++++++
 5 files changed, 43 insertions(+)
 create mode 100644 arch/arm/boot/dts/infinity-msc313.dtsi
 create mode 100644 arch/arm/boot/dts/infinity.dtsi
 create mode 100644 arch/arm/boot/dts/infinity3-msc313e.dtsi
 create mode 100644 arch/arm/boot/dts/infinity3.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 54a2fc60a1d9..8c152e29877d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2123,6 +2123,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	http://linux-chenxing.org/
 F:	Documentation/devicetree/bindings/arm/mstar.yaml
+F:	arch/arm/boot/dts/infinity*.dtsi
 F:	arch/arm/boot/dts/mstar-v7.dtsi
 F:	arch/arm/mach-mstar/
 
diff --git a/arch/arm/boot/dts/infinity-msc313.dtsi b/arch/arm/boot/dts/infinity-msc313.dtsi
new file mode 100644
index 000000000000..42f2b5552c77
--- /dev/null
+++ b/arch/arm/boot/dts/infinity-msc313.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include "infinity.dtsi"
+
+/ {
+	memory@20000000 {
+		device_type = "memory";
+		reg = <0x20000000 0x4000000>;
+	};
+};
diff --git a/arch/arm/boot/dts/infinity.dtsi b/arch/arm/boot/dts/infinity.dtsi
new file mode 100644
index 000000000000..f68e6d59c328
--- /dev/null
+++ b/arch/arm/boot/dts/infinity.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include "mstar-v7.dtsi"
diff --git a/arch/arm/boot/dts/infinity3-msc313e.dtsi b/arch/arm/boot/dts/infinity3-msc313e.dtsi
new file mode 100644
index 000000000000..4e7239afd823
--- /dev/null
+++ b/arch/arm/boot/dts/infinity3-msc313e.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include "infinity3.dtsi"
+
+/ {
+	memory@20000000 {
+		device_type = "memory";
+		reg = <0x20000000 0x4000000>;
+	};
+};
diff --git a/arch/arm/boot/dts/infinity3.dtsi b/arch/arm/boot/dts/infinity3.dtsi
new file mode 100644
index 000000000000..2830d064c07d
--- /dev/null
+++ b/arch/arm/boot/dts/infinity3.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include "infinity.dtsi"
-- 
2.27.0.rc0

