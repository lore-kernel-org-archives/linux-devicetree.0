From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH RESEND] coresight-stm: Bindings for System Trace Macrocell
Date: Thu, 26 Feb 2015 16:08:19 -0600
Message-ID: <CAL_Jsq+qPRh5DSH2bqzbHngtUMdmFkuATY169C0v6gs-x+izgA@mail.gmail.com>
References: <1424967258-28573-1-git-send-email-mathieu.poirier@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424967258-28573-1-git-send-email-mathieu.poirier@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, zhang.chunyan@linaro.org, Kaixu Xia <kaixu.xia@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 26, 2015 at 10:14 AM, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
> The System Trace Macrocell (STM) is an IP block falling under the
> CoreSight umbrella.  It's main purpose it so expose stimulus channels
> to any system component for the purpose of information logging.
>
> Bindings for this IP block adds a couple of items to the current
> mandatory definition for CoreSight components.  The driver has been posted
> here[1].
>
> [1]. https://lkml.org/lkml/2015/2/25/743
>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

Seems reasonable, but a couple minor comments below. Merge this with the driver:

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  .../devicetree/bindings/arm/coresight.txt          | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> index a3089359aaa6..854127578718 100644
> --- a/Documentation/devicetree/bindings/arm/coresight.txt
> +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> @@ -17,6 +17,7 @@ its hardware characteristcs.
>                 - "arm,coresight-tmc", "arm,primecell";
>                 - "arm,coresight-funnel", "arm,primecell";
>                 - "arm,coresight-etm3x", "arm,primecell";
> +               - "arm,coresight-stm", "arm,primecell";

No versions of STM?

>         * reg: physical base address and length of the register
>           set(s) of the component.
> @@ -31,6 +32,14 @@ its hardware characteristcs.
>           layout using the generic DT graph presentation found in
>           "bindings/graph.txt".
>
> +* Additional required properly for System Trace Macrocells (STM):
> +       * reg: along with the physical base address and length of the register
> +         set as described above, another entry is required to describe the
> +         mapping of the extended stimulus port area.
> +
> +       * reg-names: the only acceptable values are "stm-base" and
> +         "stm-channel-base", each corresponding to the areas defined in "reg".

It is not really clear that "extended stimulus port area" corresponds
to "stm-channel-base".

> +
>  * Required properties for devices that don't show up on the AMBA bus, such as
>    non-configurable replicators:
>
> @@ -198,3 +207,19 @@ Example:
>                         };
>                 };
>         };
> +
> +4. STM
> +       stm@20100000 {
> +               compatible = "arm,coresight-stm", "arm,primecell";
> +               reg = <0 0x20100000 0 0x1000>,
> +                     <0 0x28000000 0 0x180000>;
> +               reg-names = "stm-base", "stm-channel-base";
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               port {
> +                       stm_out_port: endpoint {
> +                               remote-endpoint = <&main_funnel_in_port2>;
> +                       };
> +               };
> +       };
> --
> 1.9.1
>
