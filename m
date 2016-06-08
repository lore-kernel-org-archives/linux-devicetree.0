From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 01/15] dt-bindings: sunxi: Add CCU binding documentation
Date: Wed, 8 Jun 2016 09:37:30 +0800
Message-ID: <CAGb2v661ERE7zi9uExMtiEgG68owxT6x4jX3nCsVH8BwohJ53A@mail.gmail.com>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com> <20160607204154.31967-2-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160607204154.31967-2-maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk <linux-clk@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Jean-Francois Moine <moinejf@free.fr>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 8, 2016 at 4:41 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Introduce a new binding with its documentation for the brand new clock
> sub-framework.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sunxi-ccu.txt
>
> diff --git a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
> new file mode 100644
> index 000000000000..2c66046a1342
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
> @@ -0,0 +1,17 @@
> +Allwinner Clock Control Unit Binding
> +------------------------------------
> +
> +Required properties :
> +- compatible: must contain one of the following compatible:
> +               - "allwinner,sun8i-h3-ccu"
> +
> +- reg: Must contain the registers base address and length
> +- clocks: phandle to the oscillators feeding the SPI controller. Two are

SPI? copy paste error?

> +          needed:
> +  - "hosc": the high frequency oscillator (usually at 24MHz)
> +  - "losc": the low frequency oscillator (usually at 32kHz)
> +- clock-names: Must contain the clock names described just above
> +- #clock-cells : must contain 1
> +- #reset-cells : must contain 1
> +
> +Example:

No example? Maybe just remove this section then.

ChenYu

> --
> 2.8.3
>
