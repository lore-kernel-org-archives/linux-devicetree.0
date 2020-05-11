Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FB5C47255
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 11:04:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63EB920736
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 11:04:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xdDwNe5D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729359AbgEKLEL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 07:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729371AbgEKLEB (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 11 May 2020 07:04:01 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26371C05BD0D
        for <devicetree@vger.kernel.org>; Mon, 11 May 2020 04:04:00 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l11so4477454wru.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2020 04:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wjZQiljUYlD33LUnV3Lrp+SSxrgP5GGsdxa2mXlVN0s=;
        b=xdDwNe5DKWOSnokNVlxSSaAnAn266MNyPB8XQaRemI+qdXulB4pdAf40Bg3E1gwDRI
         dQhKll9HDozQBuxfeDGq6EWaolwfXMZzPx7fA2TjrT3kRjs8XxP9lmkX4zpbULq+dQNC
         7pF8Sle/eXAB6Qq/49xffk93p0ro+TrQVx6tjhM4XgRadzOTETgc9VMYa8UCEDW+e9Dh
         n84T1xae73+FCY0nGSwktrencqzRwfULUUdSWa7sPkByONIhik3tIf2dQc05SuUMszlY
         AQ+z08mcQYVp73wDhNxRuoL7LZ0oNqrZ6sDdUtDQoHA7j0Bnf+Cr0Q4Oo5Bv9nDx19Or
         8WOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wjZQiljUYlD33LUnV3Lrp+SSxrgP5GGsdxa2mXlVN0s=;
        b=pVn47Q6y7i7AmRloHj9vM0AVpFQEXFUp+MCjvPaas4+xHk7JzVQAOHAqvYq1gJIBmU
         f2Pf8LHSuUanUsZZeTBGOk68Sd6eIjkJRJtXAKhomC7IkHlYGEVqk1ehxRaBCxF9jn93
         QbV9oYiwNaEdn9zVYEmZec1ZjL/s3V4CwJGZywKjbDbLVG1mN35Z0W0+Eo907r5QTHzX
         spwxSPw7eRppheMMFDC3C9L8x02FPvRdyO3Fq7F5Q3xoy8fBSepyN06yq+kK2QzwEfur
         rNsGux72IixwipzoClOWO9++TnenAubFU+e7z7Lq/ekPH+L1wuORKOfuUbytpKDhhWpm
         j77g==
X-Gm-Message-State: AGi0PubhpGrk5g/IG0Tu09OvJ7P7WntJDUy6TOKfH38wy/jm99A5R0Na
        4IHcKuitB4NVhp0BwvhHXocXAw==
X-Google-Smtp-Source: APiQypLkuk0QguA4T+0yy7di/0ztJ/wpeDgCX7kAIsO9jmlBqjYPQS9nKV5nkRg7LCJvi4UP3hIJDQ==
X-Received: by 2002:a5d:4389:: with SMTP id i9mr18918350wrq.374.1589195038813;
        Mon, 11 May 2020 04:03:58 -0700 (PDT)
Received: from localhost.localdomain ([37.120.63.158])
        by smtp.gmail.com with ESMTPSA id z18sm7046584wmk.46.2020.05.11.04.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 04:03:58 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>, Ben Kao <ben.kao@intel.com>,
        Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v8 3/3] media: ov8856: Implement sensor module revision identification
Date:   Mon, 11 May 2020 13:03:50 +0200
Message-Id: <20200511110350.11565-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200511110350.11565-1-robert.foss@linaro.org>
References: <20200511110350.11565-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Query the sensor for its module revision, and compare it
to known revisions.

Currently 2A and 1B revision indentification is supported.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

- Changes since v7:
  * Marco: Align broken line

- Changes since v3:
  * Actually add module revision 2A

- Changes since v2:
  * Add module revision 2A
  * Sakari: Remove ov8856_check_revision()
  * Sakari: Stop EEPROM streaming mode

 drivers/media/i2c/ov8856.c | 53 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 68cf2d6c5804..1657e03d9a9d 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -32,6 +32,19 @@
 #define OV8856_MODE_STANDBY		0x00
 #define OV8856_MODE_STREAMING		0x01
 
+/* module revisions */
+#define OV8856_2A_MODULE		0x01
+#define OV8856_1B_MODULE		0x02
+
+/* the OTP read-out buffer is at 0x7000 and 0xf is the offset
+ * of the byte in the OTP that means the module revision
+ */
+#define OV8856_MODULE_REVISION		0x700f
+#define OV8856_OTP_MODE_CTRL		0x3d84
+#define OV8856_OTP_LOAD_CTRL		0x3d81
+#define OV8856_OTP_MODE_AUTO		0x00
+#define OV8856_OTP_LOAD_CTRL_ENABLE	BIT(0)
+
 /* vertical-timings from sensor */
 #define OV8856_REG_VTS			0x380e
 #define OV8856_VTS_MAX			0x7fff
@@ -1156,6 +1169,46 @@ static int ov8856_identify_module(struct ov8856 *ov8856)
 		return -ENXIO;
 	}
 
+	ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
+			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STREAMING);
+	if (ret)
+		return ret;
+
+	ret = ov8856_write_reg(ov8856, OV8856_OTP_MODE_CTRL,
+			       OV8856_REG_VALUE_08BIT, OV8856_OTP_MODE_AUTO);
+	if (ret) {
+		dev_err(&client->dev, "failed to set otp mode");
+		return ret;
+	}
+
+	ret = ov8856_write_reg(ov8856, OV8856_OTP_LOAD_CTRL,
+			       OV8856_REG_VALUE_08BIT,
+			       OV8856_OTP_LOAD_CTRL_ENABLE);
+	if (ret) {
+		dev_err(&client->dev, "failed to enable load control");
+		return ret;
+	}
+
+	ret = ov8856_read_reg(ov8856, OV8856_MODULE_REVISION,
+			      OV8856_REG_VALUE_08BIT, &val);
+	if (ret) {
+		dev_err(&client->dev, "failed to read module revision");
+		return ret;
+	}
+
+	dev_info(&client->dev, "OV8856 revision %x (%s) at address 0x%02x\n",
+		 val,
+		 val == OV8856_2A_MODULE ? "2A" :
+		 val == OV8856_1B_MODULE ? "1B" : "unknown revision",
+		 client->addr);
+
+	ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
+			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STANDBY);
+	if (ret) {
+		dev_err(&client->dev, "failed to exit streaming mode");
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.25.1

