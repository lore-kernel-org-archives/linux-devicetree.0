Return-Path: <SRS0=Xf3c=A4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A598C433EA
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 16:01:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56D1A208C7
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jul 2020 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595001671;
	bh=QbFFDHcfMK18BVTPneujdXF5wa9/BSrZb6nRcGZq4MM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=JlCiULsp9AU004DaX2OnDyLyIP3J1tJxp8uJ86f24cUzBE+byyrnGI+zItVLYLpim
	 2scZAZOmdT27OP9Lqai+nrE8tslpC0YjfPLSm3R6JFAdU7LkiXlKDwg2aKE+q3KkOc
	 5ek1lMthqO+sfArboVxaDbxWJ1FsAafvSb+Bs1q4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbgGQQBC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jul 2020 12:01:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:40798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726998AbgGQQBA (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 17 Jul 2020 12:01:00 -0400
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.194.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 43C58207EA;
        Fri, 17 Jul 2020 16:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595001660;
        bh=QbFFDHcfMK18BVTPneujdXF5wa9/BSrZb6nRcGZq4MM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rNAOaOValywCqZggHF3hZsetoRgt5WU+G8oRE17V15JRWkBAXzXM5V+3aTmPv2Sny
         KGnKJvOoQfe1yD2fZD1A5ViNM39AbzdbIZeZCzOkcNrxaxIzrAh2dhW90px2H7oJKy
         XhMGJpXqzZyUo2MZao17oCOe2U2u2+0Gjnr8q4N8=
Received: by wens.tw (Postfix, from userid 1000)
        id 5106B600AA; Sat, 18 Jul 2020 00:00:55 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] arm64: dts: allwinner: h5: bananapi-m2-plus-v1.2: Tie in CPU OPPs
Date:   Sat, 18 Jul 2020 00:00:53 +0800
Message-Id: <20200717160053.31191-9-wens@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717160053.31191-1-wens@kernel.org>
References: <20200717160053.31191-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

The Bananapi M2 Plus H5 v1.2 can work with the standard H5 OPPs.
Tie them in to enable CPU frequency scaling.

The original Bananapi M2 Plus H5 is left out for now, as adding
the fixed regulator along with the enable pin seemed to cause some
glitching in Linux.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../arm64/boot/dts/allwinner/sun50i-h5-bananapi-m2-plus-v1.2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-bananapi-m2-plus-v1.2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-bananapi-m2-plus-v1.2.dts
index 2e2b14c0ae75..8857a3791593 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-bananapi-m2-plus-v1.2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-bananapi-m2-plus-v1.2.dts
@@ -3,6 +3,7 @@
 
 /dts-v1/;
 #include "sun50i-h5.dtsi"
+#include "sun50i-h5-cpu-opp.dtsi"
 #include <arm/sunxi-bananapi-m2-plus-v1.2.dtsi>
 
 / {
-- 
2.27.0

