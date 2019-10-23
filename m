Return-Path: <SRS0=bPG9=YQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48951CA9EB7
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 10:53:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1EA85214B2
	for <linux-devicetree@archiver.kernel.org>; Wed, 23 Oct 2019 10:53:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390638AbfJWKxC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 23 Oct 2019 06:53:02 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:36703 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390491AbfJWKxC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 23 Oct 2019 06:53:02 -0400
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iNEG8-0006gT-J6; Wed, 23 Oct 2019 12:52:56 +0200
Received: from ukl by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iNEG7-0004Jp-Ok; Wed, 23 Oct 2019 12:52:55 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Richard Leitner <richard.leitner@skidata.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Carsten Stelling <carsten.stelling@goerlitz.com>
Subject: [PATCH 3/3] usb: usb251xb: Add support for USB2422
Date:   Wed, 23 Oct 2019 12:52:50 +0200
Message-Id: <20191023105250.16537-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023105250.16537-1-u.kleine-koenig@pengutronix.de>
References: <20191023105250.16537-1-u.kleine-koenig@pengutronix.de>
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

The USB2422 uses a different package that the USB251x and only comes in
a variant with 2 downstream ports. Other than that it is software
compatible.

Tested-by: Carsten Stelling <carsten.stelling@goerlitz.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/misc/usb251xb.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index d91ef9cf3623..7e4e4787f746 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -154,6 +154,14 @@ struct usb251xb_data {
 	char product_str[USB251XB_STRING_BUFSIZE / 2]; /* ASCII string */
 };
 
+static const struct usb251xb_data usb2422_data = {
+	.product_id = 0x2422,
+	.port_cnt = 2,
+	.led_support = false,
+	.bat_support = true,
+	.product_str = "USB2422",
+};
+
 static const struct usb251xb_data usb2512b_data = {
 	.product_id = 0x2512,
 	.port_cnt = 2,
@@ -588,6 +596,9 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 
 static const struct of_device_id usb251xb_of_match[] = {
 	{
+		.compatible = "microchip,usb2422",
+		.data = &usb2422_data,
+	}, {
 		.compatible = "microchip,usb2512b",
 		.data = &usb2512b_data,
 	}, {
@@ -688,6 +699,7 @@ static int usb251xb_i2c_probe(struct i2c_client *i2c,
 }
 
 static const struct i2c_device_id usb251xb_id[] = {
+	{ "usb2422", 0 },
 	{ "usb2512b", 0 },
 	{ "usb2512bi", 0 },
 	{ "usb2513b", 0 },
-- 
2.23.0

