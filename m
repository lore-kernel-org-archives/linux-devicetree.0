Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B96C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 20:25:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 725C320709
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 20:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597782336;
	bh=aqdvzDx7NVgXD+Mv6grL/bVyS5wqALlm7cAFdctuyTk=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=sgdhfnsmIhqy1impt8Bo9fNfBRsTFTjMdPcVVVeLieLnLXLj8LdcNqn2svmGjPEd0
	 rR8cEz96cWGwf3tX2hR8FXkDzuto020QRrtFtalgAezZv/kCICUu1d1D9FQwJt4ocp
	 JLiz3j2qNlzVRbYCbpt7Q9JItPTOobGfhiiSw6dc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgHRUZf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 16:25:35 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:37578 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgHRUZf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Aug 2020 16:25:35 -0400
Received: by mail-io1-f68.google.com with SMTP id b16so22544584ioj.4
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 13:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=unMCe/BLdS+VvMIYasq8w8t2TkGYp+baa2A5Un4qXT4=;
        b=t00ZJMgUaTzsil9bhU8Es+bPufwY+3SrFaL1lMY39IT2J11m62k8jQ2QLdWKTneqbp
         K+OXkz75Wlq2YTv3RaEYyM0PaGHf8UI+3Br80VMkVPz0mdbMPqL2q5UYbDKhbzeRU8AF
         mIIGZ6zKBrZOO+iEaQmb47S5gTkrPGWmLWnz0XUZ899lvtGWD55qCIFKoD4DnNnAujbk
         dmUC5rAcME9gM3R+zhKwWThBOn2Ajbksv7aBXcHEXt2v1PsBLg501ObDMKac6YnyCXR+
         cFQgbcW4QLBAXSM86oeJsJKTSNps0ID5vBukLmQsCt7/6ZKttCIH9SCEHa+jVvS/GWQI
         vhww==
X-Gm-Message-State: AOAM533BA9OlbmhBqf5HBQlMfOWrh6Vqd+uLWXOV9iZZ2zK0C3e2UwaW
        wMgn89ezHNmfa5dfdPHR6A==
X-Google-Smtp-Source: ABdhPJxmSJSHYTVX8WnO/kBVypgafxz99/poW6PJcjJJEFmjc6bGa7uvGi3/xEEwWrlPFzo0xZnjVg==
X-Received: by 2002:a6b:6204:: with SMTP id f4mr17252073iog.56.1597782334430;
        Tue, 18 Aug 2020 13:25:34 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
        by smtp.googlemail.com with ESMTPSA id h18sm11488342iow.16.2020.08.18.13.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 13:25:33 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH] arm64: dts: imx: Add missing imx8mm-beacon-kit.dtb to build
Date:   Tue, 18 Aug 2020 14:25:31 -0600
Message-Id: <20200818202531.3918168-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The imx8mm-beacon-kit.dtb was never added to dtbs-y and wasn't getting
built. Fix it.

Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development kit")
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm64/boot/dts/freescale/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index a39f0a1723e0..903c0eb61290 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -28,6 +28,7 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-honeycomb.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-qds.dtb
 dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-rdb.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mn-ddr4-evk.dtb
-- 
2.25.1

