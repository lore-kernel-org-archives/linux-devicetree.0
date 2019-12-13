Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2078C5072D
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:37:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 02ED124718
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 20:37:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFE9gbV0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727531AbfLMN6x (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 08:58:53 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:46604 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727489AbfLMN6x (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 08:58:53 -0500
Received: by mail-pj1-f67.google.com with SMTP id z21so1231366pjq.13
        for <devicetree@vger.kernel.org>; Fri, 13 Dec 2019 05:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vcUNQxR7kklwsKYBxB+fFt1v2oL8rvHjk/tVQSdWeAA=;
        b=EFE9gbV0c7TC7yH0DM4JMFqPzwtx2/mShQaSXX7dLYtmDXa7RyVMKKuOXY28klniZg
         0ayqVkD6UvEloW2Y66ddKuh0jL3EaeVfqSG5HSqcYlcqzE/toAkgR+9phdi9CXRDShsk
         SmroiraAPwOMKlo1MrOQI6u79oH9a3xEbazN+RIwJtZFQmF0CMVgb5+yoBifE0gMmp4W
         qUHE21rfhfUSTYcSzgo++MwF+wekwkYAe+Yhn5Wd/AMV0j64hS6BDJCOoCGWWgCWKmYi
         uNcmONcBuQowyz7sjKWgiyPofQ5SIjc0u9eZEqL6zcwL3qtDPWL7WOABmbjbIL36mkyZ
         xnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vcUNQxR7kklwsKYBxB+fFt1v2oL8rvHjk/tVQSdWeAA=;
        b=VNCgIbk3td21ETRM9xOTtGBMymCalQcXX3DaoMkQwycBest0ZaiSu3iJdAIkw6Lgr0
         4njsSAy5slQ4jaIwepLWqTJAONuUPRzirw3LAMY7HlEPsuSDotDCpXl6C65uQiu3KzTm
         iz4KfkYJmPXL4bcbNyR22I+74bRUbu1IxGmpuQoL55F6t86M1PaVgOCNbx12QNVtGi9+
         a1uZONgpdLmI6W11hm1/d+V/ZlEMleq6keniXqQR2QX88WCDgP524NYh2EPiGVyH537N
         wP/JAnvjKT8hGt3gj2a5awNwJkkOn7+cih6EL0wdQ9Y6bsMfF9I3AiLS+9ixlTjLTLuq
         bl/g==
X-Gm-Message-State: APjAAAUiv86c5xVRxp1UDTKqpNzeKBo81sSw1V3yZUAtORQy4rVzqylI
        Yeug6dNsyFhl3n6LtDulDfU=
X-Google-Smtp-Source: APXvYqzaLN80aPfcy7vGwykcX7yav2qHw0Y40Aml6Mu12LESmEJrpbBNSzAbx1OaeHR9FiUwxsJ16Q==
X-Received: by 2002:a17:902:b187:: with SMTP id s7mr13765841plr.97.1576245532462;
        Fri, 13 Dec 2019 05:58:52 -0800 (PST)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id y6sm10778538pgc.10.2019.12.13.05.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 05:58:51 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     robh+dt@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 2/2] ARM: imx_v6_v7_defconfig: Select the TFP410 driver
Date:   Fri, 13 Dec 2019 10:58:38 -0300
Message-Id: <20191213135838.28697-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213135838.28697-1-festevam@gmail.com>
References: <20191213135838.28697-1-festevam@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Some boards like imx51-babbage, imx53-cx9020 and imx6q-utilite-pro
have a TFP410 DVI bridge chip.

Select its driver by default.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- None

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index d5f31e436032..e1a219573966 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -283,6 +283,7 @@ CONFIG_DRM_MSM=y
 CONFIG_DRM_PANEL_LVDS=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_SEIKO_43WVF1G=y
+CONFIG_DRM_TI_TFP410=y
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
 CONFIG_DRM_DW_HDMI_CEC=y
 CONFIG_DRM_IMX=y
-- 
2.17.1

