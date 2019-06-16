From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/6] dt-bindings: soc: qcom: add On Chip MEMory (OCMEM)
 bindings
Date: Sun, 16 Jun 2019 10:43:41 -0700
Message-ID: <20190616174341.GP22737@tuxbook-pro>
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-2-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190616132930.6942-2-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org, airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com, jonathan@marek.ca, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun 16 Jun 06:29 PDT 2019, Brian Masney wrote:

> Add device tree bindings for the On Chip Memory (OCMEM) that is present
> on some Qualcomm Snapdragon SoCs.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  .../bindings/soc/qcom/qcom,ocmem.yaml         | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml
> new file mode 100644
> index 000000000000..5e3ae6311a16
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom,ocmem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: On Chip Memory (OCMEM) that is present on some Qualcomm Snapdragon SoCs.
> +
> +maintainers:
> +  - Brian Masney <masneyb@onstation.org>
> +
> +description: |
> +  The On Chip Memory (OCMEM) allocator allows various clients to allocate memory
> +  from OCMEM based on performance, latency and power requirements. This is
> +  typically used by the GPU, camera/video, and audio components on some
> +  Snapdragon SoCs.
> +
> +properties:
> +  compatible:
> +    const: qcom,ocmem-msm8974

qcom,msm8974-ocmem

> +
> +  reg:
> +    items:
> +      - description: Control registers
> +      - description: OCMEM address range
> +
> +  reg-names:
> +    items:
> +      - const: ocmem_ctrl_physical
> +      - const: ocmem_physical

Drop the "_physical" part, it's given by this being "reg".

Regards,
Bjorn

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
> +examples:
> +  - |
> +      #include <dt-bindings/clock/qcom,rpmcc.h>
> +      #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
> +
> +      ocmem: ocmem@fdd00000 {
> +        compatible = "qcom,ocmem-msm8974";
> +
> +        reg = <0xfdd00000 0x2000>,
> +               <0xfec00000 0x180000>;
> +        reg-names = "ocmem_ctrl_physical",
> +                    "ocmem_physical";
> +
> +        clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
> +                  <&mmcc OCMEMCX_OCMEMNOC_CLK>;
> +        clock-names = "core",
> +                      "iface";
> +      };
> -- 
> 2.20.1
> 
