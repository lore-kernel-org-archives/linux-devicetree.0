Return-Path: <SRS0=WBDS=5X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5B4C2BA1A
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Apr 2020 00:05:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E974320768
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Apr 2020 00:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1586217921;
	bh=VOfh+h2MtQqoZ+YNlZDh/acRHYS0plv1SE5C2r/svls=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=snrVspNr+LctUZwCiisGST3j05s+D9bI3Z8eJoSSVuQikSjRSkvDdS8TDXPirtMjN
	 o8O2HG9ZHkQLkK8z8+NTq2arg6Mzu+xQ4JPM8kg5fjWkwUZ2YnDY0abxo78U53UA4E
	 co2rV+m4nzN+DXUC3eOVmIk6S/ydb0xzX6ADR2AM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgDGACh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Apr 2020 20:02:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:37410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726709AbgDGACh (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 6 Apr 2020 20:02:37 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E661D2078A;
        Tue,  7 Apr 2020 00:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586217756;
        bh=VOfh+h2MtQqoZ+YNlZDh/acRHYS0plv1SE5C2r/svls=;
        h=From:To:Cc:Subject:Date:From;
        b=mftwb1PFM1Tn+abTQFcfDb7yLIxR3icOBJY94ZcgeZ9hK6q8vvUXxyC+6TUM32tZx
         eDv/NrFNEzy3Pu5izFXu2+dFFNgcITQOEzhg4cHlOmGPcL291xXa0NGThU60Vxtacl
         JHsfyyi9ZA0LwWPy6C5QWkuhKdL3+RvBZxq1awUk=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Ondrej Jirman <megous@megous.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 4.19 01/13] ARM: dts: sun8i-a83t-tbs-a711: HM5065 doesn't like such a high voltage
Date:   Mon,  6 Apr 2020 20:02:22 -0400
Message-Id: <20200407000234.17088-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Ondrej Jirman <megous@megous.com>

[ Upstream commit a40550952c000667b20082d58077bc647da6c890 ]

Lowering the voltage solves the quick image degradation over time
(minutes), that was probably caused by overheating.

Signed-off-by: Ondrej Jirman <megous@megous.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
index 49547a43cc90a..54cbdaf7ffdcc 100644
--- a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
@@ -318,8 +318,8 @@
 };
 
 &reg_dldo3 {
-	regulator-min-microvolt = <2800000>;
-	regulator-max-microvolt = <2800000>;
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
 	regulator-name = "vdd-csi";
 };
 
-- 
2.20.1

