From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: reset: add bindings for the Meson-A1 SoC Reset Controller
Date: Wed, 25 Sep 2019 15:55:05 -0700
Message-ID: <7htv90rnp2.fsf@baylibre.com>
References: <1569227661-4261-1-git-send-email-xingyu.chen@amlogic.com> <1569227661-4261-3-git-send-email-xingyu.chen@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569227661-4261-3-git-send-email-xingyu.chen@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Xingyu Chen <xingyu.chen@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Hanjie Lin <hanjie.lin@amlogic.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Xingyu Chen <xingyu.chen@amlogic.com> writes:

> Add DT bindings for the Meson-A1 SoC Reset Controller include file,
> and also slightly update documentation.
>
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>

The order here doesn't look right.  As the sender, your sign-off should
be last.  Is Jianxin the author or are you?  If Jianxin, there should be
a "From:" line at the beginning of the changelog to indicate authorship
that's different from the sender.

> ---
>  .../bindings/reset/amlogic,meson-reset.yaml        |  1 +
>  include/dt-bindings/reset/amlogic,meson-a1-reset.h | 59 ++++++++++++++++++++++
>  2 files changed, 60 insertions(+)
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-reset.h
>
> diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> index 00917d8..b3f57d8 100644
> --- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> @@ -16,6 +16,7 @@ properties:
>        - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
>        - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
>        - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
> +      - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
>  
>    reg:
>      maxItems: 1
> diff --git a/include/dt-bindings/reset/amlogic,meson-a1-reset.h b/include/dt-bindings/reset/amlogic,meson-a1-reset.h
> new file mode 100644
> index 00000000..8d76a47
> --- /dev/null
> +++ b/include/dt-bindings/reset/amlogic,meson-a1-reset.h
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> + *
> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> + * Author: Xingyu Chen <xingyu.chen@amlogic.com>
> + *
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_MESON_A1_RESET_H
> +#define _DT_BINDINGS_AMLOGIC_MESON_A1_RESET_H
> +
> +/* RESET0 */
> +#define RESET_AM2AXI_VAD		1

minor nit: can you use comments/whitespace here to indicate holes?
Please see the other amlogic files in this dir for examples.

Kevin
