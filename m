From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: Add OSM L3 DT bindings
Date: Tue, 27 Aug 2019 12:18:32 -0500
Message-ID: <CAL_JsqJ8h7fH_pnQp7OYpNXJexG_wvDvv5SNEEyxcrpXzJc_Jw@mail.gmail.com>
References: <20190821091132.14994-1-sibis@codeaurora.org> <20190821091132.14994-2-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821091132.14994-2-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Evan Green <evgreen@chromium.org>, daidavid1@codeaurora.org, Saravana Kannan <saravanak@google.com>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 21, 2019 at 4:11 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add bindings for Operating State Manager (OSM) L3 interconnect provider
> on SDM845 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../bindings/interconnect/qcom,osm-l3.yaml    | 56 +++++++++++++++++++
>  .../dt-bindings/interconnect/qcom,osm-l3.h    | 12 ++++
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
>  create mode 100644 include/dt-bindings/interconnect/qcom,osm-l3.h
>
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> new file mode 100644
> index 0000000000000..dab2b6875ab27
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: BSD-2-Clause

(GPL-2.0-only OR BSD-2-Clause) for new bindings please.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interconnect/qcom,osm-l3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Operating State Manager (OSM) L3 Interconnect Provider
> +
> +maintainers:
> +  - Sibi Sankar <sibis@codeaurora.org>
> +
> +description:
> +  L3 cache bandwidth requirements on Qualcomm SoCs is serviced by the OSM.
> +  The OSM L3 interconnect provider aggregates the L3 bandwidth requests
> +  from CPU/GPU and relays it to the OSM.
> +
> +properties:
> +  compatible:
> +    const: "qcom,sdm845-osm-l3"
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: xo clock
> +      - description: alternate clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: alternate
> +
> +  '#interconnect-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#interconnect-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    osm_l3: interconnect@17d41000 {
> +      compatible = "qcom,sdm845-osm-l3";
> +      reg = <0x17d41000 0x1400>;
> +
> +      clocks = <&rpmhcc 0>, <&gcc 165>;
> +      clock-names = "xo", "alternate";
> +
> +      #interconnect-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/interconnect/qcom,osm-l3.h b/include/dt-bindings/interconnect/qcom,osm-l3.h
> new file mode 100644
> index 0000000000000..54858ff7674d7
> --- /dev/null
> +++ b/include/dt-bindings/interconnect/qcom,osm-l3.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_OSM_L3_H
> +#define __DT_BINDINGS_INTERCONNECT_QCOM_OSM_L3_H
> +
> +#define MASTER_OSM_L3_APPS     0
> +#define SLAVE_OSM_L3           1
> +
> +#endif
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
