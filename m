From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH RFC v2 06/14] dt-bindings/interrupt-controller: pdc: add SPI config register
Date: Mon, 30 Sep 2019 15:33:01 -0700
Message-ID: <5d92829e.1c69fb81.d860a.9096@mx.google.com>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org> <1568411962-1022-7-git-send-email-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568411962-1022-7-git-send-email-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: evgreen@chromium.org, linus.walleij@linaro.org, maz@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, mkshah@codeaurora.org, linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Lina Iyer (2019-09-13 14:59:14)
> In addition to configuring the PDC, additional registers that interface
> the GIC have to be configured to match the GPIO type. The registers on
> some QCOM SoCs are access restricted, while on other SoCs are not. They
> SoCs with access restriction to these SPI registers need to be written
> from the firmware using the SCM interface. Add a flag to indicate if the
> register is to be written using SCM interface.
>=20
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.txt   | 13 +++++++=
+++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,=
pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.t=
xt
> index 8e0797c..e329f8d 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
> @@ -24,6 +24,9 @@ Properties:
>         Usage: required
>         Value type: <prop-encoded-array>
>         Definition: Specifies the base physical address for PDC hardware.
> +                   Optionally, specify the PDC's GIC interface registers=
 that
> +                   need to be configured for wakeup capable GPIOs routed=
 to
> +                   the PDC.
> =20
>  - interrupt-cells:
>         Usage: required
> @@ -50,15 +53,23 @@ Properties:
>                     The second element is the GIC hwirq number for the PD=
C port.
>                     The third element is the number of interrupts in sequ=
ence.
> =20
> +- qcom,scm-spi-cfg:
> +       Usage: optional
> +       Value type: <bool>
> +       Definition: Specifies if the SPI configuration registers have to =
be
> +                   written from the firmware. Sometimes the PDC interface
> +                   register to the GIC can only be written from the firm=
ware.
> +
>  Example:
> =20
>         pdc: interrupt-controller@b220000 {
>                 compatible =3D "qcom,sdm845-pdc";
> -               reg =3D <0xb220000 0x30000>;
> +               reg =3D <0 0x0b220000 0 0x30000>, <0 0x179900f0 0 0x60>;
>                 qcom,pdc-ranges =3D <0 512 94>, <94 641 15>, <115 662 7>;
>                 #interrupt-cells =3D <2>;
>                 interrupt-parent =3D <&intc>;
>                 interrupt-controller;
> +               qcom,scm-spi-cfg;
>         };

This overlaps register region with the mailbox node. That node is
actually a pile of random "CPU" registers used to ping remote processors
and apparently control how the PDC interacts with the GIC. Maybe this
can be changed to a phandle and then the driver can interogate the
phandle to determine if it's the SCM firmware or if it's the shared
mailbox register? If it's a shared mailbox then it can write to it at
the offset it knows about (because it's sdm845 compatible specific) and
if it's SCM then it can use the hardcoded address as well?

Basically I'm saying that it just needs a phandle.

	qcom,spi-cfg =3D <&scm>;

or

	qcom,spi-cfg =3D <&mailbox>;

and then driver knows how to use that to write into random registers.
Maybe we can have an API in regmap that finds the regmap for a given
device node? That way we don't have to funnel everything through syscon
for this.

	of_get_regmap(struct device_node *np, const char *name);

Where NULL name means "first available" and then do the devres search
otherwise for a device that has the matching node pointer.
