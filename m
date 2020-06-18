Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D46C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 10:09:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5007D21D6C
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 10:09:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Xjk4lMJz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbgFRKJf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 18 Jun 2020 06:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728717AbgFRKJI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 18 Jun 2020 06:09:08 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B88C0613EE
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 03:09:08 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id y17so2236960plb.8
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2020 03:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0tx33LB4XJjdQBQtJdq8pHurr/XG5qcfV4Bojc0lI48=;
        b=Xjk4lMJzfKrnO0dJ7ag4s5wJ293r8pN6aY06e7dmdJJAdcWKbyXrT4Lrd0ctnmWbZy
         lDoSJPn4Mko3dbuiyumEg9xMiq9cbJM4Z/sxbZIMgQjxIpNigP9LDe2e7gjtnpx0USNq
         0Q1/Q7hodWx40U/KW/hIyUDq9BoujcY3vIhBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0tx33LB4XJjdQBQtJdq8pHurr/XG5qcfV4Bojc0lI48=;
        b=ntZ06DflHbhh7nwR3naUlOdQOpzT/aCKw1b0rc6MRXgAOCrNtlM73VpUddxV7wmuZo
         le0n2d89hW4av7PwLzVYgtFF94+fGmYegQfgpyWhBZYVDKmks6V0F6YpmocIwafb97oM
         kYWV06QmSqbkcKm+Q/aSCF6Ymx6YzZmZFXtlAOrchasrEdvj1G0X7GOnbNuym0WvZNs1
         jcpjk1L4wkmvrn/WjKgEdHdY0ic/XtkwD+aiR+Gl0n9CaqfVjyZKfT9EGvxn46J2YuUo
         bx1+V3H4XclChNtYCIIafUqrfo+dsF1exTD2sN9eVxqWpcwBX2wrIh3OH8VYs0BsAo6p
         O8Fg==
X-Gm-Message-State: AOAM531lK1oy4bLb3VAPRmfIQDYX0M0x+m5iFzQqGN2p7uyHBsL0+JpF
        tk12KeFZjb5yj7ZL66Z6WLE9fA==
X-Google-Smtp-Source: ABdhPJyQtBMBw9LrfkiQ5o078z+MCo/lVLK2v8zmEGv9YGdhytmSTD/XuQ7v2f2i0mL/BOi1ny7s8w==
X-Received: by 2002:a17:90b:4c4b:: with SMTP id np11mr3550785pjb.58.1592474947624;
        Thu, 18 Jun 2020 03:09:07 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:b0c7:f192:869b:df87])
        by smtp.gmail.com with ESMTPSA id o16sm2190793pgg.57.2020.06.18.03.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 03:09:06 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc:     Tom Cubie <tom@radxa.com>, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 4/4] ARM: dts: rockchip: Add Radxa Rock Pi N8 initial support
Date:   Thu, 18 Jun 2020 15:38:32 +0530
Message-Id: <20200618100832.94202-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618100832.94202-1-jagan@amarulasolutions.com>
References: <20200618100832.94202-1-jagan@amarulasolutions.com>
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
index 000000000000..ffec77f0a1b6
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
+#include "rk3288-vmarc-som.dtsi"
+#include <arm/rockchip-radxa-dalang-carrier.dtsi>
+
+/ {
+	model = "Radxa ROCK Pi N8";
+	compatible = "radxa,rockpi-n8", "vamrs,rk3288-vmarc-som",
+		     "rockchip,rk3288";
+};
-- 
2.25.1

