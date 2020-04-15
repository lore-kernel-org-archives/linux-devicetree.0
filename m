Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002D0C2BA19
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 15:45:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4ABB2078B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 15:45:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="OK8n0MgL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1414898AbgDOPpD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 11:45:03 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:33178 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1414872AbgDOPoe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Apr 2020 11:44:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=RsMinqNBHcBxPu4JtPaqIeJQm1L0qtrioJ5JRN1lF0o=; b=OK8n0MgLyy5lBv39bB+Ps+Ev0T
        xzNOdSznDYeidxQllWwMptZVM8ebRqBDyL4FZA5xLISpRe51v3GTBbARD8g59Ug3RUWAeHbnVBkTK
        VMma3VaWtHqVWvjzZcVupcuG+MVHbcZYlljZVMsT3tVs+Sq0UxQh7+P2THvBWjvPUJyY7V609rkWf
        JAQwTZZx7I8uT5eFbNzcK7HYT8kW6+PogVvllv34eH6J79yJy1KFSAP3KA9tBk6WEogfVHBM+JJbH
        z1kn1F8Ru0xgM9cEnzhF1c/b9O8xTFFT04l5kmel6s3cvX6wXOH4KlNafH5c7ulX4yLH8z8e8oUps
        0TaHqdpw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:60590 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jOkD4-0007IJ-Gd; Wed, 15 Apr 2020 16:44:18 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jOkD3-00067R-RZ; Wed, 15 Apr 2020 16:44:17 +0100
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH] arm: dts: imx6-sr-som: add ethernet PHY configuration
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jOkD3-00067R-RZ@rmk-PC.armlinux.org.uk>
Date:   Wed, 15 Apr 2020 16:44:17 +0100
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add ethernet PHY configuration ahead of removing the quirk that
configures the clocking mode for the PHY.  The RGMII delay is
already set correctly.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
This patch depends on b1f4c209d840 ("net: phy: at803x: fix clock
sink configuration on ATH8030 and ATH8035") which has been
recently merged.

 arch/arm/boot/dts/imx6qdl-sr-som.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-sr-som.dtsi b/arch/arm/boot/dts/imx6qdl-sr-som.dtsi
index 6d7f6b9035bc..b06577808ff4 100644
--- a/arch/arm/boot/dts/imx6qdl-sr-som.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sr-som.dtsi
@@ -53,10 +53,21 @@
 &fec {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_microsom_enet_ar8035>;
+	phy-handle = <&phy>;
 	phy-mode = "rgmii-id";
 	phy-reset-duration = <2>;
 	phy-reset-gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
 	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy: ethernet-phy@0 {
+			reg = <0>;
+			qca,clk-out-frequency = <125000000>;
+		};
+	};
 };
 
 &iomuxc {
-- 
2.20.1

