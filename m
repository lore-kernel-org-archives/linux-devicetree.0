From: Yakir Yang <ykk@rock-chips.com>
Subject: Re: [PATCH v2 1/3] phy: rockchip-dp: should be a child device of the
 GRF
Date: Mon, 28 Mar 2016 19:31:01 +0800
Message-ID: <56F915F5.2000101@rock-chips.com>
References: <1458854943-17388-1-git-send-email-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458854943-17388-1-git-send-email-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, kishon@ti.com
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, shawn.lin@rock-chips.com, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 03/25/2016 05:29 AM, Heiko Stuebner wrote:
> The displayport-phy is fully enclosed in the general register files (GRF).
> Therefore as seen from the device-tree it shouldn't be a separate platform-
> device but instead a sub-device of the GRF - using the simply-mfd mechanism.
>
> The driver entered the kernel in the current merge-window, so we can still
> adapt the binding without needing a fallback, as the binding hasn't been
> released with a full kernel yet.
>
> While the edp phy is fully part of the GRF, it doesn't have any separate
> register set there, so doesn't get any register-area assigned.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Thanks for your improved.

Reviewed-by: Yakir Yang <ykk@rock-chips.com>
> ---
> While one of my intermediate versions did include that conversion
> already, it looks like it was lost when the dp-phy got split out into
> its own series and I missed that dropped change.
>
> As mentioned in the patch description above, this is meant as a fixup for
> kernel 4.6.
>
>   .../devicetree/bindings/phy/rockchip-dp-phy.txt        | 18 +++++++++++-------
>   drivers/phy/phy-rockchip-dp.c                          |  7 +++++--
>   2 files changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
> index 50c4f9b..e3b4809 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
> @@ -8,15 +8,19 @@ Required properties:
>   	of memory mapped region.
>   - clock-names: from common clock binding:
>   	Required elements: "24m"
> -- rockchip,grf: phandle to the syscon managing the "general register files"
>   - #phy-cells : from the generic PHY bindings, must be 0;
>   
>   Example:
>   
> -edp_phy: edp-phy {
> -	compatible = "rockchip,rk3288-dp-phy";
> -	rockchip,grf = <&grf>;
> -	clocks = <&cru SCLK_EDP_24M>;
> -	clock-names = "24m";
> -	#phy-cells = <0>;
> +grf: syscon@ff770000 {
> +	compatible = "rockchip,rk3288-grf", "syscon", "simple-mfd";
> +
> +...
> +
> +	edp_phy: edp-phy {
> +		compatible = "rockchip,rk3288-dp-phy";
> +		clocks = <&cru SCLK_EDP_24M>;
> +		clock-names = "24m";
> +		#phy-cells = <0>;
> +	};
>   };
> diff --git a/drivers/phy/phy-rockchip-dp.c b/drivers/phy/phy-rockchip-dp.c
> index 77e2d02..793ecb6 100644
> --- a/drivers/phy/phy-rockchip-dp.c
> +++ b/drivers/phy/phy-rockchip-dp.c
> @@ -86,6 +86,9 @@ static int rockchip_dp_phy_probe(struct platform_device *pdev)
>   	if (!np)
>   		return -ENODEV;
>   
> +	if (!dev->parent || !dev->parent->of_node)
> +		return -ENODEV;
> +
>   	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
>   	if (IS_ERR(dp))
>   		return -ENOMEM;
> @@ -104,9 +107,9 @@ static int rockchip_dp_phy_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	dp->grf = syscon_regmap_lookup_by_phandle(np, "rockchip,grf");
> +	dp->grf = syscon_node_to_regmap(dev->parent->of_node);
>   	if (IS_ERR(dp->grf)) {
> -		dev_err(dev, "rk3288-dp needs rockchip,grf property\n");
> +		dev_err(dev, "rk3288-dp needs the General Register Files syscon\n");
>   		return PTR_ERR(dp->grf);
>   	}
>   
