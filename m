From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: Added syscon-reboot node for FSL's LS2080A SoC
Date: Fri, 6 Nov 2015 19:12:39 -0300
Message-ID: <CABxcv=n6UTcdskBv8fqRzfes+nCjPaFbCTDGRRDt=MStdepwWA@mail.gmail.com>
References: <1446846529-10613-1-git-send-email-German.Rivera@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446846529-10613-1-git-send-email-German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "J. German Rivera" <German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org, leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org, stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello J. German,

On Fri, Nov 6, 2015 at 6:48 PM, J. German Rivera
<German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> Added sys-reboot node to the FSL's LS2080A SoC DT to leverage
> the ARM-generic reboot mechanism for this SoC. This mechanism
> is enabled through CONFIG_POWER_RESET_SYSCON.
>

What's in the changelog ends as a part of the commit message and
usually the change history is not added there...

> CHANGE HISTORY:
>
> Changes in v3:
> - Addressed comment from Stuart Yoder
>   * Fixed commit message to refer to LS2080A instead of LS2085A.
>
> Changes in v2:
> - Addressed comment form Stuart Yoder:
>   * Removed "@<address>" from reboot node
>
> Changes in v3:
> - Addressed comment form Stuart Yoder:
>   * Expose only the reset register
>
> Changes in v4:
> - Addressed comment from Arnd Bergmann:
>   * Changed compatible string to be more specific
>   * Changed node name to 'syscon' instead of 'rstcr'
>   * Changed address to lower case hex
> - Addressed comment form Stuart Yoder:
>   * Rebase on top of branch arm-soc/for-next
>
> Signed-off-by: J. German Rivera <German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---

...so the change history should be added here, between the '---'
marker line and the patch diff since that section is omitted by tools
like git-am when applying patches.

>  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> index e81cd48..a790a90 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> @@ -153,6 +153,18 @@
>                 };
>         };
>
> +       rstcr: syscon@1e60000 {
> +               compatible = "fsl,ls2085a-rstcr", "syscon";
> +               reg = <0x0 0x1e60000 0x0 0x4>;
> +       };
> +
> +       reboot {
> +               compatible ="syscon-reboot";
> +               regmap = <&rstcr>;
> +               offset = <0x0>;
> +               mask = <0x2>;
> +       };
> +
>         timer {
>                 compatible = "arm,armv8-timer";
>                 interrupts = <1 13 0x8>, /* Physical Secure PPI, active-low */
> --

The patch looks good to me though.

Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
