From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] dt-bindings: arm: Convert RDA Micro board/soc bindings
 to json-schema
Date: Tue, 9 Jul 2019 22:45:08 +0530
Message-ID: <20190709171508.GA10127@Mani-XPS-13-9360>
References: <20190618212229.32302-4-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190618212229.32302-4-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, Jun 18, 2019 at 03:22:28PM -0600, Rob Herring wrote:
> Convert RDA Micro SoC bindings to DT schema format using json-schema.
> =

> Cc: "Andreas F=E4rber" <afaerber@suse.de>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Andreas, Update the license on this one too to dual licensed if you =

> want.

I'm fine with GPL-2.0. Since there isn't any other RDA specific patches
in my tree, you want to take this patch? Else I have to send the Pull
Request to ARM SoC folks with this patch alone.

Thanks,
Mani

> =

>  Documentation/devicetree/bindings/arm/rda.txt | 17 ----------------
>  .../devicetree/bindings/arm/rda.yaml          | 20 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 21 insertions(+), 18 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/rda.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/rda.yaml
> =

> diff --git a/Documentation/devicetree/bindings/arm/rda.txt b/Documentatio=
n/devicetree/bindings/arm/rda.txt
> deleted file mode 100644
> index 43c80762c428..000000000000
> --- a/Documentation/devicetree/bindings/arm/rda.txt
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -RDA Micro platforms device tree bindings
> -----------------------------------------
> -
> -RDA8810PL SoC
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Required root node properties:
> -
> - - compatible :  must contain "rda,8810pl"
> -
> -
> -Boards:
> -
> -Root node property compatible must contain, depending on board:
> -
> - - Orange Pi 2G-IoT: "xunlong,orangepi-2g-iot"
> - - Orange Pi i96: "xunlong,orangepi-i96"
> diff --git a/Documentation/devicetree/bindings/arm/rda.yaml b/Documentati=
on/devicetree/bindings/arm/rda.yaml
> new file mode 100644
> index 000000000000..51cec2b63b04
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/rda.yaml
> @@ -0,0 +1,20 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/rda.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RDA Micro platforms device tree bindings
> +
> +maintainers:
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - xunlong,orangepi-2g-iot     # Orange Pi 2G-IoT
> +          - xunlong,orangepi-i96        # Orange Pi i96
> +      - const: rda,8810pl
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2c6f4d15805e..56ee276088eb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2111,7 +2111,7 @@ F:	arch/arm/boot/dts/rda8810pl-*
>  F:	drivers/clocksource/timer-rda.c
>  F:	drivers/irqchip/irq-rda-intc.c
>  F:	drivers/tty/serial/rda-uart.c
> -F:	Documentation/devicetree/bindings/arm/rda.txt
> +F:	Documentation/devicetree/bindings/arm/rda.yaml
>  F:	Documentation/devicetree/bindings/interrupt-controller/rda,8810pl-int=
c.txt
>  F:	Documentation/devicetree/bindings/serial/rda,8810pl-uart.txt
>  F:	Documentation/devicetree/bindings/timer/rda,8810pl-timer.txt
> -- =

> 2.20.1
> =
