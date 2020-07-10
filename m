Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4DBC433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 09:46:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A5EC20842
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 09:46:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="kMBy3CAt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbgGJJqe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 05:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728086AbgGJJqd (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 05:46:33 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 233BFC08C5DC
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 02:46:33 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id k71so2387345pje.0
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2020 02:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QjUIM0FC2h89WQ3LszgfkIB2jNJ5S5Qa/1nAQ+VjzMk=;
        b=kMBy3CAtJ+M2vCH9gM2lKfmdmm04ZOlMK2v7Q9S6XbzbQiC0VDh1v54tWlzsPOprJG
         n/LJN6kRIhB4y7XBHyDuwAXXKDlkYphTMJdNmpSS6qhmeXCv5nomoUqg3r8bJumAOxyq
         OqM+fBDXSN+Sc1N/8inkOtD3q0BqkW3GVoHtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QjUIM0FC2h89WQ3LszgfkIB2jNJ5S5Qa/1nAQ+VjzMk=;
        b=uIF8A0sYuzH3lbPqr+gHerrSP8nIXYkH4N04Pc5QmUVL6aginxDWDfeD5p4IX2fMHO
         TDhedHg9dEJo+ktBcxL0J4m5XH3g4KU5tzw6HOSLU3R8dXoO2PCBkquFuIndjOgfzMS+
         A82IyJebnVVs4CEU6gD9CTAOW8xK0rjaaXah+9K51iS3UQ3TLCVQwVMFoxjAAY61YFoc
         Yx8B+caxIEe97LylTGhATCvx4ewj3de+THtkzJFB709rUyGGo1EEkeslw+eCQGiTJT0i
         YvY4/VCKFlr8q/Su9Nmk5ozixUXeCpdXkV0V2CD5b/2epBzTOUsSl3iyj/GA4zPiMvAh
         bZXA==
X-Gm-Message-State: AOAM530dOmM/FyrMgv/RoJbLdCGmm0PL/mdC1qXhiRzTY6oc6wwl6tSv
        b+e61GUB5MOtVSbhItrPF5+eohb07autmA==
X-Google-Smtp-Source: ABdhPJxGYYP2IXzdpFMDee+eP8jqfkBLt4Kw/yf+fM8WAxzQnwAL3EFyOzm0v/Q7bvQDF4YWBIOOeQ==
X-Received: by 2002:a17:90a:916:: with SMTP id n22mr4583655pjn.78.1594374392676;
        Fri, 10 Jul 2020 02:46:32 -0700 (PDT)
Received: from shiro.work ([2400:4162:2428:2f01:7285:c2ff:fe8e:66d7])
        by smtp.googlemail.com with ESMTPSA id z9sm5133213pgh.94.2020.07.10.02.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 02:46:31 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux@armlinux.org.uk, arnd@arndb.de,
        afaerber@suse.de, maz@kernel.org, w@1wt.eu,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v5 10/12] ARM: mstar: Add mercury5 series dtsis
Date:   Fri, 10 Jul 2020 18:45:42 +0900
Message-Id: <20200710094544.430258-11-daniel@0x0f.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710094544.430258-1-daniel@0x0f.com>
References: <20200710094544.430258-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds a family level dtsi for the mercury5 and then a
chip level dtsi for the ssc8336n chip.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 MAINTAINERS                              |  1 +
 arch/arm/boot/dts/mercury5-ssc8336n.dtsi | 14 ++++++++++++++
 arch/arm/boot/dts/mercury5.dtsi          |  7 +++++++
 3 files changed, 22 insertions(+)
 create mode 100644 arch/arm/boot/dts/mercury5-ssc8336n.dtsi
 create mode 100644 arch/arm/boot/dts/mercury5.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index cb8a6b414312..d5f5599e0a70 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2124,6 +2124,7 @@ S:	Maintained
 W:	http://linux-chenxing.org/
 F:	Documentation/devicetree/bindings/arm/mstar.yaml
 F:	arch/arm/boot/dts/infinity*.dtsi
+F:	arch/arm/boot/dts/mercury*.dtsi
 F:	arch/arm/boot/dts/mstar-v7.dtsi
 F:	arch/arm/mach-mstar/
 
diff --git a/arch/arm/boot/dts/mercury5-ssc8336n.dtsi b/arch/arm/boot/dts/mercury5-ssc8336n.dtsi
new file mode 100644
index 000000000000..7d4a4630c25c
--- /dev/null
+++ b/arch/arm/boot/dts/mercury5-ssc8336n.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include "mercury5.dtsi"
+
+/ {
+	memory@20000000 {
+		device_type = "memory";
+		reg = <0x20000000 0x4000000>;
+	};
+};
diff --git a/arch/arm/boot/dts/mercury5.dtsi b/arch/arm/boot/dts/mercury5.dtsi
new file mode 100644
index 000000000000..f68e6d59c328
--- /dev/null
+++ b/arch/arm/boot/dts/mercury5.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include "mstar-v7.dtsi"
-- 
2.27.0

