From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 3/9] dt-bindings: Add documentation for Milbeaut SoCs
Date: Wed, 20 Feb 2019 07:33:34 -0600
Message-ID: <CAL_JsqK-8iBaF92GpXdoZwBEaT_mQAjO_4URR9iPJqAiy=YW=w@mail.gmail.com>
References: <1550648622-10541-1-git-send-email-sugaya.taichi@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550648622-10541-1-git-send-email-sugaya.taichi@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sugaya Taichi <sugaya.taichi@socionext.com>
Cc: devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, soc@kernel.org, Mark Rutland <mark.rutland@arm.com>, Takao Orito <orito.takao@socionext.com>, Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Shinji Kanematsu <kanematsu.shinji@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 20, 2019 at 1:43 AM Sugaya Taichi
<sugaya.taichi@socionext.com> wrote:
>
> This adds a DT binding documentation for the M10V and its evaluation
> board.
>
> Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
> ---
>  .../bindings/arm/socionext/milbeaut.yaml           | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml
>
> diff --git a/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml b/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml
> new file mode 100644
> index 0000000..522396f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml
> @@ -0,0 +1,22 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/milbeaut.yaml#
> +$schema: http://devicetree.org/meta-schemas/milbeaut.yaml#

This line is wrong. All DT schema should be:
http://devicetree.org/meta-schemas/core.yaml#

> +
> +title: Milbeaut platforms device tree bindings
> +
> +maintainers:
> +  - Taichi Sugaya <sugaya.taichi@socionext.com>
> +  - Takao Orito <orito.takao@socionext.com>
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - socionext,milbeaut-m10v-evb
> +          - const: socionext,sc2000a
> +...
> --
> 1.9.1
>
