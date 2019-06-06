From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH V4 1/4] dt-bindings: imx: Add clock binding doc for i.MX8MN
Date: Thu, 6 Jun 2019 09:40:36 +0200
Message-ID: <20190606074036.vx2smtauiwxy6wzx@flea>
References: <20190606013323.3392-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7562383263305414709=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190606013323.3392-1-Anson.Huang@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson.Huang@nxp.com
Cc: mark.rutland@arm.com, peng.fan@nxp.com, ping.bai@nxp.com, catalin.marinas@arm.com, mturquette@baylibre.com, will.deacon@arm.com, bjorn.andersson@linaro.org, leonard.crestez@nxp.com, festevam@gmail.com, linux-clk@vger.kernel.org, abel.vesa@nxp.com, jagan@amarulasolutions.com, Linux-imx@nxp.com, devicetree@vger.kernel.org, s.hauer@pengutronix.de, olof@lixom.net, robh+dt@kernel.org, horms+renesas@verge.net.au, linux-arm-kernel@lists.infradead.org, aisheng.dong@nxp.com, sboyd@kernel.org, linux-kernel@vger.kernel.org, dinguyen@kernel.org, kernel@pengutronix.de, enric.balletbo@collabora.com, shawnguo@kernel.org, l.stach@pengutronix.de
List-Id: devicetree@vger.kernel.org


--===============7562383263305414709==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lbx5fpk47vlzcrms"
Content-Disposition: inline


--lbx5fpk47vlzcrms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Jun 06, 2019 at 09:33:20AM +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
>
> Add the clock binding doc for i.MX8MN.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V3:
> 	- switch binding doc from .txt to .yaml.
> ---
>  .../devicetree/bindings/clock/imx8mn-clock.yaml    | 115 +++++++++++
>  include/dt-bindings/clock/imx8mn-clock.h           | 215 +++++++++++++++++++++
>  2 files changed, 330 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx8mn-clock.yaml
>  create mode 100644 include/dt-bindings/clock/imx8mn-clock.h
>
> diff --git a/Documentation/devicetree/bindings/clock/imx8mn-clock.yaml b/Documentation/devicetree/bindings/clock/imx8mn-clock.yaml
> new file mode 100644
> index 0000000..8cb8fcf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/imx8mn-clock.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/imx8mn-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX8M Nano Clock Control Module Binding
> +
> +maintainers:
> +  - Anson Huang <Anson.Huang@nxp.com>
> +
> +description: |
> +  NXP i.MX8M Nano clock control module is an integrated clock controller, which
> +  generates and supplies to all modules.
> +
> +  This binding uses common clock bindings
> +  [1] Documentation/devicetree/bindings/clock/clock-bindings.txt

Which part exactly are you using?

I'm not sure it's worth referring to. Any provider property should be
listed here, and the consumer properties are already checked.

> +properties:
> +  compatible:
> +    const: fsl,imx8mn-ccm
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: 32k osc
> +      - description: 24m osc
> +      - description: ext1 clock input
> +      - description: ext2 clock input
> +      - description: ext3 clock input
> +      - description: ext4 clock input
> +
> +  clock-names:
> +    items:
> +      - const: osc_32k
> +      - const: osc_24m
> +      - const: clk_ext1
> +      - const: clk_ext2
> +      - const: clk_ext3
> +      - const: clk_ext4
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +examples:
> +  # Clock Control Module node:
> +  - |
> +    clk: clock-controller@30380000 {
> +        compatible = "fsl,imx8mn-ccm";
> +        reg = <0x0 0x30380000 0x0 0x10000>;
> +        #clock-cells = <1>;
> +        clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>,
> +                 <&clk_ext2>, <&clk_ext3>, <&clk_ext4>;
> +        clock-names = "osc_32k", "osc_24m", "clk_ext1",
> +                      "clk_ext2", "clk_ext3", "clk_ext4";
> +    };
> +
> +  # Required external clocks for Clock Control Module node:
> +  - |
> +    osc_32k: clock-osc-32k {
> +        compatible = "fixed-clock";
> +        #clock-cells = <0>;
> +        clock-frequency = <32768>;
> +	clock-output-names = "osc_32k";
> +    };
> +
> +    osc_24m: clock-osc-24m {
> +        compatible = "fixed-clock";
> +        #clock-cells = <0>;
> +        clock-frequency = <24000000>;
> +        clock-output-names = "osc_24m";
> +    };
> +
> +    clk_ext1: clock-ext1 {
> +        compatible = "fixed-clock";
> +        #clock-cells = <0>;
> +        clock-frequency = <133000000>;
> +        clock-output-names = "clk_ext1";
> +    };
> +
> +    clk_ext2: clock-ext2 {
> +        compatible = "fixed-clock";
> +        #clock-cells = <0>;
> +        clock-frequency = <133000000>;
> +        clock-output-names = "clk_ext2";
> +    };
> +
> +    clk_ext3: clock-ext3 {
> +        compatible = "fixed-clock";
> +        #clock-cells = <0>;
> +        clock-frequency = <133000000>;
> +        clock-output-names = "clk_ext3";
> +    };
> +
> +    clk_ext4: clock-ext4 {
> +        compatible = "fixed-clock";
> +        #clock-cells = <0>;
> +        clock-frequency= <133000000>;
> +        clock-output-names = "clk_ext4";
> +    };
> +
> +  # The clock consumer should specify the desired clock by having the clock
> +  # ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8mn-clock.h
> +  # for the full list of i.MX8M Nano clock IDs.

I guess this could be part of the clock-cells description.

Once fixed,
Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--lbx5fpk47vlzcrms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPjDdAAKCRDj7w1vZxhR
xQf4AQDGmVlx49YWe4vIu1dehv4zttFw3oRaIsMiDSi4vzwyMQEA+e7hg+RgrL4i
6aPykXgdE5sTJox+CRpk+KGv3Ovk3AU=
=kpoe
-----END PGP SIGNATURE-----

--lbx5fpk47vlzcrms--


--===============7562383263305414709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7562383263305414709==--
