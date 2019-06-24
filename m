From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: fsl: librem5: Limit the USB to 5V
Date: Mon, 24 Jun 2019 10:08:15 +0800
Message-ID: <20190624020815.GK3800@dragon>
References: <20190620170439.18762-1-angus@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190620170439.18762-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Cc: angus.ainslie@puri.sm, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 20, 2019 at 11:04:39AM -0600, Angus Ainslie (Purism) wrote:
> The charge controller can handle 14V but the PTC on the devkit can only
> handle 6V so limit the negotiated voltage to 5V.
> 
> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>

Prefix 'arm64: dts: librem5: ...' should be fine, so I changed it and
applied the patch.

Shawn

> ---
>  arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> index 3f4736fd3cea..ec85ada77955 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> @@ -353,7 +353,7 @@
>  			sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM |
>  				PDO_FIXED_DUAL_ROLE |
>  				PDO_FIXED_DATA_SWAP )
> -			     PDO_VAR(5000, 12000, 2000)>;
> +			     PDO_VAR(5000, 3000, 3000)>;
>  			op-sink-microwatt = <10000000>;
>  
>  			ports {
> -- 
> 2.17.1
> 
