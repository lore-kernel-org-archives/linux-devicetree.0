From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: DT: Add support to scale ramp delay based
 on platform behavior
Date: Mon, 29 Feb 2016 09:47:51 -0800
Message-ID: <20160229174751.GQ21240@tuxbot>
References: <1456756829-2277-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456756829-2277-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon 29 Feb 06:40 PST 2016, Laxman Dewangan wrote:

> It is observed that voltage change in given rail affected by the load
> and the capacitor in the rail. This may cause the slow ramp in voltage
> against what PMIC has programmed.
> 
> The property regulator-ramp-delay provides the ramp delay configuration
> for PMIC but actual voltage settling time may change based on platform.
> 
> Add new property "regulator-ramp-delay-scale" for platform specific scaling
> in final ramp delay calculation. On this case, final wait delay time
> for voltage change is calculated as the
>    DIV_ROUND_UP(ramp_delay * ramp_delay_scale, 100)
> 
> The value is provided in the term of percentage i.e. 300% means it will
> do the 3x delay of calculated value.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---

The regulator-ramp-delay is a variable you can tweak on a board basis,
so I'm not sure what benefit it gives to be able to add a scaling
factor to this.

In my experience your HW engineer will say "you have to wait X ms", not
"you have to wait 125% of X ms".


Can you please elaborate on why the original knob isn't sufficient?

Regards,
Bjorn

>  Documentation/devicetree/bindings/regulator/regulator.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
> index 1d112fc..f2e8360 100644
> --- a/Documentation/devicetree/bindings/regulator/regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/regulator.txt
> @@ -16,6 +16,13 @@ Optional properties:
>  - regulator-ramp-delay: ramp delay for regulator(in uV/uS)
>    For hardware which supports disabling ramp rate, it should be explicitly
>    initialised to zero (regulator-ramp-delay = <0>) for disabling ramp delay.
> +- regulator-ramp-delay-scale: Platform specific scaling in ramp delay to
> +  provide extra guard time to settle down voltage after its change. This will
> +  help to wait for extra time for voltage settling based on platform behavior.
> +  This is provided in terms of percentage scaling like 300% means final delay
> +  will become 3x of calculated ramp delay for voltage change.
> +  The final delay is calculated as:
> +	delay = DIV_ROUND_UP(ramp-delay * ramp-delay-scale, 100)
>  - regulator-enable-ramp-delay: The time taken, in microseconds, for the supply
>    rail to reach the target voltage, plus/minus whatever tolerance the board
>    design requires. This property describes the total system ramp time
> -- 
> 2.1.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
