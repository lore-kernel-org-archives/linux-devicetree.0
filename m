From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [RFCv3 1/3] dt-bindings: interconnect: Add bindings for imx
Date: Wed, 7 Aug 2019 18:16:37 +0300
Message-ID: <123536fc-c3ce-5bfe-fbd6-20cde0c13cc0@linaro.org>
References: <cover.1565088423.git.leonard.crestez@nxp.com>
 <90561b14af66655ca859d387b3808a84641eea4e.1565088423.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <90561b14af66655ca859d387b3808a84641eea4e.1565088423.git.leonard.crestez@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Leonard Crestez <leonard.crestez@nxp.com>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>, Alexandre Bailon <abailon@baylibre.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Saravana Kannan <saravanak@google.com>, Anson Huang <Anson.Huang@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, linux-imx@nxp.com, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Leonard,

On 8/6/19 13:55, Leonard Crestez wrote:
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> ---

Please put some commit text.

>  .../devicetree/bindings/interconnect/imx.yaml | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/imx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/imx.yaml b/Documentation/devicetree/bindings/interconnect/imx.yaml
> new file mode 100644
> index 000000000000..c6f173b38f4f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/imx.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interconnect/imx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic i.MX interconnect device
> +
> +maintainers:
> +  - Leonard Crestez <leonard.crestez@nxp.com>
> +
> +properties:
> +  compatible:
> +    contains:
> +      enum:
> +        - fsl,imx8mm-interconnect

Maybe fsl,imx8mm-busfreq? I thought it's called busfreq in downstream, but it's
up to you.

> +  "#interconnect-cells":
> +    const: 1
> +  devfreq-names:
> +    description: Names of devfreq instances for adjustable nodes
> +  devfreq:
> +    description: List of phandle pointing to devfreq instances
> +
> +required:
> +  - compatible
> +  - "#interconnect-cells"
> +  - "devfreq-names"
> +  - "devfreq"
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interconnect/imx8mm.h>
> +    icc: interconnect {
> +        compatible = "fsl,imx8mm-interconnect";
> +        #interconnect-cells = <1>;
> +        devfreq-names = "dram", "noc", "axi";
> +        devfreq = <&ddrc>, <&noc>, <&pl301_main>;
> +    };
> 

Thanks,
Georgi
