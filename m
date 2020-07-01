Return-Path: <SRS0=V/11=AM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC61C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 06:17:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 153AA20773
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 06:17:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ALuNgxv+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgGAGRx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Jul 2020 02:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727093AbgGAGRw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Jul 2020 02:17:52 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D7AAC061755
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 23:17:52 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k5so1013950pjg.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 23:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2i13HrhbdyWBz2VSMHspL7oRwZeUoksbANwTdThdMao=;
        b=ALuNgxv+cQJPruxfz+cnpxT3S4RN+lkz0v4l0l/kc5hMgfXMduVxq5vqWrOKybDhYc
         WzOJ+GM4PvSOtph/5j2UtMEjccmRYrvQQ1TBd4CPGX7fqWUDo/679LX9u2v0eUv+xRjF
         AzaV1E+kkengcxnb+S60bSmF5OQbvuDTompnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2i13HrhbdyWBz2VSMHspL7oRwZeUoksbANwTdThdMao=;
        b=BIVgjMJul4EidAnaqD/7xa6ivt0qU8YO/fjlGfdx1GDpNqX5x7L2q3kPUgTInUjN58
         zvgLN42ed1N9nIlbXJRu88O05qOuDHv+baHdL/D1JnbPpdluhfLjjflh4b7SOAyjq0Os
         QM+JsABUNiCZhdus470ueZjDZxgxravzJ21EbxPKgBnShUD99ly5X4NdxLGNVrea/o7a
         WcXmIym2XayB/p2t4c5Grd4VJmp+oIq0hS2VMJuzWAjt+SeACs3jjr/kx/YHYJdLh6jR
         ScYOQocnT0RJEo4FvPxfgT+naTSrLbaEaWJplvWia4cOGZOumP5k6QNQIgT706KvyWe6
         9C7Q==
X-Gm-Message-State: AOAM530Y+50OoSr3vTLxl2LGoLr4Rf5EKBsbAAby5X9joTHGpGUUGUan
        D9eILJzHNpkkjCRk3bxBzcS0hA==
X-Google-Smtp-Source: ABdhPJyfCGZNUCJlKo9e93Dg5bf+/kiOJfc3cIkuM8zAWpJwgVfgwOguM/twEgx6a+7cOiYlDlStWQ==
X-Received: by 2002:a17:902:6bc5:: with SMTP id m5mr21147547plt.101.1593584271768;
        Tue, 30 Jun 2020 23:17:51 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:356d:fc3d:92ff:192e])
        by smtp.gmail.com with ESMTPSA id n189sm4555744pfn.108.2020.06.30.23.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 23:17:51 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc:     Tom Cubie <tom@radxa.com>,
        Suniel Mahesh <sunil@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 4/4] ARM: dts: rockchip: Add Radxa Rock Pi N8 initial support
Date:   Wed,  1 Jul 2020 11:47:17 +0530
Message-Id: <20200701061717.143753-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200701061717.143753-1-jagan@amarulasolutions.com>
References: <20200701061717.143753-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Rock Pi N8 is a Rockchip RK3288 based SBC, which has
- VMARC RK3288 SOM (as per SMARC standard) from Vamrs.
- Compatible carrier board from Radxa.

VAMRC RK3288 SOM need to mount on top of radxa dalang
carrier board for making Rock Pi N8 SBC.

So, add initial support for Rock Pi N8 by including rk3288,
rk3288 vamrc-som and raxda dalang carrier board dtsi files.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- reorder dtsi include so-that common properties will
  visible to main dts.

 arch/arm/boot/dts/Makefile              |  1 +
 arch/arm/boot/dts/rk3288-rock-pi-n8.dts | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm/boot/dts/rk3288-rock-pi-n8.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index e8dd99201397..1d1b6ac26394 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -964,6 +964,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 	rk3288-popmetal.dtb \
 	rk3288-r89.dtb \
 	rk3288-rock2-square.dtb \
+	rk3288-rock-pi-n8.dtb \
 	rk3288-tinker.dtb \
 	rk3288-tinker-s.dtb \
 	rk3288-veyron-brain.dtb \
diff --git a/arch/arm/boot/dts/rk3288-rock-pi-n8.dts b/arch/arm/boot/dts/rk3288-rock-pi-n8.dts
new file mode 100644
index 000000000000..b19593021713
--- /dev/null
+++ b/arch/arm/boot/dts/rk3288-rock-pi-n8.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 Fuzhou Rockchip Electronics Co., Ltd
+ * Copyright (c) 2019 Vamrs Limited
+ * Copyright (c) 2019 Amarula Solutions(India)
+ */
+
+/dts-v1/;
+#include "rk3288.dtsi"
+#include <arm/rockchip-radxa-dalang-carrier.dtsi>
+#include "rk3288-vmarc-som.dtsi"
+
+/ {
+	model = "Radxa ROCK Pi N8";
+	compatible = "radxa,rockpi-n8", "vamrs,rk3288-vmarc-som",
+		     "rockchip,rk3288";
+};
-- 
2.25.1

