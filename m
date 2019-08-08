From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: clock: Add Bitmain BM1880 SoC clock controller binding
Date: Wed, 07 Aug 2019 22:01:28 -0700
Message-ID: <20190808050128.E3DA52186A@mail.kernel.org>
References: <20190705151440.20844-1-manivannan.sadhasivam@linaro.org> <20190705151440.20844-2-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190705151440.20844-2-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, robh+dt@kernel.org
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, haitao.suo@bitmain.com, darren.tsao@bitmain.com, fisher.cheng@bitmain.com, alec.lin@bitmain.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Quoting Manivannan Sadhasivam (2019-07-05 08:14:36)
> Add devicetree binding for Bitmain BM1880 SoC clock controller.
>=20
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../bindings/clock/bitmain,bm1880-clk.txt     | 47 +++++++++++

Can you convert this to YAML? It's all the rage right now.

>  include/dt-bindings/clock/bm1880-clock.h      | 82 +++++++++++++++++++
>  2 files changed, 129 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/bitmain,bm188=
0-clk.txt
>  create mode 100644 include/dt-bindings/clock/bm1880-clock.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.t=
xt b/Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.txt
> new file mode 100644
> index 000000000000..9c967095d430
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.txt
> @@ -0,0 +1,47 @@
> +* Bitmain BM1880 Clock Controller
> +
> +The Bitmain BM1880 clock controler generates and supplies clock to
> +various peripherals within the SoC.
> +
> +Required Properties:
> +
> +- compatible: Should be "bitmain,bm1880-clk"
> +- reg :        Register address and size of PLL and SYS control domains
> +- reg-names : Register domain names: "pll" and "sys"
> +- clocks : Phandle of the input reference clock.
> +- #clock-cells: Should be 1.
> +
> +Each clock is assigned an identifier, and client nodes can use this iden=
tifier
> +to specify the clock which they consume.
> +
> +All available clocks are defined as preprocessor macros in corresponding
> +dt-bindings/clock/bm1880-clock.h header and can be used in device tree s=
ources.
> +
> +External clocks:
> +
> +The osc clock used as the input for the plls is generated outside the So=
C.
> +It is expected that it is defined using standard clock bindings as "osc".
> +
> +Example:=20
> +
> +        clk: clock-controller@800 {
> +                compatible =3D "bitmain,bm1880-clk";
> +                reg =3D <0xe8 0x0c>,<0x800 0xb0>;

It looks weird still. What hardware module is this actually part of?
Some larger power manager block?

> +                reg-names =3D "pll", "sys";
> +                clocks =3D <&osc>;
> +                #clock-cells =3D <1>;
> +        };
> +
