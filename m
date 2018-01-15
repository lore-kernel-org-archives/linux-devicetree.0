From: Hermann Lauer <Hermann.Lauer@iwr.uni-heidelberg.de>
Subject: Re: [RESEND] phy: sun4i-usb: add support for R40 USB PHY
Date: Mon, 15 Jan 2018 16:06:56 +0100
Message-ID: <20180115150656.bibc4draok4i4oae@lemon.iwr.uni-heidelberg.de>
References: <20180103084944.3145-1-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180103084944.3145-1-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 03, 2018 at 04:49:44PM +0800, Icenowy Zheng wrote:
> Allwinner R40 features a USB PHY like the one in A64, but with 3 PHYs.
> 
> Add support for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> Acked-by: Rob Herring <robh@kernel.org>

You may add

Tested-by: Hermann.Lauer@iwr.uni-heidelberg.de

as my Banana Pi M2 Ultra is running over a week now with an usb-network
adapter which is needed until devicetree entries for the Banana Pi M2 Ultra
are available for the ccu register enabling allowing access to the ethernet phy.

Thanks !

> ---
> When resending, the ACK's by Maxime and Rob are added.
> 
>  Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt |  1 +
>  drivers/phy/allwinner/phy-sun4i-usb.c                   | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> index c1ce5a0a652e..07ca4ec4a745 100644
> --- a/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/sun4i-usb-phy.txt
> @@ -11,6 +11,7 @@ Required properties:
>    * allwinner,sun8i-a33-usb-phy
>    * allwinner,sun8i-a83t-usb-phy
>    * allwinner,sun8i-h3-usb-phy
> +  * allwinner,sun8i-r40-usb-phy
>    * allwinner,sun8i-v3s-usb-phy
>    * allwinner,sun50i-a64-usb-phy
>  - reg : a list of offset + length pairs
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
> index aa857be692cf..bee798892b21 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -112,6 +112,7 @@ enum sun4i_usb_phy_type {
>  	sun8i_a33_phy,
>  	sun8i_a83t_phy,
>  	sun8i_h3_phy,
> +	sun8i_r40_phy,
>  	sun8i_v3s_phy,
>  	sun50i_a64_phy,
>  };
> @@ -919,6 +920,16 @@ static const struct sun4i_usb_phy_cfg sun8i_h3_cfg = {
>  	.phy0_dual_route = true,
>  };
>  
> +static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
> +	.num_phys = 3,
> +	.type = sun8i_r40_phy,
> +	.disc_thresh = 3,
> +	.phyctl_offset = REG_PHYCTL_A33,
> +	.dedicated_clocks = true,
> +	.enable_pmu_unk1 = true,
> +	.phy0_dual_route = true,
> +};
> +
>  static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {
>  	.num_phys = 1,
>  	.type = sun8i_v3s_phy,
> @@ -948,6 +959,7 @@ static const struct of_device_id sun4i_usb_phy_of_match[] = {
>  	{ .compatible = "allwinner,sun8i-a33-usb-phy", .data = &sun8i_a33_cfg },
>  	{ .compatible = "allwinner,sun8i-a83t-usb-phy", .data = &sun8i_a83t_cfg },
>  	{ .compatible = "allwinner,sun8i-h3-usb-phy", .data = &sun8i_h3_cfg },
> +	{ .compatible = "allwinner,sun8i-r40-usb-phy", .data = &sun8i_r40_cfg },
>  	{ .compatible = "allwinner,sun8i-v3s-usb-phy", .data = &sun8i_v3s_cfg },
>  	{ .compatible = "allwinner,sun50i-a64-usb-phy",
>  	  .data = &sun50i_a64_cfg},

-- 
Netzwerkadministration/Zentrale Dienste, Interdiziplinaeres 
Zentrum fuer wissenschaftliches Rechnen der Universitaet Heidelberg
IWR; INF 205; 69120 Heidelberg; Tel: (06221)54-14405 Fax: -14427
Email: Hermann.Lauer@iwr.uni-heidelberg.de
