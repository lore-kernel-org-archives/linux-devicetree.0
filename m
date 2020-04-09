Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1C9C352B6
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:52:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA0A12082D
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:52:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gwzJ4sCs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgDIRwx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 13:52:53 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43]:37078 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726621AbgDIRwx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 13:52:53 -0400
Received: by mail-wm1-f43.google.com with SMTP id z6so648891wml.2;
        Thu, 09 Apr 2020 10:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JXbS4Svzqk1Z8bCDsWfX5K++fFmOKh7LOIAzqa7Oph4=;
        b=gwzJ4sCsFraPFBysmE88o+9ELSdwCXwGYyJx6m+SUAQiGeW/xmYk5E9kiaw/9Za3iK
         mb9C6J5IcI087eLCLmRCVaLffbIoOcAMm6sWykYmhU8vwTVMVESkmfcGg7mIXtaDJLoq
         wCnew9R+ynIxydvnyMINFn20RCYTgxfvvRDgCVDGfLhO1k4GLMBZiqMT+6s+ESPi5+PU
         gk+9CeRXeJzqGxLEFtT7V8R83kYUwBaMIIy27EVTHq4LUgz/DXAaMCV7m6s6pfTpJ88t
         taAHVf6/DHetqXQNNNnXXmwKfwxcWsfp2MAK8BlxDKWmquf5A+ypZRB7zFWbmJWZuv2U
         fr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JXbS4Svzqk1Z8bCDsWfX5K++fFmOKh7LOIAzqa7Oph4=;
        b=dODrOWkJLds0j15685mVHJmB94aQedBVIFmn/yszKgWTG9s8Q/P8X5a+UEZ7FtOqaD
         ckuqnw1OpCwEGKb0aWwPmzMUW7kpbDaW9bU8bBzCoxepZm9xXR1AnUjPqBa6uMB88j17
         oUN7D6CAww59Ont566k8wnlrl8vJJI9adLhL23t9McRVvl+uejjLTsy9+br5zTlXEFY7
         Nd55cBuRuS6Akp+KLytuUmLvI2HRtzR5GRRIxzZ05DuO2e2hnVVtfvWNOIMpRgtYupAh
         mUGrILoWf4Z91bKUvfZwvhFCI5T2yRBd+8ejS9yKocX0DBWaESFcp5xlB6qBCal4AV/e
         O/2Q==
X-Gm-Message-State: AGi0Pub+3QodE6fpk9EJcLfcsOWx2dIvrxPLUx3nM7YFFBpCia5t4Ozw
        lpm1Z06uruMydkI994CpXSE=
X-Google-Smtp-Source: APiQypIOlJqf4MQPaE8pJ7IsdKAGi+rLG4dEYSpvHJFqoqxHl4SenXqyD0xjfN7zAWjMB9yvQpvNMA==
X-Received: by 2002:a1c:6503:: with SMTP id z3mr1079964wmb.92.1586454772182;
        Thu, 09 Apr 2020 10:52:52 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id 68sm3200213wrm.65.2020.04.09.10.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 10:52:51 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 04/14] clk: tegra: Rename Tegra124 EMC clock source file
Date:   Thu,  9 Apr 2020 19:52:28 +0200
Message-Id: <20200409175238.3586487-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200409175238.3586487-1-thierry.reding@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This code is only used on Tegra124, so rename it accordingly to make it
more consistent with other file names.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/Makefile                          | 2 +-
 drivers/clk/tegra/{clk-emc.c => clk-tegra124-emc.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/clk/tegra/{clk-emc.c => clk-tegra124-emc.c} (100%)

diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
index 1f7c30f87ece..dec508ef2ada 100644
--- a/drivers/clk/tegra/Makefile
+++ b/drivers/clk/tegra/Makefile
@@ -14,7 +14,6 @@ obj-y					+= clk-tegra-audio.o
 obj-y					+= clk-tegra-periph.o
 obj-y					+= clk-tegra-fixed.o
 obj-y					+= clk-tegra-super-gen4.o
-obj-$(CONFIG_TEGRA_CLK_EMC)		+= clk-emc.o
 obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += clk-tegra20.o
 obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= clk-tegra20-emc.o
 obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         += clk-tegra30.o
@@ -22,6 +21,7 @@ obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= clk-tegra20-emc.o
 obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= clk-tegra114.o
 obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124.o
 obj-$(CONFIG_TEGRA_CLK_DFLL)		+= clk-tegra124-dfll-fcpu.o
+obj-$(CONFIG_TEGRA_CLK_EMC)		+= clk-tegra124-emc.o
 obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+= clk-tegra124.o
 obj-y					+= cvb.o
 obj-$(CONFIG_ARCH_TEGRA_210_SOC)	+= clk-tegra210.o
diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-tegra124-emc.c
similarity index 100%
rename from drivers/clk/tegra/clk-emc.c
rename to drivers/clk/tegra/clk-tegra124-emc.c
-- 
2.24.1

