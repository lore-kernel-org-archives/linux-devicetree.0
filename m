Return-Path: <SRS0=+ed7=B7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDBAC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 14:45:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 929192173E
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 14:45:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tnmSau2z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728020AbgHUOpE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Aug 2020 10:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727961AbgHUOof (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Aug 2020 10:44:35 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD5CC06179E
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2020 07:44:34 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id t23so2136803ljc.3
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2020 07:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OsJasaQyy7/E+kPEpA8PlFznj7k6c2w5j5pqgaCetRA=;
        b=tnmSau2zUkTpgpUzOkknDCLR9TWzijsVx7GOYiahq4Ohc031GC427oYP5lnbTSJAMK
         22fIY12Q77SJlGbp8+yLmrvZHhI8z3A5WiPPMAMQnpk+nf/q22aD5KnirywVU8dlHime
         d3/uEdm2pvtNJhWs5lSfN1F8p7/TCzrEOFem8u7326iPcdfRxudvh/ehrEUoCrqAn2+p
         TgimM2cnB5klT3KSzAWKLpiAvkGPLjFLzJEU3kJ9Lg02GGAEvgkamtbsxWUIQpFSUY5t
         0KxIiBC6REcvToucSJ/BUnE2dRwkT1XZykuBYFXt1CDQmtukt7yC9yseK7elwufxljPG
         Y9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OsJasaQyy7/E+kPEpA8PlFznj7k6c2w5j5pqgaCetRA=;
        b=mNOV0X6oRZIQx3HjL/w1npYXnvM/5vvcHd01KkRNkj4Glqr7aRlRv0PzDj6liRrWFw
         gl6mYs+u6zqEonO4Dud9CVtX1hdWkp52EF4fmwpkCPD4sYf6zxZo4c8h16nf2pnkDh28
         f9FMLkNo/Uut9/AcL4GAI87VSPIkmBW73WWn+5d/ZNNdKBvHFAVsvGrFl87ElaEgsS4t
         QuMCLy66PrhqGcPHk+e5Vzx5TbuCcq0v1BqeOWDsKsPzbdZ3lG0eyC5+8admeAmH6veG
         E1FMhT3Lk17m4/82I6PdNI+p4tNFLXQqKYxccV3ztuuCyfsStWXR3zqSYlkCKTKedpJd
         gjbg==
X-Gm-Message-State: AOAM5304cchAkSe3RFzaOsz8qofZ59jNWAGxk/vVPZXCq1aybfT/YRJa
        8kEdka+edyF1uQYrchPDzdeTQg==
X-Google-Smtp-Source: ABdhPJwXsAlyqcJbQaNTiBtkdJNTdJaLN5zakF9xvRHIj687NR42OvYQqWGEycOsw/SSIKxnzRVS0g==
X-Received: by 2002:a2e:95cc:: with SMTP id y12mr1581561ljh.138.1598021072622;
        Fri, 21 Aug 2020 07:44:32 -0700 (PDT)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id u10sm425301lfo.39.2020.08.21.07.44.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Aug 2020 07:44:32 -0700 (PDT)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com
Subject: [PATCH v2 6/7] soc: ti: pruss: Enable support for ICSSG subsystems on K3 AM65x SoCs
Date:   Fri, 21 Aug 2020 16:42:43 +0200
Message-Id: <1598020964-29877-7-git-send-email-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
References: <1598020964-29877-1-git-send-email-grzegorz.jaszczyk@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The K3 AM65x family of SoCs have the next generation of the PRU-ICSS
processor subsystem capable of supporting Gigabit Ethernet, and is
commonly referred to as ICSSG. These SoCs contain typically three
ICSSG instances named ICSSG0, ICSSG1 and ICSSG2. The three ICSSGs are
identical to each other for the most part with minor SoC integration
differences and capabilities. The ICSSG2 supports slightly enhanced
features like SGMII mode Ethernet, while the ICSS0 and ICSSG1 instances
are limited to MII mode only.

The ICSSGs on K3 AM65x SoCs are in general super-sets of the PRUSS on the
AM57xx/66AK2G SoCs. They include two additional auxiliary PRU cores called
RTUs and few other additional sub-modules. The interrupt integration is
also different on the K3 AM65x SoCs and are propagated through various
SoC-level Interrupt Router and Interrupt Aggregator blocks. Other IP level
differences include different constant tables, differences in system event
interrupt input sources etc. They also do not have a programmable module
reset line like those present on AM33xx/AM43xx SoCs. The modules are reset
just like any other IP with the SoC's global cold/warm resets.

The existing pruss platform driver has been updated to support these new
ICSSG instances through new AM65x specific compatibles. A build dependency
with ARCH_K3 is added to enable building all the existing PRUSS platform
drivers for this ARMv8 platform.

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
index c290343..f5b82ff 100644
--- a/drivers/soc/ti/Kconfig
+++ b/drivers/soc/ti/Kconfig
@@ -103,7 +103,7 @@ config TI_K3_SOCINFO
 
 config TI_PRUSS
 	tristate "TI PRU-ICSS Subsystem Platform drivers"
-	depends on SOC_AM33XX || SOC_AM43XX || SOC_DRA7XX || ARCH_KEYSTONE
+	depends on SOC_AM33XX || SOC_AM43XX || SOC_DRA7XX || ARCH_KEYSTONE || ARCH_K3
 	select MFD_SYSCON
 	help
 	  TI PRU-ICSS Subsystem platform specific support.
diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index d5f128e..ccc9783 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -163,6 +163,7 @@ static const struct of_device_id pruss_of_match[] = {
 	{ .compatible = "ti,am4376-pruss1", .data = &am437x_pruss1_data, },
 	{ .compatible = "ti,am5728-pruss" },
 	{ .compatible = "ti,k2g-pruss" },
+	{ .compatible = "ti,am654-icssg" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pruss_of_match);
-- 
2.7.4

