From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx7d: add missing OPP property for cpu0
Date: Thu, 19 Jul 2018 11:20:03 +0800
Message-ID: <20180719032002.GT4576@dragon>
References: <1531896889-21377-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531896889-21377-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Wed, Jul 18, 2018 at 02:54:49PM +0800, Anson Huang wrote:
> Commit b97872d4eb22 ("ARM: dts: imx: Add missing OPP properties for CPUs")
> added "operating-points" property for all CPUs, but missed i.MX7D's cpu0,
> this patch adds it.
> 
> Fixes: b97872d4eb22 ("ARM: dts: imx: Add missing OPP properties for CPUs")
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

In general, when you send a patch fixing a commit, you should have the
author of that commit copied.  I added Viresh here.

It looks like a wrong fix to me.  It seems that commit b97872d4eb22
shouldn't change imx7d.dtsi at all.  So the correct fix would be
reverting the change on imx7d.dtsi, @Viresh?

Shawn

> ---
>  arch/arm/boot/dts/imx7d.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
> index 9a772fc..30a1a73 100644
> --- a/arch/arm/boot/dts/imx7d.dtsi
> +++ b/arch/arm/boot/dts/imx7d.dtsi
> @@ -9,6 +9,11 @@
>  / {
>  	cpus {
>  		cpu0: cpu@0 {
> +			operating-points = <
> +				/* KHz	uV */
> +				996000	1075000
> +				792000	975000
> +			>;
>  			clock-frequency = <996000000>;
>  			operating-points-v2 = <&cpu0_opp_table>;
>  			#cooling-cells = <2>;
> -- 
> 2.7.4
> 
