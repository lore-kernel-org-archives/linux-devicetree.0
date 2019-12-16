Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0E1C2D0BF
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 17:48:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 489ED20717
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 17:48:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rHVK/Ju0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfLPRsC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 12:48:02 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37372 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfLPRsB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 12:48:01 -0500
Received: by mail-pl1-f194.google.com with SMTP id c23so4788887plz.4
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 09:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=67RnPKw63+A5B3mWKU81b+vfdJ8KYwSGtoL1kew422s=;
        b=rHVK/Ju0g15r+TRIbS2kezdGsHO37G24hm0K36ZYbAlHspIVlXS4Ys59i8GgAGUaBo
         4Otfi12AJqW/wV46QUynw6JkAr1d7J/IK/zQ/HojllVeIiX7ao2zKhm+pzp/DFP42FeE
         wVO8n2xTycRSGXty5gg+VNYHFHaSgOgftBJhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=67RnPKw63+A5B3mWKU81b+vfdJ8KYwSGtoL1kew422s=;
        b=BvZ0RH6e9m8PWiqVZrHklGcqmQfS4EX7HOG/DGCUJRTpNaFIeXe01+u/JSpCJbNPBq
         OCsuW13sbQo8yeuT531fuyp8KQYP8DwEKH2VJaUsklsuEaFHZDDn6Ut6U2t62v5Zp37A
         8tDmD918NXdgjYZ2vJeKlRqvXlNglvz3Vzw2g/Hk/gAY6ndYOd62V/B981ql3V+nGUkP
         oyzwuxwuWa0zmI15ss6xxRVKyreLCl/YmUI2wuSMBKxTI2mgiUnQ/pSGCwRzajBIJB21
         KhGlZyilKNw9P34b1IbHJc32MvbOyL+OpPm+URQIzD35ebsK3WIEj5gcujfKcnPdStuN
         69/A==
X-Gm-Message-State: APjAAAXqCvPb1IpRxEmef6xFmQbSlRKeSVTI2bJhO81SB7mWY2ngdnfG
        8liPcQg2IUnxMAQ4Op4Ghe1JtUMRJg0=
X-Google-Smtp-Source: APXvYqyAjAO4jnA4QyilqZkqXP3DoPuztugJ8Cps8+XwWEzUX1N4xsK5btgsHHZlP9temsP5T3pDDQ==
X-Received: by 2002:a17:902:d883:: with SMTP id b3mr16392991plz.231.1576518480927;
        Mon, 16 Dec 2019 09:48:00 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c809:c7d5:6d28:a89:f9e1:1506])
        by smtp.gmail.com with ESMTPSA id a6sm22342924pgg.25.2019.12.16.09.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 09:48:00 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Akash Gajjar <akash@openedev.com>, Tom Cubie <tom@radxa.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-amarula@amarulasolutions.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v3 4/4] arm64: dts: rockchip: Add Radxa Rock Pi N10 initial support
Date:   Mon, 16 Dec 2019 23:17:11 +0530
Message-Id: <20191216174711.17856-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191216174711.17856-1-jagan@amarulasolutions.com>
References: <20191216174711.17856-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Rock Pi N10 is a Rockchip RK3399Pro based SBC, which has
- VMARC RK3399Pro SOM (as per SMARC standard) from Vamrs.
- Compatible carrier board from Radxa.

VAMRC RK3399Pro SOM need to mount on top of radxa dalang
carrier board for making Rock Pi N10 SBC.

So, add initial support for Rock Pi N10 by including rk3399,
rk3399pro vamrc-som and raxda dalang carrier board dtsi files.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- none

 arch/arm64/boot/dts/rockchip/Makefile           |  1 +
 .../boot/dts/rockchip/rk3399pro-rock-pi-n10.dts | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 48fb631d5451..433033b18170 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -36,3 +36,4 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rock960.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire-excavator.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dts b/arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dts
new file mode 100644
index 000000000000..b42f94179538
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 Fuzhou Rockchip Electronics Co., Ltd
+ * Copyright (c) 2019 Radxa Limited
+ * Copyright (c) 2019 Amarula Solutions(India)
+ */
+
+/dts-v1/;
+#include "rk3399.dtsi"
+#include "rk3399-opp.dtsi"
+#include "rk3399pro-vmarc-som.dtsi"
+#include <arm/rockchip-radxa-dalang-carrier.dtsi>
+
+/ {
+	model = "Radxa ROCK Pi N10";
+	compatible = "radxa,rockpi-n10", "rockchip,rk3399pro";
+};
-- 
2.18.0.321.gffc6fa0e3

