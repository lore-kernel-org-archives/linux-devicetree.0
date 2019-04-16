From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v5 3/4] dt-bindings: arm: coresight: Unify funnel DT binding
Date: Tue, 16 Apr 2019 14:20:10 -0600
Message-ID: <CANLsYkwr=bZLodHbbRiDiV1m6mwscJoYbx00MoqPf4ttXytD=Q@mail.gmail.com>
References: <20190412102738.12679-1-leo.yan@linaro.org> <20190412102738.12679-4-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412102738.12679-4-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wanglai Shi <shiwanglai@hisilicon.com>
List-Id: devicetree@vger.kernel.org

On Fri, 12 Apr 2019 at 04:28, Leo Yan <leo.yan@linaro.org> wrote:
>
> Following the same fashion with replicator DT binding, this patch is to
> unify the DT binding for funnel to support static and dynamic modes;
> finally we get the funnel DT binding as below:
>
> Before patch:
>
>   Static funnel, aka. non-configurable funnel:
>     Not supported;
>
>   Dynamic funnel, aka. configurable funnel:
>     "arm,coresight-funnel", "arm,primecell";
>
> After patch:
>
>   Static funnel:
>     "arm,coresight-static-funnel";
>
>   Dynamic funnel:
>     "arm,coresight-dynamic-funnel", "arm,primecell";
>     "arm,coresight-funnel", "arm,primecell"; (obsolete)
>
> At the end of this patch, it gives an example for static funnel DT
> binding, and updates the dynamic funnel example.
>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Wanglai Shi <shiwanglai@hisilicon.com>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  .../devicetree/bindings/arm/coresight.txt     | 53 +++++++++++++++++--
>  1 file changed, 48 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> index d02d160fa8ac..8a88ddebc1a2 100644
> --- a/Documentation/devicetree/bindings/arm/coresight.txt
> +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> @@ -8,7 +8,8 @@ through the intermediate links connecting the source to the currently selected
>  sink. Each CoreSight component device should use these properties to describe
>  its hardware characteristcs.
>
> -* Required properties for all components *except* non-configurable replicators:
> +* Required properties for all components *except* non-configurable replicators
> +  and non-configurable funnels:
>
>         * compatible: These have to be supplemented with "arm,primecell" as
>           drivers are using the AMBA bus interface.  Possible values include:
> @@ -24,8 +25,10 @@ its hardware characteristcs.
>                   discovered at boot time when the device is probed.
>                         "arm,coresight-tmc", "arm,primecell";
>
> -               - Trace Funnel:
> -                       "arm,coresight-funnel", "arm,primecell";
> +               - Trace Programmable Funnel:
> +                       "arm,coresight-dynamic-funnel", "arm,primecell";
> +                       "arm,coresight-funnel", "arm,primecell"; (OBSOLETE. For
> +                               backward compatibility and will be removed)
>
>                 - Embedded Trace Macrocell (version 3.x) and
>                                         Program Flow Trace Macrocell:
> @@ -65,7 +68,7 @@ its hardware characteristcs.
>           "stm-stimulus-base", each corresponding to the areas defined in "reg".
>
>  * Required properties for devices that don't show up on the AMBA bus, such as
> -  non-configurable replicators:
> +  non-configurable replicators and non-configurable funnels:
>
>         * compatible: Currently supported value is (note the absence of the
>           AMBA markee):
> @@ -74,6 +77,9 @@ its hardware characteristcs.
>                         "arm,coresight-replicator"; (OBSOLETE. For backward
>                                 compatibility and will be removed)
>
> +               - Coresight Non-configurable Funnel:
> +                       "arm,coresight-static-funnel";
> +
>         * port or ports: see "Graph bindings for Coresight" below.
>
>  * Optional properties for ETM/PTMs:
> @@ -203,8 +209,45 @@ Example:
>                 };
>         };
>
> +       funnel {
> +               /*
> +                * non-configurable funnel don't show up on the AMBA
> +                * bus.  As such no need to add "arm,primecell".
> +                */
> +               compatible = "arm,coresight-static-funnel";
> +               clocks = <&crg_ctrl HI3660_PCLK>;
> +               clock-names = "apb_pclk";
> +
> +               out-ports {
> +                       port {
> +                               combo_funnel_out: endpoint {
> +                                       remote-endpoint = <&top_funnel_in>;
> +                               };
> +                       };
> +               };
> +
> +               in-ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       port@0 {
> +                               reg = <0>;
> +                               combo_funnel_in0: endpoint {
> +                                       remote-endpoint = <&cluster0_etf_out>;
> +                               };
> +                       };
> +
> +                       port@1 {
> +                               reg = <1>;
> +                               combo_funnel_in1: endpoint {
> +                                       remote-endpoint = <&cluster1_etf_out>;
> +                               };
> +                       };
> +               };
> +       };
> +
>         funnel@20040000 {
> -               compatible = "arm,coresight-funnel", "arm,primecell";
> +               compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>                 reg = <0 0x20040000 0 0x1000>;
>
>                 clocks = <&oscclk6a>;
> --
> 2.17.1

Same thing for this one.

>
