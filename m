Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BA3C282DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:18:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AAF4420720
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:18:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729222AbgAHQSN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 11:18:13 -0500
Received: from mout.perfora.net ([74.208.4.194]:38405 "EHLO mout.perfora.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728288AbgAHQSN (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 8 Jan 2020 11:18:13 -0500
X-Greylist: delayed 314 seconds by postgrey-1.27 at vger.kernel.org; Wed, 08 Jan 2020 11:18:13 EST
Received: from marcel-nb-toradex-int.toradex.int ([31.10.206.124]) by
 mrelay.perfora.net (mreueus001 [74.208.5.2]) with ESMTPSA (Nemesis) id
 0M4Yxu-1jcU710aU8-00ycLZ; Wed, 08 Jan 2020 17:12:39 +0100
From:   Marcel Ziswiler <marcel@ziswiler.com>
To:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stefan Agner <stefan@agner.ch>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] ARM: dts: imx7: Fix Toradex Colibri iMX7S 256MB NAND flash support
Date:   Wed,  8 Jan 2020 17:12:31 +0100
Message-Id: <20200108161232.327424-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NgfM57qzSnHZU6RlIq2nxaQLQoxcUkHwSvrd2wvK1n/CK2WmzBL
 mLr2Bbu8CFVuMfDzmap6ePR0nYAk7KDdFxRsbxKWT7RTbwwCWk4IPNl0dGJSu5dmPZMsbHf
 Y6meot00kKbCmeIFnF+RqptM88BoxCLh2aVH2dnCTtAAGA6qvIXtzBDDEuNnfQpe4XuDtXP
 Nks7b2X4yavDuHRjaHQXQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:seWHPMGoOJ8=:QYKX0nQRouKs9hsb7ioqrM
 KMhAdmiPMraZbQzHQrIZs8j/Au6rkDL9bSnfZREldBT82BxbVoFKlMNMSCc4/vhxz8UeS4ObM
 BofG+YpZlTNlU70Q0mHfesjOj2zJHyqOAs04clY0+Y9sJS4vpGA4PafY3DdNBoF3UCsCSfqrN
 oAfeRA4QKsP+au3CSODq26dyme7Xf6w1uTmBtGts1OdGg/jfr8x3yuMJo6Ab5iEIFFnGrCJk7
 itNgHPjMrq1DQosg5lKqGLKwbcmClyGuJe5JlG74HVuygvInWv8+Cq82N2mXZatCvU9Lr0qWo
 yrSXPn7EHTZsjNVOBFdVJTb9D0bYGRb0RzrwEhOSiovHhQ3UNN0a7Fnp5taqWlhtoPwkAm6EO
 4E5XbO88HnTejV4e8TGbaUaPbIQyc5sMNreTi/vYGgJeVSarVRU7/HwjYuweH6lQ/ygfX6acp
 /CMq65wWL+kKBzKfiuCKnAhLaCJ2H3zJapgzzn5XK+rHLASiNSALWrht2gV3nl/gM9zY7F6yO
 +wS5VYaQrlkBYteFXrj98/x5rPHPWffm7muHmGvX3utq8ymmZ1rblgh8LMihPlIbgn4Sv53yS
 MAuXaYz3/z4g9mVpSshlnD+t6SJLLqMlv5PlKpZ5ISdap8rqbw9hqDcZoJtusPPIj8ebMSRra
 1EBPtDEZPfgHQGGN/rCHM6sN5o2rDewL1Hr3amzllNthMalgb1T8qiCWFTBEEV+9Pf7t5Gk/4
 ASwX+geCD9R21MXzVp3MMvuKWQ7WeURGD+Yz5iCghmZzGU4vQ0qvC/Dued+uyqTRCIO6yBSCA
 q5wlyaK+P2Lvw2MTvCKx3toULhRK6VsXeb8lKFZFIhpUdVyJ+cBGo6kbPujuTM0V8QA3nzzqb
 VtNsZiRkmU4U72iis0QA==
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Turns out when introducing the eMMC version the gpmi node required for
NAND flash support got enabled exclusively on Colibri iMX7D 512MB.

Fixes: f928a4a377e4 ("ARM: dts: imx7: add Toradex Colibri iMX7D 1GB (eMMC) support")

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/imx7s-colibri.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s-colibri.dtsi b/arch/arm/boot/dts/imx7s-colibri.dtsi
index 1fb1ec5d3d70..6d16e32aed89 100644
--- a/arch/arm/boot/dts/imx7s-colibri.dtsi
+++ b/arch/arm/boot/dts/imx7s-colibri.dtsi
@@ -49,3 +49,7 @@ memory@80000000 {
 		reg = <0x80000000 0x10000000>;
 	};
 };
+
+&gpmi {
+	status = "okay";
+};
-- 
2.24.1

