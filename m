Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] dt-bindings: imx: Add clock binding doc for imx8mm
In-Reply-To: <1546938317-23203-2-git-send-email-ping.bai@nxp.com>
From: Stephen Boyd <sboyd@kernel.org>
References: <1546938317-23203-1-git-send-email-ping.bai@nxp.com> <1546938317-23203-2-git-send-email-ping.bai@nxp.com>
Message-ID: <154706619539.15366.15074052691710369448@swboyd.mtv.corp.google.com>
Date: Wed, 09 Jan 2019 12:36:35 -0800
To: "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Quoting Jacky Bai (2019-01-08 01:00:58)
> Add the clock binding doc for i.MX8MM.
>=20
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
> ---
>  .../devicetree/bindings/clock/imx8mm-clock.txt     |  19 ++
>  include/dt-bindings/clock/imx8mm-clock.h           | 244 +++++++++++++++=
++++++
>  2 files changed, 263 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx8mm-clock.=
txt
>  create mode 100644 include/dt-bindings/clock/imx8mm-clock.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/imx8mm-clock.txt b/D=
ocumentation/devicetree/bindings/clock/imx8mm-clock.txt
> new file mode 100644
> index 0000000..034b6d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/imx8mm-clock.txt
> @@ -0,0 +1,19 @@
> +* Clock bindings for NXP i.MX8M Mini
> +
> +Required properties:
> +- compatible: Should be "fsl,imx8mm-ccm"
> +- reg: Address and length of the register set
> +- #clock-cells: Should be <1>
> +- clocks: list of clock specifiers, must contain an entry for each requi=
red
> +          entry in clock-names
> +- clock-names: should include the following entries:
> +    - "osc_32k"
> +    - "osc_24m"
> +    - "clk_ext1"
> +    - "clk_ext2"
> +    - "clk_ext3"
> +    - "clk_ext4"
> +
> +The clock consumer should specify the desired clock by having the clock
> +ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8mm-cl=
ock.h
> +for the full list of i.MX8M Mini clock IDs.

Any example of this node? Not the clock consumer.
