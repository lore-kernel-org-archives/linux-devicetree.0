From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: power: add Amlogic secure power domains
 bindings
Date: Tue, 01 Oct 2019 17:09:09 -0500
Message-ID: <5d93ce88.1c69fb81.aec64.6b1b@mx.google.com>
References: <1568895064-4116-1-git-send-email-jianxin.pan@amlogic.com>
 <1568895064-4116-2-git-send-email-jianxin.pan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1568895064-4116-2-git-send-email-jianxin.pan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jianxin Pan <jianxin.pan@amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, Zhiqiang Liang <zhiqiang.liang@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 19, 2019 at 08:11:02AM -0400, Jianxin Pan wrote:
> Add the bindings for the Amlogic Secure power domains, controlling the
> secure power domains.
> 
> The bindings targets the Amlogic A1 and C1 compatible SoCs, in which the
> power domain registers are in secure world.
> 
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> Signed-off-by: Zhiqiang Liang <zhiqiang.liang@amlogic.com>
> ---
>  .../bindings/power/amlogic,meson-sec-pwrc.yaml     | 32 ++++++++++++++++++++++
>  include/dt-bindings/power/meson-a1-power.h         | 32 ++++++++++++++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
>  create mode 100644 include/dt-bindings/power/meson-a1-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> new file mode 100644
> index 00000000..327e0d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +# Copyright (c) 2019 Amlogic, Inc
> +# Author: Jianxin Pan <jianxin.pan@amlogic.com>
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/power/amlogic,meson-sec-pwrc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson Secure Power Domains
> +
> +maintainers:
> +  - Jianxin Pan <jianxin.pan@amlogic.com>
> +
> +description: |+
> +  A1/C1 series The Secure Power Domains node should be the child of a syscon
> +  node with the required property.

'a syscon node' is not specific enough. It must be a specific node.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-a1-pwrc
> +
> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    pwrc: power-controller {
> +          compatible = "amlogic,meson-a1-pwrc";

But why do you need this node? It has no resources.

#power-domain-cells needed?

> +    };
> +
> +
> diff --git a/include/dt-bindings/power/meson-a1-power.h b/include/dt-bindings/power/meson-a1-power.h
> new file mode 100644
> index 00000000..6cf50bf
> --- /dev/null
> +++ b/include/dt-bindings/power/meson-a1-power.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
> +/*
> + * Copyright (c) 2019 Amlogic, Inc.
> + * Author: Jianxin Pan <jianxin.pan@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_MESON_A1_POWER_H
> +#define _DT_BINDINGS_MESON_A1_POWER_H
> +
> +#define PWRC_DSPA_ID	8
> +#define PWRC_DSPB_ID	9
> +#define PWRC_UART_ID	10
> +#define PWRC_DMC_ID	11
> +#define PWRC_I2C_ID	12
> +#define PWRC_PSRAM_ID	13
> +#define PWRC_ACODEC_ID	14
> +#define PWRC_AUDIO_ID	15
> +#define PWRC_OTP_ID	16
> +#define PWRC_DMA_ID	17
> +#define PWRC_SD_EMMC_ID	18
> +#define PWRC_RAMA_ID	19
> +#define PWRC_RAMB_ID	20
> +#define PWRC_IR_ID	21
> +#define PWRC_SPICC_ID	22
> +#define PWRC_SPIFC_ID	23
> +#define PWRC_USB_ID	24
> +#define PWRC_NIC_ID	25
> +#define PWRC_PDMIN_ID	26
> +#define PWRC_RSA_ID	27
> +#define PWRC_MAX_ID	28
> +
> +#endif
> -- 
> 2.7.4
> 
