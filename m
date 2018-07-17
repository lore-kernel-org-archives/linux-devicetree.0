From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 4/4] ARM: dts: imx6sl-evk: make pfuze100 sw4 always on
Date: Tue, 17 Jul 2018 15:18:09 +0800
Message-ID: <20180717071807.GM4576@dragon>
References: <1531804325-3476-1-git-send-email-Anson.Huang@nxp.com>
 <1531804325-3476-4-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531804325-3476-4-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yibin.gong@nxp.com, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Tue, Jul 17, 2018 at 01:12:05PM +0800, Anson Huang wrote:
> From: Robin Gong <yibin.gong@nxp.com>
> 
> On i.MX6SL EVK board, pfuze100 sw4 supplies
> LPDDR2 which is critical for system, must be
> always on.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Robin's SoB is missing, since it's authorized by him.  I fixed it up and
applied all patches.

Shawn

> ---
>  arch/arm/boot/dts/imx6sl-evk.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/imx6sl-evk.dts b/arch/arm/boot/dts/imx6sl-evk.dts
> index 046cfab..679b448 100644
> --- a/arch/arm/boot/dts/imx6sl-evk.dts
> +++ b/arch/arm/boot/dts/imx6sl-evk.dts
> @@ -201,6 +201,7 @@
>  			sw4_reg: sw4 {
>  				regulator-min-microvolt = <800000>;
>  				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
>  			};
>  
>  			swbst_reg: swbst {
> -- 
> 2.7.4
> 
