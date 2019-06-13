From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: Add YAML schemas for the generic
 NVMEM bindings
Date: Thu, 13 Jun 2019 10:27:24 -0600
Message-ID: <CAL_JsqJWGxf+gSZtXpDDjL0Na5hzpPe+rY6f7NLQYD5NHU=FYQ@mail.gmail.com>
References: <20190613132012.14202-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190613132012.14202-1-maxime.ripard@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 13, 2019 at 7:26 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The nvmem providers and consumers have a bunch of generic properties that
> are needed in a device tree. Add a YAML schemas for those.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../bindings/nvmem/nvmem-consumer.yaml        | 45 +++++++++
>  .../devicetree/bindings/nvmem/nvmem.txt       | 81 +---------------
>  .../devicetree/bindings/nvmem/nvmem.yaml      | 93 +++++++++++++++++++
>  3 files changed, 139 insertions(+), 80 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml
>  create mode 100644 Documentation/devicetree/bindings/nvmem/nvmem.yaml
>
> diff --git a/Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml b/Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml
> new file mode 100644
> index 000000000000..c48b74733b68
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: GPL-2.0

Looks like Srinivas is the sole author of nvmem.txt. Srinivas, okay if
we license this dual GPL2/BSD-2-Clause? Really, that's a decision for
Linaro.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/nvmem-consumer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVMEM (Non Volatile Memory) Consumer Device Tree Bindings
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +select: true
> +
> +properties:
> +  nvmem:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      List of phandle to the nvmem providers.
> +
> +  nvmem-cells:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      List of phandle to the nvmem data cells.
> +
> +  nvmem-names:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    description:
> +      Names for the each nvmem provider.
> +
> +  nvmem-cell-names:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    description:
> +      Names for each nvmem-cells specified.
> +
> +dependencies:
> +  nvmem-names: [ nvmem ]
> +  nvmem-cell-names: [ nvmem-cells ]
> +
> +examples:
> +  - |
> +    tsens {
> +        /* ... */
> +        nvmem-cells = <&tsens_calibration>;
> +        nvmem-cell-names = "calibration";
> +    };
> diff --git a/Documentation/devicetree/bindings/nvmem/nvmem.txt b/Documentation/devicetree/bindings/nvmem/nvmem.txt
> index fd06c09b822b..46a7ef485e24 100644
> --- a/Documentation/devicetree/bindings/nvmem/nvmem.txt
> +++ b/Documentation/devicetree/bindings/nvmem/nvmem.txt
> @@ -1,80 +1 @@
> -= NVMEM(Non Volatile Memory) Data Device Tree Bindings =
> -
> -This binding is intended to represent the location of hardware
> -configuration data stored in NVMEMs like eeprom, efuses and so on.
> -
> -On a significant proportion of boards, the manufacturer has stored
> -some data on NVMEM, for the OS to be able to retrieve these information
> -and act upon it. Obviously, the OS has to know about where to retrieve
> -these data from, and where they are stored on the storage device.
> -
> -This document is here to document this.
> -
> -= Data providers =
> -Contains bindings specific to provider drivers and data cells as children
> -of this node.
> -
> -Optional properties:
> - read-only: Mark the provider as read only.
> -
> -= Data cells =
> -These are the child nodes of the provider which contain data cell
> -information like offset and size in nvmem provider.
> -
> -Required properties:
> -reg:   specifies the offset in byte within the storage device.
> -
> -Optional properties:
> -
> -bits:  Is pair of bit location and number of bits, which specifies offset
> -       in bit and number of bits within the address range specified by reg property.
> -       Offset takes values from 0-7.
> -
> -For example:
> -
> -       /* Provider */
> -       qfprom: qfprom@700000 {
> -               ...
> -
> -               /* Data cells */
> -               tsens_calibration: calib@404 {
> -                       reg = <0x404 0x10>;
> -               };
> -
> -               tsens_calibration_bckp: calib_bckp@504 {
> -                       reg = <0x504 0x11>;
> -                       bits = <6 128>
> -               };
> -
> -               pvs_version: pvs-version@6 {
> -                       reg = <0x6 0x2>
> -                       bits = <7 2>
> -               };
> -
> -               speed_bin: speed-bin@c{
> -                       reg = <0xc 0x1>;
> -                       bits = <2 3>;
> -
> -               };
> -               ...
> -       };
> -
> -= Data consumers =
> -Are device nodes which consume nvmem data cells/providers.
> -
> -Required-properties:
> -nvmem-cells: list of phandle to the nvmem data cells.
> -nvmem-cell-names: names for the each nvmem-cells specified. Required if
> -       nvmem-cells is used.
> -
> -Optional-properties:
> -nvmem  : list of phandles to nvmem providers.
> -nvmem-names: names for the each nvmem provider. required if nvmem is used.
> -
> -For example:
> -
> -       tsens {
> -               ...
> -               nvmem-cells = <&tsens_calibration>;
> -               nvmem-cell-names = "calibration";
> -       };
> +This file has been moved to nvmem.yaml and nvmem-consumer.yaml.
> diff --git a/Documentation/devicetree/bindings/nvmem/nvmem.yaml b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
> new file mode 100644
> index 000000000000..65ef2dbbb2a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/nvmem.yaml
> @@ -0,0 +1,93 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/nvmem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVMEM (Non Volatile Memory) Device Tree Bindings
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description: |
> +  This binding is intended to represent the location of hardware
> +  configuration data stored in NVMEMs like eeprom, efuses and so on.
> +
> +  On a significant proportion of boards, the manufacturer has stored
> +  some data on NVMEM, for the OS to be able to retrieve these
> +  information and act upon it. Obviously, the OS has to know about
> +  where to retrieve these data from, and where they are stored on the
> +  storage device.
> +
> +properties:
> +  $nodename:
> +    pattern: "^(eeprom|efuse|nvram)(@.*|-[0-9a-f])*$"
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  read-only:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Mark the provider as read only.
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    type: object
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description:
> +          Offset and size in bytes within the storage device.
> +
> +      bits:
> +        maxItems: 1
> +        items:
> +          items:
> +            - minimum: 0
> +              maximum: 7
> +              description:
> +                Offset in bit within the address range specified by reg.
> +            - minimum: 1
> +              description:
> +                Size in bit within the address range specified by reg.
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +examples:
> +  - |
> +      qfprom: qfprom@700000 {

The node name doesn't match what you specified above. Unfortunately,
the schema checking of examples added won't catch this or anything
that causes select to fail to match. I'd really like to fix that, but
don't have any ideas yet.

Otherwise, with that and any license change:

Reviewed-by: Rob Herring <robh@kernel.org>

> +          #address-cells = <1>;
> +          #size-cells = <1>;
> +
> +          /* ... */
> +
> +          /* Data cells */
> +          tsens_calibration: calib@404 {
> +              reg = <0x404 0x10>;
> +          };
> +
> +          tsens_calibration_bckp: calib_bckp@504 {
> +              reg = <0x504 0x11>;
> +              bits = <6 128>;
> +          };
> +
> +          pvs_version: pvs-version@6 {
> +              reg = <0x6 0x2>;
> +              bits = <7 2>;
> +          };
> +
> +          speed_bin: speed-bin@c{
> +              reg = <0xc 0x1>;
> +              bits = <2 3>;
> +          };
> +      };
> +
> +...
> --
> 2.21.0
>
