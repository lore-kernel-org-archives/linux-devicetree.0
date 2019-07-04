Return-Path: <SRS0=6nRC=VB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:8476 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbfGDNcl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jul 2019 09:32:41 -0400
Subject: Re: [PATCH 3/8] phy: tegra: xusb: t210: rearrange UPHY init
References: <20190614074652.21960-1-jckuo@nvidia.com>
 <20190614074652.21960-4-jckuo@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <1a57e3e6-a9b2-87ba-a76b-1785ddd0d935@nvidia.com>
Date: Thu, 4 Jul 2019 14:32:30 +0100
MIME-Version: 1.0
In-Reply-To: <20190614074652.21960-4-jckuo@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>, gregkh@linuxfoundation.org, thierry.reding@gmail.com, pdeschrijver@nvidia.com, afrid@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-ID: <devicetree@vger.kernel.org>


On 14/06/2019 08:46, JC Kuo wrote:
> This commit is a preparation for enabling XUSB LP0 support.

By LP0 do you mean ELPG? If so please stick to using one name for
referring to the power-state in question.

> It rearranges T210 XUSB PADCTL UPHY initialization sequence,

Please use Tegra210 and not T210.

> for the following reasons:
> 
> 1. PLLE hardware power sequencer has to be enabled only after
>    both PEX UPHY PLL and SATA UPHY PLL are initialized.
> 
> 2. Once UPHY PLL hardware power sequncer is enabled, do not

s/sequncer/sequencer

>    assert reset to PEX/SATA PLLs.

Maybe worth clarifying why here.
	
> 
> 3. At LP0 exit, XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_CLAMP_EN,
>    XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_CLAMP_EN_EARLY, and
>    XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_VCORE_DOWN bits have
>    to be cleared after XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE
>    and XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE bits get set.
> 
> 4. Move XUSB_PADCTL_SS_PORT_MAP and XUSB_PADCTL_UPHY_USB3_PADX_ECTL*
>    registers programming from tegra210_usb3_port_enable() to
>    tegra210_pcie_phy_power_on()/tegra210_sata_phy_power_on() so that
>    XUSB USB3 ports will be programmed at LP0 exit.

Looks like you are moving all the code from the port enable to the phy
enable and after this change the port enable does nothing. Do we not
differentiate between phy and port? I think a bit more description is
necessary here to describe the impact of this change.

> 
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
>  drivers/phy/tegra/xusb-tegra210.c | 443 ++++++++++++++++++------------
>  drivers/phy/tegra/xusb.c          |   2 +-
>  drivers/phy/tegra/xusb.h          |   2 +
>  3 files changed, 264 insertions(+), 183 deletions(-)
> 
> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
> index 18cea8311d22..007bf352b45e 100644
> --- a/drivers/phy/tegra/xusb-tegra210.c
> +++ b/drivers/phy/tegra/xusb-tegra210.c
> @@ -240,6 +240,8 @@ to_tegra210_xusb_padctl(struct tegra_xusb_padctl *padctl)
>  	return container_of(padctl, struct tegra210_xusb_padctl, base);
>  }
>  
> +static int tegra210_usb3_lane_map(struct tegra_xusb_lane *lane);
> +

Can we avoid adding this prototype?

