From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 4/7] dt-bindings: devfreq: Add bindings for imx ddr
 controller
Date: Mon, 12 Aug 2019 13:51:57 -0600
Message-ID: <CAL_Jsq+5zp1nW=sNtU_+wdUO9KJ4ABWjdX=R9DHjBsgygTxV6g@mail.gmail.com>
References: <cover.1565633880.git.leonard.crestez@nxp.com>
 <4cbddd75652c63aab19866c93faa0b784b56d53f.1565633880.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4cbddd75652c63aab19866c93faa0b784b56d53f.1565633880.git.leonard.crestez@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>, Jacky Bai <ping.bai@nxp.com>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Alexandre Bailon <abailon@baylibre.com>, Will Deacon <will@kernel.org>, Abel Vesa <abel.vesa@nxp.com>, Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, "open list:THERMAL" <linux-pm@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Dong Aisheng <aisheng.dong@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 12:50 PM Leonard Crestez
<leonard.crestez@nxp.com> wrote:
>
> Add devicetree bindings for the i.MX DDR Controller on imx8m series
> chips. It supports dynamic frequency switching between multiple data
> rates and this is exposed to Linux via the devfreq subsystem.
>
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> ---
>  .../devicetree/bindings/devfreq/imx-ddrc.yaml | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/devfreq/imx-ddrc.yaml
>
> diff --git a/Documentation/devicetree/bindings/devfreq/imx-ddrc.yaml b/Documentation/devicetree/bindings/devfreq/imx-ddrc.yaml
> new file mode 100644
> index 000000000000..fa20280a682f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/devfreq/imx-ddrc.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/devfreq/imx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX DDR Controller
> +
> +maintainers:
> +  - Leonard Crestez <leonard.crestez@nxp.com>
> +
> +properties:
> +  compatible:
> +    contains:

Don't use 'contains'.

> +      enum:
> +       - fsl,imx8m-ddrc
> +
> +  reg:
> +    maxItems: 1
> +    description: DDR Controller registers

Don't really need a description for a standard property with a single item.

> +
> +  clocks:
> +    minItems: 5

Just maxItems is sufficient unless there's a variable number of items.

> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: dram_core
> +      - const: dram_pll
> +      - const: dram_alt_root
> +      - const: dram_alt
> +      - const: dram_apb
> +
> +required:
> +  - reg
> +  - compatible
> +  - clocks
> +  - clock-names

You should add an 'additionalProperties: false' here.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx8mm-clock.h>
> +    ddrc: dram-controller@3d400000 {
> +        compatible = "fsl,imx8mm-ddrc", "fsl,imx8m-ddrc";
> +        reg = <0x3d400000 0x400000>;
> +        clock-names = "dram_core", "dram_pll", "dram_alt_root", "dram_alt", "dram_apb";
> +        clocks = <&clk IMX8MM_CLK_DRAM_CORE>,
> +                 <&clk IMX8MM_DRAM_PLL>,
> +                 <&clk IMX8MM_CLK_DRAM_ALT_ROOT>,
> +                 <&clk IMX8MM_CLK_DRAM_ALT>,
> +                 <&clk IMX8MM_CLK_DRAM_APB>;
> +        operating-points-v2 = <&ddrc_opp_table>;

Not documented. You can assume a common property has a type definition
already (this one doesn't yet), so just this is enough:

operating-points-v2: true
