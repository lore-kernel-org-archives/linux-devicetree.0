Return-Path: <SRS0=ng1M=2Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29800C32771
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 06:35:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 007DF222C4
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jan 2020 06:35:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3OQHln9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgADGfR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jan 2020 01:35:17 -0500
Received: from mail-pf1-f171.google.com ([209.85.210.171]:37739 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgADGfR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jan 2020 01:35:17 -0500
Received: by mail-pf1-f171.google.com with SMTP id p14so24467597pfn.4;
        Fri, 03 Jan 2020 22:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r5PKGVb0dDuVUlJ0+VCUDjDjxFbtyh7Bp6dOX8cXxZk=;
        b=N3OQHln9X+hJ8yMsU3mNQMI5zuWGRE/v6GRy3UBwgP8D5naP5ZA04A/HpAQrEwstIP
         GmaPV4f9hHw+7XGxv/LHzgBLnUYfUYkH9mTlEyr/K8ao7yMP3RRj8spC2iEeHV8E7cF5
         PNJBsZp7Eof3ag+a6Sn6RA1npkxv5SjCkjxmJvHVUv6rMqcb4d7VjSv3tOLi4Bqdy4fR
         DRNSIWJsCuTqLfHGJnUuojWf7e2tOkG61r2XIMvLpLfepnaRi1ykKvLvdXI8E6GQ3i8z
         EPpyq3LAWRE2j0LhuGEqBbjZjuXGBpM31nkB1ySeQwgWbUIUS1QD2rHi2CjFzFClCXRB
         YXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r5PKGVb0dDuVUlJ0+VCUDjDjxFbtyh7Bp6dOX8cXxZk=;
        b=I73Vs2DNDSw5ew7OFQpNg81M5XO9XMEQldMlt4lAQZARwoBFVknxtD03O/xpdD9/x0
         uSZyeJFUbe51dkO2T/4E/SweDthR4+Vo7pSz3h3DUNOvb0VxNWmidO2J1K2WeJyZ7KQR
         3OQ+yK6YahQPlLGGZaGWdXBWxRBvqsjziwM/drcdrH7MMI2XxE2Zt0hj8M188+JvHcw/
         uCHT07hxjzpW0qGi3J0dimOkY0/Y2etloMxdhFRJbIcVlKiiEKnwRnuTcUAJdvHPYDbY
         sQzMtthL1GEYQDpIhRf8O5bOB0xpZjs04G1iBcIg/VVw5Ta1gIgGTbIwqCZmC/vrDeZB
         UHKQ==
X-Gm-Message-State: APjAAAU+RIW9JESLGblmb3qIr1Zb08tqXqFVZmtT2MvFSKOgTxFPSYWc
        cTu+g/0dVGh9yatZYJ7BdFRespw7
X-Google-Smtp-Source: APXvYqwZj8SDI7DbUOwYdHKJrDNeMHcthHxarF0VkAChIuOoMuHZFsfaTqF6idwcE3+kpOQCLXH43w==
X-Received: by 2002:a65:578e:: with SMTP id b14mr100617080pgr.444.1578119716337;
        Fri, 03 Jan 2020 22:35:16 -0800 (PST)
Received: from anarsoul-thinkpad.lan (216-71-213-236.dyn.novuscom.net. [216.71.213.236])
        by smtp.gmail.com with ESMTPSA id u2sm64761580pgc.19.2020.01.03.22.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 22:35:15 -0800 (PST)
From:   Vasily Khoruzhick <anarsoul@gmail.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 2/3] clk: sunxi-ng: a64: export CLK_CPUX clock for DVFS
Date:   Fri,  3 Jan 2020 22:35:04 -0800
Message-Id: <20200104063505.219030-3-anarsoul@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200104063505.219030-1-anarsoul@gmail.com>
References: <20200104063505.219030-1-anarsoul@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Export CLK_CPUX so we can reference it in CPU node.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h      | 1 -
 include/dt-bindings/clock/sun50i-a64-ccu.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.h b/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
index 979929276709..116e6f826d04 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
@@ -36,7 +36,6 @@
 #define CLK_PLL_HSIC			18
 #define CLK_PLL_DE			19
 #define CLK_PLL_DDR1			20
-#define CLK_CPUX			21
 #define CLK_AXI				22
 #define CLK_APB				23
 #define CLK_AHB1			24
diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h b/include/dt-bindings/clock/sun50i-a64-ccu.h
index a8ac4cfcdcbc..e512a1c9b0fc 100644
--- a/include/dt-bindings/clock/sun50i-a64-ccu.h
+++ b/include/dt-bindings/clock/sun50i-a64-ccu.h
@@ -46,6 +46,7 @@
 #define CLK_PLL_VIDEO0		7
 #define CLK_PLL_PERIPH0		11
 
+#define CLK_CPUX		21
 #define CLK_BUS_MIPI_DSI	28
 #define CLK_BUS_CE		29
 #define CLK_BUS_DMA		30
-- 
2.24.1

