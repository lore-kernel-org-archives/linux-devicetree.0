From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 1/5] net: ethernet: stmmac: Add support for syscfg clock
Date: Thu, 3 Oct 2019 12:13:44 +0200
Message-ID: <7032bc93-cfb3-4538-1de5-bd901a3fc8c5@st.com>
References: <20190920053817.13754-1-christophe.roullier@st.com>
 <20190920053817.13754-2-christophe.roullier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190920053817.13754-2-christophe.roullier@st.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Christophe Roullier <christophe.roullier@st.com>, robh@kernel.org, davem@davemloft.net, joabreu@synopsys.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com
Cc: devicetree@vger.kernel.org, andrew@lunn.ch, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On 9/20/19 7:38 AM, Christophe Roullier wrote:
> Add optional support for syscfg clock in dwmac-stm32.c
> Now Syscfg clock is activated automatically when syscfg
> registers are used
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>   .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 36 +++++++++++++------
>   1 file changed, 25 insertions(+), 11 deletions(-)

Acked-by: Alexandre TORGUE <alexandre.torgue@st.com>

> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> index 4ef041bdf6a1..7e6619868cc1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> @@ -152,23 +152,32 @@ static int stm32mp1_clk_prepare(struct stm32_dwmac *dwmac, bool prepare)
>   	int ret = 0;
>   
>   	if (prepare) {
> -		ret = clk_prepare_enable(dwmac->syscfg_clk);
> -		if (ret)
> -			return ret;
> -
> +		if (dwmac->syscfg_clk) {
> +			ret = clk_prepare_enable(dwmac->syscfg_clk);
> +			if (ret)
> +				return ret;
> +		}
>   		if (dwmac->clk_eth_ck) {
>   			ret = clk_prepare_enable(dwmac->clk_eth_ck);
>   			if (ret) {
> -				clk_disable_unprepare(dwmac->syscfg_clk);
> +				if (dwmac->syscfg_clk)
> +					goto unprepare_syscfg;
>   				return ret;
>   			}
>   		}
>   	} else {
> -		clk_disable_unprepare(dwmac->syscfg_clk);
> +		if (dwmac->syscfg_clk)
> +			clk_disable_unprepare(dwmac->syscfg_clk);
> +
>   		if (dwmac->clk_eth_ck)
>   			clk_disable_unprepare(dwmac->clk_eth_ck);
>   	}
>   	return ret;
> +
> +unprepare_syscfg:
> +	clk_disable_unprepare(dwmac->syscfg_clk);
> +
> +	return ret;
>   }
>   
>   static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
> @@ -296,7 +305,7 @@ static int stm32mp1_parse_data(struct stm32_dwmac *dwmac,
>   {
>   	struct platform_device *pdev = to_platform_device(dev);
>   	struct device_node *np = dev->of_node;
> -	int err = 0;
> +	int err;
>   
>   	/* Gigabit Ethernet 125MHz clock selection. */
>   	dwmac->eth_clk_sel_reg = of_property_read_bool(np, "st,eth-clk-sel");
> @@ -320,13 +329,17 @@ static int stm32mp1_parse_data(struct stm32_dwmac *dwmac,
>   		return PTR_ERR(dwmac->clk_ethstp);
>   	}
>   
> -	/*  Clock for sysconfig */
> +	/*  Optional Clock for sysconfig */
>   	dwmac->syscfg_clk = devm_clk_get(dev, "syscfg-clk");
>   	if (IS_ERR(dwmac->syscfg_clk)) {
> -		dev_err(dev, "No syscfg clock provided...\n");
> -		return PTR_ERR(dwmac->syscfg_clk);
> +		err = PTR_ERR(dwmac->syscfg_clk);
> +		if (err != -ENOENT)
> +			return err;
> +		dwmac->syscfg_clk = NULL;
>   	}
>   
> +	err = 0;
> +
>   	/* Get IRQ information early to have an ability to ask for deferred
>   	 * probe if needed before we went too far with resource allocation.
>   	 */
> @@ -436,7 +449,8 @@ static int stm32mp1_suspend(struct stm32_dwmac *dwmac)
>   		return ret;
>   
>   	clk_disable_unprepare(dwmac->clk_tx);
> -	clk_disable_unprepare(dwmac->syscfg_clk);
> +	if (dwmac->syscfg_clk)
> +		clk_disable_unprepare(dwmac->syscfg_clk);
>   	if (dwmac->clk_eth_ck)
>   		clk_disable_unprepare(dwmac->clk_eth_ck);
>   
> 
