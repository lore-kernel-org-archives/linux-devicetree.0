Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81A4C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 05:29:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94554207F9
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 05:29:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AzRvCMOb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727876AbgGJF3g (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 01:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727874AbgGJF3f (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 01:29:35 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E25C08C5DC
        for <devicetree@vger.kernel.org>; Thu,  9 Jul 2020 22:29:34 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ch3so2116597pjb.5
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 22:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MSKivOm6p95vIF+xsCRXaxJ3RfMT5lkhjSXb8u6KQ/A=;
        b=AzRvCMObicHfAfSGOvZ/3ah30NFhC9vr98FBzkz4giER7xo0+6P8IUylJlSB5/iQOR
         1VvOmSZfn07xLWzFBVbYNkXjFg5/hEO4mAIjtWCjDZKYF0WBcXc5x8h2sdfAKITqM93m
         LUfaYqFINu/y79ulwbcZypq3lkFVnBCWH1l8ygT14B3kZ9YGTiHyprIxFwmU0k1l+HHd
         5RxkB4R1JoSG7iDSma0TeNvG6sLp9NzsoiJeSr+vlqkMS9EVRC0eRrWBRFv89p18uB+g
         nncHWKBmkoKK4W5ti6WZD3IBE+fVVtlKe4GcgJa2iBw6MKpBOP89QqIM4BZ/jnMg9dxq
         DdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MSKivOm6p95vIF+xsCRXaxJ3RfMT5lkhjSXb8u6KQ/A=;
        b=TVBv67uqDjCNqTtlPdiMRHhWS9sNl5v4IjX33OK7mC7KiBtsyz5bjMVmZzWM6qI3cG
         juw1Xnr5B+Xt6oLAn64ypG89uDZ4uYsCaTxthOUeGaOLa4b2JgTAU8zbgP7UvtGlRpXL
         liL+PYxFMRv2dK3I7vuBLkma5tiR7y9pYEWsIbxEeAEykwdgQgGLkIi5twmTIvH5LHz8
         bqjE5HlLQ1klSl1YDpU4ERCX8cDuUqb/uuJqHFiGehsgouDtxkQkwI5SrxnRL9kJazLq
         wFARATnfw7HlBFwl/ReU+7EoZIU/KjIfUefqFl/eyH/euV87qPhNWtNMikKjFVIdYq9Y
         uwRw==
X-Gm-Message-State: AOAM531j0Z+HPX3NoB61Q+jW8CN5aAyOxgBOSORBoIBo/q5FyS9bbaiW
        G+2ZQW3yE0xT/mW0FhpmDMgZuoRlQ2yKPghc8cw=
X-Google-Smtp-Source: ABdhPJxBqKnOiFN5zT4yMxUULpbvDRje/8up4OMyF5ylvIfzUsV3GPVWeC5YvCbNeZXYWmyPOLd9Bw==
X-Received: by 2002:a17:902:ab94:: with SMTP id f20mr15348562plr.232.1594358973974;
        Thu, 09 Jul 2020 22:29:33 -0700 (PDT)
Received: from nagraj.local ([49.206.21.239])
        by smtp.gmail.com with ESMTPSA id j17sm4168320pgn.87.2020.07.09.22.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 22:29:33 -0700 (PDT)
From:   Sumit Semwal <sumit.semwal@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org
Cc:     nishakumari@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, rnayak@codeaurora.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [RESEND: PATCH v5 1/4] regulator: Allow regulators to verify enabled during enable()
Date:   Fri, 10 Jul 2020 10:59:16 +0530
Message-Id: <20200710052919.2611-2-sumit.semwal@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710052919.2611-1-sumit.semwal@linaro.org>
References: <20200710052919.2611-1-sumit.semwal@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Some regulators might need to verify that they have indeed been enabled
after the enable() call is made and enable_time delay has passed.

This is implemented by repeatedly checking is_enabled() upto
poll_enabled_time, waiting for the already calculated enable delay in
each iteration.

Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>

---
v3: addressed minor review comments, improved kernel doc
v2: Address review comments, including swapping enable_time and poll_enabled_time.
---
 drivers/regulator/core.c         | 63 +++++++++++++++++++++++++++++++-
 include/linux/regulator/driver.h |  5 +++
 2 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 03154f5b939f..538a2779986a 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2347,6 +2347,37 @@ static void _regulator_enable_delay(unsigned int delay)
 		udelay(us);
 }
 
+/**
+ * _regulator_check_status_enabled
+ *
+ * A helper function to check if the regulator status can be interpreted
+ * as 'regulator is enabled'.
+ * @rdev: the regulator device to check
+ *
+ * Return:
+ * * 1			- if status shows regulator is in enabled state
+ * * 0			- if not enabled state
+ * * Error Value	- as received from ops->get_status()
+ */
+static inline int _regulator_check_status_enabled(struct regulator_dev *rdev)
+{
+	int ret = rdev->desc->ops->get_status(rdev);
+
+	if (ret < 0) {
+		rdev_info(rdev, "get_status returned error: %d\n", ret);
+		return ret;
+	}
+
+	switch (ret) {
+	case REGULATOR_STATUS_OFF:
+	case REGULATOR_STATUS_ERROR:
+	case REGULATOR_STATUS_UNDEFINED:
+		return 0;
+	default:
+		return 1;
+	}
+}
+
 static int _regulator_do_enable(struct regulator_dev *rdev)
 {
 	int ret, delay;
@@ -2407,7 +2438,37 @@ static int _regulator_do_enable(struct regulator_dev *rdev)
 	 * together.  */
 	trace_regulator_enable_delay(rdev_get_name(rdev));
 
-	_regulator_enable_delay(delay);
+	/* If poll_enabled_time is set, poll upto the delay calculated
+	 * above, delaying poll_enabled_time uS to check if the regulator
+	 * actually got enabled.
+	 * If the regulator isn't enabled after enable_delay has
+	 * expired, return -ETIMEDOUT.
+	 */
+	if (rdev->desc->poll_enabled_time) {
+		unsigned int time_remaining = delay;
+
+		while (time_remaining > 0) {
+			_regulator_enable_delay(rdev->desc->poll_enabled_time);
+
+			if (rdev->desc->ops->get_status) {
+				ret = _regulator_check_status_enabled(rdev);
+				if (ret < 0)
+					return ret;
+				else if (ret)
+					break;
+			} else if (rdev->desc->ops->is_enabled(rdev))
+				break;
+
+			time_remaining -= rdev->desc->poll_enabled_time;
+		}
+
+		if (time_remaining <= 0) {
+			rdev_err(rdev, "Enabled check timed out\n");
+			return -ETIMEDOUT;
+		}
+	} else {
+		_regulator_enable_delay(delay);
+	}
 
 	trace_regulator_enable_complete(rdev_get_name(rdev));
 
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 7eb9fea8e482..436df3ba0b2a 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -305,6 +305,9 @@ enum regulator_type {
  * @enable_time: Time taken for initial enable of regulator (in uS).
  * @off_on_delay: guard time (in uS), before re-enabling a regulator
  *
+ * @poll_enabled_time: The polling interval (in uS) to use while checking that
+ *                     the regulator was actually enabled. Max upto enable_time.
+ *
  * @of_map_mode: Maps a hardware mode defined in a DeviceTree to a standard mode
  */
 struct regulator_desc {
@@ -372,6 +375,8 @@ struct regulator_desc {
 
 	unsigned int off_on_delay;
 
+	unsigned int poll_enabled_time;
+
 	unsigned int (*of_map_mode)(unsigned int mode);
 };
 
-- 
2.27.0

