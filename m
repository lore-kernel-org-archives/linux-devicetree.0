Return-Path: <SRS0=u7up=3N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89324C32771
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 22:43:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E44E2071E
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 22:43:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H5M3q6aW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387417AbgAXWnT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jan 2020 17:43:19 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44293 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387406AbgAXWnT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 Jan 2020 17:43:19 -0500
Received: by mail-pg1-f195.google.com with SMTP id x7so1839935pgl.11
        for <devicetree@vger.kernel.org>; Fri, 24 Jan 2020 14:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LCy4d/uPw5BLn8Wtp8APLodtLD4pO2HOn2Pu/h6vPEQ=;
        b=H5M3q6aWRWGz+DPDkuDKKDp9JmGrdLbld1dKDiQUVp3fn2wQvRevBwkem3NygaawT/
         eRqCOrI1rSecV50Rs2vF8UXdyTv1JEJ7vAaCBQYa2uM9shXTNvrJdFW2lmTnxJhaDWot
         dLWxiqt3t4KkiP56kPl5Abs3KcMMZPahXAbfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LCy4d/uPw5BLn8Wtp8APLodtLD4pO2HOn2Pu/h6vPEQ=;
        b=oxGZqBc9HHZYoA9MkRKdFCZhNpjKIBIuUJcEcWj3aB/WfUFHeLLe04enVAoSRPCvSt
         dTbsEtb6yL8tPuzpqVfz9SDiuZ4kmkCg5TOT19Sftu8+Qhy2WclXVQKDaNC0jDXXt+Z/
         6UUl6Mf4Tmvg2oA76z5/Gjw8XKmRW+Koa+BWLEn7z2+DksaHMxrPlTm0vTuvzyuvKLZt
         W4Mp+kADyowHCde6cBCWw8oZJxifH6tAYc0wefa2qc7CjFVYPH3yTSyDq17t1mg8OXFL
         0KXpp8Cdmn2pW7TojI9ADUH/9S44n5z3P/5KlbsgFipYgAQmGgvk1V2+DXx9x6kodX3W
         0eEg==
X-Gm-Message-State: APjAAAV/+ja6YrcA/6u4iL8/kPtLq3AvyTPOws/j5tLJtcb1SjQRKqk9
        SzVzuA+fbWXIN8SwIgJJmTwxQA==
X-Google-Smtp-Source: APXvYqwqOj229OreenHXwJi4oidfVVbTHzeOfUUBBvLdizzGOX34wX6hYI9c93bqiOm2N75XvR3FNg==
X-Received: by 2002:a63:5818:: with SMTP id m24mr6680605pgb.358.1579905799008;
        Fri, 24 Jan 2020 14:43:19 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id o2sm7690948pjo.26.2020.01.24.14.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 14:43:18 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        mka@chromium.org, kalyan_t@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        hoegsberg@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 03/10] arm64: dts: qcom: sdm845: Add the missing clocks on the dispcc
Date:   Fri, 24 Jan 2020 14:42:18 -0800
Message-Id: <20200124144154.v2.3.Ie80fa74e1774f4317d80d70d30ef4b78f16cc8df@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200124224225.22547-1-dianders@chromium.org>
References: <20200124224225.22547-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

We're transitioning over to requiring the Qualcomm Display Clock
Controller to specify all the input clocks.  Let's add them for
sdm845.

NOTES:
- Until the Linux driver for sdm845's dispcc is updated, these clocks
  will not actually be used in Linux.  It will continue to use global
  clock names to match things up.
- Although the clocks from the DP PHY are required, the DP PHY isn't
  represented in the dts yet.  Apparently the magic for this is just
  to use <0>.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Patch ("arm64: dts: qcom: sdm845: Add...dispcc") new for v2.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index d42302b8889b..01354533a61b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2933,6 +2933,18 @@ opp-200000000 {
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,sdm845-dispcc";
 			reg = <0 0x0af00000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+				 <&dsi0_phy 0>,
+				 <&dsi0_phy 1>,
+				 <&dsi1_phy 0>,
+				 <&dsi1_phy 1>,
+				 <0>,
+				 <0>;
+			clock-names = "xo", "gpll0",
+				      "dsi0_phy_pll_byte", "dsi0_phy_pll_pixel",
+				      "dsi1_phy_pll_byte", "dsi1_phy_pll_pixel",
+				      "dp_phy_pll_link", "dp_phy_pll_vco_div";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-- 
2.25.0.341.g760bfbb309-goog

