From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable CONFIG_PINCTRL_MT7622 by default
Date: Fri, 27 Apr 2018 11:50:01 +0200
Message-ID: <8892ae83-8af9-0065-ed53-5dd456b9cbcb@gmail.com>
References: <aac9629afc510681a5dad1a24eb78f5f84f12c23.1524214111.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <aac9629afc510681a5dad1a24eb78f5f84f12c23.1524214111.git.sean.wang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com, catalin.marinas@arm.com, will.deacon@arm.com
Cc: khilman@baylibre.com, arnd@arndb.de, andy.gross@linaro.org, timur@codeaurora.org, xuwei5@hisilicon.com, horms+renesas@verge.net.au, heiko@sntech.de, ard.biesheuvel@linaro.org, amit.kucheria@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 04/20/2018 10:58 AM, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Recently kernelCI reported the board mt7622-rfb1 has a fail test with
> kernel: ERROR: did not start booting whose details could be seen at [1].
> 
> The cause is that UART0 can't output anything when it's missing a proper
> pin setup with current DTS, so the essential driver is always getting
> enabled to fix up the issue.
> 
> [1] https://kernelci.org/boot/id/5ad7d62759b51461bfb1f829/
> 
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: stable@vger.kernel.org
> Fixes: ae457b7679c4 ("arm64: dts: mt7622: add SoC and peripheral related device nodes")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---

Pushed to:
v4.17-next/defconfig

Thanks


>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index ecf6137..fe005df 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -320,6 +320,7 @@ CONFIG_PINCTRL_MAX77620=y
>  CONFIG_PINCTRL_MSM8916=y
>  CONFIG_PINCTRL_MSM8994=y
>  CONFIG_PINCTRL_MSM8996=y
> +CONFIG_PINCTRL_MT7622=y
>  CONFIG_PINCTRL_QDF2XXX=y
>  CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
>  CONFIG_GPIO_DWAPB=y
> 
