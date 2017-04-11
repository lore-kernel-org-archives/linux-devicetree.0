From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 08/11] mfd: axp20x: add axp20x-regulator cell for
 AXP803
Date: Tue, 11 Apr 2017 15:03:34 +0100
Message-ID: <20170411140334.7dqrrvjsyoqa2jdf@dell>
References: <20170407183441.58750-1-icenowy@aosc.io>
 <20170407183441.58750-9-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170407183441.58750-9-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, 08 Apr 2017, Icenowy Zheng wrote:

> As axp20x-regulator now supports AXP803, add a cell for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  drivers/mfd/axp20x.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 2268a6a9aa2c..08b9bbd5bd71 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -839,6 +839,8 @@ static struct mfd_cell axp803_cells[] = {
>  		.name			= "axp20x-pek",
>  		.num_resources		= ARRAY_SIZE(axp803_pek_resources),
>  		.resources		= axp803_pek_resources,
> +	}, {
> +		.name			= "axp20x-regulator",

I'd prefer it if you placed single lined entries on one line.

Like this:

	{	.name			= "axp20x-regulator" }


-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
