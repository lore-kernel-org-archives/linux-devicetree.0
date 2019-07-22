From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: soc: qcom: add On Chip MEMory
 (OCMEM) bindings
Date: Mon, 22 Jul 2019 11:35:14 -0600
Message-ID: <20190722173514.GA11931@bogus>
References: <20190626022148.23712-1-masneyb@onstation.org>
 <20190626022148.23712-2-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190626022148.23712-2-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: agross@kernel.org, robdclark@gmail.com, sean@poorly.run, bjorn.andersson@linaro.org, airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com, jonathan@marek.ca, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, jcrouse@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 25, 2019 at 10:21:43PM -0400, Brian Masney wrote:
> Add device tree bindings for the On Chip Memory (OCMEM) that is present
> on some Qualcomm Snapdragon SoCs.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Changes since v2:
> - Add *-sram node and gmu-sram to example.
> 
> Changes since v1:
> - Rename qcom,ocmem-msm8974 to qcom,msm8974-ocmem
> - Renamed reg-names to ctrl and mem
> - update hardware description
> - moved from soc to sram namespace in the device tree bindings
> 
>  .../bindings/sram/qcom/qcom,ocmem.yaml        | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sram/qcom/qcom,ocmem.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sram/qcom/qcom,ocmem.yaml b/Documentation/devicetree/bindings/sram/qcom/qcom,ocmem.yaml
> new file mode 100644
> index 000000000000..a0bf0af4860a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sram/qcom/qcom,ocmem.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sram/qcom/qcom,ocmem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: On Chip Memory (OCMEM) that is present on some Qualcomm Snapdragon SoCs.
> +
> +maintainers:
> +  - Brian Masney <masneyb@onstation.org>
> +
> +description: |
> +  The On Chip Memory (OCMEM) is typically used by the GPU, camera/video, and
> +  audio components on some Snapdragon SoCs.
> +
> +properties:
> +  compatible:
> +    const: qcom,msm8974-ocmem
> +
> +  reg:
> +    items:
> +      - description: Control registers
> +      - description: OCMEM address range
> +
> +  reg-names:
> +    items:
> +      - const: ctrl
> +      - const: mem
> +
> +  clocks:
> +    items:
> +      - description: Core clock
> +      - description: Interface clock
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: iface
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +
> +patternProperties:
> +  "^.+-sram$":
> +    type: object
> +    description: |

You don't need this to be a literal block (i.e. drop the '|').

> +      A region of reserved memory.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +
> +examples:
> +  - |
> +      #include <dt-bindings/clock/qcom,rpmcc.h>
> +      #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
> +
> +      ocmem: ocmem@fdd00000 {
> +        compatible = "qcom,msm8974-ocmem";
> +
> +        reg = <0xfdd00000 0x2000>,
> +              <0xfec00000 0x180000>;
> +        reg-names = "ctrl",
> +                    "mem";
> +
> +        clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
> +                 <&mmcc OCMEMCX_OCMEMNOC_CLK>;
> +        clock-names = "core",
> +                      "iface";
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        gmu-sram@0 {
> +                reg = <0x0 0x100000>;

This is at 0xfec00000? If so you should have a 'ranges' to translate 0 
to that.

Rob
