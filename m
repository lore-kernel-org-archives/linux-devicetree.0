Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765C0C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 03:04:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 51F98206E1
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 03:04:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbfLCDD7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 22:03:59 -0500
Received: from inva020.nxp.com ([92.121.34.13]:57370 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725941AbfLCDD7 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 2 Dec 2019 22:03:59 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 073651A125B;
        Tue,  3 Dec 2019 04:03:58 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A62FE1A0E99;
        Tue,  3 Dec 2019 04:03:54 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 2E5074028F;
        Tue,  3 Dec 2019 11:03:50 +0800 (SGT)
From:   Peter Chen <peter.chen@nxp.com>
To:     shawnguo@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-imx@nxp.com,
        Peter Chen <peter.chen@nxp.com>,
        =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
Subject: [PATCH RESEND 1/1] ARM: dts: imx7s: Add power domain for imx7d HSIC
Date:   Tue,  3 Dec 2019 11:01:52 +0800
Message-Id: <1575342112-14702-1-git-send-email-peter.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Otherwise, the system will hang if USB driver try to access
portsc register.

Cc: André Draszik <git@andred.net>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 arch/arm/boot/dts/imx7s.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index c1a4fff5ceda..a5b380f530f8 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -658,6 +658,12 @@
 						reg = <1>;
 						power-supply = <&reg_1p0d>;
 					};
+
+					pgc_hsic_phy: power-domain@2 {
+						#power-domain-cells = <0>;
+						reg = <2>;
+						power-supply = <&reg_1p2>;
+					};
 				};
 			};
 		};
@@ -1101,6 +1107,7 @@
 				compatible = "fsl,imx7d-usb", "fsl,imx27-usb";
 				reg = <0x30b30000 0x200>;
 				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&pgc_hsic_phy>;
 				clocks = <&clks IMX7D_USB_CTRL_CLK>;
 				fsl,usbphy = <&usbphynop3>;
 				fsl,usbmisc = <&usbmisc3 0>;
-- 
2.17.1

