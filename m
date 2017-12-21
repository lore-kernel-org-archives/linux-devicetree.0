From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] bindings: regulator: added support for suspend states
Date: Thu, 21 Dec 2017 17:26:14 -0600
Message-ID: <20171221232614.rhrgrpyl2w2lc6bw@rob-hp-laptop>
References: <1513837506-26543-1-git-send-email-zhang.chunyan@linaro.org>
 <1513837506-26543-2-git-send-email-zhang.chunyan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1513837506-26543-2-git-send-email-zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 21, 2017 at 02:25:02PM +0800, Chunyan Zhang wrote:
> Documented a few new added properties which are used for supporting
> regulator suspend states.

Your commit message should answer why you need this. What problem do you 
have that this solves?

> 
> Signed-off-by: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/regulator/regulator.txt | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
> index 378f6dc..618a322 100644
> --- a/Documentation/devicetree/bindings/regulator/regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/regulator.txt
> @@ -42,8 +42,15 @@ Optional properties:
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
> +	  should be set in suspend, this can be adjusted among
> +	  <regulator-suspend-min-microvolt, regulator-suspend-max-microvolt>

Perhaps this should stay a single property with: <target> <min> <max>

Though why would you ever not try to set to the minimum voltage within 
the range of <min> to <max>?

> +	- regulator-changeable-in-suspend: whether the default voltage and
> +	  the regulator on/off in suspend can be changed in runtime.
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
