Return-Path: <SRS0=BM7I=BC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE81C433F8
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 12:40:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71ED420825
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 12:40:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="FxhRtful"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728948AbgGWMkn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jul 2020 08:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728947AbgGWMkm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jul 2020 08:40:42 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70291C0619DC
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2020 05:40:42 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 1so2947098pfn.9
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2020 05:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WDNDRjywjyqpB5L/QCIx/xtojuw5bNyR8YRkTXP5eyQ=;
        b=FxhRtfulyYZnd8BzpGtUd7Q722UXLNsA245+8ajQo7fNJi52t0V3SoLQeu7rb9/8Mn
         h5a6NTPk559YwIrStlhNAVpi/OJtTE+7zHA0UxhzmFelZOJv3DNSbE/pbkbMaU1XoqnP
         Js8vSQrPTKPLL112O0qh7nZSfLDuUfteQI3I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WDNDRjywjyqpB5L/QCIx/xtojuw5bNyR8YRkTXP5eyQ=;
        b=Zx98bBeXUW+wiutlWu0qtoz8ZxKEa4nOXoiWlvNJdyo30Z/aubsbWtxNK8q/PnjSBn
         b4FAHEM+PGB2kUKzukkIbDLpHDw/NwFyA38HlSISfeVJ4LQlgtH7XcUYh/58H+DOILtY
         VqrPudL8B9Zf1DqVVkc0P3XlyR84fP+GiHjY82eRucnoGSbW2m5zkusA+F72vFn7w4eD
         o7ZW0GfoRHwqGHiMqNgsFRv2BVDwzLZOkk7TG+C3+HOZ/GOkMGxxFaw/TZS5wZFNa27J
         69hK9wygRTcq14M7Y7YYJpp/fAFqRSShsztzY81la6XnsDprzj/IT8v3lnFYoCqI017X
         78ww==
X-Gm-Message-State: AOAM532Vlzosfd5UghEO0hcwJO/k3jqkYgZWRsdlpgFOmfCF4uWo4oK3
        XdBrRNlj3124pEDUf4Bh5cZV+16QuD6w0w==
X-Google-Smtp-Source: ABdhPJy5qwfhQw/yLRPrIE+wAn4xcIP1SmsbB6BaixfqXaVhKEBLMoVOAVrMYK6hJ/8bwLK61SqZsQ==
X-Received: by 2002:a63:182:: with SMTP id 124mr3758056pgb.288.1595508042007;
        Thu, 23 Jul 2020 05:40:42 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:cbf:ea0:8a30:a3af])
        by smtp.gmail.com with ESMTPSA id m26sm3051270pff.84.2020.07.23.05.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 05:40:41 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc:     Suniel Mahesh <sunil@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 7/7] arm64: dts: rockchip: Add Engicam PX30.Core C.TOUCH 2.0 10.1" OF
Date:   Thu, 23 Jul 2020 18:09:51 +0530
Message-Id: <20200723123951.149497-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200723123951.149497-1-jagan@amarulasolutions.com>
References: <20200723123951.149497-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

PX30.Core is an EDIMM SOM based on Rockchip PX30 from Engicam.

C.TOUCH 2.0 10.1" Open Frame is a Carrier board with Capacitive
touch 10.1" open frame from Engicam.

PX30.Core needs to mount on top of this Carrier board for creating
complete PX30.Core C.TOUCH 2.0 10.1" Open Frame.

Add support for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |  1 +
 .../rockchip/px30-px30-core-ctouch2-of10.dts  | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-px30-core-ctouch2-of10.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 65116fcb7368..5b85e315f14d 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-evb.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-px30-core-ctouch2-of10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-px30-core-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3308-evb.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3308-roc-cc.dtb
diff --git a/arch/arm64/boot/dts/rockchip/px30-px30-core-ctouch2-of10.dts b/arch/arm64/boot/dts/rockchip/px30-px30-core-ctouch2-of10.dts
new file mode 100644
index 000000000000..9c957a21e38f
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/px30-px30-core-ctouch2-of10.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 Fuzhou Rockchip Electronics Co., Ltd
+ * Copyright (c) 2020 Engicam srl
+ * Copyright (c) 2020 Amarula Solutions(India)
+ */
+
+/dts-v1/;
+#include "px30.dtsi"
+#include "px30-engicam-ctouch2-of10.dtsi"
+#include "px30-px30-core.dtsi"
+
+/ {
+	model = "Engicam PX30.Core C.TOUCH 2.0 10.1\" Open Frame";
+	compatible = "engicam,px30-core-ctouch2-of10", "engicam,px30-px30-core",
+		     "rockchip,px30";
+
+	chosen {
+		stdout-path = "serial2:115200n8";
+	};
+};
-- 
2.25.1

