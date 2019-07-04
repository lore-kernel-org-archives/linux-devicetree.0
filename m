Return-Path: <SRS0=6nRC=VB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:5990 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727614AbfGDMWH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jul 2019 08:22:07 -0400
Subject: Re: [PATCH 2/8] clk: tegra: don't enable PLLE HW sequencer at init
References: <20190614074652.21960-1-jckuo@nvidia.com>
 <20190614074652.21960-3-jckuo@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <4b63588d-937c-ea9f-573f-0fc2028b6061@nvidia.com>
Date: Thu, 4 Jul 2019 13:22:02 +0100
MIME-Version: 1.0
In-Reply-To: <20190614074652.21960-3-jckuo@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>, gregkh@linuxfoundation.org, thierry.reding@gmail.com, pdeschrijver@nvidia.com, afrid@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-ID: <devicetree@vger.kernel.org>


On 14/06/2019 08:46, JC Kuo wrote:
> PLLE hardware power sequencer references PEX/SATA UPHY PLL hardware
> power sequencers' output to enable/disable PLLE. PLLE hardware power
> sequencer has to be enabled only after PEX/SATA UPHY PLL's sequencers
> are enabled.
> 
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 1583f5fc992f..e6de65987fd2 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -2469,18 +2469,6 @@ static int clk_plle_tegra210_enable(struct clk_hw *hw)
>  	pll_writel(val, PLLE_SS_CTRL, pll);
>  	udelay(1);
>  
> -	val = pll_readl_misc(pll);
> -	val &= ~PLLE_MISC_IDDQ_SW_CTRL;
> -	pll_writel_misc(val, pll);
> -
> -	val = pll_readl(pll->params->aux_reg, pll);
> -	val |= (PLLE_AUX_USE_LOCKDET | PLLE_AUX_SS_SEQ_INCLUDE);
> -	val &= ~(PLLE_AUX_ENABLE_SWCTL | PLLE_AUX_SS_SWCTL);
> -	pll_writel(val, pll->params->aux_reg, pll);
> -	udelay(1);
> -	val |= PLLE_AUX_SEQ_ENABLE;
> -	pll_writel(val, pll->params->aux_reg, pll);
> -
>  out:
>  	if (pll->lock)
>  		spin_unlock_irqrestore(pll->lock, flags);
> 

So this function is called clk_plle_tegra210_enable() and is called by
the CCF enable callback. However, after the above change, does this mean
that this no longer enables the PLL? I understand that that is what you
want, but from an architecture perspective, it seems incorrect to have
an enable function that when called does not enable the PLL as expected.

I don't fully understand why we need to add the new helpers from the
previous patch and we cannot use the CCF APIs directly?

If you really need to split the existing enable function, then the CCF
does have prepare and enable callbacks that can be used.

Cheers
Jon

-- 
nvpublic
