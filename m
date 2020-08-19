Return-Path: <SRS0=VXX5=B5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A2CC433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 17:59:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43C8320758
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Aug 2020 17:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597859965;
	bh=XDjdr5MiK7GXK9xIxnBBov3CQznIvioVNLtmyltdqQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=QR3M+0yLB76oC2gXpk1/PpPpcHFPPgZQf4eRJrJmbYGTUZvtU4Z5CnkDp+aS+X1wi
	 IxE1dzf0xVC0oCSPAojaqCmrb7DqJLu+yqCi6r3LiBkhBIeNtGnAchfQ43EY8cRvjO
	 koVR4YZYB5Lz4h2fsn2XTZ+wtjq4kNQnJmK+88kQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbgHSR7W (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Aug 2020 13:59:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:35538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726685AbgHSR7Q (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 19 Aug 2020 13:59:16 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E959E20758;
        Wed, 19 Aug 2020 17:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597859955;
        bh=XDjdr5MiK7GXK9xIxnBBov3CQznIvioVNLtmyltdqQE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vIwiBt4jhLxUvsdJv7C6Rg+Xz1ShohLiH7pW7sPB+auhkR4bH8d+6X6PsNU2fOHPb
         NDZWrNwKpO8UjnWcOXNgzlt+mXdU1oS4+tl88QF6zbPf9+6h6Ua7/+9dcCnb3T8Cp+
         3UOJ56TbMmxTHMQlXgqc0vxfoX1RUfYOyq8RPprg=
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
Subject: [RESEND PATCH 3/5] ARM: dts: spear: Align L2 cache-controller nodename with dtschema
Date:   Wed, 19 Aug 2020 19:58:51 +0200
Message-Id: <20200819175853.21492-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819175853.21492-1-krzk@kernel.org>
References: <20200819175853.21492-1-krzk@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Fix dtschema validator warnings like:
    l2-cache: $nodename:0: 'l2-cache' does not match '^(cache-controller|cpu)(@[0-9a-f,]+)*$'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/spear13xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/spear13xx.dtsi b/arch/arm/boot/dts/spear13xx.dtsi
index f187da4485f4..c87b881b2c8b 100644
--- a/arch/arm/boot/dts/spear13xx.dtsi
+++ b/arch/arm/boot/dts/spear13xx.dtsi
@@ -43,7 +43,7 @@
 			      0 7 0x04>;
 	};
 
-	L2: l2-cache {
+	L2: cache-controller {
 		    compatible = "arm,pl310-cache";
 		    reg = <0xed000000 0x1000>;
 		    cache-unified;
-- 
2.17.1

