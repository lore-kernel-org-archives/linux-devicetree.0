Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C24C43603
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 09:08:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2DC0206DB
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 09:08:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="i2XHcBwU";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="EgpryvcD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbfLDJI4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 04:08:56 -0500
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186]:49242
        "EHLO a27-186.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725922AbfLDJI4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 04:08:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575450535;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=ZBxBdnDiHly2BV89aFOWjn0ZPfJNCI0DumbcKy3IVyY=;
        b=i2XHcBwUJFQuVzXho7p6uU0EPdU142qiOjFmn1c2sOEr4YKRePAAWjdGkawa7AJ/
        D1lnRlAi1pmdAETn8biEkhgIuhWC1phfwnH1nqvwGzMMH6J4nR9PMFy49xcgYRPxufw
        j244iHJ6dv6nmDR2Fdvb2sdDSH2RqSwLjRqmBUCM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575450534;
        h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
        bh=ZBxBdnDiHly2BV89aFOWjn0ZPfJNCI0DumbcKy3IVyY=;
        b=EgpryvcDIcJl3X7R8LmgPqZZ4lD1cBNpdne1LheHWJ0a/Hvsj+EqIZ3VgoaWK+N8
        Zb7zJFJ0z3YlZNQPDHW80v7bTMUlTkM7ipMtTvZm6YGOdSf9MzvjSk0y7gXqaBLgoSv
        dBceurYsE6LoMBaYFdBtxigtAURRuaL9kHpkB0Nc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3BA35C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1] arm64: dts: sc7180: Add cpufreq HW node for cpu scaling
Date:   Wed, 4 Dec 2019 09:08:54 +0000
Message-ID: <0101016ed02b6356-5165eaaa-6c54-47ff-a008-821c91831e56-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
X-SES-Outgoing: 2019.12.04-54.240.27.186
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

cpufreq hw node required to scale CPU frequency on sc7180.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index c0ac0a1..7629995 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -40,6 +40,7 @@
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_0: l2-cache {
 				compatible = "cache";
 				next-level-cache = <&L3_0>;
@@ -55,6 +56,7 @@
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			next-level-cache = <&L2_100>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_100: l2-cache {
 				compatible = "cache";
 				next-level-cache = <&L3_0>;
@@ -67,6 +69,7 @@
 			reg = <0x0 0x200>;
 			enable-method = "psci";
 			next-level-cache = <&L2_200>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_200: l2-cache {
 				compatible = "cache";
 				next-level-cache = <&L3_0>;
@@ -79,6 +82,7 @@
 			reg = <0x0 0x300>;
 			enable-method = "psci";
 			next-level-cache = <&L2_300>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_300: l2-cache {
 				compatible = "cache";
 				next-level-cache = <&L3_0>;
@@ -91,6 +95,7 @@
 			reg = <0x0 0x400>;
 			enable-method = "psci";
 			next-level-cache = <&L2_400>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_400: l2-cache {
 				compatible = "cache";
 				next-level-cache = <&L3_0>;
@@ -103,6 +108,7 @@
 			reg = <0x0 0x500>;
 			enable-method = "psci";
 			next-level-cache = <&L2_500>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			L2_500: l2-cache {
 				compatible = "cache";
 				next-level-cache = <&L3_0>;
@@ -115,6 +121,7 @@
 			reg = <0x0 0x600>;
 			enable-method = "psci";
 			next-level-cache = <&L2_600>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			L2_600: l2-cache {
 				compatible = "cache";
 				next-level-cache = <&L3_0>;
@@ -127,6 +134,7 @@
 			reg = <0x0 0x700>;
 			enable-method = "psci";
 			next-level-cache = <&L2_700>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			L2_700: l2-cache {
 				compatible = "cache";
 				next-level-cache = <&L3_0>;
@@ -286,6 +294,17 @@
 				status = "disabled";
 			};
 		};
+
+		cpufreq_hw: cpufreq@18323000 {
+			compatible = "qcom,cpufreq-hw";
+			reg = <0 0x18323000 0 0x1400>, <0 0x18325800 0 0x1400>;
+			reg-names = "freq-domain0", "freq-domain1";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
+			clock-names = "xo", "alternate";
+
+			#freq-domain-cells = <1>;
+		};
 	};

 	timer {
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

