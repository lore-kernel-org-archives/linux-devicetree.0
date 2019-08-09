From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: display/bridge: Add binding for NWL
 mipi dsi host controller
Date: Fri, 9 Aug 2019 14:41:03 -0600
Message-ID: <CAL_JsqK-5=WMZgNuJDTJ3Dm3YOJNw_9QCrPOOSe7MQzMV26pHw@mail.gmail.com>
References: <cover.1565367567.git.agx@sigxcpu.org> <9c906bb6592424acdb1a67447a482e010a113b49.1565367567.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9c906bb6592424acdb1a67447a482e010a113b49.1565367567.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>, Lee Jones <lee.jones@linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 9, 2019 at 10:24 AM Guido G=C3=BCnther <agx@sigxcpu.org> wrote:
>
> The Northwest Logic MIPI DSI IP core can be found in NXPs i.MX8 SoCs.
>
> Signed-off-by: Guido G=C3=BCnther <agx@sigxcpu.org>
> ---
>  .../bindings/display/bridge/nwl-dsi.yaml      | 155 ++++++++++++++++++
>  1 file changed, 155 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/nwl-=
dsi.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yam=
l b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> new file mode 100644
> index 000000000000..5ed8bc4a4d18
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> @@ -0,0 +1,155 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/imx-nwl-dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Northwest Logic MIPI-DSI on imx SoCs
> +
> +maintainers:
> +  - Guido G=C3=BAnther <agx@sigxcpu.org>
> +  - Robert Chiras <robert.chiras@nxp.com>
> +
> +description: |
> +  NWL MIPI-DSI host controller found on i.MX8 platforms. This is a dsi b=
ridge for
> +  the SOCs NWL MIPI-DSI host controller.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +        - const: fsl,imx8mq-nwl-dsi

Don't need oneOf nor items here for a single possible value:

compatible:
  const: fsl,imx8mq-nwl-dsi

Or go ahead and add other compatibles because the 'if' below seems to
indicate you'll have more.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: DSI core clock
> +      - description: RX_ESC clock (used in escape mode)
> +      - description: TX_ESC clock (used in escape mode)
> +      - description: PHY_REF clock
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: rx_esc
> +      - const: tx_esc
> +      - const: phy_ref
> +
> +  phys:
> +    maxItems: 1
> +    description:
> +      A phandle to the phy module representing the DPHY
> +
> +  phy-names:
> +    items:
> +      - const: dphy
> +
> +  power-domains:
> +    maxItems: 1
> +    description:
> +      A phandle to the power domain
> +
> +  resets:
> +    maxItems: 4
> +    description:
> +      A phandle to the reset controller

Sounds like 4 phandles... This should look similar to 'clocks'.

> +
> +  reset-names:
> +    items:
> +      - const: byte
> +      - const: dpi
> +      - const: esc
> +      - const: pclk
> +
> +  mux-sel:

Needs a vendor prefix and will need a $ref to the type.

> +    maxItems: 1
> +    description:
> +      A phandle to the MUX register set
> +
> +  port:
> +    type: object
> +    description:
> +      A input put or output port node.
> +
> +  ports:
> +    type: object
> +    description:
> +      A node containing DSI input & output port nodes with endpoint
> +      definitions as documented in
> +      Documentation/devicetree/bindings/graph.txt.

You need to define what port@0 and port@1 are.

> +
> +patternProperties:
> +  "^panel@[0-9]+$": true
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8mq-nwl-dsi

This conditional isn't needed until you have more than one compatible.

> +      required:
> +        - resets
> +        - reset-names
> +        - mux-sel
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - phys
> +  - phy-names

ports should be required.

> +
> +examples:
> + - |
> +
> +   mipi_dsi: mipi_dsi@30a00000 {
> +              #address-cells =3D <1>;
> +              #size-cells =3D <0>;
> +              compatible =3D "fsl,imx8mq-nwl-dsi";
> +              reg =3D <0x30A00000 0x300>;
> +              clocks =3D <&clk 163>, <&clk 244>, <&clk 245>, <&clk 164>;
> +              clock-names =3D "core", "rx_esc", "tx_esc", "phy_ref";
> +              interrupts =3D <0 34 4>;
> +              power-domains =3D <&pgc_mipi>;
> +              resets =3D <&src 0>, <&src 1>, <&src 2>, <&src 3>;
> +              reset-names =3D "byte", "dpi", "esc", "pclk";
> +              mux-sel =3D <&iomuxc_gpr>;
> +              phys =3D <&dphy>;
> +              phy-names =3D "dphy";
> +
> +              panel@0 {
> +                      compatible =3D "...";

Needs to be a valid compatible. Also need 'reg' here or drop the unit-addre=
ss.


> +                      port@0 {
> +                           panel_in: endpoint {
> +                                     remote-endpoint =3D <&mipi_dsi_out>=
;
> +                           };
> +                      };
> +              };
> +
> +              ports {
> +                    #address-cells =3D <1>;
> +                    #size-cells =3D <0>;
> +
> +                    port@0 {
> +                           reg =3D <0>;
> +                           mipi_dsi_in: endpoint {
> +                                        remote-endpoint =3D <&lcdif_mipi=
_dsi>;
> +                           };
> +                    };
> +                    port@1 {
> +                           reg =3D <1>;
> +                           mipi_dsi_out: endpoint {
> +                                         remote-endpoint =3D <&panel_in>=
;
> +                           };
> +                    };
> +              };
> +      };
> --
> 2.20.1
>
