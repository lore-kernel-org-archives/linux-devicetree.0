From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [RFC][PATCHv5 4/4] Documentation: Add device tree bindings for Freescale FTM PWM.
Date: Mon, 28 Oct 2013 05:59:41 -0500
Message-ID: <224C2E26-6C33-4DBB-BC06-A4BA470FDA39@codeaurora.org>
References: <1382951151-31517-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382951151-31517-1-git-send-email-Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: r65073-KZfg59tc24xl57MIdRCFDg@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pwm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Oct 28, 2013, at 4:05 AM, Xiubo Li wrote:

> The RFC patch only added "See ../clock/clock-bindings.txt for details of
> the property values."
> 
> 
> 
> This adds the Document for Freescale FTM PWM driver under
> Documentation/devicetree/bindings/pwm/.
> 
> Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> .../devicetree/bindings/pwm/pwm-fsl-ftm.txt        | 34 ++++++++++++++++++++++
> 1 file changed, 34 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/pwm/pwm-fsl-ftm.txt
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-fsl-ftm.txt b/Documentation/devicetree/bindings/pwm/pwm-fsl-ftm.txt
> new file mode 100644
> index 0000000..175b762
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/pwm-fsl-ftm.txt
> @@ -0,0 +1,34 @@
> +Freescale FTM PWM controller

What does FTM stand for, and can we spell out PWM at least once early on.

> +
> +Required properties:
> +- compatible: Should be "fsl,vf610-ftm-pwm"
> +- reg: Physical base address and length of the controller's registers
> +- #pwm-cells: Should be 3. See pwm.txt in this directory for a description of
> +  the cells format.
> +- clock-names : Includes the following module clock source entries:
> +    "ftm0" (system clock),
> +    "ftm0_fix_sel" (fixed frequency clock),
> +    "ftm0_ext_sel" (external clock)
> +- clocks : Must contain a clock specifier for each entry in clock-names,
> +  See ../clock/clock-bindings.txt for details of the property values.
> +- fsl,pwm-counter-clk: The FTM PWM counter clock source, should be one of the
> +  entries in clock-names.

Why do we need this, why not just have only the clock-names/clocks reference the clk that is actually used?

> +- pinctrl-names: must contain a "default" entry.
> +- pinctrl-NNN: One property must exist for each entry in pinctrl-names.
> +  See ../pinctrl/pinctrl-bindings.txt for details of the property values.

let's drop the .. when making directory references.

> +
> +
> +Example:
> +
> +pwm0: pwm@40038000 {
> +		compatible = "fsl,vf610-ftm-pwm";
> +		reg = <0x40038000 0x1000>;
> +		#pwm-cells = <3>;
> +		clock-names = "ftm0", "ftm0_fix_sel", "ftm0_ext_sel";
> +		clocks = <&clks VF610_CLK_FTM0>,
> +			<&clks VF610_CLK_FTM0_FIX_SEL>,
> +			<&clks VF610_CLK_FTM0_EXT_SEL>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pwm0_1>;
> +		fsl,pwm-counter-clk = "ftm0_ext_sel";
> +};
> -- 
> 1.8.4

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
