From: Ben Whitten <benwhitten@gmail.com>
Subject: Re: [PATCH v3 lora-next 2/4] dt-bindings: lora: sx125x: add basic documentation
Date: Thu, 24 Jan 2019 15:03:42 +0000
Message-ID: <CAF3==isTrF7cT5ZNL7CetprgHLN50Zyh2t1ViP6XyBSFtQ_LUA@mail.gmail.com>
References: <20190124145309.21698-1-ben.whitten@lairdtech.com> <20190124145309.21698-3-ben.whitten@lairdtech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190124145309.21698-3-ben.whitten@lairdtech.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-lpwan@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Missed linux-lpwan

On Thu, 24 Jan 2019 at 14:53, Ben Whitten <ben.whitten@gmail.com> wrote:
>
> From: Ben Whitten <ben.whitten@gmail.com>
>
> The SX125x family are IQ radio transceivers from Semtech configured over
> SPI, they are typically connected to an SX130x series concentrator howeve=
r
> may be connected to a host directly.
>
> Required properties include the radio number of the host or concentrator
> bus.
>
> Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
> ---
> v2 -> v3:
> * Renamed example node name to be consistent with concentrator
> v1 -> v2:
> * Dropped spi-max-frequency binding
> * Wording changes to commit and descriptions
> * Added spi wrapper suggested by Rob H
> * Dual licence
> ---
>  .../bindings/net/lora/semtech,sx125x.yaml     | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/lora/semtech,sx=
125x.yaml
>
> diff --git a/Documentation/devicetree/bindings/net/lora/semtech,sx125x.ya=
ml b/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
> new file mode 100644
> index 000000000000..fe2d2a23c28b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/lora/semtech,sx125x.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/lora/semtech,sx125x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Semtech IQ modulator/de-modulator transeiver
> +
> +maintainers:
> +  - Andreas F=C3=A4rber <afaerber@suse.de>
> +  - Ben Whitten <ben.whitten@gmail.com>
> +
> +description: |
> +  The SX125x family are transceivers capable of supporting multiple cons=
tant
> +  and non-constant envelope modulation schemes.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - semtech,sx1255
> +        - semtech,sx1257
> +        - semtech,sx1258
> +
> +  reg:
> +    maxItems: 1
> +    description: The chip select on the SPI bus or radio number in conce=
ntrator
> +      , with radio A =3D 0 and radio B =3D 1.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    spi {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      radio0: radio@0 {
> +        compatible =3D "semtech,sx1257";
> +        reg =3D <0>;
> +      };
> +    };
> --
> 2.17.1
>
