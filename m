From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH v2 0/5] constify struct imx_pinctrl_soc_info
Date: Mon, 8 Jan 2018 18:32:24 +0800
Message-ID: <20180108103224.GB32635@b29396-OptiPlex-7040>
References: <20180106142553.15322-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180106142553.15322-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: linus.walleij@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, aisheng.dong@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Sat, Jan 06, 2018 at 03:25:48PM +0100, Stefan Agner wrote:
> This patchset grew out of the discussion around the first version
> of "pinctrl: imx6ul: add IOMUXC SNVS pinctrl driver for i.MX 6ULL".
> This is necessary for pinctrls of SoCs with multiple compatible
> strings (currently only imx7d) since the struct uses the .data
> pointer in struct of_device_id. It is also helpful for all other
> SoCs since it decreases the .data section for all drivers by 1276
> bytes.
> 
> Bai Ping (1):
>   pinctrl: imx6ul: add IOMUXC SNVS pinctrl driver for i.MX 6ULL
> 
> Stefan Agner (4):
>   pinctrl: imx: use struct imx_pinctrl_soc_info as a const
>   pinctrl: imx7d: simplify imx7d_pinctrl_probe
>   pinctrl: imx: constify struct imx_pinctrl_soc_info
>   pinctrl: imx7ulp: constify struct imx_cfg_params_decode
> 

This patch series looks really good to me.

So
Acked-by: Dong Aisheng <aisheng.dong@nxp.com>

Regards
Dong Aisheng
