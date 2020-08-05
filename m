Return-Path: <SRS0=mz9M=BP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA12BC433E1
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Aug 2020 19:22:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FA92206D4
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Aug 2020 19:22:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728281AbgHETWa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 5 Aug 2020 15:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728860AbgHERlu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 5 Aug 2020 13:41:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8270C0D9417
        for <devicetree@vger.kernel.org>; Wed,  5 Aug 2020 08:13:14 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1k3L6N-0007a9-PT; Wed, 05 Aug 2020 17:13:11 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1k3L6M-00011k-T6; Wed, 05 Aug 2020 17:13:10 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] ARM: dts: imx25-pinfunc: add missing and fix wrong SPI related defintions
Date:   Wed,  5 Aug 2020 17:13:07 +0200
Message-Id: <20200805151307.18377-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805145234.17486-1-u.kleine-koenig@pengutronix.de>
References: <20200805145234.17486-1-u.kleine-koenig@pengutronix.de>
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

I used the i.MX25 Reference Manual (Rev 2 01/2011) as source for these
additions and fixes.

No mainline dts is affected by the fixes (nor obviously by the
additions).

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

I had a wip commit in my tree which made v1 non-applicable. Here is a
proper patch that applies to 5.8 and has an additional note in the
commit log.

Best regards
Uwe

 arch/arm/boot/dts/imx25-pinfunc.h | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx25-pinfunc.h b/arch/arm/boot/dts/imx25-pinfunc.h
index 111bfdcbe552..e14140e62b9b 100644
--- a/arch/arm/boot/dts/imx25-pinfunc.h
+++ b/arch/arm/boot/dts/imx25-pinfunc.h
@@ -87,6 +87,7 @@
 #define MX25_PAD_EB1__EB1			0x044 0x25c 0x000 0x00 0x000
 #define MX25_PAD_EB1__AUD4_RXD			0x044 0x25c 0x460 0x04 0x000
 #define MX25_PAD_EB1__GPIO_2_13			0x044 0x25c 0x000 0x05 0x000
+#define MX25_PAD_EB1__CSPI3_SS1			0x044 0x25c 0x4c0 0x06 0x000
 
 #define MX25_PAD_OE__OE				0x048 0x260 0x000 0x00 0x000
 #define MX25_PAD_OE__AUD4_TXC			0x048 0x260 0x000 0x04 0x000
@@ -112,6 +113,7 @@
 #define MX25_PAD_CS5__CSPI3_MISO		0x058 0x268 0x4b4 0x06 0x000
 
 #define MX25_PAD_NF_CE0__NF_CE0			0x05c 0x26c 0x000 0x00 0x000
+#define MX25_PAD_NF_CE0__CSPI1_SS3		0x05c 0x26c 0x490 0x01 0x000
 #define MX25_PAD_NF_CE0__GPIO_3_22		0x05c 0x26c 0x000 0x05 0x000
 
 #define MX25_PAD_ECB__ECB			0x060 0x270 0x000 0x00 0x000
@@ -122,6 +124,7 @@
 #define MX25_PAD_LBA__LBA			0x064 0x274 0x000 0x00 0x000
 #define MX25_PAD_LBA__UART5_RXD			0x064 0x274 0x578 0x03 0x000
 #define MX25_PAD_LBA__GPIO_3_24			0x064 0x274 0x000 0x05 0x000
+#define MX25_PAD_LBA__CSPI3_RDY			0x064 0x274 0x4b0 0x06 0x000
 
 #define MX25_PAD_BCLK__BCLK			0x068 0x000 0x000 0x00 0x000
 #define MX25_PAD_BCLK__GPIO_4_4			0x068 0x000 0x000 0x05 0x000
@@ -286,6 +289,7 @@
 
 #define MX25_PAD_CONTRAST__CONTRAST		0x118 0x310 0x000 0x00 0x000
 #define MX25_PAD_CONTRAST__CC4			0x118 0x310 0x000 0x01 0x000
+#define MX25_PAD_CONTRAST__CSPI2_SS1		0x118 0x310 0x4a8 0x02 0x000
 #define MX25_PAD_CONTRAST__PWM4_PWMO		0x118 0x310 0x000 0x04 0x000
 #define MX25_PAD_CONTRAST__FEC_CRS		0x118 0x310 0x508 0x05 0x001
 #define MX25_PAD_CONTRAST__USBH2_PWR		0x118 0x310 0x000 0x06 0x000
