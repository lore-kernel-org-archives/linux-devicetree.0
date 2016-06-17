From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 1/3] arm64: dts: juno: add coresight support
Date: Fri, 17 Jun 2016 09:29:10 -0600
Message-ID: <CANLsYkyWhknAb9QeGGjM2Et0+VUVjz7W2xyUJGstxfNc2bC20Q@mail.gmail.com>
References: <1465228765-14038-1-git-send-email-sudeep.holla@arm.com>
 <1465228765-14038-2-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1465228765-14038-2-git-send-email-sudeep.holla@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Jon Medhurst <tixy@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 6 June 2016 at 09:59, Sudeep Holla <sudeep.holla@arm.com> wrote:
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
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
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
> +               compatible = "arm,coresight-tmc", "arm,primecell";
> +               reg = <0 0x20010000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       /* input port */
> +                       port@0 {
> +                               reg = <0>;
> +                               etf_in_port: endpoint {
> +                                       slave-mode;
> +                                       remote-endpoint = <&main_funnel_out_port>;
> +                               };
> +                       };
> +
> +                       /* output port */
> +                       port@1 {
> +                               reg = <0>;
> +                               etf_out_port: endpoint {
> +                                       remote-endpoint = <&replicator_in_port0>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       tpiu@20030000 {
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
> +               /* non-configurable replicators don't show up on the
> +                * AMBA bus.  As such no need to add "arm,primecell".
> +                */

Please use kernel documentation style.

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

With the above change:

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
