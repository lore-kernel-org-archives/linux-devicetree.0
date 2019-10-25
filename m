Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D658CC47E49
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 17:57:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA6B7222BE
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 17:57:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="i3MIHeuY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730283AbfJYR5O (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 13:57:14 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43333 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbfJYR5J (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 13:57:09 -0400
Received: by mail-pg1-f193.google.com with SMTP id l24so1996703pgh.10
        for <devicetree@vger.kernel.org>; Fri, 25 Oct 2019 10:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P3Mki6uub+NAK80E3ntfBcsFK0xNEI4Pl6xkUsSgIeM=;
        b=i3MIHeuYlYEVmU4821ovZp6xUdW9w+0CO4+t4aQLQryHnwktMguR3UUD+Yd9ZkzbTJ
         4iQrMyZXSu1Za0QtBnk0m4NeXcBDnmIdW7LtsfXsM4RHfFgOEWbXEXuvHz130kkxKtiF
         fH4VjdQ2kJHmdErld9s1DPCCJz7NeHLkpyWIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P3Mki6uub+NAK80E3ntfBcsFK0xNEI4Pl6xkUsSgIeM=;
        b=LFHL88kbuqwz8pxgxv6WviiB8s9nOEOtIW4zK+4AwOkkHub8ELnGP1cfAfQOx92c8i
         Li1+2pmCpJawVMxCRrLKcu140T4vicaWV5wFwT8YRo5Lve4CAfCxDZjPKLESqSZaQVLG
         qpf9oOEZuNx1oMKSqkIfc/P8X1YKZy41+D1hvFftEHGPA6elCeq+ZY0k9KpX05k+L4lU
         nQT3EQrVPoxgw4BWN9FUJ5D5LEJlJWKn3vPs0hr690lCDQlKPBWBFafhcZPSELKAnDJ6
         NSsKyfeDQ3FGsAe4Xh6T1/67qVSQ9hAu9kjpjSwD4YoegTBdl39JhB5vBqNUj9e+X3L4
         ahRw==
X-Gm-Message-State: APjAAAUZP8tbFNagKZ41ZcUxWc0ug7i8OQeyFhCmv9yA0Ul7Q+zbvASK
        /QWWNHLy0i/p0Sc6c703sh3OrQ==
X-Google-Smtp-Source: APXvYqwQDEhpc37JYujaBlS0c+W1Le7LhGIIS5sXpnrhe8K1umdFkvWh0OaUWV5zfFMK68Yte1XnMQ==
X-Received: by 2002:a62:58c2:: with SMTP id m185mr6044311pfb.10.1572026227045;
        Fri, 25 Oct 2019 10:57:07 -0700 (PDT)
Received: from localhost.localdomain ([115.97.180.31])
        by smtp.gmail.com with ESMTPSA id n15sm2926580pfq.146.2019.10.25.10.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 10:57:06 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     michael@amarulasolutions.com, Icenowy Zheng <icenowy@aosc.io>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v11 4/7] =?UTF-8?q?drm/sun4i:=20dsi:=20Handle=20bus=20cloc?= =?UTF-8?q?k=20explicitly=C2=A0?=
Date:   Fri, 25 Oct 2019 23:26:22 +0530
Message-Id: <20191025175625.8011-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191025175625.8011-1-jagan@amarulasolutions.com>
References: <20191025175625.8011-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Usage of clocks are varies between different Allwinner
DSI controllers. Clocking in A33 would need bus and
mod clocks where as A64 would need only bus clock.

To support this kind of clocking structure variants
in the same dsi driver, explicit handling of common
clock would require since the A64 doesn't need to
mention the clock-names explicitly in dts since it
support only one bus clock.

Also pass clk_id NULL instead "bus" to regmap clock
init function since the single clock variants no need
to mention clock-names explicitly.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 8c4c541224dd..eacdfcff64ad 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -1109,7 +1109,7 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 		return PTR_ERR(dsi->regulator);
 	}
 
-	dsi->regs = devm_regmap_init_mmio_clk(dev, "bus", base,
+	dsi->regs = devm_regmap_init_mmio_clk(dev, NULL, base,
 					      &sun6i_dsi_regmap_config);
 	if (IS_ERR(dsi->regs)) {
 		dev_err(dev, "Couldn't create the DSI encoder regmap\n");
@@ -1122,6 +1122,12 @@ static int sun6i_dsi_probe(struct platform_device *pdev)
 		return PTR_ERR(dsi->reset);
 	}
 
+	dsi->bus_clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(dsi->bus_clk)) {
+		dev_err(dev, "Couldn't get the DSI bus clock\n");
+		return PTR_ERR(dsi->bus_clk);
+	}
+
 	if (dsi->variant->has_mod_clk) {
 		dsi->mod_clk = devm_clk_get(dev, "mod");
 		if (IS_ERR(dsi->mod_clk)) {
@@ -1196,6 +1202,7 @@ static int __maybe_unused sun6i_dsi_runtime_resume(struct device *dev)
 	}
 
 	reset_control_deassert(dsi->reset);
+	clk_prepare_enable(dsi->bus_clk);
 	if (dsi->variant->has_mod_clk)
 		clk_prepare_enable(dsi->mod_clk);
 
@@ -1227,6 +1234,7 @@ static int __maybe_unused sun6i_dsi_runtime_suspend(struct device *dev)
 
 	if (dsi->variant->has_mod_clk)
 		clk_disable_unprepare(dsi->mod_clk);
+	clk_disable_unprepare(dsi->bus_clk);
 	reset_control_assert(dsi->reset);
 	regulator_disable(dsi->regulator);
 
-- 
2.18.0.321.gffc6fa0e3

