From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V3] ARM: dts: imx6sll-evk: make pfuze100 sw4 always on
Date: Sun, 1 Jul 2018 21:32:44 +0800
Message-ID: <20180701133243.GU4348@dragon>
References: <1530062725-25779-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1530062725-25779-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 27, 2018 at 09:25:25AM +0800, Anson Huang wrote:
> On i.MX6SLL EVK board, PFuze100's SW4 is supplying
> LPDDR3, it needs to be always on. This patch fixes
> Linux kernel boot up hang caused by commit 5fe156f1cab4
> ("regulator: pfuze100: add enable/disable for switch"),
> because SW4 is turned off unexpectedly:
> 
> [    1.693613] cfg80211: failed to load regulatory.db
> [    1.700063] SW4: disabling
> [    1.703973] SWBST: disabling
> 
> Fixes: 5fe156f1cab4 ("regulator: pfuze100: add enable/disable for switch")
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>

Just want to understand if we agree to break the existing DTB with v4.18
kernel?

Shawn

> ---
> changes since V2:
> 	improve the way of referencing commit, and add fix tag.
>  arch/arm/boot/dts/imx6sll-evk.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/imx6sll-evk.dts b/arch/arm/boot/dts/imx6sll-evk.dts
> index 4684ac4..2217c40 100644
> --- a/arch/arm/boot/dts/imx6sll-evk.dts
> +++ b/arch/arm/boot/dts/imx6sll-evk.dts
> @@ -142,6 +142,7 @@
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
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
