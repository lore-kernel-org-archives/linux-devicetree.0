Return-Path: <SRS0=dlvX=AH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9E8C433E2
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 08:05:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAFF82076E
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 08:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593158750;
	bh=Pw00uDHv0w9ajiJYnlNTh7BVUE/3W1DjnoMCQt50UtA=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=0RRmROa5vm8MEFB4MZUkRcPPO1hGacxsonF0T+sRz6e5/Ubkh6uGMaTaAk3dFBV49
	 qAwZF0yRIp17e8RoZcZyCewnelrdZrP7jSW2gYZxiuTF3fP8zRfTjm2HuLzvrBAN6P
	 hEyzjY6aiP/GYKdXQcBdJsMZE0aqXVNuUyU7dDRM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729143AbgFZIFs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 26 Jun 2020 04:05:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:36716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729138AbgFZIFr (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 26 Jun 2020 04:05:47 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C6402082E;
        Fri, 26 Jun 2020 08:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593158746;
        bh=Pw00uDHv0w9ajiJYnlNTh7BVUE/3W1DjnoMCQt50UtA=;
        h=From:To:Cc:Subject:Date:From;
        b=VufpYp/+0rkAKScNxAbMJqVnMsByfP2KkL5cOFVOHwVK/d+MIl76KGjbHuoWzY+1r
         ftWwzq3qorW4OUmxHbPVHphhb5akmPxiftD5uP3fDM9QgoN1iWPoy5+oNm+41yfkV3
         dy/8oZe0eVG5y9qxxCSyO91wAzdMzOG+yNtWsNxE=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: tango: Align L2 cache-controller nodename with dtschema
Date:   Fri, 26 Jun 2020 10:05:43 +0200
Message-Id: <20200626080543.3511-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Fix dtschema validator warnings like:
    l2-cache-controller@20100000: $nodename:0:
        'l2-cache-controller@20100000' does not match '^(cache-controller|cpu)(@[0-9a-f,]+)*$'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/tango4-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tango4-common.dtsi b/arch/arm/boot/dts/tango4-common.dtsi
index 54fd522badfc..d584da314500 100644
--- a/arch/arm/boot/dts/tango4-common.dtsi
+++ b/arch/arm/boot/dts/tango4-common.dtsi
@@ -51,7 +51,7 @@
 		};
 	};
 
-	l2cc: l2-cache-controller@20100000 {
+	l2cc: cache-controller@20100000 {
 		compatible = "arm,pl310-cache";
 		reg = <0x20100000 0x1000>;
 		cache-level = <2>;
-- 
2.17.1

