From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v6 2/7] dt-bindings: display: msm: gmu: add optional ocmem property
Date: Thu, 22 Aug 2019 11:07:39 -0500
Message-ID: <CAL_JsqLcrO9XH9_BgZYYfrFJUfXAnEK6ZkOUtAzv15Zug0QEpw@mail.gmail.com>
References: <20190822143703.13030-1-masneyb@onstation.org> <20190822143703.13030-3-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822143703.13030-3-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Andy Gross <agross@kernel.org>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Jonathan Marek <jonathan@marek.ca>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, freedreno <freedreno@lists.freedesktop.org>, devicetree@vger.kernel.org, Jordan Crouse <jcrouse@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 22, 2019 at 9:37 AM Brian Masney <masneyb@onstation.org> wrote:
>
> Some A3xx and A4xx Adreno GPUs do not have GMEM inside the GPU core and
> must use the On Chip MEMory (OCMEM) in order to be functional. Add the
> optional ocmem property to the Adreno Graphics Management Unit bindings.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Changes since v5:
> - rename ocmem property to sram to match what TI currently has.
>
> Changes since v4:
> - None
>
> Changes since v3:
> - correct link to qcom,ocmem.yaml
>
> Changes since v2:
> - Add a3xx example with OCMEM
>
> Changes since v1:
> - None
>
>  .../devicetree/bindings/display/msm/gmu.txt   | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
> index 90af5b0a56a9..2305a2aede5a 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.txt
> @@ -31,6 +31,10 @@ Required properties:
>  - iommus: phandle to the adreno iommu
>  - operating-points-v2: phandle to the OPP operating points
>
> +Optional properties:
> +- sram: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
> +        SoCs. See Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
> +
>  Example:
>
>  / {
> @@ -63,3 +67,49 @@ Example:
>                 operating-points-v2 = <&gmu_opp_table>;
>         };
>  };
> +
> +a3xx example with OCMEM support:
> +
> +/ {
> +       ...
> +
> +       gpu: adreno@fdb00000 {
> +               compatible = "qcom,adreno-330.2",
> +                            "qcom,adreno";
> +               reg = <0xfdb00000 0x10000>;
> +               reg-names = "kgsl_3d0_reg_memory";
> +               interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupt-names = "kgsl_3d0_irq";
> +               clock-names = "core",
> +                             "iface",
> +                             "mem_iface";
> +               clocks = <&mmcc OXILI_GFX3D_CLK>,
> +                        <&mmcc OXILICX_AHB_CLK>,
> +                        <&mmcc OXILICX_AXI_CLK>;
> +               sram = <&ocmem>;

Shouldn't this point to gmu-sram@0? You can always get the parent from
the child which is a bit easier than the other way around.

> +               power-domains = <&mmcc OXILICX_GDSC>;
> +               operating-points-v2 = <&gpu_opp_table>;
> +               iommus = <&gpu_iommu 0>;
> +       };
> +
> +       ocmem: ocmem@fdd00000 {
> +               compatible = "qcom,msm8974-ocmem";
> +
> +               reg = <0xfdd00000 0x2000>,
> +                     <0xfec00000 0x180000>;
> +               reg-names = "ctrl",
> +                            "mem";
> +
> +               clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
> +                        <&mmcc OCMEMCX_OCMEMNOC_CLK>;
> +               clock-names = "core",
> +                             "iface";
> +
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +
> +               gmu-sram@0 {
> +                       reg = <0x0 0x100000>;
> +               };
> +       };
> +};
> --
> 2.21.0
>
