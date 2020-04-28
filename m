Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E625C8300A
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 18:07:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2C7B214D8
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 18:07:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXM+NLMR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbgD1SH1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 14:07:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728656AbgD1SH0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 28 Apr 2020 14:07:26 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14991C03C1AE
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 11:07:26 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id g13so25779222wrb.8
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 11:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=28cDGW7lHDBW0cMjOkUmPSwiyuA8fTJeT/DBNYotCsg=;
        b=TXM+NLMRCnS9+pSCoTO2uWxK0dqqac8UQX/pcooJaNoiSMsBja1cqbUl3ZbIPeQxjb
         uaubDOvNUoRBxLdgA06QmhKcoVD47twZy+WdznWp9snzqpArXlLDciomOOQwYZ2gNngX
         08Ax13mceLMM1qdsCp5CMzJ+68XA7X/dE7fuhuZVl4ss2ogVUMmP44QJOjTyHEgdG2vH
         8GgGPn/MsNL64ig+2r5Wd/swPH1JptGhwuwQZTTL4mqoZkr0BiBXUM3FuF2248STnrDd
         B415bjkdtM8+Z1rpjWGirq0eqQiWI939m8qkHu0AAhxU2nklyzFyAZkI5+6Op2ikXsjg
         Gz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=28cDGW7lHDBW0cMjOkUmPSwiyuA8fTJeT/DBNYotCsg=;
        b=nTqF29dh6eFmH6rlZwosb6Fqbkjgp5kzDjGiadq3uFK03/QmZzhvXG3rriGDA/LvWl
         qKhXYy+rv2K4+OKl5fK3Q9qETYEyhzzvrjOrxjgVEW04BfYFSsVsffDcjRSu9F0v/MM+
         585PjmjCKTwrMo2lX7FmF+OGVFjcSLWbMisYpaAwv+3F73X4lhY40Ye83sPW9NjLk44e
         SDSWLr4d5ovP84ys8WpisgzTzqyzLjvCY/s1N5FyGewvo1BsC3dJmSkbF/oZCYKuEY1G
         14nzGaAE8mQOXVm8GY2AkyQBOBWX4yYdICiw61kegjVuH4ueYjOSSYAf3kRkrgJfLo8g
         fJxQ==
X-Gm-Message-State: AGi0PuZsqHea9D1kIDafvBsSZHjvOOmI39O3kPrvwy1hyXNjO2RFC301
        5VGNvg3AhtZKvp8AcWLYK68pcw==
X-Google-Smtp-Source: APiQypI8PJzjnfy3x58pQ9Accr3Blr++TnRQfRHkv2Jckw04YP5uWoNw5VlXdSvsvq3SUfkryVkoZA==
X-Received: by 2002:a5d:4cc2:: with SMTP id c2mr33703590wrt.130.1588097244819;
        Tue, 28 Apr 2020 11:07:24 -0700 (PDT)
Received: from xps7590.local ([37.120.81.28])
        by smtp.gmail.com with ESMTPSA id m14sm26202789wrs.76.2020.04.28.11.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 11:07:24 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v5 v5 3/3] media: ov8856: Implement sensor module revision identification
Date:   Tue, 28 Apr 2020 20:07:18 +0200
Message-Id: <20200428180718.1609826-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200428180718.1609826-1-robert.foss@linaro.org>
References: <20200428180718.1609826-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Query the sensor for its module revision, and compare it
to known revisions.
Currently only the '1B' revision has been added.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

- Changes since v3:
  * Actually add module revision 2A

- Changes since v2:
  * Add module revision 2A
  * Sakari: Remove ov8856_check_revision()
  * Sakari: Stop EEPROM streaming mode

 drivers/media/i2c/ov8856.c | 53 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 48b02b8d205f..a0ba0a5d5aad 100644
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
@@ -1152,6 +1165,46 @@ static int ov8856_identify_module(struct ov8856 *ov8856)
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
+		val,
+		val == OV8856_2A_MODULE ? "2A" :
+		val == OV8856_1B_MODULE ? "1B" : "unknown revision",
+		client->addr);
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

