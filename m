From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: arm: fsl: Add DSP IPC binding support
Date: Fri, 14 Jun 2019 08:52:51 -0600
Message-ID: <CAL_JsqJKgMB1PNA33gmFju4AQTc2WaSBoOGQExVaGd9LZRmk_g@mail.gmail.com>
References: <20190614081650.11880-1-daniel.baluta@nxp.com> <20190614081650.11880-3-daniel.baluta@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614081650.11880-3-daniel.baluta@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "S.j. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@gmail.com>, Anson Huang <anson.huang@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 14, 2019 at 2:15 AM <daniel.baluta@nxp.com> wrote:
>
> From: Daniel Baluta <daniel.baluta@nxp.com>
>
> DSP IPC is the layer that allows the Host CPU to communicate
> with DSP firmware.
> DSP is part of some i.MX8 boards (e.g i.MX8QM, i.MX8QXP)
>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  .../bindings/arm/freescale/fsl,dsp.yaml       | 43 +++++++++++++++++++

bindings/dsp/...

>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,dsp.yaml
>
> diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,dsp.yaml b/Documentation/devicetree/bindings/arm/freescale/fsl,dsp.yaml
> new file mode 100644
> index 000000000000..16d9df1d397b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,dsp.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: GPL-2.0

The preference is to dual license new bindings: GPL-2.0 OR BSD-2-Clause

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/freescale/fsl,dsp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX IPC DSP driver

This isn't a driver.

> +
> +maintainers:
> +  - Daniel Baluta <daniel.baluta@nxp.com>
> +
> +description: |
> +  IPC communication layer between Host CPU and DSP on NXP i.MX8 platforms
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx-dsp

You can have a fallback, but it needs SoC specific compatible(s).

> +
> +  mboxes:
> +    description:
> +      List of phandle of 2 MU channels for TXDB, 2 MU channels for RXDB
> +      (see mailbox/fsl,mu.txt)
> +    maxItems: 1

Should be 4?

> +
> +  mbox-names
> +    description:
> +      Mailboxes names
> +    allOf:
> +      - $ref: "/schemas/types.yaml#/definitions/string"

No need for this, '*-names' already has a defined type.

> +      - enum: [ "txdb0", "txdb1", "rxdb0", "rxdb1" ]

Should be an 'items' list with 4 entries?

> +required:
> +  - compatible
> +  - mboxes
> +  - mbox-names

This seems incomplete. How does one boot the DSP? Load firmware? No
resources that Linux has to manage. Shared memory?

> +
> +examples:
> +  - |
> +    dsp {
> +      compatbile = "fsl,imx-dsp";
> +      mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
> +      mboxes = <&lsio_mu13 2 0 &lsio_mu13 2 1 &lsio_mu13 3 0 &lsio_mu13 3 1>;

mboxes = <&lsio_mu13 2 0>, <&lsio_mu13 2 1>, <&lsio_mu13 3 0>, <&lsio_mu13 3 1>;

> +    };
> --
> 2.17.1
>
