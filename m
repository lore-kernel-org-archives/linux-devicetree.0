Return-Path: <SRS0=V/11=AM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BF3C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 06:57:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9ECCE20722
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 06:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593586653;
	bh=MddEptcGuA+xDjhZTaidbaAEbq4GjnI6EOwSMMBEqMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=cThmtWcg2LH5DV1QKr9xQhijUiTdQH4ijxhxRnaEZ4DPZRP5uwYVyqRRGDBpOywQe
	 mOEYfN7UCaqA3Lkx7MfQthbUdCZBiq1rVCovSSeZv4GPH0CvFwJRJ55kp6sqNYSem0
	 RQABlZ3ScYKGikuKttwne3UhDnCvGuDW3P7RqqZo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbgGAG5d (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Jul 2020 02:57:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:54880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbgGAG5c (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 1 Jul 2020 02:57:32 -0400
Received: from localhost (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DBF5020663;
        Wed,  1 Jul 2020 06:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593586651;
        bh=MddEptcGuA+xDjhZTaidbaAEbq4GjnI6EOwSMMBEqMg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T8qPgdvnbqW+zCjqSw63r5xCWrBv5sE3QA98/xCZ/LaisXDiSiUcXjOnyqUFhoHwY
         4aEzhTIimMTP6kKl7tC/4DEP+E8pUFov8s72V4PEK/q6Z5ACWNkhi7Gzq1Th3Z+S1P
         igMPr+3YvkAIUZNx/MtPf6Rpjna5OxYJ/scNYQ2g=
Date:   Wed, 1 Jul 2020 12:27:27 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] phy: armada-38x: fix NETA lockup when repeatedly
 switching speeds
Message-ID: <20200701065727.GY2599@vkoul-mobl>
References: <20200630160452.GD1551@shell.armlinux.org.uk>
 <E1jqIlO-0007rX-Tv@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1jqIlO-0007rX-Tv@rmk-PC.armlinux.org.uk>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 30-06-20, 17:05, Russell King wrote:
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
> ---
>  arch/arm/boot/dts/armada-38x.dtsi          |  3 +-

lgtm, i need ack for dts parts before I can apply this

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

-- 
~Vinod
