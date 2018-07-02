From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/1] ARM: dts: imx6ull: add operating points
Date: Mon, 2 Jul 2018 10:22:05 +0530
Message-ID: <20180702045205.fdh4dwwhwyfftptl@vireshk-i7>
References: <20180629145221.10393-1-sebastien.szymanski@armadeus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180629145221.10393-1-sebastien.szymanski@armadeus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>
List-Id: devicetree@vger.kernel.org

On 29-06-18, 16:52, Sébastien Szymanski wrote:
> i.MX6ULL has different operating ranges than i.MX6UL so add the
> operating points for the i.MX6ULL and removed them form board device

s/removed/remove/
s/form/from/

> trees. A 25mV offset is added to the minimum allowed values like for the
> i.MX6UL.
> The valid frequencies are now selected by the cpufreq driver according
> to ratings stored in fuses since commit 0aa9abd4c212 ("cpufreq: imx6q:
> check speed grades for i.MX6ULL")
> 
> Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi | 14 --------------
>  arch/arm/boot/dts/imx6ull.dtsi              | 19 +++++++++++++++++++
>  2 files changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi b/arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi
> index 3dffbcd50bf6..183193e8580d 100644
> --- a/arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi
> +++ b/arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi
> @@ -20,20 +20,6 @@
>  
>  &cpu0 {
>  	clock-frequency = <792000000>;
> -	operating-points = <
> -		/* kHz	uV */
> -		792000  1225000
> -		528000	1175000
> -		396000	1025000
> -		198000	950000
> -	>;
> -	fsl,soc-operating-points = <
> -		/* KHz	uV */
> -		792000  1175000
> -		528000	1175000
> -		396000	1175000
> -		198000	1175000
> -	>;
>  };
>  
>  &iomuxc {
> diff --git a/arch/arm/boot/dts/imx6ull.dtsi b/arch/arm/boot/dts/imx6ull.dtsi
> index ebc25c98e5e1..ade64bd46fab 100644
> --- a/arch/arm/boot/dts/imx6ull.dtsi
> +++ b/arch/arm/boot/dts/imx6ull.dtsi
> @@ -48,6 +48,25 @@
>  /* Delete CAAM node in AIPS-2 (i.MX6UL specific) */
>  /delete-node/ &crypto;
>  
> +&cpu0 {
> +	operating-points = <
> +		/* kHz	uV */
> +		900000	1275000
> +		792000	1225000
> +		528000	1175000
> +		396000	1025000
> +		198000	950000
> +	>;
> +	fsl,soc-operating-points = <
> +		/* KHz	uV */
> +		900000	1175000
> +		792000	1175000
> +		528000	1175000
> +		396000	1175000
> +		198000	1175000
> +	>;
> +};
> +
>  / {
>  	soc {
>  		aips3: aips-bus@2200000 {

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
