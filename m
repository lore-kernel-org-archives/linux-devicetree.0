Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7AEC433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 16:05:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 479322074F
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 16:05:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="EmuPxIJV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729305AbgF3QFl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 12:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729101AbgF3QFk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Jun 2020 12:05:40 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61700C061755
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 09:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:In-reply-to:Cc:To:From:
        Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
        :Resent-To:Resent-Cc:Resent-Message-ID:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=8eaWT6D6o+QUzwP6qY8G3Dh1akIB5hTVskRSmcirnN8=; b=EmuPxIJV5Cc81JjinJKE77se0c
        AWXkqodGv0ucAmgRKj0nWI1lnqUx/pS26dSaMj4RsHsYBMGfgLR4rixtE73c2s6Od7yakawxz87ms
        Y0aSGxQ3XlOD3YRtKHYH1MYCxlVyYN3H8mvQ7O1BKgRjukzlhxQ9YziQ02eJPT/gkGbXeOfYCFvB0
        KRLQrQvJBXwnQfSHHJcgcuB5niZvJr8Jog354o4yqlG/6hbb04TH5lNPaDNDpvqsQ9wdHr81tSiZZ
        WV8lSe+M0fiV1RJcPPduqxcLJj64EW46DaKCFAQfxgWC8IEd29vZFx4wbW+RKxrQZGGaSMTJf5Bl0
        MoXkADsw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47768 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jqIlP-0000kf-4h; Tue, 30 Jun 2020 17:05:39 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jqIlO-0007rX-Tv; Tue, 30 Jun 2020 17:05:38 +0100
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-reply-to: <20200630160452.GD1551@shell.armlinux.org.uk>
Subject: [PATCH 2/2] phy: armada-38x: fix NETA lockup when repeatedly
 switching speeds
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jqIlO-0007rX-Tv@rmk-PC.armlinux.org.uk>
Date:   Tue, 30 Jun 2020 17:05:38 +0100
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The mvneta hardware appears to lock up in various random ways when
repeatedly switching speeds between 1G and 2.5G, which involves
reprogramming the COMPHY.  It is not entirely clear why this happens,
but best guess is that reprogramming the COMPHY glitches mvneta clocks
causing the hardware to fail.  It seems that rebooting resolves the
failure, but not down/up cycling the interface alone.

Various other approaches have been tried, such as trying to cleanly
power down the COMPHY and then take it back through the power up
initialisation, but this does not seem to help.

It was finally noticed that u-boot's last step when configuring a
COMPHY for "SGMII" mode was to poke at a register described as
"GBE_CONFIGURATION_REG", which is undocumented in any external
documentation.  All that we have is the fact that u-boot sets a bit
corresponding to the "SGMII" lane at the end of COMPHY initialisation.

Experimentation shows that if we clear this bit prior to changing the
speed, and then set it afterwards, mvneta does not suffer this problem
on the SolidRun Clearfog when switching speeds between 1G and 2.5G.

This problem was found while script-testing phylink.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 arch/arm/boot/dts/armada-38x.dtsi          |  3 +-
 drivers/phy/marvell/phy-armada38x-comphy.c | 45 ++++++++++++++++++----
 2 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
index e038abc0c6b4..420ae26e846b 100644
--- a/arch/arm/boot/dts/armada-38x.dtsi
+++ b/arch/arm/boot/dts/armada-38x.dtsi
@@ -344,7 +344,8 @@
 
 			comphy: phy@18300 {
 				compatible = "marvell,armada-380-comphy";
-				reg = <0x18300 0x100>;
+				reg-names = "comphy", "conf";
+				reg = <0x18300 0x100>, <0x18460 4>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 
diff --git a/drivers/phy/marvell/phy-armada38x-comphy.c b/drivers/phy/marvell/phy-armada38x-comphy.c
index 6960dfd8ad8c..0fe408964334 100644
--- a/drivers/phy/marvell/phy-armada38x-comphy.c
+++ b/drivers/phy/marvell/phy-armada38x-comphy.c
@@ -41,6 +41,7 @@ struct a38x_comphy_lane {
 
 struct a38x_comphy {
 	void __iomem *base;
+	void __iomem *conf;
 	struct device *dev;
 	struct a38x_comphy_lane lane[MAX_A38X_COMPHY];
 };
@@ -54,6 +55,21 @@ static const u8 gbe_mux[MAX_A38X_COMPHY][MAX_A38X_PORTS] = {
 	{ 0, 0, 3 },
 };
 
+static void a38x_set_conf(struct a38x_comphy_lane *lane, bool enable)
+{
+	struct a38x_comphy *priv = lane->priv;
+	u32 conf;
+
+	if (priv->conf) {
+		conf = readl_relaxed(priv->conf);
+		if (enable)
+			conf |= BIT(lane->port);
+		else
+			conf &= ~BIT(lane->port);
+		writel(conf, priv->conf);
+	}
+}
+
 static void a38x_comphy_set_reg(struct a38x_comphy_lane *lane,
 				unsigned int offset, u32 mask, u32 value)
 {
@@ -97,6 +113,7 @@ static int a38x_comphy_set_mode(struct phy *phy, enum phy_mode mode, int sub)
 {
 	struct a38x_comphy_lane *lane = phy_get_drvdata(phy);
 	unsigned int gen;
+	int ret;
 
 	if (mode != PHY_MODE_ETHERNET)
 		return -EINVAL;
@@ -115,13 +132,20 @@ static int a38x_comphy_set_mode(struct phy *phy, enum phy_mode mode, int sub)
 		return -EINVAL;
 	}
 
+	a38x_set_conf(lane, false);
+
 	a38x_comphy_set_speed(lane, gen, gen);
 
-	return a38x_comphy_poll(lane, COMPHY_STAT1,
-				COMPHY_STAT1_PLL_RDY_TX |
-				COMPHY_STAT1_PLL_RDY_RX,
-				COMPHY_STAT1_PLL_RDY_TX |
-				COMPHY_STAT1_PLL_RDY_RX);
+	ret = a38x_comphy_poll(lane, COMPHY_STAT1,
+			       COMPHY_STAT1_PLL_RDY_TX |
+			       COMPHY_STAT1_PLL_RDY_RX,
+			       COMPHY_STAT1_PLL_RDY_TX |
+			       COMPHY_STAT1_PLL_RDY_RX);
+
+	if (ret == 0)
+		a38x_set_conf(lane, true);
+
+	return ret;
 }
 
 static const struct phy_ops a38x_comphy_ops = {
@@ -174,14 +198,21 @@ static int a38x_comphy_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
 	priv->dev = &pdev->dev;
 	priv->base = base;
 
+	/* Optional */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "conf");
+	if (res) {
+		priv->conf = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(priv->conf))
+			return PTR_ERR(priv->conf);
+	}
+
 	for_each_available_child_of_node(pdev->dev.of_node, child) {
 		struct phy *phy;
 		int ret;
-- 
2.20.1

