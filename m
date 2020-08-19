Return-Path: <SRS0=VXX5=B5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C427C433E3
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 17:59:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B49920882
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 17:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597859962;
	bh=9+1hSzgiVymwCB66UaU86LnUIVfzzROZydYB5/Idn/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=BLQOolXKoTWmStNI2bQlPPoyCR/RE+RlYvkG0zZAMJ6rrn1gjVDQIcIdY53dawA09
	 fxy9wl2fGKBaU2tx7sLVJ/LugrIv22sI5Ynumh8Pxq/3nU+mmmRqFhy9VvX03VC+3M
	 8sAqkia7uWKcXZTIQuJpmRH6IKpWNqoCL4O3Dk50=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbgHSR7Q (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Aug 2020 13:59:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:35400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725804AbgHSR7L (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 19 Aug 2020 13:59:11 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D5F5020786;
        Wed, 19 Aug 2020 17:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597859951;
        bh=9+1hSzgiVymwCB66UaU86LnUIVfzzROZydYB5/Idn/A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O5OUEI/b+UWmz4G7+E+4/h4DtBS2yYwbJ+bgLuheECtSG64uNbI1foU1qLfkDsyD1
         d2s3vBdggMmKSWxg5UiL+iYR9z17ghGYfeMilcjFoyW5hJ1KK5tK3YoN8V5Mc45oi2
         zvZEPu77tbcGkWR8vfWdE4K7Fl1JID7PM0/FEHy0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Barry Song <baohua@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>, Jun Nie <jun.nie@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH 2/5] ARM: dts: qcom: Align L2 cache-controller nodename with dtschema
Date:   Wed, 19 Aug 2020 19:58:50 +0200
Message-Id: <20200819175853.21492-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819175853.21492-1-krzk@kernel.org>
References: <20200819175853.21492-1-krzk@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Fix dtschema validator warnings like:
    l2-cache@2040000: $nodename:0:
        'l2-cache@2040000' does not match '^(cache-controller|cpu)(@[0-9a-f,]+)*$'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index 347b4f7d7889..dda2ceec6591 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -98,7 +98,7 @@
 		ranges;
 		compatible = "simple-bus";
 
-		L2: l2-cache@2040000 {
+		L2: cache-controller@2040000 {
 			compatible = "arm,pl310-cache";
 			reg = <0x02040000 0x1000>;
 			arm,data-latency = <2 2 0>;
-- 
2.17.1

