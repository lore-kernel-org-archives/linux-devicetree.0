Return-Path: <SRS0=Xf3c=A4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD1C9C43464
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 13:26:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7B372067D
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 13:26:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgGQN0C (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jul 2020 09:26:02 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:42619 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726322AbgGQN0B (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jul 2020 09:26:01 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E16A11C000C;
        Fri, 17 Jul 2020 13:25:58 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 11/13] media: i2c: ov5640: Initialize DVP polarities as default
Date:   Fri, 17 Jul 2020 15:28:57 +0200
Message-Id: <20200717132859.237120-12-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

With the bindings now updated to initialize the DVP synchronism
signals to the values reported by the datasheet, update the driver
to respect the same default values.

The driver works-around a documentation bug and reports the VSYNC
polarity control bit to be inverted. Regardless of the actual
value written to the hardware register, initialize the DVP configuration
to the defaults reported by the chip manual and the bindings document:

- VSYNC: active low
- HREF:	active low
- PCLK:	active high

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/ov5640.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 2fe4a7ac0592..012ef1df59aa 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -1212,9 +1212,9 @@ static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
 {
 	int ret;
 	unsigned int flags = sensor->ep.bus.parallel.flags;
-	u8 pclk_pol = 0;
+	u8 pclk_pol = 1;
 	u8 hsync_pol = 0;
-	u8 vsync_pol = 0;
+	u8 vsync_pol = 1;
 
 	/*
 	 * Note about parallel port configuration.
@@ -1229,9 +1229,9 @@ static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
 	 * devicetree endpoint control lines properties.
 	 * If no endpoint control lines properties are set,
 	 * polarity will be as below:
-	 * - VSYNC:	active high
+	 * - VSYNC:	active low
 	 * - HREF:	active low
-	 * - PCLK:	active low
+	 * - PCLK:	active high
 	 */
 
 	if (on) {
@@ -1245,12 +1245,12 @@ static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
 		 *		datasheet and hardware, 0 is active high
 		 *		and 1 is active low...)
 		 */
-		if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
-			pclk_pol = 1;
+		if (flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
+			pclk_pol = 0;
 		if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
 			hsync_pol = 1;
-		if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
-			vsync_pol = 1;
+		if (flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
+			vsync_pol = 0;
 
 		ret = ov5640_write_reg(sensor,
 				       OV5640_REG_POLARITY_CTRL00,
-- 
2.27.0

