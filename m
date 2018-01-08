From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx7s: add snvs rtc clock
Date: Mon, 8 Jan 2018 18:39:15 +0800
Message-ID: <20180108103915.GD32635@b29396-OptiPlex-7040>
References: <1515078402-22135-1-git-send-email-Anson.Huang@nxp.com>
 <1515078402-22135-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1515078402-22135-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-clk-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com, shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, stefan@agner.ch, linux@armlinux.org.uk
List-Id: devicetree@vger.kernel.org

On Thu, Jan 04, 2018 at 11:06:42PM +0800, Anson Huang wrote:
> Add i.MX7 SNVS RTC clock.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

If this clock IMX7D_SNVS_CLK is used for all SNVS sub modules,
then snvs_poweroff and snvs_pwrkey should also rely on it, right?

How about add them all in one time?

BTW, syscon-poweroff seems still not introduce clock support and
fsl,sec-v4.0-pwrkey also does not handle clock, they may need to
be added later.

Regards
Dong Aisheng

> ---
>  arch/arm/boot/dts/imx7s.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index e718fd2..f9b97f3 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -534,6 +534,8 @@
>  					offset = <0x34>;
>  					interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
>  						     <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +					clocks = <&clks IMX7D_SNVS_CLK>;
> +					clock-names = "snvs-rtc";
>  				};
>  
>  				snvs_poweroff: snvs-poweroff {
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
