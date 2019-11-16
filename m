Return-Path: <SRS0=bipS=ZI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750BDC43141
	for <linux-devicetree@archiver.kernel.org>; Sat, 16 Nov 2019 15:58:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4CCB420815
	for <linux-devicetree@archiver.kernel.org>; Sat, 16 Nov 2019 15:58:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729577AbfKPP60 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 16 Nov 2019 10:58:26 -0500
Received: from 50-87-157-213.static.tentacle.fi ([213.157.87.50]:44405 "EHLO
        bitmer.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731335AbfKPP60 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 16 Nov 2019 10:58:26 -0500
X-Greylist: delayed 2480 seconds by postgrey-1.27 at vger.kernel.org; Sat, 16 Nov 2019 10:58:25 EST
Received: from dsl-hkibng31-54faf1-87.dhcp.inet.fi ([84.250.241.87] helo=localhost.localdomain)
        by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.84_2)
        (envelope-from <jarkko.nikula@bitmer.com>)
        id 1iVzon-00077d-37; Sat, 16 Nov 2019 17:16:57 +0200
From:   Jarkko Nikula <jarkko.nikula@bitmer.com>
To:     devicetree@vger.kernel.org
Cc:     linux-omap@vger.kernel.org,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Stefan Roese <sr@denx.de>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        linux-stable <stable@vger.kernel.org>
Subject: [PATCH] ARM: dts: omap3-tao3530: Fix incorrect MMC card detection GPIO polarity
Date:   Sat, 16 Nov 2019 17:16:51 +0200
Message-Id: <20191116151651.7042-1-jarkko.nikula@bitmer.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The MMC card detection GPIO polarity is active low on TAO3530, like in many
other similar boards. Now the card is not detected and it is unable to
mount rootfs from an SD card.

Fix this by using the correct polarity.

This incorrect polarity was defined already in the commit 30d95c6d7092
("ARM: dts: omap3: Add Technexion TAO3530 SOM omap3-tao3530.dtsi") in v3.18
kernel and later changed to use defined GPIO constants in v4.4 kernel by
the commit 3a637e008e54 ("ARM: dts: Use defined GPIO constants in flags
cell for OMAP2+ boards").

While the latter commit did not introduce the issue I'm marking it with
Fixes tag due the v4.4 kernels still being maintained.

Fixes: 3a637e008e54 ("ARM: dts: Use defined GPIO constants in flags cell for OMAP2+ boards")
Cc: linux-stable <stable@vger.kernel.org> # 4.4+
Signed-off-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
---
 arch/arm/boot/dts/omap3-tao3530.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/omap3-tao3530.dtsi b/arch/arm/boot/dts/omap3-tao3530.dtsi
index a7a04d78deeb..f24e2326cfa7 100644
--- a/arch/arm/boot/dts/omap3-tao3530.dtsi
+++ b/arch/arm/boot/dts/omap3-tao3530.dtsi
@@ -222,7 +222,7 @@
 	pinctrl-0 = <&mmc1_pins>;
 	vmmc-supply = <&vmmc1>;
 	vqmmc-supply = <&vsim>;
-	cd-gpios = <&twl_gpio 0 GPIO_ACTIVE_HIGH>;
+	cd-gpios = <&twl_gpio 0 GPIO_ACTIVE_LOW>;
 	bus-width = <8>;
 };
 
-- 
2.24.0

