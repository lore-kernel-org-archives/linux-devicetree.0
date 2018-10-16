From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: ap806: add the cluster clock node in the syscon
 file
Date: Tue, 16 Oct 2018 13:56:09 -0700
Message-ID: <153972336963.5275.5425208133793471350@swboyd.mtv.corp.google.com>
References: <20180922181709.13007-1-gregory.clement@bootlin.com>
 <20180922181709.13007-2-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180922181709.13007-2-gregory.clement@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, devicetree@vger.kernel.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Gregory CLEMENT (2018-09-22 11:17:04)
> Document the device tree binding for the cluster clock controllers found
> in the Armada 7K/8K SoCs.
> =

> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---

Please Cc relevant DT maintainers and lists when submitting binding patches.

>  .../arm/marvell/ap806-system-controller.txt   | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/arm/marvell/ap806-system-c=
ontroller.txt b/Documentation/devicetree/bindings/arm/marvell/ap806-system-=
controller.txt
> index 3fd21bb7cb37..8f281816a6b8 100644
> --- a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controll=
er.txt
> +++ b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controll=
er.txt
> @@ -136,3 +136,25 @@ ap_syscon1: system-controller@6f8000 {
>                 #thermal-sensor-cells =3D <1>;
>         };
>  };
> +
> +Cluster clocks:
> +---------------
> +
> +Device Tree Clock bindings for cluster clock of AP806 Marvell. Each
> +cluster contain up to 2 CPUs running at the same frequency.
> +
> +Required properties:
> +- compatible: must be  "marvell,ap806-cpu-clock";
> +- #clock-cells : should be set to 1.
> +- clocks : shall be the input parents clock phandle for the clock.
> +
> +ap_syscon1: system-controller@6f8000 {
> +       compatible =3D "syscon", "simple-mfd";
> +       reg =3D <0x6f8000 0x1000>;
> +
> +       cpu_clk: clock-cpu {
> +               compatible =3D "marvell,ap806-cpu-clock";
> +               clocks =3D <&ap_clk 0>, <&ap_clk 1>;
> +               #clock-cells =3D <1>;
> +       };
> +};
