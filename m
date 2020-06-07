Return-Path: <SRS0=Te14=7U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8175EC433DF
	for <linux-devicetree@archiver.kernel.org>; Sun,  7 Jun 2020 16:31:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 552DB2073B
	for <linux-devicetree@archiver.kernel.org>; Sun,  7 Jun 2020 16:31:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xdTL2NQO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727786AbgFGQbC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 7 Jun 2020 12:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgFGQbB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 7 Jun 2020 12:31:01 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C1DC08C5C5
        for <devicetree@vger.kernel.org>; Sun,  7 Jun 2020 09:31:00 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id 202so8739099lfe.5
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2020 09:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WjXebY5QtcvN7Odp1pbuemzpCVQPCaprQRcJnauls1g=;
        b=xdTL2NQOA8zPNA64Udqix9m8upZNsI4VUW2sLly0Ad9qQw9ZpEacC8Yeh3M8oeYi7R
         xyGaN+/jaQQGQuV5ShduYcJN9elzEic60QctEwL+nSzJVnzeO6V1wXJ1a0Y3dNGCvB0F
         HymT2Tk0BXnG4lBjWA2yfi3U1MwJm79EeXYbSPbwMtWl/RBtSWBy2jXB4mS96nPadHpP
         kxz8l6iKCpkR/w4SEeOH0hQiAPPzIXvAbKVqVuNopbbpgPR0crnATl8qKakTprrDBfiV
         04pyjWVqjBS7W+v1u6o99xPvu3OcAHZ6IwlbwjDfmsFz5JeGEHtplDdKrIzCU3mrYatg
         diXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WjXebY5QtcvN7Odp1pbuemzpCVQPCaprQRcJnauls1g=;
        b=rhzSFpvAHv8FfL5d+/GsmZzsJEDr5kvBESPGAqyFb8NbxV0OrjcPWtJmswHPx0SMVo
         f0zA2hpJK8/2tQvM/4dD3LhyNUWpzs3SY17wa7gB2ei+8QpIDr0wlRgDxAb8gM0rZZty
         UrgxDwEOcHHaVCm1FuT/oKi4zXekpPrdIQAelLnkuOaY0c75jjpkkiHriGeS9kh0UJ7H
         33S8QEf9GyC9A3/ptblQM9ICOnkqLVaeK0jhniTXqCeDze5TS0P01fsxPnUO66Src/6u
         O61mt2NkzXLe5EzHp1cbX7uR7M9ClN2IelFOX7WqYRY5yadZLKnOdNLdS9ghSFUHnpDZ
         x1xQ==
X-Gm-Message-State: AOAM530eY4fDXYzOyaAJ81iJb0F//no0xcgtzi36SoVYPf1bDPk0h3Rb
        FZgoHuOdUVA/DNKOUT21yi6U6A==
X-Google-Smtp-Source: ABdhPJz2+0XORBmKupYT1hANsXAnVr8WdKQBgv6HE9FXfAm085NQD6o5rVpp3L583ehbFYtmVImxMg==
X-Received: by 2002:a19:3f01:: with SMTP id m1mr10354676lfa.130.1591547459202;
        Sun, 07 Jun 2020 09:30:59 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id l7sm1726511ljj.55.2020.06.07.09.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2020 09:30:58 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     mchehab@kernel.org, sakari.ailus@iki.fi,
        manivannan.sadhasivam@linaro.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        c.barrett@framos.com, a.brela@framos.com, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v4 06/10] media: i2c: imx290: Add support for test pattern generation
Date:   Sun,  7 Jun 2020 19:30:21 +0300
Message-Id: <20200607163025.8409-7-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200607163025.8409-1-andrey.konovalov@linaro.org>
References: <20200607163025.8409-1-andrey.konovalov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Add support for generating following test patterns by IMX290:

* Sequence Pattern 1
* Horizontal Color-bar Chart
* Vertical Color-bar Chart
* Sequence Pattern 2
* Gradation Pattern 1
* Gradation Pattern 2
* 000/555h Toggle Pattern

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/i2c/imx290.c | 41 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 152b65cb7cbc..67725a5aabd3 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -26,12 +26,19 @@
 #define IMX290_REGHOLD 0x3001
 #define IMX290_XMSTA 0x3002
 #define IMX290_FR_FDG_SEL 0x3009
+#define IMX290_BLKLEVEL_LOW 0x300a
+#define IMX290_BLKLEVEL_HIGH 0x300b
 #define IMX290_GAIN 0x3014
 #define IMX290_HMAX_LOW 0x301c
 #define IMX290_HMAX_HIGH 0x301d
+#define IMX290_PGCTRL 0x308c
 #define IMX290_PHY_LANE_NUM 0x3407
 #define IMX290_CSI_LANE_MODE 0x3443
 
+#define IMX290_PGCTRL_REGEN BIT(0)
+#define IMX290_PGCTRL_THRU BIT(1)
+#define IMX290_PGCTRL_MODE(n) ((n) << 4)
+
 static const char * const imx290_supply_name[] = {
 	"vdda",
 	"vddd",
@@ -91,6 +98,17 @@ static const struct regmap_config imx290_regmap_config = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
+static const char * const imx290_test_pattern_menu[] = {
+	"Disabled",
+	"Sequence Pattern 1",
+	"Horizontal Color-bar Chart",
+	"Vertical Color-bar Chart",
+	"Sequence Pattern 2",
+	"Gradation Pattern 1",
+	"Gradation Pattern 2",
+	"000/555h Toggle Pattern",
+};
+
 static const struct imx290_regval imx290_global_init_settings[] = {
 	{ 0x3007, 0x00 },
 	{ 0x3018, 0x65 },
@@ -448,6 +466,22 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_GAIN:
 		ret = imx290_set_gain(imx290, ctrl->val);
 		break;
+	case V4L2_CID_TEST_PATTERN:
+		if (ctrl->val) {
+			imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW, 0x00);
+			imx290_write_reg(imx290, IMX290_BLKLEVEL_HIGH, 0x00);
+			msleep(10);
+			imx290_write_reg(imx290, IMX290_PGCTRL,
+					 (u8)(IMX290_PGCTRL_REGEN |
+					 IMX290_PGCTRL_THRU |
+					 IMX290_PGCTRL_MODE(ctrl->val)));
+		} else {
+			imx290_write_reg(imx290, IMX290_PGCTRL, 0x00);
+			msleep(10);
+			imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW, 0x3c);
+			imx290_write_reg(imx290, IMX290_BLKLEVEL_HIGH, 0x00);
+		}
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -959,7 +993,7 @@ static int imx290_probe(struct i2c_client *client)
 	 */
 	imx290_entity_init_cfg(&imx290->sd, NULL);
 
-	v4l2_ctrl_handler_init(&imx290->ctrls, 3);
+	v4l2_ctrl_handler_init(&imx290->ctrls, 4);
 
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 			  V4L2_CID_GAIN, 0, 72, 1, 0);
@@ -977,6 +1011,11 @@ static int imx290_probe(struct i2c_client *client)
 					       1, INT_MAX, 1,
 					       imx290_calc_pixel_rate(imx290));
 
+	v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(imx290_test_pattern_menu) - 1,
+				     0, 0, imx290_test_pattern_menu);
+
 	imx290->sd.ctrl_handler = &imx290->ctrls;
 
 	if (imx290->ctrls.error) {
-- 
2.17.1

