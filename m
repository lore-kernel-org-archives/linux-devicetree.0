From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: imx: add imx8mq nitrogen support
Date: Thu, 25 Jul 2019 11:11:17 -0300
Message-ID: <CAOMZO5BWarNdbCc5eVW7TTO9ahkG5wMwX_3XXKkngzKcjk+mpg@mail.gmail.com>
References: <20190725121452.16607-1-dafna.hirschfeld@collabora.com> <20190725121452.16607-2-dafna.hirschfeld@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725121452.16607-2-dafna.hirschfeld@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com, Gary Bisson <gary.bisson@boundarydevices.com>, Troy Kisky <troy.kisky@boundarydevices.com>
List-Id: devicetree@vger.kernel.org

Hi Dafna,

On Thu, Jul 25, 2019 at 10:56 AM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> From: Gary Bisson <gary.bisson@boundarydevices.com>
>
> i.MX 8Quad is a quad (4x) Cortex-A53 processor with powerful
> graphic and multimedia features.
> This patch adds Nitrogen8M board support.
>
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> Signed-off-by: Troy Kisky <troy.kisky@boundarydevices.com>
> [Dafna: porting vendor's code to mainline]
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 7294ac36f4c0..728c41ef83bb 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -227,6 +227,12 @@ properties:
>                - fsl,imx8qxp-mek           # i.MX8QXP MEK Board
>            - const: fsl,imx8qxp
>
> +      - description: i.MX8MQ based Boards

This line is already present in latest code as we already have some
i.MX8MQ boards listed.

Please rebase it against linux-next.
