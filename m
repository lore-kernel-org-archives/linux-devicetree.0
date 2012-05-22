From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v2 08/12] ARM: imx6q: add usbphy clocks
Date: Tue, 22 May 2012 06:32:13 +0200
Message-ID: <201205220632.13896.marex@denx.de>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
 <1337592237-5090-9-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1337592237-5090-9-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Dear Richard Zhao,

Maybe reorder this so it's in before the PHY driver?

Reviewed-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>

> Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  arch/arm/mach-imx/clk-imx6q.c |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-imx/clk-imx6q.c b/arch/arm/mach-imx/clk-imx6q.c
> index f99509a..0d003aa 100644
> --- a/arch/arm/mach-imx/clk-imx6q.c
> +++ b/arch/arm/mach-imx/clk-imx6q.c
> @@ -152,7 +152,7 @@ enum mx6q_clks {
>  	ssi2, ssi3, uart_ipg, uart_serial, usboh3, usdhc1, usdhc2, usdhc3,
>  	usdhc4, vdo_axi, vpu_axi, cko1, pll1_sys, pll2_bus, pll3_usb_otg,
>  	pll4_audio, pll5_video, pll6_mlb, pll7_usb_host, pll8_enet, ssi1_ipg,
> -	ssi2_ipg, ssi3_ipg, clk_max
> +	ssi2_ipg, ssi3_ipg, usbphy1_gate, usbphy2_gate, clk_max
>  };
> 
>  static struct clk *clk[clk_max];
> @@ -197,6 +197,9 @@ int __init mx6q_clocks_init(void)
>  	clk[pll7_usb_host] = imx_clk_pllv3(IMX_PLLV3_USB,	
"pll7_usb_host","osc",
> base + 0x20, 0x2000,   0x3); clk[pll8_enet]     =
> imx_clk_pllv3(IMX_PLLV3_ENET,	"pll8_enet",	"osc", base + 0xe0, 0x182000,
> 0x3);
> 
> +	clk[usbphy1_gate] = imx_clk_gate("usbphy1_gate", "pll3_usb_otg", base +
> 0x10, 6); +	clk[usbphy2_gate] = imx_clk_gate("usbphy2_gate",
> "pll7_usb_host", base + 0x20, 6); +
>  	/*                                name              parent_name       
> reg       idx */ clk[pll2_pfd0_352m] = imx_clk_pfd("pll2_pfd0_352m",
> "pll2_bus",     base + 0x100, 0); clk[pll2_pfd1_594m] =
> imx_clk_pfd("pll2_pfd1_594m", "pll2_bus",     base + 0x100, 1); @@ -395,6
> +398,8 @@ int __init mx6q_clocks_init(void)
>  	clk_register_clkdev(clk[usboh3], NULL, "2184200.usb");
>  	clk_register_clkdev(clk[usboh3], NULL, "2184400.usb");
>  	clk_register_clkdev(clk[usboh3], NULL, "2184600.usb");
> +	clk_register_clkdev(clk[usbphy1_gate], NULL, "20c9000.usbphy");
> +	clk_register_clkdev(clk[usbphy2_gate], NULL, "20ca000.usbphy");
>  	clk_register_clkdev(clk[uart_serial], "per", "2020000.serial");
>  	clk_register_clkdev(clk[uart_ipg], "ipg", "2020000.serial");
>  	clk_register_clkdev(clk[uart_serial], "per", "21e8000.serial");

Best regards,
Marek Vasut
