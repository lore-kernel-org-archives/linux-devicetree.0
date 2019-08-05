From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/6] dt-bindings: soc: qcom: add On Chip MEMory (OCMEM) bindings
Date: Mon, 5 Aug 2019 09:10:16 -0600
Message-ID: <CAL_JsqK1Xerw+319yDE6=9jmrrqQ0+DAu_nj10EX_Lj=bTJ2hw@mail.gmail.com>
References: <20190803142026.9647-1-masneyb@onstation.org> <20190803142026.9647-2-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190803142026.9647-2-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Andy Gross <agross@kernel.org>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Jonathan Marek <jonathan@marek.ca>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, freedreno <freedreno@lists.freedesktop.org>, devicetree@vger.kernel.org, Jordan Crouse <jcrouse@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 3, 2019 at 8:20 AM Brian Masney <masneyb@onstation.org> wrote:
>
> Add device tree bindings for the On Chip Memory (OCMEM) that is present
> on some Qualcomm Snapdragon SoCs.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Changes since v3
> - add ranges property
> - remove unnecessary literal block |
> - add #address-cells and #size-cells to binding
> - rename path devicetree/bindings/sram/qcom/ to devicetree/bindings/sram/ since
>   this is the only qcom binding in the sram namespace. That was a holdover from
>   when I originally put this in the soc namespace.
>
> Changes since v2:
> - Add *-sram node and gmu-sram to example.
>
> Changes since v1:
> - Rename qcom,ocmem-msm8974 to qcom,msm8974-ocmem
> - Renamed reg-names to ctrl and mem
> - update hardware description
> - moved from soc to sram namespace in the device tree bindings
>
>  .../devicetree/bindings/sram/qcom,ocmem.yaml  | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
>
> diff --git a/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml b/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
> new file mode 100644
> index 000000000000..1bb386fffa01
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sram/qcom/qcom,ocmem.yaml#

Need to update the path here too.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
