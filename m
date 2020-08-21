Return-Path: <SRS0=+ed7=B7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE10FC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 14:44:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B91B221741
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 14:44:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r0iV8Pe4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727864AbgHUOoy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Aug 2020 10:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727940AbgHUOoa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Aug 2020 10:44:30 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A67C0613ED
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2020 07:44:30 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b11so1031044lfe.10
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2020 07:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aXHPVuBnUltzTW16E/CnLpjc3EIf1ZbgHUhxEqUcDwc=;
        b=r0iV8Pe4LG5mSz7gWwPDu4qiBMSkQWiFp7Zm5mwLQ7zpUwsfMOkaZahYP+quUzI+0K
         5doGgwPxZPE6l+dMP7Neddt7GCsYf1u3+kRV64Qla5r8XyELCd9SsQ5EplzNXrhVEDeq
         yZMUqfMnjPBEI47t28a1wbGXhTJ/7f31kMz8WqoroRR3oXQLwbGD62spf+4bpIGm25+b
         uSRB1nK98lesOQx+FjHhkDCVjo2wevq73W0IixXBhuvxbeB9KI6CyCnJtpJqvvBLm9rb
         dlNbupG9u9jWPQauLWG3GM1vLnqrx412PJW2UD1w3aGtR+zNUW887QoFiHz7U/aHuJaV
         zh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aXHPVuBnUltzTW16E/CnLpjc3EIf1ZbgHUhxEqUcDwc=;
        b=jw1LZwghBzqabINIg7rX02m3bShLEqtG/FvQm/Hoy6xi8KTKOW1dsVH9J3sj0NLVu0
         zfKtrga43vU3n7YWcQaM+VhdlKUG3RE2S2nAMeael1b/81x+nIJmRihRAeIhGYIrOkVU
         boxrFFqXUVI/lYotJkxiIbn/IM7ZIV6tKHXwe+6bIuhKM/fUMEYz4CISgvfCbGr1jRAE
         V/rpWP58zBr9FWCqm0MCL3BukN5gUQ6CCKOIZxUuqpJPkyiII5FH+rwEWo2aXcp2kEde
         Q19WnsfQKQibgVlCrwHQuX4hA/1oiOIV4HUs9PBWUoc27iUysTBg60Kq4iFaE4i4a+5d
         haNw==
X-Gm-Message-State: AOAM532oYNKcEQwsWC2i/AfhQvvRX2DDXtfugu7Ul5X0ZF0YMONBMUhz
        uP/Mkh2r0VlmI8/UPNWFqoUQ2Q==
X-Google-Smtp-Source: ABdhPJzjQWabtQpT9hIy6AInrgGe6Wh4JUvT4Eh1HedRmvlwoxUEQ8fIhonVLJ3w0OSpcpT3KBRQrQ==
X-Received: by 2002:ac2:5338:: with SMTP id f24mr1606706lfh.5.1598021068437;
        Fri, 21 Aug 2020 07:44:28 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id u10sm425301lfo.39.2020.08.21.07.44.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Aug 2020 07:44:27 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com
Subject: [PATCH v2 4/7] soc: ti: pruss: Add support for PRU-ICSS subsystems on AM57xx SoCs
Date:   Fri, 21 Aug 2020 16:42:41 +0200
Message-Id: <1598020964-29877-5-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The AM57xx family of SoCs supports two PRU-ICSS instances, each of
which has two PRU processor cores. The two PRU-ICSS instances are
identical to each other, and are very similar to the PRU-ICSS1 of
AM33xx/AM43xx except for a few minor differences like the RAM sizes
and the number of interrupts coming into the MPU INTC. They do
not have a programmable module reset line unlike those present on
AM33xx/AM43xx SoCs. The modules are reset just like any other IP
with the SoC's global cold/warm resets. Each PRU-ICSS's INTC is also
preceded by a Crossbar that enables multiple external events to be
routed to a specific number of input interrupt events. Any interrupt
event directed towards PRUSS needs this crossbar to be setup properly
on the firmware side.

The existing PRUSS platform driver has been enhanced to support
these AM57xx PRU-ICSS instances through new AM57xx specific
compatible for properly probing and booting all the different PRU
cores in each PRU-ICSS processor subsystem. A build dependency with
SOC_DRA7XX is also added to enable the driver to be built in
AM57xx-only configuration (there is no separate Kconfig option
for AM57xx vs DRA7xx).

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
---
v1->v2:
 - No changes.
---
 drivers/soc/ti/Kconfig | 2 +-
 drivers/soc/ti/pruss.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
index 40d6a22..99dbc14 100644
--- a/drivers/soc/ti/Kconfig
+++ b/drivers/soc/ti/Kconfig
@@ -103,7 +103,7 @@ config TI_K3_SOCINFO
 
 config TI_PRUSS
 	tristate "TI PRU-ICSS Subsystem Platform drivers"
-	depends on SOC_AM33XX || SOC_AM43XX
+	depends on SOC_AM33XX || SOC_AM43XX || SOC_DRA7XX
 	select MFD_SYSCON
 	help
 	  TI PRU-ICSS Subsystem platform specific support.
diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index 04938ba..5df4caa 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -161,6 +161,7 @@ static const struct of_device_id pruss_of_match[] = {
 	{ .compatible = "ti,am3356-pruss" },
 	{ .compatible = "ti,am4376-pruss0", .data = &am437x_pruss0_data, },
 	{ .compatible = "ti,am4376-pruss1", .data = &am437x_pruss1_data, },
+	{ .compatible = "ti,am5728-pruss" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pruss_of_match);
-- 
2.7.4

