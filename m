Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBAAECA9EB9
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 10:53:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A385D214B2
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 10:53:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404329AbfJWKxQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 06:53:16 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55665 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404463AbfJWKxP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 Oct 2019 06:53:15 -0400
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iNEG8-0006gR-J8; Wed, 23 Oct 2019 12:52:56 +0200
Received: from ukl by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iNEG7-0004Jk-N4; Wed, 23 Oct 2019 12:52:55 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Richard Leitner <richard.leitner@skidata.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Carsten Stelling <carsten.stelling@goerlitz.com>
Subject: [PATCH 1/3] usb: usb251xb: Drop some unused defines
Date:   Wed, 23 Oct 2019 12:52:48 +0200
Message-Id: <20191023105250.16537-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The five removed symbols are unused since they were introduced in commit
3ec72a2a1e5d ("usb: misc: add USB251xB/xBi Hi-Speed Hub Controller
Driver") back in 2017.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/misc/usb251xb.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 6ca9111d150a..d91ef9cf3623 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -26,10 +26,6 @@
 
 #define USB251XB_ADDR_PRODUCT_ID_LSB	0x02
 #define USB251XB_ADDR_PRODUCT_ID_MSB	0x03
-#define USB251XB_DEF_PRODUCT_ID_12	0x2512 /* USB2512B/12Bi */
-#define USB251XB_DEF_PRODUCT_ID_13	0x2513 /* USB2513B/13Bi */
-#define USB251XB_DEF_PRODUCT_ID_14	0x2514 /* USB2514B/14Bi */
-#define USB251XB_DEF_PRODUCT_ID_17	0x2517 /* USB2517/17i */
 
 #define USB251XB_ADDR_DEVICE_ID_LSB	0x04
 #define USB251XB_ADDR_DEVICE_ID_MSB	0x05
@@ -74,7 +70,6 @@
 
 #define USB251XB_ADDR_PRODUCT_STRING_LEN	0x14
 #define USB251XB_ADDR_PRODUCT_STRING		0x54
-#define USB251XB_DEF_PRODUCT_STRING		"USB251xB/xBi/7i"
 
 #define USB251XB_ADDR_SERIAL_STRING_LEN		0x15
 #define USB251XB_ADDR_SERIAL_STRING		0x92
-- 
2.23.0

