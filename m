From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v8] clk: corenet: Adds the clock binding
Date: Fri, 10 Jan 2014 14:19:30 -0600
Message-ID: <1389385170.24905.19.camel@snotra.buserror.net>
References: <1389320944-2574-1-git-send-email-Yuantian.Tang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389320944-2574-1-git-send-email-Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: b07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org, galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2014-01-10 at 10:29 +0800, Tang Yuantian wrote:
> +- reg: Offset and length of the clock register set

"offset" into what?  The containing node is not within the scope of this
binding.

I know that plenty of other bindings are worded this way, and I wouldn't
hold up acceptance if this were the only issue, but it ought to be fixed
to say something like "reg: resource zero represents the clock register
set".

> +Recommended properties:
> +- clock-frequency: Input system clock frequency. Must be present
> +	if the device has sub-nodes.

Why only "if the device has sub-nodes"?

> +       * "fsl,qoriq-sysclk-1.0": for input system clock (v1.0).
> +               It takes parent's clock as its clock.
> +       * "fsl,qoriq-sysclk-2.0": for input system clock (v2.0).
> +               It takes parent's clock as its clock.

s/parent's clock/parent's clock-frequency/ since the parent isn't
actually exposing a clock as per the clock bindings.

> +Example for clock block and clock provider:
> +/ {
> +	clockgen: global-utilities@e1000 {
> +		compatible = "fsl,p5020-clockgen", "fsl,qoriq-clockgen-1.0";
> +		ranges = <0x0 0xe1000 0x1000>;
> +		clock-frequency = <0>;

It'd be better to show a real clock-frequency here -- this is an example
for the node as the OS sees it, not what goes in the dts as an input to
U-Boot.

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
