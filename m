Return-Path: <SRS0=2LfR=BX=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DC9C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 20:24:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CC6220791
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Aug 2020 20:24:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgHMUYZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Aug 2020 16:24:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgHMUYY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Aug 2020 16:24:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FDB7C061757
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2020 13:24:24 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1k6Jlq-0003tg-Ri; Thu, 13 Aug 2020 22:24:18 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1k6Jlp-0003OG-IY; Thu, 13 Aug 2020 22:24:17 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH] ARM: dts: imx25-pinfunc: Fix GPT function names
Date:   Thu, 13 Aug 2020 22:24:10 +0200
Message-Id: <20200813202410.5670-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

According to the reference manual of the i.MX25 the function name for
the GPT capture input is called CAPIN1. So fix the names to follow the
same naming scheme as used for the other pads and functions. Also add
one missing pad function.

There are no mainline users that needs adaption.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/arm/boot/dts/imx25-pinfunc.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx25-pinfunc.h b/arch/arm/boot/dts/imx25-pinfunc.h
index 55948e668410..908caf810351 100644
--- a/arch/arm/boot/dts/imx25-pinfunc.h
+++ b/arch/arm/boot/dts/imx25-pinfunc.h
@@ -288,7 +288,7 @@
 #define MX25_PAD_OE_ACD__GPIO_1_25		0x114 0x30c 0x000 0x05 0x000
 
 #define MX25_PAD_CONTRAST__CONTRAST		0x118 0x310 0x000 0x00 0x000
-#define MX25_PAD_CONTRAST__CC4			0x118 0x310 0x000 0x01 0x000
+#define MX25_PAD_CONTRAST__GPT4_CAPIN1		0x118 0x310 0x000 0x01 0x000
 #define MX25_PAD_CONTRAST__CSPI2_SS1		0x118 0x310 0x4a8 0x02 0x000
 #define MX25_PAD_CONTRAST__PWM4_PWMO		0x118 0x310 0x000 0x04 0x000
 #define MX25_PAD_CONTRAST__FEC_CRS		0x118 0x310 0x508 0x05 0x001
@@ -404,7 +404,7 @@
 
 #define MX25_PAD_UART1_RTS__UART1_RTS		0x178 0x370 0x000 0x00 0x000
 #define MX25_PAD_UART1_RTS__CSI_D0		0x178 0x370 0x488 0x01 0x001
-#define MX25_PAD_UART1_RTS__CC3			0x178 0x370 0x000 0x02 0x000
+#define MX25_PAD_UART1_RTS__GPT3_CAPIN1		0x178 0x370 0x000 0x02 0x000
 #define MX25_PAD_UART1_RTS__UART2_DCD		0x178 0x370 0x000 0x03 0x000
 #define MX25_PAD_UART1_RTS__GPIO_4_24		0x178 0x370 0x000 0x05 0x000
 
@@ -421,7 +421,7 @@
 
 #define MX25_PAD_UART2_RTS__UART2_RTS		0x188 0x380 0x000 0x00 0x000
 #define MX25_PAD_UART2_RTS__FEC_COL		0x188 0x380 0x504 0x02 0x002
-#define MX25_PAD_UART2_RTS__CC1			0x188 0x380 0x000 0x03 0x000
+#define MX25_PAD_UART2_RTS__GPT1_CAPIN1		0x188 0x380 0x000 0x03 0x000
 #define MX25_PAD_UART2_RTS__GPIO_4_28		0x188 0x380 0x000 0x05 0x000
 #define MX25_PAD_UART2_RTS__CSPI2_SS3		0x188 0x380 0x000 0x06 0x000
 
@@ -575,6 +575,7 @@
 #define MX25_PAD_GPIO_C__PWM4_PWMO		0x1fc 0x3f8 0x000 0x01 0x000
 #define MX25_PAD_GPIO_C__I2C2_SCL		0x1fc 0x3f8 0x51c 0x02 0x001
 #define MX25_PAD_GPIO_C__KPP_COL4		0x1fc 0x3f8 0x52c 0x03 0x001
+#define MX25_PAD_GPIO_C__GPT2_CAPIN1		0x1fc 0x3f8 0x000 0x04 0x000
 #define MX25_PAD_GPIO_C__CSPI1_SS2		0x1fc 0x3f8 0x000 0x05 0x000
 #define MX25_PAD_GPIO_C__CAN2_TX		0x1fc 0x3f8 0x000 0x06 0x000
 #define MX25_PAD_GPIO_C__CSPI2_SS2		0x1fc 0x3f8 0x000 0x07 0x000
-- 
2.27.0

