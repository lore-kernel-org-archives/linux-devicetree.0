Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 320E9CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 15:48:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D43921A4A
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 15:48:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388366AbfJVPsw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 11:48:52 -0400
Received: from 14.mo6.mail-out.ovh.net ([46.105.56.113]:54596 "EHLO
        14.mo6.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387659AbfJVPsw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 22 Oct 2019 11:48:52 -0400
Received: from player793.ha.ovh.net (unknown [10.109.159.152])
        by mo6.mail-out.ovh.net (Postfix) with ESMTP id C12591E4386
        for <devicetree@vger.kernel.org>; Tue, 22 Oct 2019 15:19:35 +0200 (CEST)
Received: from armadeus.com (lfbn-1-7591-179.w90-126.abo.wanadoo.fr [90.126.248.179])
        (Authenticated sender: sebastien.szymanski@armadeus.com)
        by player793.ha.ovh.net (Postfix) with ESMTPSA id 1FB76B3E44A4;
        Tue, 22 Oct 2019 13:19:22 +0000 (UTC)
From:   =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Julien Boibessot <julien.boibessot@armadeus.com>,
        =?UTF-8?q?S=C3=A9bastien=20Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Subject: [PATCH 8/9] ARM: dts: imx6qdl-apf6dev: add backlight support
Date:   Tue, 22 Oct 2019 15:16:54 +0200
Message-Id: <20191022131655.25737-9-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191022131655.25737-1-sebastien.szymanski@armadeus.com>
References: <20191022131655.25737-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 137078316207461445
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkeejgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add PWM backlight support.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
---
 arch/arm/boot/dts/imx6qdl-apf6dev.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi b/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi
index 9067355d8541..f617089be9cc 100644
--- a/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-apf6dev.dtsi
@@ -11,6 +11,14 @@
 		stdout-path = &uart4;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm3 0 191000>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
+		default-brightness-level = <0>;
+		power-supply = <&reg_5v>;
+	};
+
 	disp0 {
 		compatible = "fsl,imx-parallel-display";
 		interface-pix-fmt = "bgr666";
-- 
2.21.0

