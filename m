Return-Path: <SRS0=dlvX=AH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BB9C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 08:07:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 145C120836
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 08:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593158838;
	bh=nGGMZWvsN3S1Ts/DraeRv1TrECa7+j+0GR9n0Z4CkCY=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=j3GNH+6ct5yMvRq43Pz81SeJb0UFbjMLlnQ/p37txkpK8va47qhntJFlGWzOw4hfH
	 7waHeiR31ZYyja/Nu2oQ9X1iJ1Dg7ubxnHB0xVcwNagOw3LgPpLap9NyxK6J8RrIR+
	 ddU9e+QAad3CNzuKZ4FfyjHMVi7aNlQHmvAnkSwE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729389AbgFZIHN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 26 Jun 2020 04:07:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:37480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729264AbgFZIGS (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 26 Jun 2020 04:06:18 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 605D220836;
        Fri, 26 Jun 2020 08:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593158778;
        bh=nGGMZWvsN3S1Ts/DraeRv1TrECa7+j+0GR9n0Z4CkCY=;
        h=From:To:Cc:Subject:Date:From;
        b=W8KHRuf17/k29Kvrm2+97iNK3kM86hdbQVsoLtJ9fU2mrj/QOyLCdPHVWPPbwDQ0U
         nt/3dMRAwQrTQsKCvF/rvILNAwJ6O6PIioeV5WuDe0JU2grNvHs9pZERlS/hrAEvZ0
         KmzmH3azfQ0wEUSyIYofprwEzjXfoFYsBlyfaVC0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Barry Song <baohua@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: prima: Align L2 cache-controller nodename with dtschema
Date:   Fri, 26 Jun 2020 10:06:13 +0200
Message-Id: <20200626080613.3955-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Fix dtschema validator warnings like:
    l2-cache-controller@80040000: $nodename:0:
        'l2-cache-controller@80040000' does not match '^(cache-controller|cpu)(@[0-9a-f,]+)*$'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/prima2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/prima2.dtsi b/arch/arm/boot/dts/prima2.dtsi
index 9c7b46b90c3c..7d3d93c22ed9 100644
--- a/arch/arm/boot/dts/prima2.dtsi
+++ b/arch/arm/boot/dts/prima2.dtsi
@@ -50,7 +50,7 @@
 		#size-cells = <1>;
 		ranges = <0x40000000 0x40000000 0x80000000>;
 
-		l2-cache-controller@80040000 {
+		cache-controller@80040000 {
 			compatible = "arm,pl310-cache";
 			reg = <0x80040000 0x1000>;
 			interrupts = <59>;
-- 
2.17.1