>  /* must be called under padctl->lock */
>  static int tegra210_pex_uphy_enable(struct tegra_xusb_padctl *padctl)
>  {
> @@ -453,35 +455,44 @@ static int tegra210_pex_uphy_enable(struct tegra_xusb_padctl *padctl)
>  static void tegra210_pex_uphy_disable(struct tegra_xusb_padctl *padctl)
>  {
>  	struct tegra_xusb_pcie_pad *pcie = to_pcie_pad(padctl->pcie);
> -
> -	mutex_lock(&padctl->lock);
> +	u32 value;
> +	int i;
>  
>  	if (WARN_ON(pcie->enable == 0))
> -		goto unlock;
> +		return;
>  
>  	if (--pcie->enable > 0)
> -		goto unlock;
> +		return;
>  
> -	reset_control_assert(pcie->rst);
> +	for (i = 0; i < padctl->pcie->soc->num_lanes; i++) {
> +		value = padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
> +		value &= ~XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(i);
> +		padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
> +	}
>  	clk_disable_unprepare(pcie->pll);
> -
> -unlock:
> -	mutex_unlock(&padctl->lock);
>  }
>  
>  /* must be called under padctl->lock */
> -static int tegra210_sata_uphy_enable(struct tegra_xusb_padctl *padctl, bool usb)
> +static int tegra210_sata_uphy_enable(struct tegra_xusb_padctl *padctl)
>  {
>  	struct tegra_xusb_sata_pad *sata = to_sata_pad(padctl->sata);
> +	struct tegra_xusb_lane *lane = tegra_xusb_find_lane(padctl, "sata", 0);
>  	unsigned long timeout;
>  	u32 value;
>  	int err;
> +	bool usb = false;
>  
>  	if (sata->enable > 0) {
>  		sata->enable++;
>  		return 0;
>  	}
>  
> +	if (!lane)
> +		return 0;
> +
> +	if (tegra_xusb_lane_check(lane, "usb3-ss"))
> +		usb = true;

This return a boolean type so you can just ...

	usb = tegra_xusb_lane_check(lane, "usb3-ss");

> +
>  	err = clk_prepare_enable(sata->pll);
>  	if (err < 0)
>  		return err;
> @@ -695,30 +706,36 @@ static int tegra210_sata_uphy_enable(struct tegra_xusb_padctl *padctl, bool usb)
>  static void tegra210_sata_uphy_disable(struct tegra_xusb_padctl *padctl)
>  {
>  	struct tegra_xusb_sata_pad *sata = to_sata_pad(padctl->sata);
> -
> -	mutex_lock(&padctl->lock);
> +	u32 value;
> +	int i;
>  
>  	if (WARN_ON(sata->enable == 0))
> -		goto unlock;
> +		return;
>  
>  	if (--sata->enable > 0)
> -		goto unlock;
> +		return;
>  
> -	reset_control_assert(sata->rst);
> +	for (i = 0; i < padctl->sata->soc->num_lanes; i++) {
> +		value = padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
> +		value &= ~XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(i);
> +		padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
> +	}
>  	clk_disable_unprepare(sata->pll);
> -
> -unlock:
> -	mutex_unlock(&padctl->lock);
>  }
>  
>  static int tegra210_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
>  {
> -	u32 value;
> +	return 0;
> +}
>  
> -	mutex_lock(&padctl->lock);
> +static int tegra210_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
> +{
> +	return 0;
> +}

Why bother keeping these functions at all if they now do nothing?

>  
> -	if (padctl->enable++ > 0)
> -		goto out;
> +static void tegra210_aux_mux_lp0_clamp_disable(struct tegra_xusb_padctl *padctl)

Any reason for renaming these? These appear to deal with the XUSB_PADCTL
and so the previous names seem fine.

> +{
> +	u32 value;
>  
>  	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
>  	value &= ~XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_CLAMP_EN;
> @@ -735,24 +752,12 @@ static int tegra210_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
>  	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
>  	value &= ~XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_VCORE_DOWN;
>  	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> -
> -out:
> -	mutex_unlock(&padctl->lock);
> -	return 0;
>  }
>  
> -static int tegra210_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
> +static void tegra210_aux_mux_lp0_clamp_enable(struct tegra_xusb_padctl *padctl)
>  {
>  	u32 value;
>  
> -	mutex_lock(&padctl->lock);
> -
> -	if (WARN_ON(padctl->enable == 0))
> -		goto out;
> -
> -	if (--padctl->enable > 0)
> -		goto out;
> -
>  	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
>  	value |= XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_VCORE_DOWN;
>  	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> @@ -768,12 +773,76 @@ static int tegra210_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
>  	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
>  	value |= XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_CLAMP_EN;
>  	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +}
> +
> +static int tegra210_uphy_init(struct tegra_xusb_padctl *padctl)
> +{
> +	struct tegra_xusb_pcie_pad *pcie;
> +	struct tegra_xusb_sata_pad *sata;
> +	u32 value;
> +	int err;
> +	int i;
> +
> +	if (tegra210_plle_hw_sequence_is_enabled()) {
> +		dev_dbg(padctl->dev, "PLLE is already in HW control\n");
> +		/* skip pll initialization, update plle refcount only */
> +		if (padctl->pcie) {
> +			pcie = to_pcie_pad(padctl->pcie);
> +			if (pcie->enable == 0) {
> +				err = clk_prepare_enable(pcie->pll);
> +				if (err < 0)
> +					return err;
> +				pcie->enable++;

Do we need all this additional ref counting around clk_prepare_enable?

> +			}
> +		}
> +		if (padctl->sata) {
> +			sata = to_sata_pad(padctl->sata);
> +			if (sata->enable == 0) {
> +				err = clk_prepare_enable(sata->pll);
> +				if (err < 0)
> +					return err;
> +				sata->enable++;

Same here.

> +			}
> +		}
> +		goto skip_pll_init;
> +	}
> +
> +	if (padctl->pcie)
> +		tegra210_pex_uphy_enable(padctl);
> +	if (padctl->sata)
> +		tegra210_sata_uphy_enable(padctl);
> +
> +	tegra210_plle_hw_sequence_start();
> +
> +skip_pll_init:
> +	for (i = 0; i < padctl->pcie->soc->num_lanes; i++) {
> +		value = padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
> +		value |= XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(i);
> +		padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
> +	}
> +
> +	for (i = 0; i < padctl->sata->soc->num_lanes; i++) {
> +		value = padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
> +		value |= XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(i);
> +		padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
> +	}
> +
> +	tegra210_aux_mux_lp0_clamp_disable(padctl);
>  
> -out:
> -	mutex_unlock(&padctl->lock);
>  	return 0;
>  }
>  
> +static void __maybe_unused
> +tegra210_uphy_deinit(struct tegra_xusb_padctl *padctl)
> +{
> +	tegra210_aux_mux_lp0_clamp_enable(padctl);
> +
> +	if (padctl->pcie)
> +		tegra210_pex_uphy_disable(padctl);
> +	if (padctl->sata)
> +		tegra210_sata_uphy_disable(padctl);

What about the clocks that were enabled?

> +}
> +
>  static int tegra210_hsic_set_idle(struct tegra_xusb_padctl *padctl,
>  				  unsigned int index, bool idle)
>  {
> @@ -1420,6 +1489,113 @@ static const struct tegra_xusb_lane_soc tegra210_pcie_lanes[] = {
>  	TEGRA210_LANE("pcie-6", 0x028, 24, 0x3, pcie),
>  };
>  
> +static int tegra210_usb3_phy_power_on(struct phy *phy)
> +{
> +	struct device *dev = &phy->dev;
> +	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
> +	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
> +	struct tegra_xusb_usb3_port *usb3 = tegra_xusb_find_usb3_port(padctl,
> +					    tegra210_usb3_lane_map(lane));

I think that this should be placed on separate lines. Other places you
check the return value of tegra210_usb3_lane_map() but here you don't.
We should be consistent.

> +	int index;
> +	u32 value;
> +
> +	if (!usb3) {
> +		dev_err(dev, "no USB3 port found for lane %u\n", lane->index);
> +		return -ENODEV;
> +	}
> +	index = usb3->base.index;
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
> +
> +	if (!usb3->internal)
> +		value &= ~XUSB_PADCTL_SS_PORT_MAP_PORTX_INTERNAL(index);
> +	else
> +		value |= XUSB_PADCTL_SS_PORT_MAP_PORTX_INTERNAL(index);
> +
> +	value &= ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(index);
> +	value |= XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(index, usb3->port);
> +	padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_UPHY_USB3_PADX_ECTL1(index));
> +	value &= ~(XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_MASK <<
> +		   XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_SHIFT);
> +	value |= XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_VAL <<
> +		 XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_SHIFT;
> +	padctl_writel(padctl, value, XUSB_PADCTL_UPHY_USB3_PADX_ECTL1(index));
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_UPHY_USB3_PADX_ECTL2(index));
> +	value &= ~(XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_MASK <<
> +		   XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_SHIFT);
> +	value |= XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_VAL <<
> +		 XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_SHIFT;
> +	padctl_writel(padctl, value, XUSB_PADCTL_UPHY_USB3_PADX_ECTL2(index));
> +
> +	padctl_writel(padctl, XUSB_PADCTL_UPHY_USB3_PAD_ECTL3_RX_DFE_VAL,
> +		      XUSB_PADCTL_UPHY_USB3_PADX_ECTL3(index));
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_UPHY_USB3_PADX_ECTL4(index));
> +	value &= ~(XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_MASK <<
> +		   XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_SHIFT);
> +	value |= XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_VAL <<
> +		 XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_SHIFT;
> +	padctl_writel(padctl, value, XUSB_PADCTL_UPHY_USB3_PADX_ECTL4(index));
> +
> +	padctl_writel(padctl, XUSB_PADCTL_UPHY_USB3_PAD_ECTL6_RX_EQ_CTRL_H_VAL,
> +		      XUSB_PADCTL_UPHY_USB3_PADX_ECTL6(index));
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +	value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(index);
> +	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +	usleep_range(100, 200);
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +	value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(index);
> +	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +	usleep_range(100, 200);
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +	value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(index);
> +	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +	return 0;
> +}
> +
> +static int tegra210_usb3_phy_power_off(struct phy *phy)
> +{
> +	struct device *dev = &phy->dev;
> +	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
> +	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
> +	struct tegra_xusb_usb3_port *usb3 = tegra_xusb_find_usb3_port(padctl,
> +					    tegra210_usb3_lane_map(lane));
> +	int index;
> +	u32 value;
> +
> +	if (!usb3) {
> +		dev_err(dev, "no USB3 port found for lane %u\n", lane->index);
> +		return -ENODEV;
> +	}
> +	index = usb3->base.index;
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +	value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(index);
> +	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +	usleep_range(100, 200);
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +	value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(index);
> +	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +	usleep_range(250, 350);
> +
> +	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> +	value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(index);
> +	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> +
> +	return 0;
> +}
>  static struct tegra_xusb_lane *
>  tegra210_pcie_lane_probe(struct tegra_xusb_pad *pad, struct device_node *np,
>  			 unsigned int index)
> @@ -1461,6 +1637,13 @@ static const struct tegra_xusb_lane_ops tegra210_pcie_lane_ops = {
>  static int tegra210_pcie_phy_init(struct phy *phy)
>  {
>  	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
> +	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
> +
> +	mutex_lock(&padctl->lock);
> +
> +	tegra210_uphy_init(padctl);
> +
> +	mutex_unlock(&padctl->lock);
>  
>  	return tegra210_xusb_padctl_enable(lane->pad->padctl);
>  }
> @@ -1476,20 +1659,13 @@ static int tegra210_pcie_phy_power_on(struct phy *phy)
>  {
>  	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
>  	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
> -	u32 value;
> -	int err;
> +	int err = 0;
>  
>  	mutex_lock(&padctl->lock);
>  
> -	err = tegra210_pex_uphy_enable(padctl);
> -	if (err < 0)
> -		goto unlock;
> +	if (tegra_xusb_lane_check(lane, "usb3-ss"))
> +		err = tegra210_usb3_phy_power_on(phy);
>  
> -	value = padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
> -	value |= XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(lane->index);
> -	padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
> -
> -unlock:
>  	mutex_unlock(&padctl->lock);
>  	return err;
>  }
> @@ -1498,15 +1674,15 @@ static int tegra210_pcie_phy_power_off(struct phy *phy)
>  {
>  	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
>  	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
> -	u32 value;
> +	int err = 0;
>  
> -	value = padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
> -	value &= ~XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(lane->index);
> -	padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
> +	mutex_lock(&padctl->lock);
>  
> -	tegra210_pex_uphy_disable(padctl);
> +	if (tegra_xusb_lane_check(lane, "usb3-ss"))
> +		err = tegra210_usb3_phy_power_off(phy);
>  
> -	return 0;
> +	mutex_unlock(&padctl->lock);
> +	return err;
>  }
>  
>  static const struct phy_ops tegra210_pcie_phy_ops = {
> @@ -1632,7 +1808,13 @@ static const struct tegra_xusb_lane_ops tegra210_sata_lane_ops = {
>  static int tegra210_sata_phy_init(struct phy *phy)
>  {
>  	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
> +	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
> +
> +	mutex_lock(&padctl->lock);
> +
> +	tegra210_uphy_init(padctl);
>  
> +	mutex_unlock(&padctl->lock);
>  	return tegra210_xusb_padctl_enable(lane->pad->padctl);
>  }
>  
> @@ -1647,20 +1829,13 @@ static int tegra210_sata_phy_power_on(struct phy *phy)
>  {
>  	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
>  	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
> -	u32 value;
> -	int err;
> +	int err = 0;
>  
>  	mutex_lock(&padctl->lock);
>  
> -	err = tegra210_sata_uphy_enable(padctl, false);
> -	if (err < 0)
> -		goto unlock;
> -
> -	value = padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
> -	value |= XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(lane->index);
> -	padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
> +	if (tegra_xusb_lane_check(lane, "usb3-ss"))
> +		err = tegra210_usb3_phy_power_on(phy);
>  
> -unlock:
>  	mutex_unlock(&padctl->lock);
>  	return err;
>  }
> @@ -1669,15 +1844,15 @@ static int tegra210_sata_phy_power_off(struct phy *phy)
>  {
>  	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
>  	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
> -	u32 value;
> +	int err = 0;
>  
> -	value = padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
> -	value &= ~XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(lane->index);
> -	padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
> +	mutex_lock(&padctl->lock);
>  
> -	tegra210_sata_uphy_disable(lane->pad->padctl);
> +	if (tegra_xusb_lane_check(lane, "usb3-ss"))
> +		err = tegra210_usb3_phy_power_off(phy);
>  
> -	return 0;
> +	mutex_unlock(&padctl->lock);
> +	return err;
>  }
>  
>  static const struct phy_ops tegra210_sata_phy_ops = {
> @@ -1802,125 +1977,11 @@ static const struct tegra_xusb_port_ops tegra210_hsic_port_ops = {
>  
>  static int tegra210_usb3_port_enable(struct tegra_xusb_port *port)
>  {
> -	struct tegra_xusb_usb3_port *usb3 = to_usb3_port(port);
> -	struct tegra_xusb_padctl *padctl = port->padctl;
> -	struct tegra_xusb_lane *lane = usb3->base.lane;
> -	unsigned int index = port->index;
> -	u32 value;
> -	int err;
> -
> -	value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
> -
> -	if (!usb3->internal)
> -		value &= ~XUSB_PADCTL_SS_PORT_MAP_PORTX_INTERNAL(index);
> -	else
> -		value |= XUSB_PADCTL_SS_PORT_MAP_PORTX_INTERNAL(index);
> -
> -	value &= ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(index);
> -	value |= XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(index, usb3->port);
> -	padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
> -
> -	/*
> -	 * TODO: move this code into the PCIe/SATA PHY ->power_on() callbacks
> -	 * and conditionalize based on mux function? This seems to work, but
> -	 * might not be the exact proper sequence.
> -	 */
> -	err = regulator_enable(usb3->supply);
> -	if (err < 0)
> -		return err;
> -
> -	value = padctl_readl(padctl, XUSB_PADCTL_UPHY_USB3_PADX_ECTL1(index));
> -	value &= ~(XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_MASK <<
> -		   XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_SHIFT);
> -	value |= XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_VAL <<
> -		 XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_SHIFT;
> -	padctl_writel(padctl, value, XUSB_PADCTL_UPHY_USB3_PADX_ECTL1(index));
> -
> -	value = padctl_readl(padctl, XUSB_PADCTL_UPHY_USB3_PADX_ECTL2(index));
> -	value &= ~(XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_MASK <<
> -		   XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_SHIFT);
> -	value |= XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_VAL <<
> -		 XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_SHIFT;
> -	padctl_writel(padctl, value, XUSB_PADCTL_UPHY_USB3_PADX_ECTL2(index));
> -
> -	padctl_writel(padctl, XUSB_PADCTL_UPHY_USB3_PAD_ECTL3_RX_DFE_VAL,
> -		      XUSB_PADCTL_UPHY_USB3_PADX_ECTL3(index));
> -
> -	value = padctl_readl(padctl, XUSB_PADCTL_UPHY_USB3_PADX_ECTL4(index));
> -	value &= ~(XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_MASK <<
> -		   XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_SHIFT);
> -	value |= XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_VAL <<
> -		 XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_SHIFT;
> -	padctl_writel(padctl, value, XUSB_PADCTL_UPHY_USB3_PADX_ECTL4(index));
> -
> -	padctl_writel(padctl, XUSB_PADCTL_UPHY_USB3_PAD_ECTL6_RX_EQ_CTRL_H_VAL,
> -		      XUSB_PADCTL_UPHY_USB3_PADX_ECTL6(index));
> -
> -	if (lane->pad == padctl->sata)
> -		err = tegra210_sata_uphy_enable(padctl, true);
> -	else
> -		err = tegra210_pex_uphy_enable(padctl);
> -
> -	if (err) {
> -		dev_err(&port->dev, "%s: failed to enable UPHY: %d\n",
> -			__func__, err);
> -		return err;
> -	}
> -
> -	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> -	value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(index);
> -	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> -
> -	usleep_range(100, 200);
> -
> -	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> -	value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(index);
> -	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> -
> -	usleep_range(100, 200);
> -
> -	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> -	value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(index);
> -	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> -
>  	return 0;
>  }
>  
>  static void tegra210_usb3_port_disable(struct tegra_xusb_port *port)
>  {
> -	struct tegra_xusb_usb3_port *usb3 = to_usb3_port(port);
> -	struct tegra_xusb_padctl *padctl = port->padctl;
> -	struct tegra_xusb_lane *lane = port->lane;
> -	unsigned int index = port->index;
> -	u32 value;
> -
> -	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> -	value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(index);
> -	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> -
> -	usleep_range(100, 200);
> -
> -	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> -	value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(index);
> -	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> -
> -	usleep_range(250, 350);
> -
> -	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
> -	value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(index);
> -	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
> -
> -	if (lane->pad == padctl->sata)
> -		tegra210_sata_uphy_disable(padctl);
> -	else
> -		tegra210_pex_uphy_disable(padctl);
> -
> -	regulator_disable(usb3->supply);
> -
> -	value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
> -	value &= ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(index);
> -	value |= XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(index, 0x7);
> -	padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
>  }
>  
>  static const struct tegra_xusb_lane_map tegra210_usb3_map[] = {
> @@ -1933,6 +1994,24 @@ static const struct tegra_xusb_lane_map tegra210_usb3_map[] = {
>  	{ 0, NULL,   0 }
>  };
>  
> +static int tegra210_usb3_lane_map(struct tegra_xusb_lane *lane)
> +{
> +	const struct tegra_xusb_lane_map *map;
> +
> +	for (map = tegra210_usb3_map; map->type; map++) {
> +		if (map->index == lane->index &&
> +		    strcmp(map->type, lane->pad->soc->name) == 0) {
> +			dev_dbg(lane->pad->padctl->dev,
> +				"lane = %s map to port = usb3-%d\n",
> +				lane->pad->soc->lanes[lane->index].name,
> +				map->port);
> +			return map->port;
> +		}
> +	}
> +
> +	return -1;

Return a proper errno please.

> +}
> +
>  static struct tegra_xusb_lane *
>  tegra210_usb3_port_map(struct tegra_xusb_port *port)
>  {
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 2ea8497af82a..7fbba53f6097 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -370,7 +370,7 @@ static int tegra_xusb_setup_pads(struct tegra_xusb_padctl *padctl)
>  	return 0;
>  }
>  
> -static bool tegra_xusb_lane_check(struct tegra_xusb_lane *lane,
> +bool tegra_xusb_lane_check(struct tegra_xusb_lane *lane,
>  				  const char *function)
>  {
>  	const char *func = lane->soc->funcs[lane->function];
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index 093076ca27fd..1bfe14b2a274 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -127,6 +127,8 @@ struct tegra_xusb_lane_ops {
>  	void (*remove)(struct tegra_xusb_lane *lane);
>  };
>  
> +bool tegra_xusb_lane_check(struct tegra_xusb_lane *lane, const char *function);
> +
>  /*
>   * pads
>   */
> 

-- 
nvpublic
