From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [RESEND PATCH 2/2] phy: rockchip-inno-usb2: add support of u2phy for rk3328
Date: Wed, 01 Mar 2017 18:50:25 +0100
Message-ID: <3252267.tuzTTrxVuY@phil>
References: <1488364463-27075-1-git-send-email-daniel.meng@rock-chips.com> <1488364463-27075-3-git-send-email-daniel.meng@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1488364463-27075-3-git-send-email-daniel.meng@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Meng Dongyang <daniel.meng@rock-chips.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, geert+renesas@glider.be, yoshihiro.shimoda.uh@renesas.com, martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, kishon@ti.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, kever.yang@rock-chips.com, william.wu@rock-chips.com, frank.wang@rock-chips.com
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 1. März 2017, 18:34:23 CET schrieb Meng Dongyang:
> Add u2phy config information in the data of match table for
> rk3328.
> 
> Signed-off-by: Meng Dongyang <daniel.meng@rock-chips.com>

in general looks good, so
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

one question below


>  drivers/phy/phy-rockchip-inno-usb2.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/phy/phy-rockchip-inno-usb2.c
> b/drivers/phy/phy-rockchip-inno-usb2.c index 4ea95c2..cf2729c 100644
> --- a/drivers/phy/phy-rockchip-inno-usb2.c
> +++ b/drivers/phy/phy-rockchip-inno-usb2.c
> @@ -1141,6 +1141,26 @@ static int rockchip_usb2phy_probe(struct
> platform_device *pdev) return ret;
>  }
> 
> +static const struct rockchip_usb2phy_cfg rk3328_phy_cfgs[] = {
> +	{
> +		.reg = 0x100,
> +		.num_ports	= 2,
> +		.phy_tuning	= rk3328_usb2phy_tuning,
> +		.clkout_ctl	= { 0x108, 4, 4, 1, 0 },
> +		.port_cfgs	= {
> +			[USB2PHY_PORT_HOST] = {
> +				.phy_sus	= { 0x104, 15, 0, 0, 0x1d1 },
> +				.ls_det_en	= { 0x110, 1, 1, 0, 1 },
> +				.ls_det_st	= { 0x114, 1, 1, 0, 1 },
> +				.ls_det_clr	= { 0x118, 1, 1, 0, 1 },
> +				.utmi_ls	= { 0x120, 17, 16, 0, 1 },
> +				.utmi_hstdet	= { 0x120, 19, 19, 0, 1 }
> +			}
> +		},
> +	},

The TRM also talks about the otg-port, so is there a reason for not including 
it here?


Heiko

> +	{ /* sentinel */ }
> +};
> +
>  static const struct rockchip_usb2phy_cfg rk3366_phy_cfgs[] = {
>  	{
>  		.reg = 0x700,
> @@ -1223,6 +1243,7 @@ static int rockchip_usb2phy_probe(struct
> platform_device *pdev) };
> 
>  static const struct of_device_id rockchip_usb2phy_dt_match[] = {
> +	{ .compatible = "rockchip,rk3328-usb2phy", .data = &rk3328_phy_cfgs },
>  	{ .compatible = "rockchip,rk3366-usb2phy", .data = &rk3366_phy_cfgs },
>  	{ .compatible = "rockchip,rk3399-usb2phy", .data = &rk3399_phy_cfgs },
>  	{}
