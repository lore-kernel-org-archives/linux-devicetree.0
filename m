From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/3] arm64: dts: juno: add coresight support
Date: Mon, 20 Jun 2016 22:41:29 -0700
Message-ID: <CAOesGMjQNEOcmYpUAxUxBJLyUYZQuRKK48a31Ys9LuTJFWqMFA@mail.gmail.com>
References: <1465228765-14038-1-git-send-email-sudeep.holla@arm.com>
	<1465228765-14038-2-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465228765-14038-2-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Some nits below.

On Mon, Jun 6, 2016 at 8:59 AM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
> Most of the debug-related components on Juno are located in the coreSight
> subsystem while others are located in the Cortex-Axx clusters, the SCP
> subsystem, and in the main system.
>
> Each core in the two processor clusters contain an Embedded Trace
> Macrocell(ETM) which generates real-time trace information that trace
> tools can use and an ATB trace output that is sent to a funnel before
> going to the CoreSight subsystem.
>
> The trace output signals combine with two trace expansions using another
> funnel and fed into the Embedded Trace FIFO(ETF0).
>
> The output trace data stream of the funnel is then replicated before it
> is sent to either the:
> - Trace Port Interface Unit(TPIU), that sends it out using the trace port.
> - ETR that can write the trace data to memory located in the application
>   memory space
>
> Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm64/boot/dts/arm/juno-base.dtsi | 296 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/arm/juno-r1.dts    |  24 +++
>  arch/arm64/boot/dts/arm/juno-r2.dts    |  24 +++
>  arch/arm64/boot/dts/arm/juno.dts       |  24 +++
>  4 files changed, 368 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
> index dee2386d3b9b..90a8710f7032 100644
> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> @@ -56,6 +56,302 @@
>                              <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>;
>         };
>
> +       /*
> +        * Juno TRMs specify the size for these coresight components as 64K.
> +        * The actual size is just 4K though 64K is reserved. Access to the
> +        * unmapped reserved region results in a DECERR response.
> +        */
> +       etf@20010000 {

Would it make sense to name it something like trace-fifo instead? We
normally name the nodes based on type of device (ethernet@, pci@,
etc).


> +               compatible = "arm,coresight-tmc", "arm,primecell";

Is there a more specific compatible needed here, or does
arm,coresight-tmc give you all the information you need on how to use
this interface?

The bindings doc is sort of sparse in this area, all it says is "you
might use one of these compatibles".

> +       tpiu@20030000 {

Again, these names are not great. Luckily they don't affect the
binding, so they can be fixed. What would be a more human readable and
functionally describing name here?

> +               compatible = "arm,coresight-tpiu", "arm,primecell";
> +               reg = <0 0x20030000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               port {
> +                       tpiu_in_port: endpoint {
> +                               slave-mode;
> +                               remote-endpoint = <&replicator_out_port0>;
> +                       };
> +               };
> +       };
> +
> +       main_funnel@20040000 {

Underscores are usually frowned upon. funnel@ or ideally a better more
descriptive name should be used here.
Use dashes if you really have to.

> +               compatible = "arm,coresight-funnel", "arm,primecell";
> +               reg = <0 0x20040000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               main_funnel_out_port: endpoint {
> +                                       remote-endpoint = <&etf_in_port>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg = <0>;
> +                               main_funnel_in_port0: endpoint {
> +                                       slave-mode;
> +                                       remote-endpoint = <&cluster0_funnel_out_port>;
> +                               };
> +                       };
> +
> +                       port@2 {
> +                               reg = <1>;
> +                               main_funnel_in_port1: endpoint {
> +                                       slave-mode;
> +                                       remote-endpoint = <&cluster1_funnel_out_port>;
> +                               };
> +                       };
> +
> +               };
> +       };
> +
> +       etr@20070000 {

Again..

> +               compatible = "arm,coresight-tmc", "arm,primecell";
> +               reg = <0 0x20070000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               port {
> +                       etr_in_port: endpoint {
> +                               slave-mode;
> +                               remote-endpoint = <&replicator_out_port1>;
> +                       };
> +               };
> +       };
> +
> +       coresight-replicator {

Hm. It'd sort of be nice to stick all the coresight stuff under one
node instead of having them all at the toplevel, but that doesn't
really go with the concept of having each device where it's at in the
bus/address hierarchy.

Should _all_ the nodes be at the toplevel though? Looks like you have
a few address ranges that most of the toplevel devices are at, is
there really not a physical bus they're each connected to that you can
describe?


> +               /* non-configurable replicators don't show up on the
> +                * AMBA bus.  As such no need to add "arm,primecell".
> +                */
> +               compatible = "arm,coresight-replicator";
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       /* replicator output ports */
> +                       port@0 {
> +                               reg = <0>;
> +                               replicator_out_port0: endpoint {
> +                                       remote-endpoint = <&tpiu_in_port>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg = <1>;
> +                               replicator_out_port1: endpoint {
> +                                       remote-endpoint = <&etr_in_port>;
> +                               };
> +                       };
> +
> +                       /* replicator input port */
> +                       port@2 {
> +                               reg = <0>;
> +                               replicator_in_port0: endpoint {
> +                                       slave-mode;
> +                                       remote-endpoint = <&etf_out_port>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       cluster0_funnel@220c0000 {
> +               compatible = "arm,coresight-funnel", "arm,primecell";
> +               reg = <0 0x220c0000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               cluster0_funnel_out_port: endpoint {
> +                                       remote-endpoint = <&main_funnel_in_port0>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg = <0>;
> +                               cluster0_funnel_in_port0: endpoint {
> +                                       slave-mode;
> +                                       remote-endpoint = <&cluster0_etm0_out_port>;
> +                               };
> +                       };
> +
> +                       port@2 {
> +                               reg = <1>;
> +                               cluster0_funnel_in_port1: endpoint {
> +                                       slave-mode;
> +                                       remote-endpoint = <&cluster0_etm1_out_port>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       cluster1_funnel@230c0000 {
> +               compatible = "arm,coresight-funnel", "arm,primecell";
> +               reg = <0 0x230c0000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               cluster1_funnel_out_port: endpoint {
> +                                       remote-endpoint = <&main_funnel_in_port1>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg = <0>;
> +                               cluster1_funnel_in_port0: endpoint {
> +                                       slave-mode;
> +                                       remote-endpoint = <&cluster1_etm0_out_port>;
> +                               };
> +                       };
> +
> +                       port@2 {
> +                               reg = <1>;
> +                               cluster1_funnel_in_port1: endpoint {
> +                                       slave-mode;
> +                                       remote-endpoint = <&cluster1_etm1_out_port>;
> +                               };
> +                       };
> +                       port@3 {
> +                               reg = <2>;
> +                               cluster1_funnel_in_port2: endpoint {
> +                                       slave-mode;
> +                                       remote-endpoint = <&cluster1_etm2_out_port>;
> +                               };
> +                       };
> +                       port@4 {
> +                               reg = <3>;
> +                               cluster1_funnel_in_port3: endpoint {
> +                                       slave-mode;
> +                                       remote-endpoint = <&cluster1_etm3_out_port>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       etm0: etm@22040000 {

If this file is sorted on reg values, then this node and the two after
are out of order.

> +               compatible = "arm,coresight-etm4x", "arm,primecell";
> +               reg = <0 0x22040000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               port {
> +                       cluster0_etm0_out_port: endpoint {
> +                               remote-endpoint = <&cluster0_funnel_in_port0>;
> +                       };
> +               };
> +       };
> +
> +       etm1: etm@22140000 {
> +               compatible = "arm,coresight-etm4x", "arm,primecell";
> +               reg = <0 0x22140000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               port {
> +                       cluster0_etm1_out_port: endpoint {
> +                               remote-endpoint = <&cluster0_funnel_in_port1>;
> +                       };
> +               };
> +       };
> +
> +       etm2: etm@23040000 {
> +               compatible = "arm,coresight-etm4x", "arm,primecell";
> +               reg = <0 0x23040000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               port {
> +                       cluster1_etm0_out_port: endpoint {
> +                               remote-endpoint = <&cluster1_funnel_in_port0>;
> +                       };
> +               };
> +       };
> +
> +       etm3: etm@23140000 {
> +               compatible = "arm,coresight-etm4x", "arm,primecell";
> +               reg = <0 0x23140000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               port {
> +                       cluster1_etm1_out_port: endpoint {
> +                               remote-endpoint = <&cluster1_funnel_in_port1>;
> +                       };
> +               };
> +       };
> +
> +       etm4: etm@23240000 {
> +               compatible = "arm,coresight-etm4x", "arm,primecell";
> +               reg = <0 0x23240000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               port {
> +                       cluster1_etm2_out_port: endpoint {
> +                               remote-endpoint = <&cluster1_funnel_in_port2>;
> +                       };
> +               };
> +       };
> +
> +       etm5: etm@23340000 {
> +               compatible = "arm,coresight-etm4x", "arm,primecell";
> +               reg = <0 0x23340000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               port {
> +                       cluster1_etm3_out_port: endpoint {
> +                               remote-endpoint = <&cluster1_funnel_in_port3>;
> +                       };
> +               };
> +       };
> +
>         sram: sram@2e000000 {
>                 compatible = "arm,juno-sram-ns", "mmio-sram";
>                 reg = <0x0 0x2e000000 0x0 0x8000>;
> diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dts/arm/juno-r1.dts
> index d95d9e7e2dc0..f4f8f54f8b85 100644
> --- a/arch/arm64/boot/dts/arm/juno-r1.dts
> +++ b/arch/arm64/boot/dts/arm/juno-r1.dts
> @@ -181,3 +181,27 @@
>  &pcie_ctlr {
>         status = "okay";
>  };
> +
> +&etm0 {
> +       cpu = <&A57_0>;
> +};
> +
> +&etm1 {
> +       cpu = <&A57_1>;
> +};
> +
> +&etm2 {
> +       cpu = <&A53_0>;
> +};
> +
> +&etm3 {
> +       cpu = <&A53_1>;
> +};
> +
> +&etm4 {
> +       cpu = <&A53_2>;
> +};
> +
> +&etm5 {
> +       cpu = <&A53_3>;
> +};
> diff --git a/arch/arm64/boot/dts/arm/juno-r2.dts b/arch/arm64/boot/dts/arm/juno-r2.dts
> index 88ecd6182b67..d903e545b64c 100644
> --- a/arch/arm64/boot/dts/arm/juno-r2.dts
> +++ b/arch/arm64/boot/dts/arm/juno-r2.dts
> @@ -181,3 +181,27 @@
>  &pcie_ctlr {
>         status = "okay";
>  };
> +
> +&etm0 {
> +       cpu = <&A72_0>;
> +};
> +
> +&etm1 {
> +       cpu = <&A72_1>;
> +};
> +
> +&etm2 {
> +       cpu = <&A53_0>;
> +};
> +
> +&etm3 {
> +       cpu = <&A53_1>;
> +};
> +
> +&etm4 {
> +       cpu = <&A53_2>;
> +};
> +
> +&etm5 {
> +       cpu = <&A53_3>;
> +};
> diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/juno.dts
> index dcfcf15a17f5..a7270eff6939 100644
> --- a/arch/arm64/boot/dts/arm/juno.dts
> +++ b/arch/arm64/boot/dts/arm/juno.dts
> @@ -173,3 +173,27 @@
>
>         #include "juno-base.dtsi"
>  };
> +
> +&etm0 {
> +       cpu = <&A57_0>;
> +};
> +
> +&etm1 {
> +       cpu = <&A57_1>;
> +};
> +
> +&etm2 {
> +       cpu = <&A53_0>;
> +};
> +
> +&etm3 {
> +       cpu = <&A53_1>;
> +};
> +
> +&etm4 {
> +       cpu = <&A53_2>;
> +};
> +
> +&etm5 {
> +       cpu = <&A53_3>;
> +};
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