@@ -298,7 +302,7 @@
 #define MX25_PAD_CSI_D2__UART5_RXD		0x120 0x318 0x578 0x01 0x001
 #define MX25_PAD_CSI_D2__SIM1_CLK0		0x120 0x318 0x000 0x04 0x000
 #define MX25_PAD_CSI_D2__GPIO_1_27		0x120 0x318 0x000 0x05 0x000
-#define MX25_PAD_CSI_D2__CSPI3_MOSI		0x120 0x318 0x000 0x07 0x000
+#define MX25_PAD_CSI_D2__CSPI3_MOSI		0x120 0x318 0x4b8 0x07 0x001
 
 #define MX25_PAD_CSI_D3__CSI_D3			0x124 0x31c 0x000 0x00 0x000
 #define MX25_PAD_CSI_D3__UART5_TXD		0x124 0x31c 0x000 0x01 0x000
@@ -310,23 +314,25 @@
 #define MX25_PAD_CSI_D4__UART5_RTS		0x128 0x320 0x574 0x01 0x001
 #define MX25_PAD_CSI_D4__SIM1_VEN0		0x128 0x320 0x000 0x04 0x000
 #define MX25_PAD_CSI_D4__GPIO_1_29		0x128 0x320 0x000 0x05 0x000
-#define MX25_PAD_CSI_D4__CSPI3_SCLK		0x128 0x320 0x000 0x07 0x000
+#define MX25_PAD_CSI_D4__CSPI3_SCLK		0x128 0x320 0x4ac 0x07 0x001
 
 #define MX25_PAD_CSI_D5__CSI_D5			0x12c 0x324 0x000 0x00 0x000
 #define MX25_PAD_CSI_D5__UART5_CTS		0x12c 0x324 0x000 0x01 0x000
 #define MX25_PAD_CSI_D5__SIM1_TX0		0x12c 0x324 0x000 0x04 0x000
 #define MX25_PAD_CSI_D5__GPIO_1_30		0x12c 0x324 0x000 0x05 0x000
-#define MX25_PAD_CSI_D5__CSPI3_RDY		0x12c 0x324 0x000 0x07 0x000
+#define MX25_PAD_CSI_D5__CSPI3_RDY		0x12c 0x324 0x4b0 0x07 0x001
 
 #define MX25_PAD_CSI_D6__CSI_D6			0x130 0x328 0x000 0x00 0x000
 /* SION must be set; see the comment for MX25_PAD_SD1_CMD__ESDHC1_CMD. */
 #define MX25_PAD_CSI_D6__ESDHC2_CMD		0x130 0x328 0x4e0 0x12 0x001
 #define MX25_PAD_CSI_D6__SIM1_PD0		0x130 0x328 0x000 0x04 0x000
 #define MX25_PAD_CSI_D6__GPIO_1_31		0x130 0x328 0x000 0x05 0x000
+#define MX25_PAD_CSI_D6__CSPI3_SS0		0x130 0x328 0x4bc 0x07 0x001
 
 #define MX25_PAD_CSI_D7__CSI_D7			0x134 0x32c 0x000 0x00 0x000
 #define MX25_PAD_CSI_D7__ESDHC2_CLK		0x134 0x32C 0x4dc 0x02 0x001
 #define MX25_PAD_CSI_D7__GPIO_1_6		0x134 0x32c 0x000 0x05 0x000
+#define MX25_PAD_CSI_D7__CSPI3_SS1		0x134 0x32c 0x4c0 0x07 0x001
 
 #define MX25_PAD_CSI_D8__CSI_D8			0x138 0x330 0x000 0x00 0x000
 #define MX25_PAD_CSI_D8__AUD6_RXC		0x138 0x330 0x000 0x02 0x000
@@ -417,10 +423,12 @@
 #define MX25_PAD_UART2_RTS__FEC_COL		0x188 0x380 0x504 0x02 0x002
 #define MX25_PAD_UART2_RTS__CC1			0x188 0x380 0x000 0x03 0x000
 #define MX25_PAD_UART2_RTS__GPIO_4_28		0x188 0x380 0x000 0x05 0x000
+#define MX25_PAD_UART2_RTS__CSPI2_SS3		0x188 0x380 0x000 0x06 0x000
 
 #define MX25_PAD_UART2_CTS__UART2_CTS		0x18c 0x384 0x000 0x00 0x000
 #define MX25_PAD_UART2_CTS__FEC_RX_ERR		0x18c 0x384 0x518 0x02 0x002
 #define MX25_PAD_UART2_CTS__GPIO_4_29		0x18c 0x384 0x000 0x05 0x000
