From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/5] bindings: regulator: added support for suspend
 states
Date: Fri, 5 Jan 2018 12:53:28 -0600
Message-ID: <20180105185328.zmt33idv2cqled62@rob-hp-laptop>
References: <1515050568-23876-1-git-send-email-zhang.chunyan@linaro.org>
 <1515050568-23876-2-git-send-email-zhang.chunyan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1515050568-23876-2-git-send-email-zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 04, 2018 at 03:22:44PM +0800, Chunyan Zhang wrote:
> Some systems need to set regulators to specific states when they enter
> low power modes, especially around CPUs. There are many of these modes
> depending on the particular runtime state.
> 
> Currently the regulator consumers are not granted permission to change
> suspend state of regulator devices, the constraints are configured at
> startup.  In order to allow changes in a vlotage range, we need to add
> new properties for voltage range and a flag to give permission to
> change the suspend voltage and suspend on/off in suspend mode.
> 
> Signed-off-by: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/regulator/regulator.txt | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
> index 378f6dc..532e286 100644
> --- a/Documentation/devicetree/bindings/regulator/regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/regulator.txt
> @@ -42,8 +42,19 @@ Optional properties:
>  - regulator-state-[mem/disk] node has following common properties:
>  	- regulator-on-in-suspend: regulator should be on in suspend state.
>  	- regulator-off-in-suspend: regulator should be off in suspend state.
> -	- regulator-suspend-microvolt: regulator should be set to this voltage
> -	  in suspend.
> +	- regulator-suspend-min-microvolt: minimum voltage may be set in
> +	  suspend state.
> +	- regulator-suspend-max-microvolt: maximum voltage may be set in
> +	  suspend state.
> +	- regulator-suspend-microvolt: the default voltage which regulator
> +	  would be set in suspend. The voltage for suspend also can be
> +	  adjusted among {regulator-suspend-min-microvolt,
> +	  regulator-suspend-max-microvolt} by calling
> +	  regulator_set_suspend_voltage(). This property is not deprecated,

You mean "is deprecated", right?

> +	  setting voltage for suspend mode via API the regulator driver
> +	  provides is recommended.
> +	- regulator-changeable-in-suspend: whether the default voltage and
> +	  the regulator on/off in suspend can be changed in runtime.

Is this not implied by having the constraints? Or the driver should know 
this. The simply means you have some 2nd bank of registers for settings 
while in suspend mode, right?

>  	- regulator-mode: operating mode in the given suspend state.
>  	  The set of possible operating modes depends on the capabilities of
>  	  every hardware so the valid modes are documented on each regulator
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
