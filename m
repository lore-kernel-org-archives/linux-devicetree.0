From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm: fsl: Add DSP IPC binding support
Date: Wed, 26 Jun 2019 17:49:21 +0300
Message-ID: <CAEnQRZBNA4ndSL1vMStHemYkzt9TxqjgdWWjqFwnBFQ+ha+egA@mail.gmail.com>
References: <20190614081650.11880-1-daniel.baluta@nxp.com> <20190614081650.11880-3-daniel.baluta@nxp.com>
 <CAL_JsqJKgMB1PNA33gmFju4AQTc2WaSBoOGQExVaGd9LZRmk_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJKgMB1PNA33gmFju4AQTc2WaSBoOGQExVaGd9LZRmk_g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "S.j. Wang" <shengjiu.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Rob,

This is my first time documenting the bindings using the
new yaml format so thanks for your patience and explanations!

On Fri, Jun 14, 2019 at 5:53 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Fri, Jun 14, 2019 at 2:15 AM <daniel.baluta@nxp.com> wrote:
> >
> > From: Daniel Baluta <daniel.baluta@nxp.com>
> >
> > DSP IPC is the layer that allows the Host CPU to communicate
> > with DSP firmware.
> > DSP is part of some i.MX8 boards (e.g i.MX8QM, i.MX8QXP)
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  .../bindings/arm/freescale/fsl,dsp.yaml       | 43 +++++++++++++++++++
>
> bindings/dsp/...

Fair enough. Will fix in v2.

>
> >  1 file changed, 43 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,dsp.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,dsp.yaml b/Documentation/devicetree/bindings/arm/freescale/fsl,dsp.yaml
> > new file mode 100644
> > index 000000000000..16d9df1d397b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,dsp.yaml
> > @@ -0,0 +1,43 @@
> > +# SPDX-License-Identifier: GPL-2.0
>
> The preference is to dual license new bindings: GPL-2.0 OR BSD-2-Clause
>
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/freescale/fsl,dsp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP i.MX IPC DSP driver
>
> This isn't a driver.

I see. This node is actually the representation of DSP IPC so not a driver.
>
> > +
> > +maintainers:
> > +  - Daniel Baluta <daniel.baluta@nxp.com>
> > +
> > +description: |
> > +  IPC communication layer between Host CPU and DSP on NXP i.MX8 platforms
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,imx-dsp
>
> You can have a fallback, but it needs SoC specific compatible(s).
Agree. Will fix in v2.

>
> > +
> > +  mboxes:
> > +    description:
> > +      List of phandle of 2 MU channels for TXDB, 2 MU channels for RXDB
> > +      (see mailbox/fsl,mu.txt)
> > +    maxItems: 1
>
> Should be 4?

Actually is just a list with 1 item. I think is the terminology:

You can have an example here of the mboxes defined for SCU.
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/freescale/imx8qxp.dtsi#L123


>
> > +
> > +  mbox-names
> > +    description:
> > +      Mailboxes names
> > +    allOf:
> > +      - $ref: "/schemas/types.yaml#/definitions/string"
>
> No need for this, '*-names' already has a defined type.
So, should I remove the above two lines ?
>
> > +      - enum: [ "txdb0", "txdb1", "rxdb0", "rxdb1" ]
>
> Should be an 'items' list with 4 entries?

Let me better read the yaml spec. But "items" list indeed sounds better.

>
> > +required:
> > +  - compatible
> > +  - mboxes
> > +  - mbox-names
>
> This seems incomplete. How does one boot the DSP? Load firmware? No
> resources that Linux has to manage. Shared memory?

This is only the IPC mailboxes used by DSP to communicate with Linux. The
loading of the firmware, the resources needed to be managed by Linux, etc
are part of the DSP node.

To avoid confusion I have renamed this node from dsp to dsp_ipc.

>
> > +
> > +examples:
> > +  - |
> > +    dsp {
> > +      compatbile = "fsl,imx-dsp";
> > +      mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
> > +      mboxes = <&lsio_mu13 2 0 &lsio_mu13 2 1 &lsio_mu13 3 0 &lsio_mu13 3 1>;
>
> mboxes = <&lsio_mu13 2 0>, <&lsio_mu13 2 1>, <&lsio_mu13 3 0>, <&lsio_mu13 3 1>;

Actually no! It looks like the imx mailbox expects one element with a
list of phandles directions and index.

See again, how SCU uses the mailbox node.

https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/freescale/imx8qxp.dtsi#L123

>
> > +    };
> > --
> > 2.17.1
> >
