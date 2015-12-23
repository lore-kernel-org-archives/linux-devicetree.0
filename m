From: Bhupesh SHARMA <bhupesh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] dts/ls2080a: Update DTSI to add support of SP805 WDT
Date: Wed, 23 Dec 2015 10:53:04 +0530
Message-ID: <CAFTCetS7P6wF3MhgMSXSXP_jnLQvBc-NSY0TW3OOnCjtbL0N_w@mail.gmail.com>
References: <1450189825-29065-1-git-send-email-bhupesh.sharma@freescale.com>
	<1450189825-29065-3-git-send-email-bhupesh.sharma@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450189825-29065-3-git-send-email-bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Leo Li <LeoLi-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd, Olof, Kevin

On Tue, Dec 15, 2015 at 8:00 PM, Bhupesh Sharma
<bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> This patch updates the LS2080a DTSI (DTS Include) file to add
> support for eight SP805 Watchdog units which can be used to
> reset the eight Cortex-A57 cores available on LS2080A.
>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi |   56 ++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)

Since Rob has acked the SP805 WDT binding documentation patch (patch
1/2 of this series),
can this DTSI change, please be considered for absorption in the arm-soc tree.

Regards,
Bhupesh

>
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> index e81cd48..7b0f411 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> @@ -193,6 +193,62 @@
>                         interrupts = <0 32 0x4>; /* Level high type */
>                 };
>
> +               cluster1_core0_watchdog: wdt@c000000 {
> +                       compatible = "arm,sp805-wdt", "arm,primecell";
> +                       reg = <0x0 0xc000000 0x0 0x1000>;
> +                       clocks = <&clockgen 4 3>, <&clockgen 4 3>;
> +                       clock-names = "apb_pclk", "wdog_clk";
> +               };
> +
> +               cluster1_core1_watchdog: wdt@c010000 {
> +                       compatible = "arm,sp805-wdt", "arm,primecell";
> +                       reg = <0x0 0xc010000 0x0 0x1000>;
> +                       clocks = <&clockgen 4 3>, <&clockgen 4 3>;
> +                       clock-names = "apb_pclk", "wdog_clk";
> +               };
> +
> +               cluster2_core0_watchdog: wdt@c100000 {
> +                       compatible = "arm,sp805-wdt", "arm,primecell";
> +                       reg = <0x0 0xc100000 0x0 0x1000>;
> +                       clocks = <&clockgen 4 3>, <&clockgen 4 3>;
> +                       clock-names = "apb_pclk", "wdog_clk";
> +               };
> +
> +               cluster2_core1_watchdog: wdt@c110000 {
> +                       compatible = "arm,sp805-wdt", "arm,primecell";
> +                       reg = <0x0 0xc110000 0x0 0x1000>;
> +                       clocks = <&clockgen 4 3>, <&clockgen 4 3>;
> +                       clock-names = "apb_pclk", "wdog_clk";
> +               };
> +
> +               cluster3_core0_watchdog: wdt@c200000 {
> +                       compatible = "arm,sp805-wdt", "arm,primecell";
> +                       reg = <0x0 0xc200000 0x0 0x1000>;
> +                       clocks = <&clockgen 4 3>, <&clockgen 4 3>;
> +                       clock-names = "apb_pclk", "wdog_clk";
> +               };
> +
> +               cluster3_core1_watchdog: wdt@c210000 {
> +                       compatible = "arm,sp805-wdt", "arm,primecell";
> +                       reg = <0x0 0xc210000 0x0 0x1000>;
> +                       clocks = <&clockgen 4 3>, <&clockgen 4 3>;
> +                       clock-names = "apb_pclk", "wdog_clk";
> +               };
> +
> +               cluster4_core0_watchdog: wdt@c300000 {
> +                       compatible = "arm,sp805-wdt", "arm,primecell";
> +                       reg = <0x0 0xc300000 0x0 0x1000>;
> +                       clocks = <&clockgen 4 3>, <&clockgen 4 3>;
> +                       clock-names = "apb_pclk", "wdog_clk";
> +               };
> +
> +               cluster4_core1_watchdog: wdt@c310000 {
> +                       compatible = "arm,sp805-wdt", "arm,primecell";
> +                       reg = <0x0 0xc310000 0x0 0x1000>;
> +                       clocks = <&clockgen 4 3>, <&clockgen 4 3>;
> +                       clock-names = "apb_pclk", "wdog_clk";
> +               };
> +
>                 fsl_mc: fsl-mc@80c000000 {
>                         compatible = "fsl,qoriq-mc";
>                         reg = <0x00000008 0x0c000000 0 0x40>,    /* MC portal base */
> --
> 1.7.9.5
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
