From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH linux-next v1 2/4] clk: renesas: Add binding document for AVB
 Counter Clock
Date: Mon, 29 Oct 2018 11:29:10 -0700
Message-ID: <154083775062.98144.11157403961171783929@swboyd.mtv.corp.google.com>
References: <20181025072349.15173-1-jiada_wang@mentor.com>
 <20181025072349.15173-3-jiada_wang@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181025072349.15173-3-jiada_wang@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: geert+renesas@glider.be, horms@verge.net.au, magnus.damm@gmail.com, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, jiada_wang@mentor.com
List-Id: devicetree@vger.kernel.org

Quoting jiada_wang@mentor.com (2018-10-25 00:23:47)
> From: Jiada Wang <jiada_wang@mentor.com>
> =

> Add device tree bindings for avb counter clock for Renesas
> R-Car Socs.
> =

> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  .../bindings/clock/renesas,avb-clk.txt        | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,avb-c=
lk.txt
> =

> diff --git a/Documentation/devicetree/bindings/clock/renesas,avb-clk.txt =
b/Documentation/devicetree/bindings/clock/renesas,avb-clk.txt
> new file mode 100644
> index 000000000000..03bf50b5830c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,avb-clk.txt
> @@ -0,0 +1,19 @@
> +* Renesas AVB Counter Clock
> +
> +The AVB Counter Clocks are provided by avb_counter8 Clock Generator,
> +avb_counter8 has dividers which operates with S0D1=CF=95 clock and has
> +8 output clocks.
> +
> +Required Properties:
> +  - compatible: Must be "renesas,clk-avb"
> +  - reg: Base address and length of the memory resource used by the AVB
> +  - #clock-cells: Must be 1
> +
> +Example
> +-------
> +
> +       clk_avb: avb-clock@ec5a011c {
> +               compatible =3D "renesas,clk-avb";
> +               reg =3D <0 0xec5a011c 0 0x24>;

This is an odd register offset. Is this just one clk inside of a larger
clk controller?
