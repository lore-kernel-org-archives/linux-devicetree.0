Return-Path: <SRS0=sT6Z=YP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467E1CA9EBB
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 14:35:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1CDF521872
	for <linux-devicetree@archiver.kernel.org>; Tue, 22 Oct 2019 14:35:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbfJVOfL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 22 Oct 2019 10:35:11 -0400
Received: from 3.mo179.mail-out.ovh.net ([178.33.251.175]:40366 "EHLO
        3.mo179.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732039AbfJVOfK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 22 Oct 2019 10:35:10 -0400
Received: from player793.ha.ovh.net (unknown [10.108.35.158])
        by mo179.mail-out.ovh.net (Postfix) with ESMTP id AD6DD14633E
        for <devicetree@vger.kernel.org>; Tue, 22 Oct 2019 15:18:24 +0200 (CEST)
Received: from armadeus.com (lfbn-1-7591-179.w90-126.abo.wanadoo.fr [90.126.248.179])
        (Authenticated sender: sebastien.szymanski@armadeus.com)
        by player793.ha.ovh.net (Postfix) with ESMTPSA id F286CB3E3F70;
        Tue, 22 Oct 2019 13:18:10 +0000 (UTC)
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
Subject: [PATCH 3/9] ARM: dts: imx6qdl-apf6: add phy to fec
Date:   Tue, 22 Oct 2019 15:16:49 +0200
Message-Id: <20191022131655.25737-4-sebastien.szymanski@armadeus.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191022131655.25737-1-sebastien.szymanski@armadeus.com>
References: <20191022131655.25737-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 117093590818575429
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkeejgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the mdio bus and the phy to the fec-node.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
---
 arch/arm/boot/dts/imx6qdl-apf6.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-apf6.dtsi b/arch/arm/boot/dts/imx6qdl-apf6.dtsi
index 10981c74c90d..37cbdfd4fb33 100644
--- a/arch/arm/boot/dts/imx6qdl-apf6.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-apf6.dtsi
@@ -11,7 +11,21 @@
 	phy-mode = "rgmii-id";
 	phy-reset-duration = <10>;
 	phy-reset-gpios = <&gpio1 24 GPIO_ACTIVE_LOW>;
+	phy-handle = <&ethphy1>;
 	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy1: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			interrupt-parent = <&gpio1>;
+			interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
+			status = "okay";
+		};
+	};
 };
 
 /* Bluetooth */
-- 
2.21.0

