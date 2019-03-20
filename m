From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: coresight: Support
 non-configurable funnel
Date: Wed, 20 Mar 2019 11:28:07 -0600
Message-ID: <CANLsYkyooCaEjRtq0OnNkSKPhe6MPKVbL14Fao=pQ1j3Riw5Pg@mail.gmail.com>
References: <1553085490-42870-1-git-send-email-shiwanglai@hisilicon.com>
 <1553085490-42870-2-git-send-email-shiwanglai@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1553085490-42870-2-git-send-email-shiwanglai@hisilicon.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wanglai Shi <shiwanglai@hisilicon.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "Suzuki K. Poulose" <suzuki.poulose@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Suzhuangluan <suzhuangluan@hisilicon.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, xuwei <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Leo Yan <leo.yan@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Wanglai,

On Wed, 20 Mar 2019 at 06:53, Wanglai Shi <shiwanglai@hisilicon.com> wrote:
>
> From: Leo Yan <leo.yan@linaro.org>
>
> Document DT binding for non-configurable funnel and give an example
> for it.
>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

This patch needs to be sent on its own.


> ---
>  .../devicetree/bindings/arm/coresight.txt     | 45 +++++++++++++++++--
>  1 file changed, 42 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> index f8aff65ab921..e63ec3362af8 100644
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
> @@ -24,7 +25,7 @@ its hardware characteristcs.
>                   discovered at boot time when the device is probed.
>                         "arm,coresight-tmc", "arm,primecell";
>
> -               - Trace Funnel:
> +               - Trace Programmable Funnel:
>                         "arm,coresight-funnel", "arm,primecell";
>
>                 - Embedded Trace Macrocell (version 3.x) and
> @@ -65,11 +66,12 @@ its hardware characteristcs.
>           "stm-stimulus-base", each corresponding to the areas defined in "reg".
>
>  * Required properties for devices that don't show up on the AMBA bus, such as
> -  non-configurable replicators:
> +  non-configurable replicators and non-configurable funnels:
>
>         * compatible: Currently supported value is (note the absence of the
>           AMBA markee):
>                 - "arm,coresight-replicator"
> +               - "arm,coresight-funnel"
>
>         * port or ports: see "Graph bindings for Coresight" below.
>
> @@ -200,6 +202,43 @@ Example:
>                 };
>         };
>
> +       funnel {
> +               /*
> +                * non-configurable funnel don't show up on the AMBA
> +                * bus.  As such no need to add "arm,primecell".
> +                */
> +               compatible = "arm,coresight-funnel";
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
>                 compatible = "arm,coresight-funnel", "arm,primecell";
>                 reg = <0 0x20040000 0 0x1000>;
> --
> 2.17.1
>
