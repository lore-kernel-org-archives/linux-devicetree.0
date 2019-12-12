Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5244CC3F68F
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 17:17:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 22B7322527
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 17:17:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWMkVLaF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730007AbfLLRRv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 12:17:51 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:38810 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730033AbfLLRRv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 12:17:51 -0500
Received: by mail-vs1-f65.google.com with SMTP id y195so2116628vsy.5
        for <devicetree@vger.kernel.org>; Thu, 12 Dec 2019 09:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kRfKAPfMEUm/2zkHboQLQaylg2t7tUTfEAgsKFsqRwk=;
        b=kWMkVLaF5J/gfIhP5JTmWGQ2KzV9kG2a0uL+IoO/BSzuvXv/0ivsuSG1odSRxMt07z
         95AWvm4Tr18IzUOCXt0r+/3+LzO1Uj4fAPWzEPKmk/vmuLoG8l0marnXnUD7vprvVfku
         sbTAlPyuC3OA1PVMrHf7uWLuTX9mozCgCDRUDttkoGqrb37TmmCXs87+hTr2tOUIVp7n
         BeNt5xvErq33WbHzPEckgv1lwRkxMkj5voedlEBCpoE5CymKq/xpFrqvP4DYH4hShrlG
         VRSUvCAGF2I/se/KjFIcKuhSKptScUTP4Joflikk0Q9Gsrc1JbCsF7s9k7YcUmguWUgd
         fPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kRfKAPfMEUm/2zkHboQLQaylg2t7tUTfEAgsKFsqRwk=;
        b=cZiECB1i8sfWwYLgium1xQV9jsJDGVw1m9O+UtH+8jnHIgQp5tLXD4fNNVk4gA29HX
         XoYmVOjlbskYZOKJvcbps85h9TXwF2ZnCNnk3inyQcNmhqAn+oQRV/kHkbCaAtzy5Nzk
         sMaeyCsv9qj17UlS7yv3CSDGxvZyITz+NUkjU2UCIkiuBjiLcahsUi1BP5DB6GnYg7fI
         Q+L9+SjSYDF5A/OVJkcylGEN8Umxk2Zs9UUq+H7KRu2orxPISDcIz15akOhQubzL9nap
         Ebb/EosUYneLnKTLAq3m5iQZ3UOPkbHA9WNTEppdpB43CpwuReaZh/9VTcO2tkKhXJQp
         gS1w==
X-Gm-Message-State: APjAAAXyBu0a7Qe4rZYWA8u+iqIAE4r3lPXk7/RA2dAk46UDUSeRgs32
        vzFbTKi9SLZr08uOM5uO3Xg=
X-Google-Smtp-Source: APXvYqxJ4kY7LqW4cC0Ruf0k9jB/m0MDR/MN8O+V6C+YRc6quplpNwBJe5CJotpscNj1PGfc7g+/NQ==
X-Received: by 2002:a67:cd85:: with SMTP id r5mr7619017vsl.79.1576171070462;
        Thu, 12 Dec 2019 09:17:50 -0800 (PST)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id g140sm4246759vkf.18.2019.12.12.09.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 09:17:49 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] ARM: imx_v6_v7_defconfig: Select the TFP410 driver
Date:   Thu, 12 Dec 2019 14:17:04 -0300
Message-Id: <20191212171704.23604-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212171704.23604-1-festevam@gmail.com>
References: <20191212171704.23604-1-festevam@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Some boards like imx51-babbage, imx53-cx9020 and imx6q-utilite-pro
have a TFP410 DVI bridge chip.

Select its driver by default.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
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

