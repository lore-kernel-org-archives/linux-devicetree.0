From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 3/5] dt: bindings: add mt7621-pll dt binding documentation
Date: Mon, 22 Jul 2019 14:51:35 -0700
Message-ID: <20190722215136.1FC9121951@mail.kernel.org>
References: <20190709182018.23193-1-gch981213@gmail.com> <20190709182018.23193-4-gch981213@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190709182018.23193-4-gch981213@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>, open list <linux-kernel@vger.kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, John Crispin <john@phrozen.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>, Chuanhong Guo <gch981213@gmail.com>
List-Id: devicetree@vger.kernel.org

Quoting Chuanhong Guo (2019-07-09 11:20:16)
> This commit adds device tree binding documentation for MT7621
> PLL controller.
>=20
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  .../bindings/clock/mediatek,mt7621-pll.txt    | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt76=
21-pll.txt
>=20
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.=
txt b/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.txt
> new file mode 100644
> index 000000000000..05c15062cd20
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.txt
> @@ -0,0 +1,19 @@
> +Binding for Mediatek MT7621 PLL controller
> +
> +The PLL controller provides the 2 main clocks of the SoC: CPU and BUS.
> +
> +Required Properties:
> +- compatible: has to be "mediatek,mt7621-pll"
> +- #clock-cells: has to be one
> +
> +Optional properties:
> +- clock-output-names: should be "cpu", "bus"
> +
> +Example:
> +       pll {
> +               compatible =3D "mediatek,mt7621-pll", "syscon";

Why is this a syscon and not just part of some larger mt7621 clk
provider node?

> +
> +               #clock-cells =3D <1>;
> +               clock-output-names =3D "cpu", "bus";
> +       };
> +
