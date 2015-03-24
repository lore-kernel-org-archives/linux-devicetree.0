From: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] coresight: adding basic support for Spreadtrum SC9836
Date: Tue, 24 Mar 2015 09:08:50 -0600
Message-ID: <CANLsYkw+dzHU5QtqM-Pw8s-C-K4aqd0ATKd_SidwVf6uqyd9cA@mail.gmail.com>
References: <1427176113-23411-1-git-send-email-zhang.chunyan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427176113-23411-1-git-send-email-zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Kaixu Xia <kaixu.xia-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Zhizhou <zhizhou.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, orsonzhai-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 23 March 2015 at 23:48, Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Support only for ETB, FUNNEL, STM are included currently.
> Support for ETM, TPIU and the replicator linked to it are not included in
> this version patch.
>
> Signed-off-by: Chunyan Zhang <zhang.chunyan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm64/boot/dts/sprd/sc9836.dtsi | 57 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/sprd/sc9836.dtsi b/arch/arm64/boot/dts/sprd/sc9836.dtsi
> index f92f1b4..2ca80f3 100644
> --- a/arch/arm64/boot/dts/sprd/sc9836.dtsi
> +++ b/arch/arm64/boot/dts/sprd/sc9836.dtsi
> @@ -45,6 +45,63 @@
>                 };
>         };
>
> +       etb@10003000 {
> +               compatible = "arm,coresight-etb10", "arm,primecell";
> +               reg = <0 0x10003000 0 0x1000>;
> +               arm,primecell-periphid = <0x0003b907>;

Specifying the primecell id in the device tree like this is usually to
avoid probing of the memory space by the AMBA mechanic when bus
components are discovered.  As such components are probed and
initialised when their drivers are registered with the diver core
later in the boot process.

Is there a good reason why this is done here?  Especially when the
funnel and STM don't specify their cell IDs in the DT.

> +               coresight-default-sink;

Please remove the above - this feature no longer exists.

> +               clocks = <&clk26mhz>;
> +               clock-names = "apb_pclk";
> +               port {
> +                       etb_in: endpoint {
> +                               slave-mode;
> +                               remote-endpoint = <&funnel_out_port0>;
> +                       };
> +               };
> +       };
> +
> +       funnel@10001000 {
> +               compatible = "arm,coresight-funnel", "arm,primecell";
> +               reg = <0 0x10001000 0 0x1000>;
> +               clocks = <&clk26mhz>;
> +               clock-names = "apb_pclk";
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       /* funnel output port */
> +                       port@0 {
> +                               reg = <0>;
> +                               funnel_out_port0: endpoint {
> +                                       remote-endpoint = <&etb_in>;
> +                               };
> +                       };
> +
> +                       /* funnel input port 0~3 is reserved for ETMs */
> +                       port@1 {
> +                               reg = <4>;
> +                               funnel_in_port4: endpoint {
> +                                       slave-mode;
> +                                       remote-endpoint = <&stm_out>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       stm@10006000 {
> +               compatible = "arm,coresight-stm", "arm,primecell";
> +               reg = <0 0x10006000 0 0x1000>,
> +                     <0 0x01000000 0 0x180000>;
> +               reg-names = "stm-base", "stm-stimulus-base";
> +               clocks = <&clk26mhz>;
> +               clock-names = "apb_pclk";
> +               port {
> +                       stm_out: endpoint {
> +                               remote-endpoint = <&funnel_in_port4>;
> +                       };
> +               };
> +       };
> +
>         gic: interrupt-controller@12001000 {
>                 compatible = "arm,gic-400";
>                 reg = <0 0x12001000 0 0x1000>,
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
