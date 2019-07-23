From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 5/5] dt-bindings: dsp: fsl: Add DSP core binding support
Date: Tue, 23 Jul 2019 16:32:16 -0600
Message-ID: <CAL_JsqJ0A8MikmZb0KZd5r72J2o73GJ_E0o4CzW_=OVu2OcPKA@mail.gmail.com>
References: <20190723084104.12639-1-daniel.baluta@nxp.com> <20190723084104.12639-6-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723084104.12639-6-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: Marco Felsch <m.felsch@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Dong Aisheng <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>, Anson Huang <anson.huang@nxp.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, paul.olaru@nxp.com, Sascha Hauer <kernel@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, sound-open-firmware@alsa-project.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 23, 2019 at 2:41 AM Daniel Baluta <daniel.baluta@nxp.com> wrote:
>
> This describes the DSP device tree node.
>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
>
> diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> new file mode 100644
> index 000000000000..d112486eda0e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/freescale/fsl,dsp.yaml#

This needs updating to match the path.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX8 DSP core
> +
> +maintainers:
> +  - Daniel Baluta <daniel.baluta@nxp.com>
> +
> +description: |
> +  Some boards from i.MX8 family contain a DSP core used for
> +  advanced pre- and post- audio processing.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8qxp-dsp
> +
> +  reg:
> +    description: Should contain register location and length
> +
> +  clocks:
> +    items:
> +      - description: ipg clock
> +      - description: ocram clock
> +      - description: core clock
> +
> +  clock-names:
> +    items:
> +      - const: ipg
> +      - const: ocram
> +      - const: core
> +
> +  power-domains:
> +    description:
> +      List of phandle and PM domain specifier as documented in
> +      Documentation/devicetree/bindings/power/power_domain.txt
> +    maxItems: 4

Need a blank line here.

With those 2 fixes:

Reviewed-by: Rob Herring <robh@kernel.org>

> +  mboxes:
> +    description:
> +      List of <&phandle type channel> - 2 channels for TXDB, 2 channels for RXDB
> +      (see mailbox/fsl,mu.txt)
> +    maxItems: 4
> +
> +  mbox-names:
> +    items:
> +      - const: txdb0
> +      - const: txdb1
> +      - const: rxdb0
> +      - const: rxdb1
> +
> +  memory-region:
> +    description:
> +       phandle to a node describing reserved memory (System RAM memory)
> +       used by DSP (see bindings/reserved-memory/reserved-memory.txt)
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - mboxes
> +  - mbox-names
> +  - memory-region
> +
> +examples:
> +  - |
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +    #include <dt-bindings/clock/imx8-clock.h>
> +    dsp@596e8000 {
> +        compatbile = "fsl,imx8qxp-dsp";
> +        reg = <0x596e8000 0x88000>;
> +        clocks = <&adma_lpcg IMX_ADMA_LPCG_DSP_IPG_CLK>,
> +                 <&adma_lpcg IMX_ADMA_LPCG_OCRAM_IPG_CLK>,
> +                 <&adma_lpcg IMX_ADMA_LPCG_DSP_CORE_CLK>;
> +        clock-names = "ipg", "ocram", "core";
> +        power-domains = <&pd IMX_SC_R_MU_13A>,
> +                        <&pd IMX_SC_R_MU_13B>,
> +                        <&pd IMX_SC_R_DSP>,
> +                        <&pd IMX_SC_R_DSP_RAM>;
> +        mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
> +        mboxes = <&lsio_mu13 2 0>, <&lsio_mu13 2 1>, <&lsio_mu13 3 0>, <&lsio_mu13 3 1>;
> +    };
> --
> 2.17.1
>
