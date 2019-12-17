Return-Path: <SRS0=r3bb=2H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965BFC2D0CD
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 21:04:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6383221D7D
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 21:04:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mvRDQsws"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728756AbfLQVEj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Dec 2019 16:04:39 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37256 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728401AbfLQVEi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Dec 2019 16:04:38 -0500
Received: by mail-pg1-f196.google.com with SMTP id q127so6347515pga.4
        for <devicetree@vger.kernel.org>; Tue, 17 Dec 2019 13:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1+26A+2VB2HJa/JQAWYAfB+QQDCd/IKr2ogBbGLbutU=;
        b=mvRDQswsWn70e5n9/hEvMCOUivm4JLj9eLcfRTfba0W+0Qq59F9fXuqaprna0IMKXI
         D9XlZ/XVMcKDHKX+lRYml3D2wnvj0YGFWwdl+RYGkKCeMk1qaLrn7xU6A5eZqajjDmOA
         B7iJSSgekYCrZT8R1GNcxzvgJy594UukTKDqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1+26A+2VB2HJa/JQAWYAfB+QQDCd/IKr2ogBbGLbutU=;
        b=YFKZkmAeu3OpW92SMtNsc41V2hn5exezK7IJLZh7vHaDMO70nrS4Su103cmbfFTvex
         A7cbNWrux50qU+uS2Q8eEQzD9w3ifPOPmeOA98fAruCSjFa77X/WhJbYzmGJw/ZiVaab
         MJrpDdW46Qb+XXCU+zF8dhTm/b2NrFNnQXvZdq5miG5L2LPATEaJMKeCWKm8otSE1P+I
         i7gNjdKAx+mJSrHquOQahOJtGZq8vcxCL7k0yMCZ9Ra2jf/e/rcoNh78l3iHSrj3+kw0
         J6mdg7Ze8ij/zcd8BqAZkwjHS4+3XvSS7FMR5Mr0OepUZmQQjKGQFLQr4neeQCBz0JHN
         4KeA==
X-Gm-Message-State: APjAAAVkhn6f8d4r+Q8S4Rd5754bSHSEX0aieID5dcAJtTf+lz9MZytg
        3T02l8BElgy8fBFOVnDRYkDnkw==
X-Google-Smtp-Source: APXvYqx8uYGUj8zzwEF0jGyJKMRn4A2TAQwLPUGapJkhurejbCH8bXNW1EM6Cx+z/k7HOiEBCV/zng==
X-Received: by 2002:aa7:82d5:: with SMTP id f21mr25319829pfn.245.1576616677617;
        Tue, 17 Dec 2019 13:04:37 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id u18sm27818964pgi.44.2019.12.17.13.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 13:04:36 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linus.walleij@linaro.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] arm64: dts: qcom: sc7180: Fix I2C/UART numbers 2, 4, 7, and 9
Date:   Tue, 17 Dec 2019 13:04:07 -0800
Message-Id: <20191217130352.1.Id8562de45e8441cac34699047e25e7424281e9d4@changeid>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Commit f4a73f5e2633 ("pinctrl: qcom: sc7180: Add new qup functions")
has landed which means that we absolutely need to use the proper names
for the pinmuxing for I2C/UART numbers 2, 4, 7, and 9.  Let's do it.

For reference:
- If you get only one of this commit and the pinctrl commit then none
  of I2C/UART 2, 4, 7, and 9 will work.
- If you get neither of these commits then I2C 2, 4, 7, and 9 will
  work but not UART.

...but despite the above it should be fine for this commit to land in
the Qualcomm tree because sc7180.dtsi only exists there (it hasn't
made it to mainline).

Fixes: ba3fc6496366 ("arm64: dts: sc7180: Add qupv3_0 and qupv3_1")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 52a58615ec06..faa9ef733204 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -717,7 +717,7 @@ pinmux {
 			qup_i2c2_default: qup-i2c2-default {
 				pinmux {
 					pins = "gpio15", "gpio16";
-					function = "qup02";
+					function = "qup02_i2c";
 				};
 			};
 
@@ -731,7 +731,7 @@ pinmux {
 			qup_i2c4_default: qup-i2c4-default {
 				pinmux {
 					pins = "gpio115", "gpio116";
-					function = "qup04";
+					function = "qup04_i2c";
 				};
 			};
 
@@ -752,7 +752,7 @@ pinmux {
 			qup_i2c7_default: qup-i2c7-default {
 				pinmux {
 					pins = "gpio6", "gpio7";
-					function = "qup11";
+					function = "qup11_i2c";
 				};
 			};
 
@@ -766,7 +766,7 @@ pinmux {
 			qup_i2c9_default: qup-i2c9-default {
 				pinmux {
 					pins = "gpio46", "gpio47";
-					function = "qup13";
+					function = "qup13_i2c";
 				};
 			};
 
@@ -867,7 +867,7 @@ pinmux {
 			qup_uart2_default: qup-uart2-default {
 				pinmux {
 					pins = "gpio15", "gpio16";
-					function = "qup02";
+					function = "qup02_uart";
 				};
 			};
 
@@ -882,7 +882,7 @@ pinmux {
 			qup_uart4_default: qup-uart4-default {
 				pinmux {
 					pins = "gpio115", "gpio116";
-					function = "qup04";
+					function = "qup04_uart";
 				};
 			};
 
@@ -905,7 +905,7 @@ pinmux {
 			qup_uart7_default: qup-uart7-default {
 				pinmux {
 					pins = "gpio6", "gpio7";
-					function = "qup11";
+					function = "qup11_uart";
 				};
 			};
 
@@ -919,7 +919,7 @@ pinmux {
 			qup_uart9_default: qup-uart9-default {
 				pinmux {
 					pins = "gpio46", "gpio47";
-					function = "qup13";
+					function = "qup13_uart";
 				};
 			};
 
-- 
2.24.1.735.g03f4e72817-goog

