From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCHv7 3/6] arm64: dts: qcom: msm8996: Add Coresight support
Date: Thu, 7 Feb 2019 13:23:04 -0700
Message-ID: <CANLsYkyZARfPS+mCJuQb5y1-KsTUMZ9eqQEHzkuamVyLWAF_JQ@mail.gmail.com>
References: <cover.1548981329.git.saiprakash.ranjan@codeaurora.org> <ac141df0f056c9a50418c2d87a0d1cef17d49556.1548981329.git.saiprakash.ranjan@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ac141df0f056c9a50418c2d87a0d1cef17d49556.1548981329.git.saiprakash.ranjan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Doug Anderson <dianders@chromium.org>, Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Rajendra Nayak <rnayak@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Tingwei Zhang <tingwei@codeaurora.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 31 Jan 2019 at 17:54, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> From: Vivek Gautam <vivek.gautam@codeaurora.org>
>
> Enable coresight support by adding device nodes for the
> available source, sinks and channel blocks on msm8996.
>
> This also adds coresight cpu debug nodes.
>
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 434 ++++++++++++++++++++++++++
>  1 file changed, 434 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 99b7495455a6..3406a10f40db 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -429,6 +429,440 @@
>                         reg = <0x300000 0x90000>;
>                 };
>
> +               stm@3002000 {
> +                       compatible = "arm,coresight-stm", "arm,primecell";
> +                       reg = <0x3002000 0x1000>,
> +                             <0x8280000 0x180000>;
> +                       reg-names = "stm-base", "stm-stimulus-base";
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       out-ports {
> +                               port {
> +                                       stm_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&funnel0_in>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               tpiu@3020000 {
> +                       compatible = "arm,coresight-tpiu", "arm,primecell";
> +                       reg = <0x3020000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       in-ports {
> +                               port {
> +                                       tpiu_in: endpoint {
> +                                               remote-endpoint =
> +                                                 <&replicator_out1>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               funnel@3021000 {
> +                       compatible = "arm,coresight-funnel", "arm,primecell";
> +                       reg = <0x3021000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       in-ports {
> +                               port {
> +                                       funnel0_in: endpoint {
> +                                               remote-endpoint =
> +                                                 <&stm_out>;
> +                                       };
> +                               };
> +                       };
> +
> +                       out-ports {
> +                               port {
> +                                       funnel0_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&merge_funnel_in0>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               funnel@3022000 {
> +                       compatible = "arm,coresight-funnel", "arm,primecell";
> +                       reg = <0x3022000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       in-ports {
> +                               port {
> +                                       funnel1_in: endpoint {
> +                                               remote-endpoint =
> +                                                 <&apss_merge_funnel_out>;
> +                                       };
> +                               };
> +                       };
> +
> +                       out-ports {
> +                               port {
> +                                       funnel1_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&merge_funnel_in1>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               funnel@3025000 {
> +                       compatible = "arm,coresight-funnel", "arm,primecell";
> +                       reg = <0x3025000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       in-ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +                                       merge_funnel_in0: endpoint {
> +                                               remote-endpoint =
> +                                                 <&funnel0_out>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       merge_funnel_in1: endpoint {
> +                                               remote-endpoint =
> +                                                 <&funnel1_out>;
> +                                       };
> +                               };
> +                       };
> +
> +                       out-ports {
> +                               port {
> +                                       merge_funnel_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&etf_in>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               replicator@3026000 {
> +                       compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +                       reg = <0x3026000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       in-ports {
> +                               port {
> +                                       replicator_in: endpoint {
> +                                               remote-endpoint =
> +                                                 <&etf_out>;
> +                                       };
> +                               };
> +                       };
> +
> +                       out-ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +                                       replicator_out0: endpoint {
> +                                               remote-endpoint =
> +                                                 <&etr_in>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       replicator_out1: endpoint {
> +                                               remote-endpoint =
> +                                                 <&tpiu_in>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               etf@3027000 {
> +                       compatible = "arm,coresight-tmc", "arm,primecell";
> +                       reg = <0x3027000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       in-ports {
> +                               port {
> +                                       etf_in: endpoint {
> +                                               remote-endpoint =
> +                                                 <&merge_funnel_out>;
> +                                       };
> +                               };
> +                       };
> +
> +                       out-ports {
> +                               port {
> +                                       etf_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&replicator_in>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               etr@3028000 {
> +                       compatible = "arm,coresight-tmc", "arm,primecell";
> +                       reg = <0x3028000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +                       arm,scatter-gather;
> +
> +                       in-ports {
> +                               port {
> +                                       etr_in: endpoint {
> +                                               remote-endpoint =
> +                                                 <&replicator_out0>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               debug@3810000 {
> +                       compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +                       reg = <0x3810000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>;
> +                       clock-names = "apb_pclk";
> +
> +                       cpu = <&CPU0>;
> +               };
> +
> +               etm@3840000 {
> +                       compatible = "arm,coresight-etm4x", "arm,primecell";
> +                       reg = <0x3840000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       cpu = <&CPU0>;
> +
> +                       out-ports {
> +                               port {
> +                                       etm0_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&apss_funnel0_in0>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               debug@3910000 {
> +                       compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +                       reg = <0x3910000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>;
> +                       clock-names = "apb_pclk";
> +
> +                       cpu = <&CPU1>;
> +               };
> +
> +               etm@3940000 {
> +                       compatible = "arm,coresight-etm4x", "arm,primecell";
> +                       reg = <0x3940000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       cpu = <&CPU1>;
> +
> +                       out-ports {
> +                               port {
> +                                       etm1_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&apss_funnel0_in1>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               funnel@39b0000 { /* APSS Funnel 0 */
> +                       compatible = "arm,coresight-funnel", "arm,primecell";
> +                       reg = <0x39b0000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       in-ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +                                       apss_funnel0_in0: endpoint {
> +                                               remote-endpoint = <&etm0_out>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       apss_funnel0_in1: endpoint {
> +                                               remote-endpoint = <&etm1_out>;
> +                                       };
> +                               };
> +                       };
> +
> +                       out-ports {
> +                               port {
> +                                       apss_funnel0_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&apss_merge_funnel_in0>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               debug@3a10000 {
> +                       compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +                       reg = <0x3a10000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>;
> +                       clock-names = "apb_pclk";
> +
> +                       cpu = <&CPU2>;
> +               };
> +
> +               etm@3a40000 {
> +                       compatible = "arm,coresight-etm4x", "arm,primecell";
> +                       reg = <0x3a40000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       cpu = <&CPU2>;
> +
> +                       out-ports {
> +                               port {
> +                                       etm2_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&apss_funnel1_in0>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               debug@3b10000 {
> +                       compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +                       reg = <0x3b10000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>;
> +                       clock-names = "apb_pclk";
> +
> +                       cpu = <&CPU3>;
> +               };
> +
> +               etm@3b40000 {
> +                       compatible = "arm,coresight-etm4x", "arm,primecell";
> +                       reg = <0x3b40000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       cpu = <&CPU3>;
> +
> +                       out-ports {
> +                               port {
> +                                       etm3_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&apss_funnel1_in1>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               funnel@3bb0000 { /* APSS Funnel 1 */
> +                       compatible = "arm,coresight-funnel", "arm,primecell";
> +                       reg = <0x3bb0000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       in-ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +                                       apss_funnel1_in0: endpoint {
> +                                               remote-endpoint = <&etm2_out>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       apss_funnel1_in1: endpoint {
> +                                               remote-endpoint = <&etm3_out>;
> +                                       };
> +                               };
> +                       };
> +
> +                       out-ports {
> +                               port {
> +                                       apss_funnel1_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&apss_merge_funnel_in1>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               funnel@3bc0000 {
> +                       compatible = "arm,coresight-funnel", "arm,primecell";
> +                       reg = <0x3bc0000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
> +                       clock-names = "apb_pclk", "atclk";
> +
> +                       in-ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +                                       apss_merge_funnel_in0: endpoint {
> +                                               remote-endpoint =
> +                                                 <&apss_funnel0_out>;
> +                                       };
> +                               };
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       apss_merge_funnel_in1: endpoint {
> +                                               remote-endpoint =
> +                                                 <&apss_funnel1_out>;
> +                                       };
> +                               };
> +                       };
> +
> +                       out-ports {
> +                               port {
> +                                       apss_merge_funnel_out: endpoint {
> +                                               remote-endpoint =
> +                                                 <&funnel1_in>;
> +                                       };
> +                               };
> +                       };
> +               };
> +

Normally you'd want to have two seperate patches for coresight and
cpu-debug but that is up up to the David and Andy to decide.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>                 kryocc: clock-controller@6400000 {
>                         compatible = "qcom,apcc-msm8996";
>                         reg = <0x6400000 0x90000>;
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
