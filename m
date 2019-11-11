Return-Path: <SRS0=QTuQ=ZD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1CACC43331
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 20:30:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80182214E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 Nov 2019 20:30:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="Wgt/j1h3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbfKKUa1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 Nov 2019 15:30:27 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:33822 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726877AbfKKUa0 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 11 Nov 2019 15:30:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=QElYDqEnVjhgR2amDU3Lld5k4da0izVAi5qsqFodSsI=; b=Wgt/j1h3vFwJqKl/wU63e1862o
        qLvDu1qTUpBxaG5WJSkrtfvtgTlvAYlZrZc4iF1Fp3vDLHPBSYBM0C1pkhNTgAWQtg8a0hTe4LlRp
        EargSxDXqVuz0oEgJKO6EZMKS/2Bnx3lJUzSnNXxQD5kc9i/ML5EE4zrstdEmXSiIc2Q=;
Received: from p200300ccff07dd001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff07:dd00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iUGKM-00015Q-Ur; Mon, 11 Nov 2019 21:30:23 +0100
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1iUGKM-0006Iy-G2; Mon, 11 Nov 2019 21:30:22 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH] ARM: dts: e60k02: fix power button
Date:   Mon, 11 Nov 2019 21:29:59 +0100
Message-Id: <20191111202959.24189-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The power button was only producing irqs, but no key events,
Forced power down with long key press works, so probably
only a short spike arrives at the SoC.
Further investigation shows that LDORTC2 is off after boot
of the vendor kernel. LDORTC2 is shared with a GPIO at the pmic
which probably transfers the button press to the SoC.
That regulator off at boot, so "regulator-boot-on" is definitively
wrong. So remove that.

Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/e60k02.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/e60k02.dtsi b/arch/arm/boot/dts/e60k02.dtsi
index a0ade2ba7a21..33e02bd2b59d 100644
--- a/arch/arm/boot/dts/e60k02.dtsi
+++ b/arch/arm/boot/dts/e60k02.dtsi
@@ -356,11 +356,6 @@
 				regulator-name = "LDORTC1";
 				regulator-boot-on;
 			};
-
-			ldortc2_reg: LDORTC2 {
-				regulator-name = "LDORTC2";
-				regulator-boot-on;
-			};
 		};
 	};
 };
-- 
2.20.1

