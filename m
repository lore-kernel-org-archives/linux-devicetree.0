Return-Path: <SRS0=d5cD=3G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0CBC33C9E
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 23:08:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A024A21D7D
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 23:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579302531;
	bh=hhp34OiFef2NZ1niBTkhlEUt0ypmquxtjX9wniXBbtg=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=lU26FjcsYJpOsR4IrRvcYIspP5TifFQmj6mTJPP1o9ek4i7LcVF8K2DE6fw3OjakL
	 oBQz0wlmj8WZa/NsobV93vbEOtMNG/UV21go/cBSLgvobCtjgBwzvgfb/548n0XcrE
	 2E0gCiHZkppE0UbEym4pvJwLPrvWLyuKaCRCTs4c=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729368AbgAQXIv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jan 2020 18:08:51 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40709 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729099AbgAQXIv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jan 2020 18:08:51 -0500
Received: by mail-oi1-f196.google.com with SMTP id c77so23686148oib.7
        for <devicetree@vger.kernel.org>; Fri, 17 Jan 2020 15:08:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kM6E5RI0gVieeVXW7R7Tpe2qYJ/SdGRuJk38JqzG80A=;
        b=G9kROVKqQlMGNir/Qno71e3PZv3IgaziMTxiJFWh5Vp8huYiBmXnGzRz8hpzgj77RH
         Z5UE9+X1gYFpLeDC7quW3YtrQzn5kj9NQhJSuZhGlR6xJhKHmmwRkLzlYQHk1mgBTufb
         7PJg5jVgpHBf1OButEC17AI6Qei38+8hzAZ/zciLWO6CBpSh02gv9gIzbzyECH7YGxNh
         XIp9djDm8UMPMub+mASfdu2lEqIUViGBKGchKSUbNSoHH2H9pUt1Dh1rsqLmesPFNrXU
         zKVy7tMvXsr6/bKsfi/TAkZkPq6DuCBpLz0BbQznVFWnPk8Li60w4vmDTjjw6GGN4LKB
         2KVQ==
X-Gm-Message-State: APjAAAWH3qK7+FMbVwKFy627FA30tXdgaaHwA0BQiY/zbI7vvvkiTwi+
        k+5sQwrQdoRomV43lVMFR6OyaVw=
X-Google-Smtp-Source: APXvYqzaCWlwXj5q4arj1fmnxMYbL1aksXCZLq/DerNjVsRxT+FDSFmcAs5zUNcDcY6JlHTwZn0oeQ==
X-Received: by 2002:aca:3542:: with SMTP id c63mr5245144oia.135.1579302530055;
        Fri, 17 Jan 2020 15:08:50 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id m185sm8272443oia.26.2020.01.17.15.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 15:08:49 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH] arm: imx: dts: Kill off "simple-panel" compatibles
Date:   Fri, 17 Jan 2020 17:08:48 -0600
Message-Id: <20200117230848.25330-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

"simple-panel" is a Linux driver and has never been an accepted upstream
compatible string, so remove it.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/boot/dts/imx6q-novena.dts          | 2 +-
 arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q-novena.dts b/arch/arm/boot/dts/imx6q-novena.dts
index 61347a545d6c..69f170ff31c5 100644
--- a/arch/arm/boot/dts/imx6q-novena.dts
+++ b/arch/arm/boot/dts/imx6q-novena.dts
@@ -107,7 +107,7 @@
 	};
 
 	panel: panel {
-		compatible = "innolux,n133hse-ea1", "simple-panel";
+		compatible = "innolux,n133hse-ea1";
 		backlight = <&backlight>;
 	};
 
diff --git a/arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts b/arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts
index 3749fdda3611..5d3805b07032 100644
--- a/arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts
+++ b/arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts
@@ -25,7 +25,7 @@
 	};
 
 	panel {
-		compatible = "auo,g101evn010", "simple-panel";
+		compatible = "auo,g101evn010";
 		power-supply = <&ldo4_ext>;
 		backlight = <&lcd_backlight>;
 
-- 
2.20.1

