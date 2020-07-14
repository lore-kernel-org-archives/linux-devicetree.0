Return-Path: <SRS0=HudI=AZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75718C433E5
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 07:13:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48C0A22224
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Jul 2020 07:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594710801;
	bh=wtiSdBLfP/oEAjuWCJVaVyY3I3kTknkon20LM58lCn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=UPPG9ekZ3v+e3tJ9jl3Ttf3/HM32yZfneq/jx5+XZcPJwX1VL338xopSSCwHf7LUq
	 /LYfDykV3WHvbIcJoBwDfB35WEf68W4JlXQwu+Z0O7gq/Id15rs8UuTaQlRuLsPoq5
	 7s7ltputWEgUSmjqJoG3IxlApWyTk/I09SgGmrVM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgGNHNU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Jul 2020 03:13:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:55838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726782AbgGNHNU (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Jul 2020 03:13:20 -0400
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.194.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9A99C22210;
        Tue, 14 Jul 2020 07:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594710799;
        bh=wtiSdBLfP/oEAjuWCJVaVyY3I3kTknkon20LM58lCn4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ma1kr062avGaCtPZxmJRmXknz8+TQaEl9Q3AbmoS0hy2TQGZfBkAApQnSYGoEriwP
         EpHqDHxs8uAL5L9xI+ViOnQBAnf83qBRaDgcbKQTGjbWlXuyA4sRwK//gurtz7wz1P
         KsjULFwPDE680eeYxP0PBREMEHmiZJKc1c2RN9gM=
Received: by wens.tw (Postfix, from userid 1000)
        id 114FF5FCF6; Tue, 14 Jul 2020 15:13:14 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Siarhei Siamashka <siarhei.siamashka@gmail.com>
Subject: [PATCH 4/5] ARM: dts: sun7i: Add LCD0 RGB888 pins
Date:   Tue, 14 Jul 2020 15:13:04 +0800
Message-Id: <20200714071305.18492-5-wens@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714071305.18492-1-wens@kernel.org>
References: <20200714071305.18492-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

In some designs, the full 24 bits of RGB plus the control / sync signals
for the LCD panel are used.

Add a pinmux option for this.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 6d6a37940db2..eec6b4473cbd 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -934,6 +934,18 @@ ir1_tx_pin: ir1-tx-pin {
 				function = "ir1";
 			};
 
+			/omit-if-no-ref/
+			lcd0_rgb888_pins: lcd0-rgb888-pins {
+				pins = "PD0", "PD1", "PD2", "PD3",
+				       "PD4", "PD5", "PD6", "PD7",
+				       "PD8", "PD9", "PD10", "PD11",
+				       "PD12", "PD13", "PD14", "PD15",
+				       "PD16", "PD17", "PD18", "PD19",
+				       "PD20", "PD21", "PD22", "PD23",
+				       "PD24", "PD25", "PD26", "PD27";
+				function = "lcd0";
+			};
+
 			/omit-if-no-ref/
 			lcd_lvds0_pins: lcd-lvds0-pins {
 				pins = "PD0", "PD1", "PD2", "PD3", "PD4",
-- 
2.27.0

