From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH v2 4/6] dt: bindings: add mt7621-pll dt binding
 documentation
Date: Mon, 29 Jul 2019 17:33:09 +0000
Message-ID: <20190729173307.ex2mf5hikzxl534v@pburton-laptop>
References: <20190724022310.28010-1-gch981213@gmail.com>
 <20190724022310.28010-5-gch981213@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724022310.28010-5-gch981213@gmail.com>
Content-Language: en-US
Content-ID: <C26CC762CCD7CF42A8FC0CCA4047FDE4@namprd22.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chuanhong Guo <gch981213@gmail.com>
Cc: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, John Crispin <john@phrozen.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>
List-Id: devicetree@vger.kernel.org

Hi Chuanhong,

On Wed, Jul 24, 2019 at 10:23:08AM +0800, Chuanhong Guo wrote:
> This commit adds device tree binding documentation for MT7621
> PLL controller.
>=20
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>=20
> Change since v1:
> drop useless syscon in compatible string
>=20
>  .../bindings/clock/mediatek,mt7621-pll.txt     | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt76=
21-pll.txt

This binding needs review from DT maintainers before I apply it, but as
a general note it's typical to add the binding *before* its use in the
series. That is, this patch should come before patch 3.

Personally I'd squash it with patch 1 so the binding & the header file
needed to use the binding are added in one patch, then a later patch
actually makes use of them.

Thanks,
    Paul

> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.=
txt b/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.txt
> new file mode 100644
> index 000000000000..7dcfbd5283e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.txt
> @@ -0,0 +1,18 @@
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
> +	pll {
> +		compatible =3D "mediatek,mt7621-pll";
> +
> +		#clock-cells =3D <1>;
> +		clock-output-names =3D "cpu", "bus";
> +	};
> --=20
> 2.21.0
>=20
