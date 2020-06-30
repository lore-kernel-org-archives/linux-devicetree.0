Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A933C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 16:06:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4787220759
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 16:06:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="hLlGg3Yk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgF3QGl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 12:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbgF3QGk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Jun 2020 12:06:40 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A0EBC061755
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 09:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=MV3MKHWYAq0IW2XeDBL0BeIhtAhu9qVj0lWNEdc57q4=; b=hLlGg3Yk1OhaM3fcCvCWUeXk1
        v1yFa+1d8QCzf05EzvE1PDw2eaxpya0vU4R4e5KFIKC6ih5rmFLTuoOnYQfgN2PNCSbcXcf8dI+lR
        +BclPfq1S2NvtieKRXpjKZEnEFOeSSOSZROSEuqjn4jJNly+4Kp1mfPFEdDvAoDndcXyV5ppwpWkk
        nr2aQRPkCQgFdGbEVfS6c1Cr2wAYblWlPlt+Vua4RXnm+YJX6WMloGUjlzjnj6M/lKQRmEnVVuLv/
        fcT2ESLugYxH+GdUQz5YXuMq2hw7SUb3OwDkKRHIkpx6JRDJqLwZ/R77bB9J5EyeQ7JpSEXU24duy
        QOF2qCI5g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33610)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jqImL-0000lE-2k; Tue, 30 Jun 2020 17:06:37 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jqImK-0008JS-PY; Tue, 30 Jun 2020 17:06:36 +0100
Date:   Tue, 30 Jun 2020 17:06:36 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] phy: armada-38x: fix NETA lockup when repeatedly
 switching speeds
Message-ID: <20200630160636.GE1551@shell.armlinux.org.uk>
References: <20200630160452.GD1551@shell.armlinux.org.uk>
 <E1jqIlO-0007rX-Tv@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1jqIlO-0007rX-Tv@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jun 30, 2020 at 05:05:38PM +0100, Russell King wrote:
> The mvneta hardware appears to lock up in various random ways when
> repeatedly switching speeds between 1G and 2.5G, which involves
> reprogramming the COMPHY.  It is not entirely clear why this happens,
> but best guess is that reprogramming the COMPHY glitches mvneta clocks
> causing the hardware to fail.  It seems that rebooting resolves the
> failure, but not down/up cycling the interface alone.
> 
> Various other approaches have been tried, such as trying to cleanly
> power down the COMPHY and then take it back through the power up
> initialisation, but this does not seem to help.
> 
> It was finally noticed that u-boot's last step when configuring a
> COMPHY for "SGMII" mode was to poke at a register described as
> "GBE_CONFIGURATION_REG", which is undocumented in any external
> documentation.  All that we have is the fact that u-boot sets a bit
> corresponding to the "SGMII" lane at the end of COMPHY initialisation.
> 
> Experimentation shows that if we clear this bit prior to changing the
> speed, and then set it afterwards, mvneta does not suffer this problem
> on the SolidRun Clearfog when switching speeds between 1G and 2.5G.
> 
> This problem was found while script-testing phylink.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

I forgot...

Fixes: 14dc100b4411 ("phy: armada38x: add common phy support")

> ---
>  arch/arm/boot/dts/armada-38x.dtsi          |  3 +-
>  drivers/phy/marvell/phy-armada38x-comphy.c | 45 ++++++++++++++++++----
>  2 files changed, 40 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
> index e038abc0c6b4..420ae26e846b 100644
> --- a/arch/arm/boot/dts/armada-38x.dtsi
> +++ b/arch/arm/boot/dts/armada-38x.dtsi
> @@ -344,7 +344,8 @@
>  
>  			comphy: phy@18300 {
>  				compatible = "marvell,armada-380-comphy";
> -				reg = <0x18300 0x100>;
> +				reg-names = "comphy", "conf";
> +				reg = <0x18300 0x100>, <0x18460 4>;
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
> diff --git a/drivers/phy/marvell/phy-armada38x-comphy.c b/drivers/phy/marvell/phy-armada38x-comphy.c
> index 6960dfd8ad8c..0fe408964334 100644
> --- a/drivers/phy/marvell/phy-armada38x-comphy.c
> +++ b/drivers/phy/marvell/phy-armada38x-comphy.c
> @@ -41,6 +41,7 @@ struct a38x_comphy_lane {
>  
>  struct a38x_comphy {
>  	void __iomem *base;
> +	void __iomem *conf;
>  	struct device *dev;
>  	struct a38x_comphy_lane lane[MAX_A38X_COMPHY];
>  };
> @@ -54,6 +55,21 @@ static const u8 gbe_mux[MAX_A38X_COMPHY][MAX_A38X_PORTS] = {
>  	{ 0, 0, 3 },
>  };
>  
> +static void a38x_set_conf(struct a38x_comphy_lane *lane, bool enable)
> +{
> +	struct a38x_comphy *priv = lane->priv;
> +	u32 conf;
> +
> +	if (priv->conf) {
> +		conf = readl_relaxed(priv->conf);
> +		if (enable)
> +			conf |= BIT(lane->port);
> +		else
> +			conf &= ~BIT(lane->port);
> +		writel(conf, priv->conf);
> +	}
> +}
> +
>  static void a38x_comphy_set_reg(struct a38x_comphy_lane *lane,
>  				unsigned int offset, u32 mask, u32 value)
>  {
> @@ -97,6 +113,7 @@ static int a38x_comphy_set_mode(struct phy *phy, enum phy_mode mode, int sub)
>  {
>  	struct a38x_comphy_lane *lane = phy_get_drvdata(phy);
>  	unsigned int gen;
> +	int ret;
>  
>  	if (mode != PHY_MODE_ETHERNET)
>  		return -EINVAL;
> @@ -115,13 +132,20 @@ static int a38x_comphy_set_mode(struct phy *phy, enum phy_mode mode, int sub)
>  		return -EINVAL;
>  	}
>  
> +	a38x_set_conf(lane, false);
> +
>  	a38x_comphy_set_speed(lane, gen, gen);
>  
> -	return a38x_comphy_poll(lane, COMPHY_STAT1,
> -				COMPHY_STAT1_PLL_RDY_TX |
> -				COMPHY_STAT1_PLL_RDY_RX,
> -				COMPHY_STAT1_PLL_RDY_TX |
> -				COMPHY_STAT1_PLL_RDY_RX);
> +	ret = a38x_comphy_poll(lane, COMPHY_STAT1,
> +			       COMPHY_STAT1_PLL_RDY_TX |
> +			       COMPHY_STAT1_PLL_RDY_RX,
> +			       COMPHY_STAT1_PLL_RDY_TX |
> +			       COMPHY_STAT1_PLL_RDY_RX);
> +
> +	if (ret == 0)
> +		a38x_set_conf(lane, true);
> +
> +	return ret;
>  }
>  
>  static const struct phy_ops a38x_comphy_ops = {
> @@ -174,14 +198,21 @@ static int a38x_comphy_probe(struct platform_device *pdev)
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(&pdev->dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
>  	priv->dev = &pdev->dev;
>  	priv->base = base;
>  
> +	/* Optional */
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "conf");
> +	if (res) {
> +		priv->conf = devm_ioremap_resource(&pdev->dev, res);
> +		if (IS_ERR(priv->conf))
> +			return PTR_ERR(priv->conf);
> +	}
> +
>  	for_each_available_child_of_node(pdev->dev.of_node, child) {
>  		struct phy *phy;
>  		int ret;
> -- 
> 2.20.1
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