+#define MX25_PAD_UART2_CTS__CSPI3_SS3		0x18c 0x384 0x4c8 0x06 0x001
 
 /*
  * Removing the SION bit from MX25_PAD_*__ESDHCn_CMD breaks detecting an SD
@@ -446,14 +454,17 @@
 #define MX25_PAD_SD1_DATA0__GPIO_2_25		0x198 0x390 0x000 0x05 0x000
 
 #define MX25_PAD_SD1_DATA1__ESDHC1_DAT1		0x19c 0x394 0x000 0x00 0x000
+#define MX25_PAD_SD1_DATA1__CSPI2_RDY		0x19c 0x394 0x498 0x01 0x001
 #define MX25_PAD_SD1_DATA1__AUD7_RXD		0x19c 0x394 0x478 0x03 0x000
 #define MX25_PAD_SD1_DATA1__GPIO_2_26		0x19c 0x394 0x000 0x05 0x000
 
 #define MX25_PAD_SD1_DATA2__ESDHC1_DAT2		0x1a0 0x398 0x000 0x00 0x000
+#define MX25_PAD_SD1_DATA2__CSPI2_SS0		0x1a0 0x398 0x4a4 0x01 0x001
 #define MX25_PAD_SD1_DATA2__FEC_RX_CLK		0x1a0 0x398 0x514 0x02 0x002
 #define MX25_PAD_SD1_DATA2__GPIO_2_27		0x1a0 0x398 0x000 0x05 0x000
 
 #define MX25_PAD_SD1_DATA3__ESDHC1_DAT3		0x1a4 0x39c 0x000 0x00 0x000
+#define MX25_PAD_SD1_DATA3__CSPI2_SS1		0x1a4 0x39c 0x4a8 0x01 0x001
 #define MX25_PAD_SD1_DATA3__FEC_CRS		0x1a4 0x39c 0x508 0x02 0x002
 #define MX25_PAD_SD1_DATA3__GPIO_2_28		0x1a4 0x39c 0x000 0x05 0x000
 
@@ -564,11 +575,14 @@
 #define MX25_PAD_GPIO_C__PWM4_PWMO		0x1fc 0x3f8 0x000 0x01 0x000
 #define MX25_PAD_GPIO_C__I2C2_SCL		0x1fc 0x3f8 0x51c 0x02 0x001
 #define MX25_PAD_GPIO_C__KPP_COL4		0x1fc 0x3f8 0x52c 0x03 0x001
+#define MX25_PAD_GPIO_C__CSPI1_SS2		0x1fc 0x3f8 0x000 0x05 0x000
 #define MX25_PAD_GPIO_C__CAN2_TX		0x1fc 0x3f8 0x000 0x06 0x000
+#define MX25_PAD_GPIO_C__CSPI2_SS2		0x1fc 0x3f8 0x000 0x07 0x000
 
 #define MX25_PAD_GPIO_D__GPIO_D			0x200 0x3fc 0x000 0x00 0x000
 #define MX25_PAD_GPIO_D__I2C2_SDA		0x200 0x3fc 0x520 0x02 0x001
 #define MX25_PAD_GPIO_D__CAN2_RX		0x200 0x3fc 0x484 0x06 0x001
+#define MX25_PAD_GPIO_D__CSPI3_SS2		0x200 0x3fc 0x4c4 0x07 0x001
 
 #define MX25_PAD_GPIO_E__GPIO_E			0x204 0x400 0x000 0x00 0x000
 #define MX25_PAD_GPIO_E__I2C3_CLK		0x204 0x400 0x524 0x01 0x002
@@ -593,6 +607,7 @@
 #define MX25_PAD_VSTBY_REQ__UART4_RTS		0x214 0x408 0x56c 0x06 0x002
 
 #define MX25_PAD_VSTBY_ACK__VSTBY_ACK		0x218 0x40c 0x000 0x00 0x000
+#define MX25_PAD_VSTBY_ACK__CSPI1_SS3		0x218 0x40c 0x490 0x02 0x001
 #define MX25_PAD_VSTBY_ACK__GPIO_3_18		0x218 0x40c 0x000 0x05 0x000
 
 #define MX25_PAD_POWER_FAIL__POWER_FAIL		0x21c 0x410 0x000 0x00 0x000
-- 
2.27.0

