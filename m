Return-Path: <SRS0=Vyee=AT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64521C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 06:37:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A14E206E2
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 06:37:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="EvVxKg8S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729763AbgGHGhE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jul 2020 02:37:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729762AbgGHGhE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jul 2020 02:37:04 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45708C08C5DC
        for <devicetree@vger.kernel.org>; Tue,  7 Jul 2020 23:37:04 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u185so17489898pfu.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2020 23:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ck5aijhNng/ZXTjfuRPiw9zt4tyG0HNHaHu36lpohaw=;
        b=EvVxKg8SmOXYYxSKF0LAEHL0ilmOXKMGIk1SJmXFRrW0410UUsrxxXjefx2ki89rM/
         Eo9IeiL0prPgsHdgFNteVzXwGzVqYHK92zbKquNTwJgewAKQzoLMsTys4SwAa0tzWNCy
         cebRZ8igu6gkcDkgemmQo4AHIAH4sV19lyVU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ck5aijhNng/ZXTjfuRPiw9zt4tyG0HNHaHu36lpohaw=;
        b=DmUdTOafNN6vW7wmAU6CY3Qg2hVKI/ErTGkm95tQJCaf6zA7gC9NRgJsR1jwAYnMxz
         R2tl2itmSE+4eNoRDjP76VVIRwkif3qfBnj7B9+oytQoGjMnW/Pk04i1E9VdUyMVAxL+
         Kvdde+UDcshVunbXeJfc5PVgLyCVqdFbSVkPsYpGWKt9nA+J2XbeEP2yExYME5av3sNH
         3Jy0bnozwjm8K3naLpIarOfkE9g6sR0PhNW6TIXLiEh9HtRV822n0sPk4cv8MwlJvQog
         zwW+GY0qZg1ntl4LALvdXRekiDkboHxWKa1ZJ4TJqIZTyVLx6ExNAX5QFxZLymsrC8Y8
         bjQg==
X-Gm-Message-State: AOAM531olfvqE7WkHeGq47cPm+Q3k12gtlnyAndjTcpdbWfnhFqA4KZk
        Fd72p46RrXPN7muKfsnkb/cHuQrvaqPGRg==
X-Google-Smtp-Source: ABdhPJzBHlW3PuvdsPhv5uf7FnA7hzZ/I3s16xAlnqqWmp4EsuILLYatSDBXsuBboI189BH4yRuRDQ==
X-Received: by 2002:a63:a84d:: with SMTP id i13mr46447892pgp.342.1594190223800;
        Tue, 07 Jul 2020 23:37:03 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:ade2:f5f3:8cc0:52f9])
        by smtp.gmail.com with ESMTPSA id c12sm24587898pfn.162.2020.07.07.23.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 23:37:03 -0700 (PDT)
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
Subject: [PATCH v4 4/4] ARM: dts: rockchip: Add Radxa Rock Pi N8 initial support
Date:   Wed,  8 Jul 2020 12:06:27 +0530
Message-Id: <20200708063627.8365-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200708063627.8365-1-jagan@amarulasolutions.com>
References: <20200708063627.8365-1-jagan@amarulasolutions.com>
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
Changes for v4, v3:
- none
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

